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

data "aws_sns_topic" "current" {
  name     = "DevOps-Alerts-Topic"
  provider = aws.sqs_region
}
resource "aws_sqs_queue" "qatalyst_service_queue" {
  provider = aws.sqs_region

  for_each                   = var.sqs_details
  name                       = each.value.queue_name
  delay_seconds              = each.value.delay_seconds
  max_message_size           = each.value.max_message_size
  message_retention_seconds  = each.value.message_retention_seconds
  receive_wait_time_seconds  = each.value.receive_wait_time_seconds
  visibility_timeout_seconds = each.value.visibility_timeout_seconds
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.qatalyst_service_queue_deadletter[each.key].arn
    maxReceiveCount     = 4
  })
  depends_on = [
    aws_sqs_queue.qatalyst_service_queue_deadletter
  ]

  tags = merge(tomap({ "Name" : each.value.queue_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_sqs_queue" "qatalyst_service_queue_deadletter" {
  provider = aws.sqs_region

  for_each                  = var.sqs_details
  name                      = "${each.value.queue_name}-dl"
  message_retention_seconds = 1209600 #14 days

  tags = merge(tomap({ "Name" : "${each.value.queue_name}-dl" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

#Cloudwatch Metrics
resource "aws_cloudwatch_metric_alarm" "qatalyst_sqs_cw_alarm" {
  provider            = aws.sqs_region
  for_each            = var.sqs_details
  alarm_name          = join("-", [each.value.queue_name, "visibility-alarm"])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = "300" // 5 minutes
  statistic           = "SampleCount"
  threshold           = "300" // 5 minutes
  alarm_description   = "Alarm if the age of the oldest message in the queue is greater than 5 minutes."

  dimensions = {
    QueueName = each.value.queue_name
  }
  alarm_actions = [data.aws_sns_topic.current.arn] // Define actions to take when the alarm state changes
}
resource "aws_cloudwatch_metric_alarm" "qatalyst_sqs_dl_cw_alarm" {
  provider            = aws.sqs_region
  for_each            = var.sqs_details
  alarm_name          = join("-", [each.value.queue_name, "dl", "visibility-alarm"])
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = "300" // 5 minutes
  statistic           = "SampleCount"
  threshold           = "300" // 5 minutes
  alarm_description   = "Alarm if the age of the oldest message in the queue is greater than 5 minutes."

  dimensions = {
    QueueName = "${each.value.queue_name}-dl"
  }
  alarm_actions = [data.aws_sns_topic.current.arn] // Define actions to take when the alarm state changes
}