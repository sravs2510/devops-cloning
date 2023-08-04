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
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.ecs_region.name)
}

# ECS Cluster
resource "aws_ecs_cluster" "qatalyst_ecs_cluster" {
  provider = aws.ecs_region
  name     = join("-", [var.ecs_cluster_name, var.STAGE, local.datacenter_code])
  tags     = merge(tomap({ "Name" : var.ecs_cluster_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
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