# Dashboard Resources
module "create_dashboard_s3_bucket" {
  source       = "./s3-fe"
  bucket_name  = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_dashboard_acm" {
  source       = "./acm-fe"
  base_domain  = var.base_domain
  domain_name  = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_dashboard_cloudfront" {
  source                      = "./cloudfront-fe"
  base_domain                 = var.base_domain
  cf_domain_name              = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  bucket_arn                  = module.create_dashboard_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_dashboard_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_dashboard_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_dashboard_acm.acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.sea_region
  }
}

module "create_cognito_user_pool" {
  source                    = "./cognito"
  user_pool_name            = var.user_pool_name
  user_pool_web_client_name = var.user_pool_web_client_name
  DEFAULT_TAGS              = var.DEFAULT_TAGS
  STAGE                     = var.STAGE

  providers = {
    aws.cognito_region = aws.us_region

  }
}

# Testervioew Resources
module "create_tester_view_s3_bucket" {
  source       = "./s3-fe"
  bucket_name  = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.tester_view_sub_domain, var.STAGE, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_tester_view_acm" {
  source       = "./acm-fe"
  base_domain  = var.base_domain
  domain_name  = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.tester_view_sub_domain, var.STAGE, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_tester_view_cloudfront" {
  source                      = "./cloudfront-fe"
  base_domain                 = var.base_domain
  cf_domain_name              = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.tester_view_sub_domain, var.STAGE, var.base_domain])
  bucket_arn                  = module.create_tester_view_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_tester_view_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_tester_view_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_tester_view_acm.acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.sea_region
  }
}


