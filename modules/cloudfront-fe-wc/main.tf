terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cloudfront_region, aws.bucket_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.bucket_region
}

data "aws_cloudfront_cache_policy" "cache_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-CachingOptimized"
}

data "aws_cloudfront_response_headers_policy" "response_headers_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-SecurityHeadersPolicy"
}

data "aws_caller_identity" "current" {
  provider = aws.bucket_region
}

locals {
  wildcard_cf_domain = join(".", ["*", var.cf_domain_name])
  account_id         = data.aws_caller_identity.current.account_id
}

# CF Distribution
resource "aws_cloudfront_distribution" "media_cf_distribution" {
  provider = aws.cloudfront_region
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = var.cf_domain_name
    origin_access_control_id = var.s3_origin_access_control_id
  }

  aliases = [
    var.cf_domain_name,
    local.wildcard_cf_domain
  ]

  default_root_object = "index.html"

  enabled = true

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cached_methods             = ["GET", "HEAD"]
    viewer_protocol_policy     = "redirect-to-https"
    compress                   = true
    target_origin_id           = var.cf_domain_name
    cache_policy_id            = data.aws_cloudfront_cache_policy.cache_policy.id
    response_headers_policy_id = data.aws_cloudfront_response_headers_policy.response_headers_policy.id
  }

  custom_error_response {
    error_caching_min_ttl = 3600
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
  }

  tags = merge(tomap({ "Name" : var.base_domain }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

#S3 Bucket Policy
data "aws_iam_policy_document" "media_s3_bucket_policy_document" {
  provider = aws.bucket_region
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.bucket_arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"] # Use the service principal for CloudFront
    }
    condition {
      test     = "StringLike"
      variable = "AWS:SourceArn"
      values   = ["arn:aws:cloudfront::${local.account_id}:distribution/*"]
    }
  }
}

resource "aws_s3_bucket_policy" "media_s3_bucket_policy" {
  provider = aws.bucket_region
  bucket   = var.bucket_id
  policy   = data.aws_iam_policy_document.media_s3_bucket_policy_document.json
}