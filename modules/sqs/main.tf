terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.sqs_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.sqs_region
}

resource "aws_sqs_queue" "cyborg_queue" {
  provider = aws.sqs_region

  for_each                   = var.sqs_details
  name                       = each.value.queue_name
  delay_seconds              = each.value.delay_seconds
  max_message_size           = each.value.max_message_size
  message_retention_seconds  = each.value.message_retention_seconds
  receive_wait_time_seconds  = each.value.receive_wait_time_seconds
  visibility_timeout_seconds = each.value.visibility_timeout_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.cyborg_queue_deadletter[each.key].arn
    maxReceiveCount     = 4
  })
  depends_on = [
    aws_sqs_queue.cyborg_queue_deadletter
  ]

  tags = merge(tomap({ "Name" : each.value.queue_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_sqs_queue" "cyborg_queue_deadletter" {
  provider = aws.sqs_region

  for_each                  = var.sqs_details
  name                      = "${each.value.queue_name}-dl"
  message_retention_seconds = 1209600 #14 days

  tags = merge(tomap({ "Name" : "${each.value.queue_name}-dl" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}