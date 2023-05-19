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
  from_email_id       = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
  default_auth_flows  = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_CUSTOM_AUTH", "ALLOW_USER_SRP_AUTH"]
  ses_arn             = join("", ["arn:aws:ses:us-west-2:", local.account_id, ":identity/", local.from_email_id])
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

  email_configuration {
    from_email_address    = local.from_email_id
    email_sending_account = "DEVELOPER"
    source_arn            = local.ses_arn
  }

  auto_verified_attributes = ["email"]
  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject        = "Welcome to Qatalyst! Verify your email"
    email_message        = "Welcome to Qatalyst,To finish signing up, please verify your email by making use of this verification code {####}. The verification code will be valid for the next 1 hr.<br><br>Thanks!<br>Team Qatalyst"
  }

  lambda_config {
    post_confirmation = join("", ["arn:aws:lambda:", local.cognito_region_name, ":", local.account_id, ":function:qatalyst-", var.STAGE, "-signup"])
    custom_message    = join("", ["arn:aws:lambda:", local.cognito_region_name, ":", local.account_id, ":function:qatalyst-", var.STAGE, "-custom-message"])
  }

  tags = merge(tomap({ "Name" : var.user_pool_name, "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_cognito_user_pool_client" "user_pool_web_client" {
  provider                             = aws.cognito_region
  name                                 = var.user_pool_web_client_name
  user_pool_id                         = aws_cognito_user_pool.user_pool.id
  callback_urls                        = [var.cognito_callback_url]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid"]
  supported_identity_providers         = ["COGNITO", "Google", "Microsoft"]
  explicit_auth_flows                  = var.STAGE == "prod" ? local.default_auth_flows : concat(local.default_auth_flows, ["ALLOW_ADMIN_USER_PASSWORD_AUTH"])
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
    email   = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    name    = "http://schemas.microsoft.com/identity/claims/displayname"
    website = "http://schemas.microsoft.com/ws/2008/06/identity/claims/windowsaccountname"
  }
}

#Google
resource "aws_cognito_identity_provider" "google_sso_provider" {
  provider      = aws.cognito_region
  user_pool_id  = aws_cognito_user_pool.user_pool.id
  provider_name = "Google"
  provider_type = "Google"

  provider_details = {
    authorize_scopes = "profile email openid"
    client_id        = "#QATALYST_GOOGLE_CLIENT_ID"
    client_secret    = "#QATALYST_GOOGLE_CLIENT_SECRET"
  }

  attribute_mapping = {
    email    = "email"
    username = "sub"
  }
}

# Custom Domain
resource "aws_cognito_user_pool_domain" "cognito_custom_domain" {
  provider        = aws.cognito_region
  domain          = var.cognito_custom_domain
  certificate_arn = var.cognito_custom_domain_acm_arn
  user_pool_id    = aws_cognito_user_pool.user_pool.id
}
