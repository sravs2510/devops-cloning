terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.batch_region]
    }
  }
}

data "aws_region" "batch_region" {
  provider = aws.batch_region
}

data "aws_caller_identity" "current" {
  provider = aws.batch_region
}

data "aws_opensearch_domain" "qatalyst_domain" {
  provider    = aws.batch_region
  domain_name = join("-", ["converz", var.STAGE, "search", local.datacenter_code])
}

locals {
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.batch_region.name)
  account_id      = data.aws_caller_identity.current.account_id
  ecr_repo        = join(".", [local.account_id, "dkr.ecr", local.datacenter_code, "amazonaws", var.batch_job_configuration.image])
}

resource "aws_batch_compute_environment" "qatalyst_compute_environment" {
  provider                 = aws.batch_region
  compute_environment_name = var.batch_compute

  compute_resources {
    max_vcpus          = 200
    min_vcpus          = 0
    security_group_ids = [var.sg_id]
    subnets            = var.private_subnets
    type               = "FARGATE"
  }

  service_role = var.batch_service_role
  type         = "MANAGED"

  tags = merge(tomap({ "Name" : join("-", [var.batch_compute, var.STAGE]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_batch_job_queue" "qatalyst_job_queue" {
  provider = aws.batch_region
  name     = var.batch_job_queue
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.qatalyst_compute_environment.arn
  ]

  tags = merge(tomap({ "Name" : join("-", [var.batch_job_queue, var.STAGE]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_batch_job_definition" "qatalyst_job_definition" {
  provider = aws.batch_region
  name     = var.batch_job_definition
  type     = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = jsonencode({
    jobRoleArn = var.batch_job_role
    image      = local.ecr_repo
    fargatePlatformConfiguration = {
      platformVersion = "LATEST"
    }

    resourceRequirements = [
      {
        type  = "VCPU"
        value = "4"
      },
      {
        type  = "MEMORY"
        value = "8192"
      }
    ],

    environment = [
      {
        name  = "STAGE"
        value = var.STAGE
      },
      {
        name  = "REGION_NAME",
        value = data.aws_region.batch_region.name
      },
      {
        name  = "DATACENTER_CODE",
        value = local.datacenter_code
      },
      {
        name  = "AWS_ACCOUNT_ID",
        value = local.account_id
      },
      {
        name  = "LOG_LEVEL"
        value = "INFO"
      },
      {
        name  = "OPENSEARCH_DOMAIN",
        value = join("", ["https://", data.aws_opensearch_domain.qatalyst_domain.endpoint])
      },
      {
        name  = "SENTRY_SAMPLE_RATE"
        value = "1"
      },
      {
        name  = "SENTRY_TRACES_SAMPLE_RATE"
        value = "0"
      },
      {
        name  = "SENTRY_PROFILING_SAMPLE_RATE"
        value = "0"
      }
    ],

    secrets = [
      {
        name      = "MEDIACONVERT_ENDPOINT"
        valueFrom = "MEDIACONVERT_ENDPOINT" #This ssm stored via platform platform infra
      }
    ]

    executionRoleArn = var.batch_execution_role
  })
}