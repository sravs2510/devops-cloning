terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cognito_region]
    }
  }
}

data "aws_region" "cognito_region" {
  provider = aws.cognito_region
}

data "aws_caller_identity" "current" {
  provider = aws.cognito_region
}

locals {
  account_id          = data.aws_caller_identity.current.account_id
  cognito_region_name = data.aws_region.cognito_region.name
}

resource "aws_cognito_user_pool" "user_pool" {
  provider            = aws.cognito_region
  name                = var.user_pool_name
  deletion_protection = "INACTIVE"
  username_attributes = ["email"]

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  auto_verified_attributes = ["email"]

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject        = "Qatalyst | Verification code"
    email_message        = "Please enter the below verification code to verify your email and complete the Sign-in process for your Qatalyst account.<br><br>Verification Code: {####}"
  }

  lambda_config {
    post_confirmation = join("", ["arn:aws:lambda:", local.cognito_region_name, ":", local.account_id, ":function:qatalyst-", var.STAGE, "-signup"])
  }

  tags = merge(tomap({ "Name" : var.user_pool_name, "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_cognito_user_pool_client" "user_pool_web_client" {
  provider     = aws.cognito_region
  name         = var.user_pool_web_client_name
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

#Microsoft
resource "aws_cognito_identity_provider" "microsoft_saml_provider" {
  provider      = aws.cognito_region
  user_pool_id  = aws_cognito_user_pool.user_pool.id
  provider_name = "Microsoft"
  provider_type = "SAML"

  provider_details = {
    MetadataURL           = "https://login.microsoftonline.com/c47dcff4-6b21-4de3-931a-058aa60a9629/federationmetadata/2007-06/federationmetadata.xml"
    SSORedirectBindingURI = "https://login.microsoftonline.com/c47dcff4-6b21-4de3-931a-058aa60a9629/saml2"
    SLORedirectBindingURI = "https://login.microsoftonline.com/c47dcff4-6b21-4de3-931a-058aa60a9629/saml2"
  }

  attribute_mapping = {
    email    = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    username = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    website  = "http://schemas.microsoft.com/ws/2008/06/identity/claims/windowsaccountname"
  }
}
