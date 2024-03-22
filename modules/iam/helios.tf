locals {
  helios_ecs_task_execution_role_name = "qatalyst-helios-ecs-task-execution-role"
  helios_ecs_task_iam_policy          = "qatalyst-helios-ecs-task-policy"
}

# ECS Task Execution Role
resource "aws_iam_role" "qatalyst_helios_ecs_task_execution_role" {
  provider = aws.iam_region
  name     = local.helios_ecs_task_execution_role_name
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
  tags = merge(tomap({ "Name" : local.helios_ecs_task_execution_role_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role_policy_attachment" "qatalyst_helios_ecs_task_execution_service_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_helios_ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "qatalyst_helios_ecs_task_execution_service_role_policy_attachment_2" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_helios_ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

resource "aws_iam_policy" "qatalyst_helios_ecs_task_iam_policy" {
  provider    = aws.iam_region
  name        = local.helios_ecs_task_iam_policy
  path        = "/"
  description = "Qatalyst Helios ECS Task IAM Policy"
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
        Resource = [local.s3_media_bucket_arn]
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Effect   = "Allow",
        Resource = [local.s3_media_bucket_object_arn]
      }
    ]
  })
  tags = merge(tomap({ "Name" : local.helios_ecs_task_iam_policy }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_iam_role" "qatalyst_helios_ecs_task_role" {
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

resource "aws_iam_role_policy_attachment" "qatalyst_helios_ecs_task_role_policy_attachment" {
  provider   = aws.iam_region
  role       = aws_iam_role.qatalyst_helios_ecs_task_role.name
  policy_arn = aws_iam_policy.qatalyst_helios_ecs_task_iam_policy.arn
}