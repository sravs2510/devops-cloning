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
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:UpdateItem"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:us-east-1:081063778907:table/qatalyst-*"
      },
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
