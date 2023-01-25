# EU Resources
module "create_eu_vpc" {
  source          = "./vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE

  providers = {
    aws.vpc_region = aws.eu_region
  }
}

module "create_eu_s3_bucket" {
  source                 = "./s3"
  bucket_prefix          = var.media_sub_domain
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  datacenter_codes       = var.datacenter_codes
  tester_view_sub_domain = var.tester_view_sub_domain
  base_domain            = var.base_domain

  providers = {
    aws.s3_region = aws.eu_region
  }
}

module "create_eu_acm_media_cf" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.eu_region
  }
}

module "create_eu_media_cloudfront" {
  source                      = "./cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_eu_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_eu_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_eu_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_eu_acm_media_cf.acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.eu_region
  }
}

module "create_eu_acm_api" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.eu_region
    aws.datacenter_region = aws.eu_region
  }
}

# INDIA Resources
module "create_in_vpc" {
  source          = "./vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE

  providers = {
    aws.vpc_region = aws.in_region
  }
}

module "create_in_s3_bucket" {
  source                 = "./s3"
  bucket_prefix          = var.media_sub_domain
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  datacenter_codes       = var.datacenter_codes
  tester_view_sub_domain = var.tester_view_sub_domain
  base_domain            = var.base_domain

  providers = {
    aws.s3_region = aws.in_region
  }
}

module "create_in_acm_media_cf" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.in_region
  }
}

module "create_in_media_cloudfront" {
  source                      = "./cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_in_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_in_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_in_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_in_acm_media_cf.acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.in_region
  }
}

module "create_in_acm_api" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.in_region
    aws.datacenter_region = aws.in_region
  }
}

# SEA Resources
module "create_sea_vpc" {
  source          = "./vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE

  providers = {
    aws.vpc_region = aws.sea_region
  }
}

module "create_sea_s3_bucket" {
  source                 = "./s3"
  bucket_prefix          = var.media_sub_domain
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  datacenter_codes       = var.datacenter_codes
  tester_view_sub_domain = var.tester_view_sub_domain
  base_domain            = var.base_domain

  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_sea_acm_media_cf" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.sea_region
  }
}

module "create_sea_media_cloudfront" {
  source                      = "./cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_sea_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_sea_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_sea_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_sea_acm_media_cf.acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.sea_region
  }
}

module "create_sea_acm_api" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.sea_region
    aws.datacenter_region = aws.sea_region
  }
}

# US Resources
module "create_us_vpc" {
  source          = "./vpc"
  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE

  providers = {
    aws.vpc_region = aws.us_region
  }
}

module "create_us_s3_bucket" {
  source                 = "./s3"
  bucket_prefix          = var.media_sub_domain
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  datacenter_codes       = var.datacenter_codes
  tester_view_sub_domain = var.tester_view_sub_domain
  base_domain            = var.base_domain

  providers = {
    aws.s3_region = aws.us_region
  }
}

module "create_us_acm_media_cf" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

module "create_us_media_cloudfront" {
  source                      = "./cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_us_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_us_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_us_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_us_acm_media_cf.acm_arn
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}

module "create_us_acm_api" {
  source           = "./acm"
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

#Global DDB Tables
module "create_global_dynamodb" {
  source               = "./dynamodb_global"
  DEFAULT_TAGS         = var.DEFAULT_TAGS
  STAGE                = var.STAGE
  global_table_details = var.global_table_details

  providers = {
    aws.sea_region = aws.sea_region
    aws.in_region  = aws.in_region
    aws.us_region  = aws.us_region
    aws.eu_region  = aws.eu_region
  }
}
