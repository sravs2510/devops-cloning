terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ssm_region]
    }
  }
}

resource "aws_ssm_parameter" "qatalyst_bitly_bearer_token" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
  type     = "SecureString"
  value    = "#BITLY_BEARER_TOKEN"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "bitlyBearerToken"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_sendgrid_key" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
  type     = "SecureString"
  value    = "#SENDGRID_KEY"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "sendgridAccessKey"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_ssm_parameter" "qatalyst_figma_access_token" {
  provider = aws.ssm_region
  name     = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
  type     = "SecureString"
  value    = "#FIGMA_ACCESS_TOKEN"
  tags     = merge(tomap({ "Name" : join("-", ["qatalyst", var.STAGE, "figmaAccessToken"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
