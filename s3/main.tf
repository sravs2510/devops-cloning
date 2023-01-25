terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.s3_region]
    }
  }
}

locals {
  studyview_domain = format("%s%s", "https://", var.STAGE == "prod" ? join(".", [ var.tester_view_sub_domain , var.base_domain ]) : join(".", [var.tester_view_sub_domain, var.STAGE , var.base_domain ]))
  dashboard_domain = format("%s%s", "https://", var.STAGE == "prod" ? join(".", ["*", var.base_domain]) : join(".", ["*", var.STAGE, var.base_domain]))
}
data "aws_region" "current" {
  provider = aws.s3_region
}

resource "aws_s3_bucket" "s3_bucket" {
  provider = aws.s3_region
  bucket   = join(".", [lookup(var.datacenter_codes, data.aws_region.current.name), var.bucket_prefix, var.STAGE, var.base_domain])
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst","media", lookup(var.datacenter_codes, data.aws_region.current.name), "bucket"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
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
