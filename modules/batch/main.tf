terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.batch_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.batch_region
}

data "aws_caller_identity" "current" {
  provider = aws.batch_region
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  batch_resource_requirements_fargate_cpu = [
    {
      type  = "VCPU"
      value = var.batch_job_configuration.required_vcpus
    },
    {
      type  = "MEMORY"
      value = var.batch_job_configuration.required_memory
    }
  ]
}

resource "aws_batch_compute_environment" "aws_batch_compute_environment" {
  provider                 = aws.batch_region
  compute_environment_name = join("-", [var.batch_job_configuration.name, "compute-environment"])
  service_role             = var.qatalyst_aws_batch_service_role
  type                     = "MANAGED"
  compute_resources {
    instance_role = var.batch_job_configuration.type == "EC2" ? var.qatalyst_aws_iam_instance_profile : null
    dynamic "launch_template" {
      for_each = var.batch_job_configuration.type == "EC2" ? [1] : []
      content {
        launch_template_id = aws_launch_template.aws_batch_launch_template.id
      }
    }
    instance_type      = var.batch_job_configuration.type == "EC2" ? var.batch_job_configuration.instance_types : null
    max_vcpus          = var.batch_job_configuration.max_vcpus
    min_vcpus          = var.batch_job_configuration.min_vcpus
    security_group_ids = toset([var.sg_id])
    subnets = [
      try("${var.private_subnets[0]}", ""),
      try("${var.private_subnets[1]}", ""),
      try("${var.private_subnets[2]}", "")
    ]
    tags = var.batch_job_configuration.type == "EC2" ? merge(tomap({ "Name" : join("-", [var.batch_job_configuration.name, "instance"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS) : null
    type = var.batch_job_configuration.type
  }

  tags = merge(tomap({ "Name" : join("-", [var.batch_job_configuration.name, "compute-environment"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_batch_job_queue" "aws_batch_job_queue" {
  provider = aws.batch_region
  name     = join("-", [var.batch_job_configuration.name, "job-queue"])
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.aws_batch_compute_environment.arn
  ]
  tags = merge(tomap({ "Name" : join("_", [var.batch_job_configuration.name, "job-queue"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_batch_job_definition" "aws_batch_job_definition" {
  provider              = aws.batch_region
  name                  = join("-", [var.batch_job_configuration.name, "job-definition"])
  type                  = "container"
  platform_capabilities = [var.batch_job_configuration.type]
  timeout {
    attempt_duration_seconds = 18000
  }
  container_properties = jsonencode({
    image                        = join(".", [local.account_id, "dkr.ecr", local.region, "amazonaws", var.batch_job_configuration.image])
    jobRoleArn                   = var.qatalyst_aws_batch_service_role
    executionRoleArn             = var.qatalyst_aws_batch_service_role
    resourceRequirements         = var.batch_job_configuration.type == "FARGATE" ? local.batch_resource_requirements_fargate_cpu : null
    fargateqatalystConfiguration = var.batch_job_configuration.type == "FARGATE" ? { qatalystVersion = "LATEST" } : null

    environment = [
      {
        name  = "STAGE"
        value = var.STAGE
      },
      {
        name  = "REGION_NAME"
        value = local.region
      },
      {
        name  = "AWS_ACCOUNT_ID"
        value = local.account_id
      },
      {
        name  = "SENTRY_SAMPLE_RATE"
        value = var.STAGE == "prod" ? "1" : "0.5"
      },
      {
        name  = "SENTRY_PROFILING_SAMPLE_RATE"
        value = var.STAGE == "prod" ? "1" : "0.5"
      }
    ]
  })

  tags = merge(tomap({ "Name" : join("-", [var.batch_job_configuration.name, "job-definition"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_launch_template" "aws_batch_launch_template" {
  provider = aws.batch_region
  name     = join("-", [var.batch_job_configuration.name, "launch-template"])

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 100
      volume_type = "gp2"
    }
  }

  tags = merge(tomap({ "Name" : join("-", [var.batch_job_configuration.name, "launch-template"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}