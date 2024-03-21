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

output "batch_service_role_arn" {
  value = aws_iam_role.qatalyst_batch_service_role.arn
}

output "batch_job_role_arn" {
  value = aws_iam_role.qatalyst_batch_job_role.arn
}

output "batch_execution_role_arn" {
  value = aws_iam_role.qatalyst_batch_ecs_task_execution_role.arn
}
