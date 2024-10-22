output "cdn_cache_policy_id" {
  value = aws_cloudfront_cache_policy.qatalyst_cdn_cache_policy.id
}

output "s3_origin_access_control_id" {
  value = aws_cloudfront_origin_access_control.s3_origin_access_control.id
}