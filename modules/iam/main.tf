terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.iam_region]
    }
  }
}

resource "aws_iam_role" "qatalyst_ecs_task_execution_role" {
  provider = aws.iam_region
  name     = "qatalyst-ecs-task-execution-role-name"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "ecs-tasks.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-task-execution-role" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_task_execution_service_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_task_execution_service_role_policy_attachment_2" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

data "aws_caller_identity" "current" {
  provider = aws.iam_region
}

data "aws_region" "current" {
  provider = aws.iam_region
}

locals {
  account_id                 = data.aws_caller_identity.current.account_id
  region                     = data.aws_region.current.name
  media_bucket_name          = var.STAGE == "prod" ? join(".", ["*", "media.getqatalyst.io"]) : join(".", ["*", var.STAGE, "media.getqatalyst.io"])
  s3_media_bucket_arn        = join(":", ["arn:aws:s3::", local.media_bucket_name])
  s3_media_bucket_object_arn = join("", ["arn:aws:s3:::", local.media_bucket_name, "/*"])
  common_bucket_name         = var.STAGE == "prod" ? "common.getqatalyst.io/*" : join(".", [var.STAGE, "common.getqatalyst.io/*"])
  s3_common_bucket_arn       = join(":", ["arn:aws:s3::", local.common_bucket_name])
  ses_arn                    = join(":", ["arn:aws:ses", "us-west-2", local.account_id, "identity/*"])
  qatalyst_lambdas_arn       = join(":", ["arn:aws:lambda", local.region, local.account_id, "function", "qatalyst-*"])
}

# add the required permission to the policy below
resource "aws_iam_policy" "qatalyst_ecs_task_iam_policy" {
  provider    = aws.iam_region
  name        = "qatalyst_ecs_task_iam_policy"
  path        = "/"
  description = "Qatalyst ECS Task IAM Policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:BatchGetItem",
          "dynamodb:BatchWriteItem",
          "dynamodb:PutItem",
          "dynamodb:DescribeTable",
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:UpdateItem"
        ]
        Effect   = "Allow"
        Resource = join(":", ["arn:aws:dynamodb:*", local.account_id, "table/qatalyst-*"])
      },
      {
        Action = [
          "s3:ListBucket"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_object_arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Effect   = "Allow",
        Resource = local.s3_common_bucket_arn
      },
      {
        Action = [
          "s3:GetObject"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "ses:SendEmail"
        ],
        Effect   = "Allow",
        Resource = local.ses_arn
      },
      {
        Action = ["lambda:InvokeFunction"],
        Effect = "Allow",
        Resource = local.qatalyst_lambdas_arn
      }
    ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-task-iam-policy" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role" "qatalyst_ecs_task_role" {
  provider = aws.iam_region
  name     = "qatalyst-ecs-task-iam-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "ecs-tasks.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : ""
        }
      ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-task-role" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_task_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_task_role.name
  policy_arn = aws_iam_policy.qatalyst_ecs_task_iam_policy.arn
}

resource "aws_iam_role" "qatalyst_ecs_autoscale_role" {
  provider = aws.iam_region
  name     = "qatalyst-ecs-autoscale-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "application-autoscaling.amazonaws.com"
          },
          "Effect" : "Allow"
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_autoscale_policy" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_autoscale_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole"
}

resource "aws_iam_policy" "media_convert_policy" {
  provider    = aws.iam_region
  name        = "qatalyst-media-convert-policy"
  description = "qatalyst media convert Policy"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_object_arn
      },
    ]
  })
}

resource "aws_iam_role" "media_convert_role" {
  provider           = aws.iam_region
  name               = "qatalyst-media-convert-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "mediaconvert.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    })
}

resource "aws_iam_role_policy_attachment" "qatalyst_media_convert_role" {
  provider   = aws.iam_region
  role       = aws_iam_role.media_convert_role.id
  policy_arn = aws_iam_policy.media_convert_policy.arn
}