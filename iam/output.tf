output "ecs_task_execution_role_arn" {
  value = aws_iam_role.qatalyst_ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.qatalyst_ecs_task_role.arn
}

output "qatalyst_ecs_autoscale_role_arn" {
  value = aws_iam_role.qatalyst_ecs_autoscale_role.arn
}
output "qatalyst_cw_dashboard_role_arn" {
  value = aws_iam_role.qatalyst_cw_dashboard_role.arn
}