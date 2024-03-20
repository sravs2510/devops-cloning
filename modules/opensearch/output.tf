output "opensearch_host" {
  value = aws_opensearch_domain.opensearch_domain.endpoint
}

output "opensearch_password" {
  value = aws_ssm_parameter.ssm_opensearch_master_password.value
}
