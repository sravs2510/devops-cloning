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

data "aws_caller_identity" "current" {
  provider = aws.bucket_region
}

locals {
  datacenter_code             = lookup(var.datacenter_codes, data.aws_region.current.name)
  r53_hosted_zone_domain_name = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.sub_domain, var.base_domain])
  domain_suffix               = join(".", [var.sub_domain, var.base_domain])
  multi_region_domain         = var.STAGE == "prod" ? join(".", [local.datacenter_code, local.domain_suffix]) : join(".", [local.datacenter_code, var.STAGE, local.domain_suffix])
  global_domain               = var.STAGE == "prod" ? local.domain_suffix : join(".", [var.STAGE, local.domain_suffix])
  cf_domain_name              = var.is_multi_region ? local.multi_region_domain : local.global_domain
  account_id                  = data.aws_caller_identity.current.account_id
}

data "aws_cloudfront_response_headers_policy" "response_headers_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-SecurityHeadersPolicy"
}

# CF Distribution
resource "aws_cloudfront_distribution" "media_cf_distribution" {
  provider = aws.cloudfront_region
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = local.cf_domain_name
    origin_access_control_id = var.s3_origin_access_control_id
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
    cache_policy_id            = var.cache_policy_id
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
    minimum_protocol_version       = "TLSv1.2_2021"
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
