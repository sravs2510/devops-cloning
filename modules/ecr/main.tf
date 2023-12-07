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
  ecr_repo_tag_name = join("-", [var.repo_name, "ecr"])
}
resource "aws_ecr_repository" "qatalyst_repository" {
  # as Jenkins is in SEA Region
  provider = aws.ecr_region
  name     = var.repo_name
  tags     = merge(tomap({ "Name" : local.ecr_repo_tag_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecr_lifecycle_policy" "qatalyst_repository_lifecycle" {
  provider   = aws.ecr_region
  repository = aws_ecr_repository.qatalyst_repository.name
  policy     = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 5 untagged images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 5
      },
      "action": {
        "type": "expire"
      }
    },
    {
      "rulePriority": 2,
      "description": "Keep last 30 days images",
      "selection": {
        "tagStatus": "any",
        "countType": "sinceImagePushed",
        "countNumber": 30,
        "countUnit": "days"
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}