terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.sea_region, aws.in_region, aws.us_region, aws.eu_region]
    }
  }
}

data "aws_region" "sea_region" {
  provider = aws.sea_region
}

data "aws_region" "in_region" {
  provider = aws.in_region
}

data "aws_region" "us_region" {
  provider = aws.us_region
}

data "aws_region" "eu_region" {
  provider = aws.eu_region
}

resource "aws_ecr_repository" "qatalyst_repository" {
  # as Jenkins is in SEA Region
  provider = aws.sea_region
  name     = "qatalyst-backend"
  tags     = merge(tomap({ "Name" : "qatalyst-backend-ecr" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecr_lifecycle_policy" "qatalyst_repository_lifecycle" {
  provider   = aws.sea_region
  repository = aws_ecr_repository.qatalyst_repository.name
  policy     = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

data "aws_caller_identity" "current" {
  provider = aws.sea_region
}

locals {
  account_id          = data.aws_caller_identity.current.account_id
  replication_regions = [data.aws_region.eu_region.name, data.aws_region.us_region.name, data.aws_region.in_region.name]
}

resource "aws_ecr_replication_configuration" "qatalyst_ecr_replication" {
  provider = aws.sea_region
  replication_configuration {
    rule {
      dynamic "destination" {
        # Replicate in eu-north-1, us-east-1, ap-south-1
        for_each = toset(local.replication_regions)

        content {
          region      = destination.key
          registry_id = local.account_id
        }
      }

      repository_filter {
        filter_type = "PREFIX_MATCH"
        filter      = "qatalyst"
      }
    }
  }
}