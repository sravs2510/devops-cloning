output "qatalyst_bitly_bearer_token" {
  value = aws_ssm_parameter.qatalyst_bitly_bearer_token.value
}

output "qatalyst_sendgrid_key" {
  value = aws_ssm_parameter.qatalyst_sendgrid_key.value
}

output "qatalyst_figma_access_token" {
  value = aws_ssm_parameter.qatalyst_figma_access_token.value
}

output "datadog_api_key" {
  value = aws_ssm_parameter.datadog_api_key.value
}

output "qatalyst_sentry_dsn_value" {
  value = aws_ssm_parameter.qatalyst_sentry_dsn_value.value
}

output "qatalyst_fingerprint_token" {
  value = aws_ssm_parameter.qatalyst_fingerprint_token.value
}

output "qatalyst_100ms_access_key" {
  value = aws_ssm_parameter.qatalyst_100ms_access_key.value
}