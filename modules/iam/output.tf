output "ecs_task_execution_role_arn" {
  value = aws_iam_role.qatalyst_ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.qatalyst_ecs_task_role.arn
}

output "qatalyst_ecs_autoscale_role_arn" {
  value = aws_iam_role.qatalyst_ecs_autoscale_role.arn
}

output "cyborg_ecs_task_role_arn" {
  value = aws_iam_role.qatalyst_ecs_cyborg_task_role.arn
}

output "furyblade_ecs_task_role_arn" {
  value = aws_iam_role.qatalyst_ecs_furyblade_task_role.arn
}

output "mammoth_ecs_task_role_arn" {
  value = aws_iam_role.qatalyst_ecs_mammoth_task_role.arn
}

output "event_bridge_scheduler_role_arn" {
  value = aws_iam_role.eventbridge_scheduler_role.arn
}

output "qatalyst_aws_iam_instance_profile" {
  value = aws_iam_instance_profile.qatalyst_ecs_instance_profile.arn
}

output "qatalyst_aws_batch_service_role" {
  value = aws_iam_role.qatalyst_aws_batch_service_role.arn
}