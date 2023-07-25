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
  account_id            = data.aws_caller_identity.current.account_id
  ecr_repo              = join(".", [local.account_id, "dkr.ecr", data.aws_region.ecs_region.name, "amazonaws.com/qatalyst-backend:latest"])
  qatalyst_sender_email = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
  datacenter_code       = lookup(var.datacenter_codes, data.aws_region.ecs_region.name)
  bitly_bearer_token    = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
  sendgrid_key          = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
  figma_access_token    = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
  sentry_dsn_value      = join("-", ["qatalyst", var.STAGE, "sentry-dsn-value"])
  fingerprint_token     = join("-", ["qatalyst", var.STAGE, "fingerprint-token"])
  datadog_api_key       = join("-", ["datadog", var.STAGE, "api-key"])
  container_name        = join("-", ["qatalyst-ecs-container-definition", var.STAGE, local.datacenter_code])
  feature_flag_auth     = join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])
  _100ms_access_key     = join("-", ["qatalyst", var.STAGE, "100ms-access-key"])
  _100ms_secret_key     = join("-", ["qatalyst", var.STAGE, "100ms-secret-key"])
}
resource "aws_ecs_cluster" "qatalyst_ecs_cluster" {
  provider = aws.ecs_region
  name     = join("-", [var.qatalyst_ecs_cluster_name, var.STAGE, local.datacenter_code])
  tags     = merge(tomap({ "Name" : var.qatalyst_ecs_cluster_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecs_cluster_capacity_providers" "qatalyst_ecs_cluster_capacity_provider" {
  provider           = aws.ecs_region
  cluster_name       = aws_ecs_cluster.qatalyst_ecs_cluster.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 1
    capacity_provider = "FARGATE"
  }
}

resource "aws_cloudwatch_log_group" "qatalyst_log_group" {
  provider          = aws.ecs_region
  name              = "qatalyst-backend-log-group"
  retention_in_days = var.cw_logs_retention_in_days
  tags              = merge(tomap({ "Name" : "qatalyst-backend-log-group" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecs_task_definition" "qatalyst_ecs_task_definition" {
  provider                 = aws.ecs_region
  family                   = join("-", ["qatalyst-task-definition", var.STAGE, local.datacenter_code])
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = var.fargate_cpu_memory.memory
  cpu                      = var.fargate_cpu_memory.cpu
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn
  container_definitions = jsonencode(
    [
      {
        name      = local.container_name
        image     = local.ecr_repo
        memory    = var.fargate_cpu_memory.memory
        cpu       = var.fargate_cpu_memory.cpu
        essential = true
        environment = [
          {
            name  = "COGNITO_USER_POOL_ID"
            value = var.cognito_user_pool_id
          },
          {
            name  = "STAGE"
            value = var.STAGE
          },
          {
            name  = "LOCAL_RUN"
            value = "false"
          },
          {
            name  = "QATALYST_DOMAIN"
            value = var.qatalyst_domain
          },
          {
            name  = "FE_TESTER_VIEW_DOMAIN_NAME"
            value = var.fe_tester_view_domain_name
          },
          {
            name  = "REGION_NAME"
            value = data.aws_region.ecs_region.name
          },
          {
            name  = "WEB_CONCURRENCY"
            value = var.uvicorn_workers_count
          },
          {
            name  = "QATALYST_SENDER_EMAIL"
            value = local.qatalyst_sender_email
          }
        ],
        secrets = [
          {
            name      = "BITLY_BEARER"
            valueFrom = local.bitly_bearer_token
          },
          {
            name      = "FIGMA_ACCESS_TOKEN"
            valueFrom = local.figma_access_token
          },
          {
            name      = "SENDGRID_KEY"
            valueFrom = local.sendgrid_key
          },
          {
            name      = "FINGERPRINT_API_TOKEN"
            valueFrom = local.fingerprint_token
          },
          {
            name      = "SENTRY_SDK_DSN"
            valueFrom = local.sentry_dsn_value
          },
          {
            name      = "FEATURE_FLAG_AUTH"
            valueFrom = local.feature_flag_auth
          },
          {
            name      = "100MS_ACCESS_KEY"
            valueFrom = local._100ms_access_key
          },
          {
            name      = "100MS_SECRET_KEY"
            valueFrom = local._100ms_secret_key
          },
        ]
        portMappings = [
          {
            containerPort = 80
            hostPort      = 80
            protocol      = "tcp"
          }
        ]
        healthCheck = {
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
            dd_service     = join("-", ["qatalyst-backend", var.STAGE, local.datacenter_code])
            dd_source      = join("-", ["qatalyst", var.STAGE])
            dd_tags        = "project:qatalyst"
            dd_message_key = "log"
            TLS            = "on"
            provider       = "ecs"
          }
          secretOptions = [
            {
              name      = "apikey"
              valueFrom = local.datadog_api_key
            }
          ]
        }
        dockerLabels = {
          "com.datadoghq.tags.env"     = var.STAGE
          "com.datadoghq.tags.region"  = data.aws_region.ecs_region.name
          "com.datadoghq.tags.service" = "qatalyst-backend"
        }
      },
      {
        name      = "log-router"
        image     = "amazon/aws-for-fluent-bit:stable"
        essential = true
        firelensConfiguration = {
          type = "fluentbit"
          options = {
            enable-ecs-log-metadata = "true"
          }
        }
      },
      {
        name      = "datadog-agent"
        image     = var.datadog_docker_image
        essential = true
        environment = [
          {
            name  = "DD_APM_ENABLED",
            value = "true"
          },
          {
            name  = "ECS_FARGATE",
            value = "true"
          },
          {
            name  = "DD_LOGS_INJECTION",
            value = "true"
          },
          {
            name  = "DD_ENV",
            value = var.STAGE
          },
          {
            name  = "DD_SERVICE",
            value = "qatalyst-backend"
          }
        ]
        secrets = [
          {
            name      = "DD_API_KEY",
            valueFrom = local.datadog_api_key
          }
        ]
        healthCheck = {
          retries     = 3
          command     = ["CMD-SHELL", "agent health"]
          timeout     = 5
          interval    = 30
          startPeriod = 15
        }
      }
  ])
  tags = merge(tomap({ "Name" : "qatalyst-ecs-td" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_security_group" "qatalyst_ecs_sg" {
  provider    = aws.ecs_region
  name        = "qatalyst-ecs-sg"
  description = "ECS Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description     = "HTTP From ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group] #ALB Security
  }

  egress {
    description = "All Traffic Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(tomap({ "Name" : "qatalyst-ecs-sg" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecs_service" "qatalyst_ecs_service" {
  provider             = aws.ecs_region
  name                 = join("-", [var.qatalyst_dashboard_service_name, var.STAGE, local.datacenter_code])
  cluster              = aws_ecs_cluster.qatalyst_ecs_cluster.id
  task_definition      = aws_ecs_task_definition.qatalyst_ecs_task_definition.arn
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true
  propagate_tags       = "SERVICE"
  network_configuration {
    subnets          = var.ecs_subnets
    assign_public_ip = false
    security_groups  = [aws_security_group.qatalyst_ecs_sg.id]
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = local.container_name
    container_port   = 80
  }
  tags = merge(tomap({ "Name" : var.qatalyst_dashboard_service_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecs_service" "qatalyst_reports_service" {
  provider             = aws.ecs_region
  name                 = join("-", [var.qatalyst_reports_service_name, var.STAGE, local.datacenter_code])
  cluster              = aws_ecs_cluster.qatalyst_ecs_cluster.id
  task_definition      = aws_ecs_task_definition.qatalyst_ecs_task_definition.arn
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true
  propagate_tags       = "SERVICE"
  network_configuration {
    subnets          = var.ecs_subnets
    assign_public_ip = false
    security_groups  = [aws_security_group.qatalyst_ecs_sg.id]
  }

  load_balancer {
    target_group_arn = var.alb_target_group_reports_arn
    container_name   = local.container_name
    container_port   = 80
  }
  tags = merge(tomap({ "Name" : var.qatalyst_reports_service_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecs_service" "qatalyst_tester_view_service" {
  provider             = aws.ecs_region
  name                 = join("-", [var.qatalyst_tester_view_service_name, var.STAGE, local.datacenter_code])
  cluster              = aws_ecs_cluster.qatalyst_ecs_cluster.id
  task_definition      = aws_ecs_task_definition.qatalyst_ecs_task_definition.arn
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true
  propagate_tags       = "SERVICE"
  network_configuration {
    subnets          = var.ecs_subnets
    assign_public_ip = false
    security_groups  = [aws_security_group.qatalyst_ecs_sg.id]
  }

  load_balancer {
    target_group_arn = var.alb_target_group_tester_view_arn
    container_name   = local.container_name
    container_port   = 80
  }
  tags = merge(tomap({ "Name" : var.qatalyst_tester_view_service_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

# Define the Auto Scaling target for the ECS service
resource "aws_appautoscaling_target" "qatalyst_ecs_ast" {
  provider           = aws.ecs_region
  min_capacity       = 1
  max_capacity       = 6
  resource_id        = join("/", ["service", aws_ecs_cluster.qatalyst_ecs_cluster.name, aws_ecs_service.qatalyst_ecs_service.name])
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  role_arn           = var.qatalyst_ecs_autoscale_role_arn
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
    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
