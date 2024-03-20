output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnets" {
  value = aws_subnet.private_subnet.*.id
}

output "security_group_id" {
  value = aws_security_group.cyborg_security_group.id
}

output "lambda_security_group_id" {
  value = aws_security_group.lambda_security_group.id
}
