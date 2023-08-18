terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cloudfront_region]
    }
  }
}


resource "aws_cloudfront_cache_policy" "qatalyst_cdn_cache_policy" {

  provider = aws.cloudfront_region
  name     = "qatalyst-cdn-cache-policy"

  # Cache policy default TTL settings
  default_ttl = 86400    # 1 day
  max_ttl     = 31536000 # 1 year
  min_ttl     = 1        # 1 second

  # Cache key settings
  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "all"
    }
    enable_accept_encoding_gzip   = true
    enable_accept_encoding_brotli = true
  }
}
