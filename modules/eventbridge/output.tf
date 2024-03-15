output "eventbridge_group" {
  value = aws_scheduler_schedule_group.qatalyst_schedule_group.arn
}

