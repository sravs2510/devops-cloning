terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ssm_region]
    }
    random = {
      source                = "hashicorp/random"
      configuration_aliases = [random.random]
    }
  }
}

data "aws_region" "ssm_region" {
  provider = aws.ssm_region
}
locals {
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.ssm_region.name)
}
resource "aws_ssm_parameter" "qatalyst_bitly_bearer_token" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
  type     = "SecureString"
  value    = "#BITLY_BEARER_TOKEN"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_sendgrid_key" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
  type     = "SecureString"
  value    = "#SENDGRID_KEY"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "sendgrid-key"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_figma_access_token" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
  type     = "SecureString"
  value    = "#FIGMA_ACCESS_TOKEN"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "figma-access-token"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "datadog_api_key" {
  provider = aws.ssm_region
  name     = join("-", ["datadog", var.STAGE, "api-key"])
  type     = "SecureString"
  value    = "#DD_API_KEY"
  tags     = merge(tomap({ "Name" : join("-", ["datadog", var.STAGE, "api-key"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_sentry_dsn_value" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "sentry-dsn-value"])
  type     = "SecureString"
  value    = "#SENTRY_DSN_VALUE"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "sentry-dsn-value"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_fingerprint_token" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "fingerprint-token"])
  type     = "SecureString"
  value    = "#FINGERPRINT_API_TOKEN"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "fingerprint-token"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "random_uuid" "feature_flag_auth" {
  provider = random.random
}
resource "aws_ssm_parameter" "qatalyst_feature_flag_auth" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])
  type     = "SecureString"
  value    = random_uuid.feature_flag_auth.result
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "feature-flag-auth"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_100ms_access_key" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "100ms-access-key"])
  type     = "SecureString"
  value    = "#QATALYST_100MS_ACCESS_KEY"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "100ms-access-key"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_100ms_secret_key" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "100ms-secret-key"])
  type     = "SecureString"
  value    = "#QATALYST_100MS_SECRET_KEY"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "100ms-secret-key"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_client_id_in" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "in" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "client-id-in"])
  type     = "SecureString"
  value    = "#PLATFORM_CLIENT_ID_IN"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "client-id-in"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_client_id_us" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "us" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "client-id-us"])
  type     = "SecureString"
  value    = "#PLATFORM_CLIENT_ID_US"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "client-id-us"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_client_id_eu" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "eu" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "client-id-eu"])
  type     = "SecureString"
  value    = "#PLATFORM_CLIENT_ID_EU"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "client-id-eu"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_client_id_sea" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "sea" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "client-id-sea"])
  type     = "SecureString"
  value    = "#PLATFORM_CLIENT_ID_SEA"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "client-id-sea"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_secret_in" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "in" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "secret-in"])
  type     = "SecureString"
  value    = "#PLATFORM_SECRET_in"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "secret-in"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_secret_us" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "us" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "secret-us"])
  type     = "SecureString"
  value    = "#PLATFORM_SECRET_US"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "secret-us"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_secret_eu" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "eu" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "secret-eu"])
  type     = "SecureString"
  value    = "#PLATFORM_SECRET_EU"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "secret-eu"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_secret_sea" {
  provider = aws.ssm_region
  count    = local.datacenter_code == "sea" ? 1 : 0
  name     = join("-", ["platform", var.STAGE, "secret-sea"])
  type     = "SecureString"
  value    = "#PLATFORM_SECRET_SEA"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "secret-sea"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "platform_realm_id" {
  provider = aws.ssm_region
  name     = join("-", ["platform", var.STAGE, "realm-id"])
  type     = "SecureString"
  value    = "#PLATFORM_REALM_ID"
  tags     = merge(tomap({ "Name" : join("-", ["platform", var.STAGE, "realm-id"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}