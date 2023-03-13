# EU Resources
locals {
  qatalyst_domain           = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  tester_view_domain        = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
  qatalyst_ecs_service_name = "qatalyst-ecs-service"
  qatalyst_ecs_cluster_name = "qatalyst-ecs-cluster"
}


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

module "create_eu_alb" {
  source             = "./alb"
  vpc_id             = module.create_eu_vpc.vpc_id
  alb_subnets        = module.create_eu_vpc.public_subnets
  alb_certficate_arn = module.create_eu_acm_api.acm_arn
  datacenter_codes   = var.datacenter_codes
  base_domain        = var.base_domain
  sub_domain         = var.api_sub_domain
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.alb_region = aws.eu_region
  }
}

module "create_eu_ecs" {
  source                          = "./ecs"
  fargate_cpu_memory              = var.fargate_cpu_memory
  vpc_id                          = module.create_eu_vpc.vpc_id
  alb_security_group              = module.create_eu_alb.qatalyst_alb_sg_id
  ecs_subnets                     = module.create_eu_vpc.private_subnets
  alb_target_group_arn            = module.create_eu_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn     = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn               = module.create_iam.ecs_task_role_arn
  cognito_user_pool_id            = module.create_cognito_user_pool.user_pool_id
  qatalyst_domain                 = local.qatalyst_domain
  fe_tester_view_domain_name      = local.tester_view_domain
  cw_logs_retention_in_days       = var.cw_logs_retention_in_days
  qatalyst_ecs_autoscale_role_arn = module.create_iam.qatalyst_ecs_autoscale_role_arn
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_eu_dynamodb_gsi" {
  source                 = "./dynamodb_gsi"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  gsi_table_details      = var.gsi_table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.eu_region
  }
}

module "create_eu_dynamodb" {
  source                 = "./dynamodb"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  table_details          = var.table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.eu_region
  }
}

module "create_eu_cloudwatch_dashboard" {
  source           = "./cloudwatch"
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_ecs_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_eu_alb.qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_eu_alb.qatalyst_tg_arn_suffix
  
  providers = {
    aws.cw_region = aws.eu_region
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

module "create_in_alb" {
  source             = "./alb"
  vpc_id             = module.create_in_vpc.vpc_id
  alb_subnets        = module.create_in_vpc.public_subnets
  alb_certficate_arn = module.create_in_acm_api.acm_arn
  datacenter_codes   = var.datacenter_codes
  base_domain        = var.base_domain
  sub_domain         = var.api_sub_domain
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.alb_region = aws.in_region
  }
}

module "create_in_ecs" {
  source                          = "./ecs"
  fargate_cpu_memory              = var.fargate_cpu_memory
  vpc_id                          = module.create_in_vpc.vpc_id
  alb_security_group              = module.create_in_alb.qatalyst_alb_sg_id
  ecs_subnets                     = module.create_in_vpc.private_subnets
  alb_target_group_arn            = module.create_in_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn     = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn               = module.create_iam.ecs_task_role_arn
  cognito_user_pool_id            = module.create_cognito_user_pool.user_pool_id
  qatalyst_domain                 = local.qatalyst_domain
  fe_tester_view_domain_name      = local.tester_view_domain
  cw_logs_retention_in_days       = var.cw_logs_retention_in_days
  qatalyst_ecs_autoscale_role_arn = module.create_iam.qatalyst_ecs_autoscale_role_arn
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_in_dynamodb_gsi" {
  source                 = "./dynamodb_gsi"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  gsi_table_details      = var.gsi_table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.in_region
  }
}

module "create_in_dynamodb" {
  source                 = "./dynamodb"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  table_details          = var.table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.in_region
  }
}

module "create_in_cloudwatch_dashboard" {
  source           = "./cloudwatch"
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_ecs_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_in_alb.qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_in_alb.qatalyst_tg_arn_suffix

  providers = {
    aws.cw_region = aws.in_region
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

module "create_sea_alb" {
  source             = "./alb"
  vpc_id             = module.create_sea_vpc.vpc_id
  alb_subnets        = module.create_sea_vpc.public_subnets
  alb_certficate_arn = module.create_sea_acm_api.acm_arn
  datacenter_codes   = var.datacenter_codes
  base_domain        = var.base_domain
  sub_domain         = var.api_sub_domain
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.alb_region = aws.sea_region
  }
}

module "create_sea_ecs" {
  source                          = "./ecs"
  fargate_cpu_memory              = var.fargate_cpu_memory
  vpc_id                          = module.create_sea_vpc.vpc_id
  alb_security_group              = module.create_sea_alb.qatalyst_alb_sg_id
  ecs_subnets                     = module.create_sea_vpc.private_subnets
  alb_target_group_arn            = module.create_sea_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn     = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn               = module.create_iam.ecs_task_role_arn
  cognito_user_pool_id            = module.create_cognito_user_pool.user_pool_id
  qatalyst_domain                 = local.qatalyst_domain
  fe_tester_view_domain_name      = local.tester_view_domain
  cw_logs_retention_in_days       = var.cw_logs_retention_in_days
  qatalyst_ecs_autoscale_role_arn = module.create_iam.qatalyst_ecs_autoscale_role_arn
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_sea_dynamodb_gsi" {
  source                 = "./dynamodb_gsi"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  gsi_table_details      = var.gsi_table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.sea_region
  }
}

module "create_sea_dynamodb" {
  source                 = "./dynamodb"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  table_details          = var.table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.sea_region
  }
}

module "create_sea_cloudwatch_dashboard" {
  source           = "./cloudwatch"
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_ecs_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_sea_alb.qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_sea_alb.qatalyst_tg_arn_suffix

  providers = {
    aws.cw_region = aws.sea_region
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

module "create_us_alb" {
  source             = "./alb"
  vpc_id             = module.create_us_vpc.vpc_id
  alb_subnets        = module.create_us_vpc.public_subnets
  alb_certficate_arn = module.create_us_acm_api.acm_arn
  datacenter_codes   = var.datacenter_codes
  base_domain        = var.base_domain
  sub_domain         = var.api_sub_domain
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.alb_region = aws.us_region
  }
}

module "create_us_ecs" {
  source                          = "./ecs"
  fargate_cpu_memory              = var.fargate_cpu_memory
  vpc_id                          = module.create_us_vpc.vpc_id
  alb_security_group              = module.create_us_alb.qatalyst_alb_sg_id
  ecs_subnets                     = module.create_us_vpc.private_subnets
  alb_target_group_arn            = module.create_us_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn     = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn               = module.create_iam.ecs_task_role_arn
  cognito_user_pool_id            = module.create_cognito_user_pool.user_pool_id
  qatalyst_domain                 = local.qatalyst_domain
  fe_tester_view_domain_name      = local.tester_view_domain
  cw_logs_retention_in_days       = var.cw_logs_retention_in_days
  qatalyst_ecs_autoscale_role_arn = module.create_iam.qatalyst_ecs_autoscale_role_arn
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE

  providers = {
    aws.ecs_region = aws.us_region
  }
}

module "create_us_dynamodb_gsi" {
  source                 = "./dynamodb_gsi"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  gsi_table_details      = var.gsi_table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.us_region
  }
}

module "create_us_dynamodb" {
  source                 = "./dynamodb"
  DEFAULT_TAGS           = var.DEFAULT_TAGS
  STAGE                  = var.STAGE
  table_details          = var.table_details
  point_in_time_recovery = var.point_in_time_recovery

  providers = {
    aws.dynamo_region = aws.us_region
  }
}

#Global DDB Tables
module "create_global_dynamodb" {
  source                                 = "./dynamodb_global"
  DEFAULT_TAGS                           = var.DEFAULT_TAGS
  STAGE                                  = var.STAGE
  global_ddb_table_details               = var.global_ddb_table_details
  global_ddb_tables_without_range        = var.global_ddb_tables_without_range
  gsi_global_table_details_without_range = var.gsi_global_table_details_without_range
  point_in_time_recovery                 = var.point_in_time_recovery

  providers = {
    aws.sea_region = aws.sea_region
    aws.in_region  = aws.in_region
    aws.us_region  = aws.us_region
    aws.eu_region  = aws.eu_region
  }
}

module "create_us_cloudwatch_dashboard" {
  source           = "./cloudwatch"
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_ecs_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_us_alb.qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_us_alb.qatalyst_tg_arn_suffix

  providers = {
    aws.cw_region = aws.us_region
  }
}

#ECR 
module "create_ecr" {
  source       = "./ecr"
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}

#IAM
module "create_iam" {
  source       = "./iam"
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  # Provider is not used as IAM is global service
  providers = {
    aws.iam_region = aws.us_region
  }
}
