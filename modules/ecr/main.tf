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
  policy = jsonencode(
    {
      rules = [
        {
          rulePriority = 1
          description  = "Keep last 5 images"
          selection = {
            tagStatus   = "any",
            countType   = "imageCountMoreThan",
            countNumber = 5
          }
          action = {
            type = "expire"
          }
        }
      ]
    }
  )
}
