terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.ses_region]
    }
  }
}

locals {
  email = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
}


data "aws_region" "current" {
  provider = aws.ses_region
}

data "aws_ssm_parameter" "devops_alerts_sns_topic" {
  provider = aws.ses_region
  name     = "DEVOPS_ALERTS_SNS_TOPIC"
}

resource "aws_ses_email_identity" "qatalyst_ses_email_identity" {
  provider = aws.ses_region
  email    = local.email
}

resource "aws_ses_active_receipt_rule_set" "qatalyst_receipt_rule_set" {
  provider      = aws.ses_region
  rule_set_name = "qatalyst-rule-set"
}

resource "aws_ses_receipt_rule" "qatalyst_ses_receipt_rule" {
  provider      = aws.ses_region
  name          = "qatalyst-receipt-rule"
  rule_set_name = aws_ses_active_receipt_rule_set.qatalyst_receipt_rule_set.id
  recipients    = [local.email]
  enabled       = true
  scan_enabled  = true

  sns_action {
    topic_arn = data.aws_ssm_parameter.devops_alerts_sns_topic.value
    position  = 1
    encoding  = "UTF-8"
  }

depends_on = [
  aws_ses_active_receipt_rule_set.qatalyst_receipt_rule_set
  ]
}