output "ecs_cluster_id" {
  value = aws_ecs_cluster.qatalyst_ecs_cluster.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.qatalyst_ecs_cluster.name
}

output "ecs_security_group_ids" {
  value = [aws_security_group.qatalyst_ecs_sg.id]
}