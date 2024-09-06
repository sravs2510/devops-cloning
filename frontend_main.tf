# Dashboard Resources
module "create_dashboard_s3_bucket" {
  source       = "./modules/s3-fe"
  bucket_name  = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_dashboard_cloudfront" {
  source                      = "./modules/cloudfront-fe-wc"
  base_domain                 = var.base_domain
  cf_domain_name              = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  bucket_arn                  = module.create_dashboard_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_dashboard_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_dashboard_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = var.dashboard_acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.sea_region
  }
}

locals {
  cognito_custom_domain = var.STAGE == "prod" ? join(".", ["auth", var.base_domain]) : join(".", [var.STAGE, "auth", var.base_domain])
}

#Congito Custom Domain ACM
module "create_cognito_custom_domain_acm" {
  source       = "./modules/acm-fe"
  base_domain  = var.base_domain
  domain_name  = local.cognito_custom_domain
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

#Cognito
module "create_cognito_user_pool" {
  source                        = "/Users/sravani/Desktop/cognito-modulr/terraform-modules/cognito"
  user_pool_name                = var.user_pool_name
  user_pool_web_client_name     = var.user_pool_web_client_name
  cognito_custom_domain         = local.cognito_custom_domain
  cognito_custom_domain_acm_arn = module.create_cognito_custom_domain_acm.acm_arn
  cognito_callback_url          = join("", ["https://", local.dasboard_domain, "/callback?"])
  base_domain                   = var.base_domain
  product_name = var.product_name
  oidc_issuer = var.oidc_issuer
  cognito_amazon_id_secret = var.cognito_amazon_id_secret
  cognito_google_id_secret = var.cognito_google_id_secret
  cognito_auth0_id_secret = var.cognito_auth0_id_secret
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE

  providers = {
    aws.cognito_region = aws.us_region

  }
}

locals {
  s3_bucket_name = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
}

# Tester view Resources
module "create_tester_view_s3_bucket" {
  source       = "./modules/s3-fe"
  bucket_name  = local.s3_bucket_name
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.s3_region = aws.sea_region
  }
}

#CDN
module "create_cdn" {
  source       = "./modules/cdn"
  count        = var.STAGE == "prod" ? 1 : 0
  base_domain  = var.base_domain
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.cdn_region = aws.us_region
  }
}
