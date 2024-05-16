output "devops_sns_topic_arn" {
  value = data.aws_sns_topic.current.arn
}