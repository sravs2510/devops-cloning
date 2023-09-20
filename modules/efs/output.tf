output "efs_id" {
  value = aws_efs_file_system.efs.id
}

output "efs_arn" {
  value = aws_efs_file_system.efs.arn
}

output "access_point_id" {
  value = aws_efs_access_point.access_point.id
}

output "access_point_arn" {
  value = aws_efs_access_point.access_point.arn
}