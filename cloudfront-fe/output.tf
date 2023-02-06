output "cf_distribution_id" {
  value = aws_cloudfront_distribution.media_cf_distribution.id
}

output "cf_domain_name" {
  value = aws_cloudfront_distribution.media_cf_distribution.domain_name
}

output "cf_hosted_zone_id" {
  value = aws_cloudfront_distribution.media_cf_distribution.hosted_zone_id
}