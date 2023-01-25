terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cognito_region]
    }
  }
}

resource "aws_cognito_user_pool" "user_pool" {
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

  tags = merge(tomap({ "Name" : var.user_pool_name, "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_cognito_user_pool_client" "user_pool_web_client" {
  name         = var.user_pool_web_client_name
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
