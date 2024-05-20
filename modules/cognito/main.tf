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
  deletion_protection = "ACTIVE"
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

  mfa_configuration = "OPTIONAL"

  software_token_mfa_configuration {
    enabled = true
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
  allowed_oauth_scopes                 = ["email", "openid", "profile"]
  supported_identity_providers         = ["COGNITO", "Google", "LoginWithAmazon", "Auth0"]
  access_token_validity                = 1  #hours
  id_token_validity                    = 1  #hours
  refresh_token_validity               = 30 #days
  explicit_auth_flows                  = var.STAGE == "prod" ? local.default_auth_flows : concat(local.default_auth_flows, ["ALLOW_ADMIN_USER_PASSWORD_AUTH"])
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
    # Default attributes 
    attributes_url                = "https://people.googleapis.com/v1/people/me?personFields="
    attributes_url_add_attributes = true
    authorize_url                 = "https://accounts.google.com/o/oauth2/v2/auth"
    oidc_issuer                   = "https://accounts.google.com"
    token_request_method          = "POST"
    token_url                     = "https://www.googleapis.com/oauth2/v4/token"
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

#Login with Amazon
resource "aws_cognito_identity_provider" "amazon_provider" {
  provider      = aws.cognito_region
  user_pool_id  = aws_cognito_user_pool.user_pool.id
  provider_name = "LoginWithAmazon"
  provider_type = "LoginWithAmazon"

  provider_details = {
    authorize_scopes = "profile"
    client_id        = "#QATALYST_AMAZON_CLIENT_ID"
    client_secret    = "#QATALYST_AMAZON_CLIENT_SECRET"
    # Default attributes
    attributes_url                = "https://api.amazon.com/user/profile"
    attributes_url_add_attributes = false
    authorize_url                 = "https://www.amazon.com/ap/oa"
    token_request_method          = "POST"
    token_url                     = "https://api.amazon.com/auth/o2/token"
  }

  attribute_mapping = {
    email    = "email"
    username = "user_id"
  }
}
#Auth0
resource "aws_cognito_identity_provider" "cognito_auth0_provider" {
  provider      = aws.cognito_region
  user_pool_id  = aws_cognito_user_pool.user_pool.id
  provider_name = "Auth0"
  provider_type = "OIDC"
  provider_details = {
    authorize_scopes          = "openid profile email"
    client_id                 = "#QATALYST_AUTH0_CLIENT_ID"
    client_secret             = "#QATALYST_AUTH0_CLIENT_SECRET"
    attributes_request_method = "GET"
    oidc_issuer               = "https://getqatalyst.us.auth0.com"
    # Default attributes
    attributes_url_add_attributes = false
  }
  attribute_mapping = {
    email    = "email"
    username = "sub"
  }
}
