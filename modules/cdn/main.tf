terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cdn_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.cdn_region
}

locals {
  cdn_domain_name = join(".", ["cdn", var.base_domain])
}

#S3
resource "aws_s3_bucket" "cdn_s3_bucket" {
  provider = aws.cdn_region
  bucket   = local.cdn_domain_name
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst-cdn-bucket"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  provider = aws.cdn_region
  bucket   = aws_s3_bucket.cdn_s3_bucket.id
  acl      = "private"
}

resource "aws_s3_bucket_public_access_block" "cdn_s3_bucket_public_access_block" {
  provider                = aws.cdn_region
  bucket                  = aws_s3_bucket.cdn_s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_cors_configuration" "cdn_s3_cors_config" {
  provider = aws.cdn_region
  bucket   = aws_s3_bucket.cdn_s3_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3600
  }
}

#ACM
resource "aws_acm_certificate" "cdn_acm_domain_name" {
  provider          = aws.cdn_region
  domain_name       = local.cdn_domain_name
  validation_method = "DNS"
  tags              = merge(tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

data "aws_route53_zone" "domain_hosted_zone" {
  provider     = aws.cdn_region
  name         = var.base_domain
  private_zone = false
}

resource "aws_route53_record" "cdn_acm_domain_record_sets" {
  provider = aws.cdn_region
  for_each = {
    for dvo in aws_acm_certificate.cdn_acm_domain_name.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.domain_hosted_zone.zone_id
}

resource "aws_acm_certificate_validation" "cdn_acm_domain_validation" {
  provider                = aws.cdn_region
  certificate_arn         = aws_acm_certificate.cdn_acm_domain_name.arn
  validation_record_fqdns = [for record in aws_route53_record.cdn_acm_domain_record_sets : record.fqdn]
}

#CloudFront
data "aws_cloudfront_cache_policy" "cache_policy" {
  provider = aws.cdn_region
  name     = "Managed-CachingOptimized"
}

data "aws_cloudfront_response_headers_policy" "response_headers_policy" {
  provider = aws.cdn_region
  name     = "Managed-SecurityHeadersPolicy"
}

# CF OAI
resource "aws_cloudfront_origin_access_identity" "cdn_s3_origin_identity" {
  provider = aws.cdn_region
  comment  = local.cdn_domain_name
}

# CF Distribution
resource "aws_cloudfront_distribution" "cdn_cf_distribution" {
  provider = aws.cdn_region
  origin {
    domain_name = aws_s3_bucket.cdn_s3_bucket.bucket_domain_name
    origin_id   = local.cdn_domain_name

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${aws_cloudfront_origin_access_identity.cdn_s3_origin_identity.id}"
    }
  }

  aliases = [
    local.cdn_domain_name
  ]

  default_root_object = "index.html"

  enabled = true

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD", "OPTIONS"]
    cached_methods             = ["GET", "HEAD"]
    viewer_protocol_policy     = "redirect-to-https"
    compress                   = true
    target_origin_id           = local.cdn_domain_name
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
    acm_certificate_arn            = aws_acm_certificate.cdn_acm_domain_name.arn
    ssl_support_method             = "sni-only"
  }

  tags = merge(tomap({ "Name" : local.cdn_domain_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

#S3 Bucket Policy
data "aws_iam_policy_document" "cdn_s3_bucket_policy_document" {
  provider = aws.cdn_region
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.cdn_s3_bucket.arn}/*"]
  
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cdn_s3_origin_identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "cdn_s3_bucket_policy" {
  provider = aws.cdn_region
  bucket   = aws_s3_bucket.cdn_s3_bucket.id
  policy   = data.aws_iam_policy_document.cdn_s3_bucket_policy_document.json
}


resource "aws_route53_record" "cdn_cf_r53_record" {
  provider = aws.cdn_region
  name     = local.cdn_domain_name
  type     = "A"
  zone_id  = data.aws_route53_zone.domain_hosted_zone.id

  alias {
    name                   = aws_cloudfront_distribution.cdn_cf_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.cdn_cf_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
