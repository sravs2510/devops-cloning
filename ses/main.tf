terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ses_region]
    }
  }
}

locals {
  email            = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
  from_mail_domain = var.STAGE == "prod" ? join(".", ["mail", var.base_domain]) : join(".", ["mail", var.STAGE, var.base_domain])
}


data "aws_region" "current" {
  provider = aws.ses_region
}

data "aws_ssm_parameter" "devops_alerts_sns_topic" {
  provider = aws.ses_region
  name     = "DEVOPS_ALERTS_SNS_TOPIC"
}

resource "aws_sesv2_email_identity" "qatalyst_ses_email_identity" {
  provider       = aws.ses_region
  email_identity = local.email
  dkim_signing_attributes {
    next_signing_key_length = "RSA_2048_BIT"
  }
  tags = merge(tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_sesv2_email_identity_mail_from_attributes" "qatalyst_ses_mail_from" {
  provider               = aws.ses_region
  email_identity         = aws_sesv2_email_identity.qatalyst_ses_email_identity.email_identity
  behavior_on_mx_failure = "USE_DEFAULT_VALUE"
  mail_from_domain       = local.from_mail_domain
}

resource "aws_ses_receipt_rule_set" "qatalyst_receipt_rule_set" {
  provider      = aws.ses_region
  rule_set_name = "qatalyst-rule-set"
}

resource "aws_ses_receipt_rule" "qatalyst_ses_receipt_rule" {
  provider      = aws.ses_region
  name          = "qatalyst-receipt-rule"
  rule_set_name = aws_ses_receipt_rule_set.qatalyst_receipt_rule_set.id
  recipients    = [local.email]
  enabled       = true
  scan_enabled  = true

  sns_action {
    topic_arn = data.aws_ssm_parameter.devops_alerts_sns_topic.value
    position  = 1
    encoding  = "UTF-8"
  }
}

resource "aws_ses_active_receipt_rule_set" "qatalyst_active_receipt_rule_set" {
  provider      = aws.ses_region
  rule_set_name = aws_ses_receipt_rule_set.qatalyst_receipt_rule_set.id

  depends_on = [
    aws_ses_receipt_rule_set.qatalyst_receipt_rule_set
  ]
}