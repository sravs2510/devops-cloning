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
  account_id = data.aws_caller_identity.current.account_id
  ecr_repo   = join(".", [local.account_id, "dkr.ecr", data.aws_region.ecs_region.name, "amazonaws.com/qatalyst-backend:latest"])
}
resource "aws_ecs_cluster" "qatalyst_ecs_cluster" {
  provider = aws.ecs_region
  name     = "qatalyst-ecs-cluster"
  tags     = merge(tomap({ "Name" : "qatalyst-ecs-cluster" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
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
  family                   = "qatalyst-task-definition"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory                   = var.fargate_cpu_memory.memory
  cpu                      = var.fargate_cpu_memory.cpu
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn
  container_definitions = jsonencode(
    [
      {
        "name" : "qatalyst-ecs-container-definition",
        "image" : local.ecr_repo,
        "memory" : var.fargate_cpu_memory.memory,
        "cpu" : var.fargate_cpu_memory.cpu,
        "essential" : true,
        "environment" : [
          {
            "name" : "COGNITO_USER_POOL_ID",
            "value" : var.cognito_user_pool_id
          },
          {
            "name" : "STAGE",
            "value" : var.STAGE
          },
          {
            "name" : "LOCAL_RUN",
            "value" : "false"
          },
          {
            "name" : "QATALYST_DOMAIN"
            "value" : var.qatalyst_domain
          },
          {
            "name" : "SENTRY_SDK_DSN"
            "value" : "#SENTRY_DSN_VALUE"
          },
          {
            "name" : "FE_TESTER_VIEW_DOMAIN_NAME"
            "value" : var.fe_tester_view_domain_name
          }
        ],
        "portMappings" : [
          {
            "containerPort" : 80,
            "hostPort" : 80,
            "protocol" : "tcp"
          }
        ]
        "logConfiguration" : {
          "logDriver" : "awslogs",
          "options" : {
            "awslogs-region" : data.aws_region.ecs_region.name,
            "awslogs-group" : "qatalyst-backend-log-group",
            "awslogs-stream-prefix" : "qatalyst-backend"
          }
        },
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
  name                 = "qatalyst-ecs-service"
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
    container_name   = "qatalyst-ecs-container-definition"
    container_port   = 80
  }
  tags = merge(tomap({ "Name" : "qatalyst-ecs-service" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}


Define the Auto Scaling target for the ECS service
resource "aws_appautoscaling_target" "qatalyst_ecs_ast" {
  max_capacity       = 6
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.qatalyst_ecs_cluster.name}/${aws_ecs_service.qatalyst_ecs_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

# Define the Auto Scaling policy for the ECS service
resource "aws_appautoscaling_policy" "qatalyst_ecs_asp" {
  name               = "qatalyst-ecs-asp"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.qatalyst_ecs_ast.resource_id
  scalable_dimension = aws_appautoscaling_target.qatalyst_ecs_ast.scalable_dimension
  service_namespace  = aws_appautoscaling_target.qatalyst_ecs_ast.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown = 300
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 60
      scaling_adjustment = 1
    }

    step_adjustment {
      metric_interval_lower_bound = 30
      scaling_adjustment = -1
    }
  }
}
