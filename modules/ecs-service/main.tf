terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ecs_region]
    }
  }
}

data "aws_region" "ecs_region" {
  provider = aws.ecs_region
}

data "aws_caller_identity" "current" {
  provider = aws.ecs_region
}

locals {
  ecs_service_name     = join("-", [var.ecs_service_name, var.STAGE, local.datacenter_code])
  container_name       = join("-", [var.ecs_service_name, var.STAGE, local.datacenter_code, "container"])
  task_definition_name = join("-", [var.ecs_service_name, var.STAGE, local.datacenter_code, "td"])
  account_id           = data.aws_caller_identity.current.account_id
  ecr_repo             = join(".", [local.account_id, "dkr.ecr", data.aws_region.ecs_region.name, "amazonaws.com/qatalyst-${var.repo_name}:latest"])
  datacenter_code      = lookup(var.datacenter_codes, data.aws_region.ecs_region.name)
  dd_api_key_ssm_param = join("-", ["datadog", var.STAGE, "api-key"])
  dd_service_name      = join("-", [var.ecs_service_name, var.STAGE])
  is_sqs_service       = contains(["mammoth", "furyblade", "cyborg"], var.service) ? true : false
}

resource "aws_ecs_task_definition" "qatalyst_ecs_task_definition" {
  provider                 = aws.ecs_region
  family                   = local.task_definition_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = var.fargate_cpu_memory.memory
  cpu                      = var.fargate_cpu_memory.cpu
  ephemeral_storage {
    size_in_gib = var.STAGE == "dev" ? 50 : 25
  }
  execution_role_arn = var.ecs_task_execution_role_arn
  task_role_arn      = var.ecs_task_role_arn
  container_definitions = jsonencode(
    [
      {
        name        = local.container_name
        volumesFrom = []
        image       = local.ecr_repo
        memory      = var.fargate_cpu_memory.memory
        cpu         = var.fargate_cpu_memory.cpu
        essential   = true
        environment = concat(var.service_environment_variables, [
          {
            name  = "REGION_NAME"
            value = data.aws_region.ecs_region.name
          },
          {
            name  = "AWS_ACCOUNT_ID"
            value = local.account_id
          },
          {
            name  = "STAGE"
            value = var.STAGE
          },
          {
            name  = "LOG_LEVEL"
            value = "INFO"
          },
          {
            name  = "DD_SERVICE"
            value = local.dd_service_name
          }
        ]),
        secrets = concat(var.service_environment_secrets, [
          {
            name      = join("_", ["PLATFORM_CLIENT_ID", upper(local.datacenter_code)])
            valueFrom = join("-", ["platform", var.STAGE, "client-id", local.datacenter_code])
          },
          {
            name      = join("_", ["PLATFORM_SECRET", upper(local.datacenter_code)])
            valueFrom = join("-", ["platform", var.STAGE, "secret", local.datacenter_code])
          },
        ])
        mountPoints : var.service == "cyborg" || var.service == "furyblade" || var.service == "mammoth" ? [
          {
            "containerPath" : "/mnt${var.efs_configuration.path}",
            "sourceVolume" : join("-", ["qatalyst", var.service]),
            "readOnly" : false
          }
        ] : []
        portMappings = [
          {
            containerPort = 80
            hostPort      = 80
            protocol      = "tcp"
          }
        ]
        healthCheck = var.service == "cyborg" || var.service == "furyblade" || var.service == "mammoth" ? null : {
          retries     = 3
          command     = ["CMD-SHELL", "curl -f http://localhost/health || exit 1"]
          timeout     = 30
          interval    = 60
          startPeriod = 30
        }
        logConfiguration = {
          logDriver = "awsfirelens"
          options = {
            Name           = "datadog"
            Host           = "http-intake.logs.datadoghq.com"
            dd_service     = local.dd_service_name
            dd_source      = join("-", ["qatalyst", var.STAGE])
            dd_tags        = "project:qatalyst"
            dd_message_key = "log"
            TLS            = "on"
            provider       = "ecs"
          }
          secretOptions = [
            {
              name      = "apikey"
              valueFrom = local.dd_api_key_ssm_param
            }
          ]
        }
        dockerLabels = {
          "com.datadoghq.tags.env"     = var.STAGE
          "com.datadoghq.tags.region"  = data.aws_region.ecs_region.name
          "com.datadoghq.tags.service" = local.dd_service_name
        }
      },
      {
        cpu          = 0
        environment  = []
        mountPoints  = []
        name         = "log-router"
        portMappings = []
        user         = "0"
        volumesFrom  = []
        image        = "amazon/aws-for-fluent-bit:stable"
        essential    = true
        firelensConfiguration = {
          type = "fluentbit"
          options = {
            enable-ecs-log-metadata = "true"
          }
        }
      },
      {
        cpu          = 0
        mountPoints  = []
        name         = "datadog-agent"
        portMappings = []
        volumesFrom  = []
        image        = var.datadog_docker_image
        essential    = true
        environment = concat(var.dd_environment_variables, [
          {
            name  = "DD_SERVICE",
            value = local.dd_service_name
          }
        ])
        secrets = var.dd_environment_secrets
        healthCheck = {
          retries     = 3
          command     = ["CMD-SHELL", "agent health"]
          timeout     = 5
          interval    = 30
          startPeriod = 15
        }
      }
  ])

  dynamic "volume" {
    for_each = var.service == "cyborg" || var.service == "mammoth" || var.service == "furyblade" ? [1] : []
    content {
      name = join("-", ["qatalyst", var.service])
      efs_volume_configuration {
        file_system_id     = var.efs_file_system_id
        root_directory     = "/"
        transit_encryption = "ENABLED"
        authorization_config {
          access_point_id = var.efs_access_point_id
          iam             = "ENABLED"
        }
      }

    }
  }
  tags = merge(tomap({ "Name" : local.task_definition_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecs_service" "qatalyst_ecs_service" {
  provider             = aws.ecs_region
  name                 = local.ecs_service_name
  cluster              = var.ecs_cluster_id
  task_definition      = aws_ecs_task_definition.qatalyst_ecs_task_definition.arn
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true
  propagate_tags       = "SERVICE"
  network_configuration {
    subnets          = var.ecs_subnets
    assign_public_ip = false
    security_groups  = var.ecs_security_groups
  }

  dynamic "load_balancer" {
    for_each = var.service != "cyborg" && var.service != "furyblade" && var.service != "mammoth" ? [1] : []

    content {
      target_group_arn = var.alb_target_group_arn
      container_name   = local.container_name
      container_port   = 80
    }
  }
  tags = merge(tomap({ "Name" : var.ecs_service_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

# Define the Auto Scaling target for the ECS service
resource "aws_appautoscaling_target" "qatalyst_ecs_ast" {
  provider           = aws.ecs_region
  min_capacity       = 1
  max_capacity       = var.STAGE == "dev" ? 1 : local.is_sqs_service ? 100 : 10
  resource_id        = join("/", ["service", var.ecs_cluster_name, aws_ecs_service.qatalyst_ecs_service.name])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "qatalyst_ecs_asp_sqs_sum" {
  provider           = aws.ecs_region
  count              = local.is_sqs_service ? 1 : 0
  name               = "qatalyst-ecs-asp-sqs-sum-${var.service}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.qatalyst_ecs_ast.resource_id
  scalable_dimension = aws_appautoscaling_target.qatalyst_ecs_ast.scalable_dimension
  service_namespace  = aws_appautoscaling_target.qatalyst_ecs_ast.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value       = 1
    scale_in_cooldown  = 30
    scale_out_cooldown = 30
    customized_metric_specification {
      metrics {
        label = "MessagesWaitingToBeProcessed"
        id    = "m1"
        metric_stat {
          metric {
            metric_name = "ApproximateNumberOfMessagesVisible"
            namespace   = "AWS/SQS"
            dimensions {
              name  = "QueueName"
              value = join("-", ["qatalyst", var.service])
            }
          }
          stat = "Sum"
        }
        return_data = true
      }
    }
  }
}

# Define the Auto Scaling policy for the ECS service
resource "aws_appautoscaling_policy" "qatalyst_ecs_asp_cpu_average" {
  provider           = aws.ecs_region
  name               = "qatalyst-ecs-asp-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.qatalyst_ecs_ast.resource_id
  scalable_dimension = aws_appautoscaling_target.qatalyst_ecs_ast.scalable_dimension
  service_namespace  = aws_appautoscaling_target.qatalyst_ecs_ast.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}

resource "aws_appautoscaling_policy" "qatalyst_ecs_asp_memory_average" {
  provider           = aws.ecs_region
  name               = "qatalyst-ecs-asp-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.qatalyst_ecs_ast.resource_id
  scalable_dimension = aws_appautoscaling_target.qatalyst_ecs_ast.scalable_dimension
  service_namespace  = aws_appautoscaling_target.qatalyst_ecs_ast.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value       = 85
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
