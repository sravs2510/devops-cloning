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
