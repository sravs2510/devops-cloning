terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.s3_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.s3_region
}

locals {
  datacenter_code          = lookup(var.datacenter_codes, data.aws_region.current.name)
  studyview_domain         = format("%s%s", "https://", var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain]))
  dashboard_domain         = format("%s%s", "https://", var.STAGE == "prod" ? join(".", ["*", var.base_domain]) : join(".", ["*", var.STAGE, var.base_domain]))
  bucket_prefix            = join(".", [var.bucket_prefix, var.base_domain])
  multi_region_bucket_name = var.STAGE == "prod" ? join(".", [local.datacenter_code, local.bucket_prefix]) : join(".", [local.datacenter_code, var.STAGE, local.bucket_prefix])
  global_bucket_name       = var.STAGE == "prod" ? local.bucket_prefix : join(".", [var.STAGE, local.bucket_prefix])
  bucket_name              = var.is_multi_region ? local.multi_region_bucket_name : local.global_bucket_name
}

resource "aws_s3_bucket" "s3_bucket" {
  provider = aws.s3_region
  bucket   = local.bucket_name
  tags     = merge(tomap({ "Name" : join("-", [local.datacenter_code, "qatalyst", var.bucket_prefix, "bucket"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  provider = aws.s3_region
  bucket   = aws_s3_bucket.s3_bucket.id
  acl      = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  provider                = aws.s3_region
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_cors_configuration" "aws_cors_config" {
  provider = aws.s3_region
  bucket   = aws_s3_bucket.s3_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET"]
    allowed_origins = var.STAGE != "dev" ? [local.studyview_domain, local.dashboard_domain] : [local.studyview_domain, local.dashboard_domain, "http://localhost:3000", "http://*.localhost:3000"]
    expose_headers  = []
    max_age_seconds = 3600
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_bucket_lifecycle" {
  provider = aws.s3_region
  rule {
    id     = "delete-old-objects-aborted-multi-part-uploads"
    status = "Enabled"
    filter {}
    expiration {
      days = var.object_expiration_duration
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
  bucket = aws_s3_bucket.s3_bucket.id
}