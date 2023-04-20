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

locals {
  datacenter_code             = lookup(var.datacenter_codes, data.aws_region.current.name)
  r53_hosted_zone_domain_name = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.sub_domain, var.base_domain])
  domain_suffix               = join("", [var.sub_domain, var.base_domain])
  cf_datacenter_code_domain   = var.STAGE == "prod" ? join(".", [local.datacenter_code, local.domain_suffix]) : join(".", [local.datacenter_code, var.STAGE, local.domain_suffix])
  cf_with_prefix_domain       = var.STAGE == "prod" ? local.domain_suffix : join(".", [var.STAGE, local.domain_suffix])
  cf_domain_name              = var.is_multi_region ? local.cf_datacenter_code_domain : local.cf_with_prefix_domain
}

data "aws_cloudfront_cache_policy" "cache_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-CachingOptimized"
}

data "aws_cloudfront_response_headers_policy" "response_headers_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-SecurityHeadersPolicy"
}

# CF OAI
resource "aws_cloudfront_origin_access_identity" "media_s3_origin_identity" {
  provider = aws.cloudfront_region
  comment  = local.cf_domain_name
}

# CF Distribution
resource "aws_cloudfront_distribution" "media_cf_distribution" {
  provider = aws.cloudfront_region
  origin {
    domain_name = var.bucket_regional_domain_name
    origin_id   = local.cf_domain_name

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.media_s3_origin_identity.id}"
    }
  }

  aliases = [
    local.cf_domain_name
  ]

  enabled = true

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD", "OPTIONS"]
    cached_methods             = ["GET", "HEAD"]
    viewer_protocol_policy     = "redirect-to-https"
    compress                   = true
    target_origin_id           = local.cf_domain_name
    cache_policy_id            = data.aws_cloudfront_cache_policy.cache_policy.id
    response_headers_policy_id = data.aws_cloudfront_response_headers_policy.response_headers_policy.id
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
  }

  tags = merge(tomap({ "Name" : join("-", ["qatalyst-media-distribution", var.STAGE]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

#S3 Bucket Policy
data "aws_iam_policy_document" "media_s3_bucket_policy_document" {
  provider = aws.bucket_region
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.bucket_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.media_s3_origin_identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "media_s3_bucket_policy" {
  provider = aws.bucket_region
  bucket   = var.bucket_id
  policy   = data.aws_iam_policy_document.media_s3_bucket_policy_document.json
}

data "aws_route53_zone" "route53_zone" {
  provider     = aws.cloudfront_region
  name         = local.r53_hosted_zone_domain_name
  private_zone = false
}

resource "aws_route53_record" "media_cf_r53_record" {
  provider = aws.cloudfront_region
  name     = local.cf_domain_name
  type     = "A"
  zone_id  = data.aws_route53_zone.route53_zone.id

  alias {
    name                   = aws_cloudfront_distribution.media_cf_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.media_cf_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
