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
  datacenter_code           = lookup(var.datacenter_codes, data.aws_region.batch_region.name)
  account_id                = data.aws_caller_identity.current.account_id
  ecr_repo                  = join(".", [local.account_id, "dkr.ecr", data.aws_region.batch_region.name, "amazonaws", var.batch_job_configuration.image])
  batch_job_definition_name = join("-", ["qatalyst", var.batch_job_configuration.service_name, "batch-job-definition"])
  batch_compute_name        = join("-", ["qatalyst", var.batch_job_configuration.service_name, "batch-compute"])
  batch_job_queue           = join("-", ["qatalyst", var.batch_job_configuration.service_name, "batch-job-queue"])
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
  batch_resource_requirements_ec2_gpu = concat(local.batch_resource_requirements_fargate_cpu, [
    {
      type  = "GPU"
      value = var.batch_job_configuration.required_gpu
    }
  ])
}

resource "aws_batch_compute_environment" "qatalyst_compute_environment" {
  provider                 = aws.batch_region
  compute_environment_name = local.batch_compute_name
  service_role             = var.batch_service_role
  type                     = "MANAGED"

  compute_resources {
    instance_role = var.batch_job_configuration.type == "EC2" ? var.batch_iam_instance_profile : null

    dynamic "launch_template" {
      for_each = var.batch_job_configuration.type == "EC2" ? [1] : []
      content {
        launch_template_id = aws_launch_template.aws_batch_launch_template.id
      }
    }

    instance_type      = var.batch_job_configuration.type == "EC2" ? var.batch_job_configuration.instance_types : null
    max_vcpus          = var.batch_job_configuration.max_vcpus
    min_vcpus          = var.batch_job_configuration.min_vcpus
    security_group_ids = toset([var.security_group_id])
    subnets = [
      try("${var.subnet_ids[0]}", ""),
      try("${var.subnet_ids[1]}", ""),
      try("${var.subnet_ids[2]}", "")
    ]
    tags = var.batch_job_configuration.type == "EC2" ? merge(tomap({ "Name" : join("-", [var.batch_job_configuration.name, "instance"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS) : null
    type = var.batch_job_configuration.type
  }


  tags = merge(tomap({ "Name" : join("-", [local.batch_compute_name, var.STAGE]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_batch_job_queue" "qatalyst_job_queue" {
  provider = aws.batch_region
  name     = local.batch_job_queue
  state    = "ENABLED"
  priority = 1

  compute_environment_order {
    order               = 1
    compute_environment = aws_batch_compute_environment.qatalyst_compute_environment.arn
  }

  tags = merge(tomap({ "Name" : join("-", [local.batch_job_queue, var.STAGE]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_batch_job_definition" "qatalyst-media-processing-job-definition" {
  provider = aws.batch_region
  name     = local.batch_job_definition_name
  type     = "container"

  platform_capabilities = [
    "FARGATE",
  ]
  container_properties = jsonencode({
    image                        = local.ecr_repo
    jobRoleArn                   = var.batch_job_role
    executionRoleArn             = var.batch_execution_role
    fargatePlatformConfiguration = var.batch_job_configuration.type == "FARGATE" ? { platformVersion = "LATEST" } : null
    resourceRequirements         = var.batch_job_configuration.type == "FARGATE" ? local.batch_resource_requirements_fargate_cpu : local.batch_resource_requirements_ec2_gpu,
    mountPoints = try(var.batch_job_configuration.efs, null) != null ? [
      {
        sourceVolume  = var.batch_job_configuration.efs
        containerPath = var.batch_job_configuration.efs_path
        readOnly      = false
      }
    ] : []
    volumes = try(var.batch_job_configuration.efs, null) != null ? [
      {
        efsVolumeConfiguration = {
          fileSystemId      = var.file_system_id
          rootDirectory     = "/"
          transitEncryption = "ENABLED"
          authorizationConfig = {
            accessPointId = var.access_point_id
            "iam"         = "ENABLED"
          }
        }
        name = var.batch_job_configuration.efs
      }
    ] : []
    command = try(var.batch_job_configuration.command, null)
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
    ]
  })
}
