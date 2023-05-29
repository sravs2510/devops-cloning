terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ssm_region]
    }
  }
}

resource "aws_ssm_parameter" "qatalyst_bitly_bearer_token" {
  provider  = aws.ssm_region
  name      = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
  type      = "SecureString"
  value     = "#BITLY_BEARER_TOKEN"
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_sendgrid_key" {
  provider  = aws.ssm_region
  name      = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
  type      = "SecureString"
  value     = "#SENDGRID_KEY"
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "sendgrid-key"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_figma_access_token" {
  provider  = aws.ssm_region
  name      = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
  type      = "SecureString"
  value     = "#FIGMA_ACCESS_TOKEN"
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "figma-access-token"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "datadog_api_key" {
  provider  = aws.ssm_region
  name      = join("-", ["datadog", var.STAGE, "api-key"])
  type      = "SecureString"
  value     = "#DD_API_KEY"
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["datadog", var.STAGE, "api-key"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_sentry_dsn_value" {
  provider  = aws.ssm_region
  name      = join("-", ["qatalyst", var.STAGE, "sentry-dsn-value"])
  type      = "SecureString"
  value     = "#SENTRY_DSN_VALUE"
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "sentry-dsn-value"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_fingerprint_token" {
  provider  = aws.ssm_region
  name      = join("-", ["qatalyst", var.STAGE, "fingerprint-token"])
  type      = "SecureString"
  value     = "#FINGERPRINT_API_TOKEN"
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "fingerprint-token"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "random_uuid" "feature_flag_auth" {
}
resource "aws_ssm_parameter" "feature_flag_auth" {
  provider  = aws.ssm_region
  name      = join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])
  type      = "SecureString"
  value     = random_uuid.feature_flag_auth.result
  overwrite = true
  tags      = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "feature-flag-auth"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}