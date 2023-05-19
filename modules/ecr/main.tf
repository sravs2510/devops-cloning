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

resource "aws_ecr_repository" "qatalyst_repository" {
  # as Jenkins is in SEA Region
  provider = aws.ecr_region
  name     = "qatalyst-backend"
  tags     = merge(tomap({ "Name" : "qatalyst-backend-ecr" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ecr_lifecycle_policy" "qatalyst_repository_lifecycle" {
  provider   = aws.ecr_region
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