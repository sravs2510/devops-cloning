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
  account_id                          = data.aws_caller_identity.current.account_id
  media_bucket_name                   = var.STAGE == "prod" ? join(".", ["*", "media.getqatalyst.io"]) : join(".", ["*", var.STAGE, "media.getqatalyst.io"])
  s3_media_bucket_arn                 = join(":", ["arn:aws:s3::", local.media_bucket_name])
  s3_media_bucket_object_arn          = join("", ["arn:aws:s3:::", local.media_bucket_name, "/*"])
  common_bucket_name                  = var.STAGE == "prod" ? "common.getqatalyst.io/*" : join(".", [var.STAGE, "common.getqatalyst.io/*"])
  s3_common_bucket_arn                = join(":", ["arn:aws:s3::", local.common_bucket_name])
  ses_arn                             = join(":", ["arn:aws:ses", "us-west-2", local.account_id, "identity/*"])
  qatalyst_lambdas_arn                = join(":", ["arn:aws:lambda", "*", local.account_id, "function", "qatalyst-*"])
  qatalyst_sqs_arn                    = join(":", ["arn:aws:sqs", "*", local.account_id, "qatalyst-*"])
  qatalyst_eventbridge_scheduler_arn  = join(":", ["arn:aws:scheduler", "*", local.account_id, "*"])
  qatalyst_iam_passrole_arn           = join(":", ["arn:aws:iam:", local.account_id, "*"])
  qatalyst_media_bucket_name          = var.STAGE == "prod" ? join("-", ["*", "qatalyst-media"]) : join("-", ["*", var.STAGE, "qatalyst-media"])
  s3_qatalyst_media_bucket_arn        = join(":", ["arn:aws:s3::", local.qatalyst_media_bucket_name])
  s3_qatalyst_media_bucket_object_arn = join("", [local.s3_qatalyst_media_bucket_arn, "/*"])
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
        Resource = [local.s3_media_bucket_arn, local.s3_qatalyst_media_bucket_arn]
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        Effect   = "Allow",
        Resource = [local.s3_media_bucket_object_arn, local.s3_qatalyst_media_bucket_object_arn]
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
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
        Action   = ["lambda:InvokeFunction"],
        Effect   = "Allow",
        Resource = local.qatalyst_lambdas_arn
      },
      {
        Action = [
          "sqs:SendMessage",
          "sqs:GetQueueAttributes"
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_sqs_arn
      },
      {
        Action = [
          "batch:*"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:batch:*:${local.account_id}:job-definition/qatalyst*",
          "arn:aws:batch:*:${local.account_id}:job-queue/qatalyst*",
          "arn:aws:batch:*:${local.account_id}:compute-environment/qatalyst*"
        ]
      }
    ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-task-iam-policy" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_policy" "qatalyst_ecs_cyborg_task_iam_policy" {
  provider    = aws.iam_region
  name        = "qatalyst_ecs_cyborg_task_iam_policy"
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
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_object_arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
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
        Action   = ["lambda:InvokeFunction"],
        Effect   = "Allow",
        Resource = local.qatalyst_lambdas_arn
      },
      {
        Action = [
          "elasticfilesystem:DescribeMountTargets",
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:DescribeTags",
          "elasticfilesystem:ClientMount",
          "elasticfilesystem:ClientWrite",
          "elasticfilesystem:CreateMountTarget",
          "elasticfilesystem:ClientRootAccess"
        ]
        Effect = "Allow"
        Resource = [
          join(":", ["arn:aws:elasticfilesystem:*", local.account_id, "access-point/*"]),
          join(":", ["arn:aws:elasticfilesystem:*", local.account_id, "file-system/*"])
        ]
      },
      {
        Action = [
          "sqs:*"
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_sqs_arn
      },
      {
        Action = [
          "scheduler:CreateSchedule",
          "scheduler:DeleteSchedule",
          "scheduler:TagResource",
          "scheduler:UntagResource",
          "scheduler:ListTagsForResource",
          "scheduler:GetSchedule",
          "scheduler:GetScheduleGroup",
          "scheduler:ListSchedules",
          "scheduler:ListScheduleGroups"
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_eventbridge_scheduler_arn
      }
    ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-cyborg-task-iam-policy" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_policy" "qatalyst_ecs_furyblade_task_iam_policy" {
  provider    = aws.iam_region
  name        = "qatalyst_ecs_furyblade_task_iam_policy"
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
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_object_arn
      },
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_sqs_arn
      },
      {
        Action = [
          "scheduler:CreateSchedule",
          "scheduler:DeleteSchedule",
          "scheduler:TagResource",
          "scheduler:UntagResource",
          "scheduler:ListTagsForResource",
          "scheduler:GetSchedule",
          "scheduler:GetScheduleGroup",
          "scheduler:ListSchedules",
          "scheduler:ListScheduleGroups"
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_eventbridge_scheduler_arn
      },
      {
        Action   = ["iam:PassRole"]
        Effect   = "Allow"
        Resource = local.qatalyst_iam_passrole_arn
      }
    ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-furyblade-task-iam-policy" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_policy" "qatalyst_ecs_mammoth_task_iam_policy" {
  provider    = aws.iam_region
  name        = "qatalyst_ecs_mammoth_task_iam_policy"
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
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_object_arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        Effect   = "Allow",
        Resource = local.s3_common_bucket_arn
      },
      {
        Action = [
          "ses:SendEmail"
        ],
        Effect   = "Allow",
        Resource = local.ses_arn
      },
      {
        Action   = ["lambda:InvokeFunction"],
        Effect   = "Allow",
        Resource = local.qatalyst_lambdas_arn
      },
      {
        Action = [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_sqs_arn
      }
    ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-mammoth-task-iam-policy" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
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
resource "aws_iam_role" "qatalyst_ecs_cyborg_task_role" {
  provider = aws.iam_region
  name     = "qatalyst-ecs-cyborg-task-iam-role"
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
  tags = merge(tomap({ "Name" : "qatalyst-ecs-cyborg-task-role" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role" "qatalyst_ecs_furyblade_task_role" {
  provider = aws.iam_region
  name     = "qatalyst-ecs-furyblade-task-iam-role"
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
          "Sid" : "ECSTask"
        },
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "scheduler.amazonaws.com"
          },
          "Action" : "sts:AssumeRole",
          "Sid" : "Scheduler"
        }
      ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-furyblade-task-role" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role" "qatalyst_ecs_mammoth_task_role" {
  provider = aws.iam_region
  name     = "qatalyst-ecs-mammoth-task-iam-role"
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
          "Condition" : {
            "StringEquals" : {
              "aws:SourceAccount" : local.account_id
            }
          }
        }
      ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-mammoth-task-role" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_task_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_task_role.name
  policy_arn = aws_iam_policy.qatalyst_ecs_task_iam_policy.arn
}
resource "aws_iam_role_policy_attachment" "qatalyst_ecs_cyborg_task_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_cyborg_task_role.name
  policy_arn = aws_iam_policy.qatalyst_ecs_cyborg_task_iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_furyblade_task_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_furyblade_task_role.name
  policy_arn = aws_iam_policy.qatalyst_ecs_furyblade_task_iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "qatalyst_ecs_mammoth_task_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_ecs_mammoth_task_role.name
  policy_arn = aws_iam_policy.qatalyst_ecs_mammoth_task_iam_policy.arn
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
          "Condition" : {
            "StringEquals" : {
              "aws:SourceAccount" : local.account_id
            }
          }
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
    Version = "2012-10-17"
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
          "s3:DeleteObject",
          "s3:AbortMultipartUpload",
          "s3:ListMultipartUploadParts"
        ],
        Effect   = "Allow",
        Resource = local.s3_media_bucket_object_arn
      },
    ]
  })
}

resource "aws_iam_role" "media_convert_role" {
  provider = aws.iam_region
  name     = "qatalyst-media-convert-role"
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
          "Condition" : {
            "StringEquals" : {
              "aws:SourceAccount" : local.account_id
            }
          }
        }
      ]
  })
}

resource "aws_iam_role_policy_attachment" "qatalyst_media_convert_role" {
  provider   = aws.iam_region
  role       = aws_iam_role.media_convert_role.id
  policy_arn = aws_iam_policy.media_convert_policy.arn
}

resource "aws_iam_policy" "event_bridge_policy" {
  provider    = aws.iam_region
  name        = "qatalyst-event-bridge-scheduler-policy"
  description = "qatalyst event bridge scheduler policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:SendMessage"
        ],
        Effect   = "Allow",
        Resource = local.qatalyst_sqs_arn
      }
    ]
  })
}

resource "aws_iam_role" "eventbridge_scheduler_role" {
  provider = aws.iam_region
  name     = "qatalyst-evenbridge-scheduler-iam-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "scheduler.amazonaws.com"
          },
          "Action" : "sts:AssumeRole",
          "Condition" : {
            "StringEquals" : {
              "aws:SourceAccount" : local.account_id
            }
          }
        }
      ]
  })
  tags = merge(tomap({ "Name" : "qatalyst-ecs-task-role" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role_policy_attachment" "eventbridge_scheduler_role_attach_policy" {
  provider   = aws.iam_region
  role       = aws_iam_role.eventbridge_scheduler_role.id
  policy_arn = aws_iam_policy.event_bridge_policy.arn
}
