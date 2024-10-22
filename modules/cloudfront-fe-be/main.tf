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
  r53_hosted_zone_domain_name = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.sub_domain, var.base_domain])
  domain_suffix               = join(".", [var.sub_domain, var.base_domain])
  cf_domain_name              = var.STAGE == "prod" ? local.domain_suffix : join(".", [var.STAGE, local.domain_suffix])
  api_http_allowed_methods    = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  api_http_cache_methods      = ["GET", "HEAD", "OPTIONS"]
  account_id                  = data.aws_caller_identity.current.account_id
}

data "aws_cloudfront_cache_policy" "cache_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-CachingOptimized"
}

data "aws_cloudfront_response_headers_policy" "response_headers_policy" {
  provider = aws.cloudfront_region
  name     = "Managed-SecurityHeadersPolicy"
}

data "aws_cloudfront_cache_policy" "cache_policy_api" {
  provider = aws.cloudfront_region
  name     = "Managed-CachingDisabled"
}

data "aws_cloudfront_origin_request_policy" "origin_request_policy_api" {
  provider = aws.cloudfront_region
  name     = "Managed-AllViewer"
}
# CF OAI

resource "aws_cloudfront_origin_access_identity" "reports_s3_origin_identity" {
  provider = aws.cloudfront_region
  comment  = var.bucket_id
}

# CF Distribution
resource "aws_cloudfront_distribution" "reports_cf_distribution" {
  provider = aws.cloudfront_region
  #s3-origin
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_id                = local.cf_domain_name
    origin_access_control_id = var.s3_origin_access_control_id
  }

  dynamic "origin" {
    for_each = var.qatalyst_alb_dns_names
    content {
      domain_name = origin.value
      origin_id   = origin.value
      custom_header {
        name  = "REQUEST-SOURCE"
        value = "CLOUDFRONT"
      }
      custom_origin_config {
        http_port                = 80
        https_port               = 443
        origin_protocol_policy   = "https-only"
        origin_ssl_protocols     = ["TLSv1.2"]
        origin_keepalive_timeout = 60
        origin_read_timeout      = 60
      }
    }
  }
  aliases = [
    local.cf_domain_name
  ]
  default_root_object = "index.html"

  enabled = true

  dynamic "ordered_cache_behavior" {
    for_each = var.qatalyst_alb_dns_names
    content {
      path_pattern             = join("", ["/v1/", ordered_cache_behavior.key, "/*"])
      allowed_methods          = local.api_http_allowed_methods
      cached_methods           = local.api_http_cache_methods
      target_origin_id         = ordered_cache_behavior.value
      cache_policy_id          = data.aws_cloudfront_cache_policy.cache_policy_api.id
      origin_request_policy_id = data.aws_cloudfront_origin_request_policy.origin_request_policy_api.id
      viewer_protocol_policy   = "https-only"
    }
  }

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cached_methods             = ["GET", "HEAD"]
    viewer_protocol_policy     = "redirect-to-https"
    compress                   = true
    target_origin_id           = local.cf_domain_name
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

  tags = merge(tomap({ "Name" : local.cf_domain_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

#S3 Bucket Policy
data "aws_iam_policy_document" "reports_s3_bucket_policy_document" {
  provider = aws.bucket_region
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.bucket_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.reports_s3_origin_identity.iam_arn]
    }
  }
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

resource "aws_s3_bucket_policy" "reports_s3_bucket_policy" {
  provider = aws.bucket_region
  bucket   = var.bucket_id
  policy   = data.aws_iam_policy_document.reports_s3_bucket_policy_document.json
}

data "aws_route53_zone" "route53_zone" {
  provider     = aws.cloudfront_region
  name         = local.r53_hosted_zone_domain_name
  private_zone = false
}

resource "aws_route53_record" "reports_cf_r53_record" {
  provider = aws.cloudfront_region
  name     = local.cf_domain_name
  type     = "A"
  zone_id  = data.aws_route53_zone.route53_zone.id

  alias {
    name                   = aws_cloudfront_distribution.reports_cf_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.reports_cf_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
