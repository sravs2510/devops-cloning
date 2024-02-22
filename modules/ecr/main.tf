terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ecr_region]
    }
  }
}

data "aws_region" "ecr_region" {
  provider = aws.ecr_region
}

locals {
  repo_name = join("-", ["qatalyst", var.service_name])
  # DEV Policy
  dev_ecr_lcp = jsonencode(
    {
      rules = [
        {
          rulePriority = 1
          description  = "Keep last 1 untagged image"
          selection = {
            tagStatus   = "untagged",
            countType   = "imageCountMoreThan",
            countNumber = 1
          }
          action = {
            type = "expire"
          }
        }
      ]
    }
  )
  #Non Dev Policy
  ecr_lcp = jsonencode(
    {
      rules = [
        {
          rulePriority = 1
          description  = "Keep last 5 tagged images"
          selection = {
            tagStatus     = "tagged"
            tagPrefixList = ["20", "latest"]
            countType     = "imageCountMoreThan"
            countNumber   = 5
          }
          action = {
            type = "expire"
          }
        }
      ]
    }
  )
}

resource "aws_ecr_repository" "qatalyst_repository" {
  # as Jenkins is in SEA Region
  provider = aws.ecr_region
  name     = local.repo_name
  tags     = merge(tomap({ "Name" : local.repo_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecr_lifecycle_policy" "qatalyst_repository_lifecycle" {
  provider   = aws.ecr_region
  repository = aws_ecr_repository.qatalyst_repository.name
  policy     = var.STAGE == "dev" ? local.dev_ecr_lcp : local.ecr_lcp
}
