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
  openai_key      = lookup(var.open_ai_api, data.aws_region.ssm_region.name)
}

resource "random_uuid" "feature_flag_auth" {
  provider = random.random
}
resource "aws_ssm_parameter" "qatalyst_ssm_secure_values" {
  provider = aws.ssm_region
  for_each = {
    join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])    = "#BITLY_BEARER_TOKEN"
    join("-", ["qatalyst", var.STAGE, "sendgrid-key"])          = "#SENDGRID_KEY"
    join("-", ["qatalyst", var.STAGE, "figma-access-token"])    = "#FIGMA_ACCESS_TOKEN"
    join("-", ["datadog", var.STAGE, "api-key"])                = "#DD_API_KEY"
    join("-", ["qatalyst", var.STAGE, "fingerprint-token"])     = "#FINGERPRINT_API_TOKEN"
    join("-", ["qatalyst", var.STAGE, "100ms-access-key"])      = "#QATALYST_100MS_ACCESS_KEY"
    join("-", ["qatalyst", var.STAGE, "100ms-secret-key"])      = "#QATALYST_100MS_SECRET_KEY"
    join("-", ["platform", var.STAGE, "client-id-in"])          = "#PLATFORM_CLIENT_ID_IN"
    join("-", ["platform", var.STAGE, "client-id-us"])          = "#PLATFORM_CLIENT_ID_US"
    join("-", ["platform", var.STAGE, "client-id-eu"])          = "#PLATFORM_CLIENT_ID_EU"
    join("-", ["platform", var.STAGE, "client-id-sea"])         = "#PLATFORM_CLIENT_ID_SEA"
    join("-", ["platform", var.STAGE, "secret-in"])             = "#PLATFORM_SECRET_IN"
    join("-", ["platform", var.STAGE, "secret-us"])             = "#PLATFORM_SECRET_US"
    join("-", ["platform", var.STAGE, "secret-eu"])             = "#PLATFORM_SECRET_EU"
    join("-", ["platform", var.STAGE, "secret-sea"])            = "#PLATFORM_SECRET_SEA"
    join("-", ["platform", var.STAGE, "realm-id"])              = "#PLATFORM_REALM_ID"
    join("-", ["qatalyst", var.STAGE, "stripe-api-key"])        = "#QATALYST_STRIPE_API_KEY"
    join("-", ["qatalyst", var.STAGE, "stripe-webhook-secret"]) = "#QATALYST_STRIPE_WEBHOOK_SECRET"
    join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])     = random_uuid.feature_flag_auth.result
    join("-", ["qatalyst", var.STAGE, "open-ai-key"])           = local.openai_key

  }
  name  = each.key
  type  = "SecureString"
  value = each.value

  tags = merge(tomap({ "Name" : "qatalyst-ssm-parameter" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}


