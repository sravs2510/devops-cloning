# EU Resources

module "create_eu_vpc" {
  source           = "./modules/vpc"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  cidr_block       = var.cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.vpc_region = aws.eu_region
  }
}

module "create_eu_s3_bucket" {
  source                     = "./modules/s3"
  count                      = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  bucket_prefix              = var.media_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.tester_view_sub_domain
  base_domain                = var.base_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = true
  reports_sub_domain         = var.reports_sub_domain
  invite_sub_domain          = var.invite_sub_domain

  providers = {
    aws.s3_region = aws.eu_region
  }
}

module "create_eu_acm_media_cf" {
  source           = "./modules/acm"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.eu_region
  }
}

module "create_eu_meet_acm_cf" {
  source           = "./modules/acm"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain      = var.base_domain
  sub_domain       = var.meet_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.eu_region
    aws.datacenter_region = aws.eu_region
  }
}

module "create_eu_acm_invite_alb" {
  source           = "./modules/acm"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain      = var.base_domain
  sub_domain       = var.invite_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.eu_region
    aws.datacenter_region = aws.eu_region
  }
}
module "create_eu_media_cloudfront" {
  source                      = "./modules/cloudfront"
  count                       = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = try(module.create_eu_s3_bucket[0].s3_bucket_arn, "")
  bucket_id                   = try(module.create_eu_s3_bucket[0].s3_bucket_id, "")
  bucket_regional_domain_name = try(module.create_eu_s3_bucket[0].s3_bucket_regional_domain_name, "")
  acm_certificate_arn         = try(module.create_eu_acm_media_cf[0].acm_arn, "")
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.eu_region
  }
}

module "create_eu_acm_api" {
  source           = "./modules/acm"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.eu_region
    aws.datacenter_region = aws.eu_region
  }
}

module "create_eu_alb" {
  source              = "./modules/alb"
  count               = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  vpc_id              = try(module.create_eu_vpc[0].vpc_id, "")
  alb_subnets         = try(module.create_eu_vpc[0].public_subnets, [])
  alb_certficate_arn  = try(module.create_eu_acm_api[0].acm_arn, "")
  reports_acm_arn     = try(module.create_eu_reports_acm[0].acm_arn, "")
  datacenter_codes    = var.datacenter_codes
  base_domain         = var.base_domain
  sub_domain          = var.api_sub_domain
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  STAGE               = var.STAGE
  meet_acm_arn        = try(module.create_eu_meet_acm_cf[0].acm_arn, "")
  lb_target_health    = var.lb_target_health
  invite_acm_arn      = try(module.create_eu_acm_invite_alb[0].acm_arn, "")
  tester_view_acm_arn = try(module.create_eu_tester_view_acm[0].acm_arn, "")

  providers = {
    aws.alb_region = aws.eu_region
  }
}

module "create_eu_ecs" {
  source             = "./modules/ecs-cluster"
  count              = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  ecs_cluster_name   = local.qatalyst_ecs_cluster_name
  vpc_id             = try(module.create_eu_vpc[0].vpc_id, "")
  alb_security_group = try(module.create_eu_alb[0].qatalyst_alb_sg_id, "")
  datacenter_codes   = var.datacenter_codes
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_eu_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  count         = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.eu_region
    aws.dynamo_eu     = aws.eu_region
    aws.dynamo_in     = aws.in_region
    aws.dynamo_sea    = aws.sea_region
    aws.dynamo_us     = aws.us_region
  }
}

module "create_eu_ssm" {
  source                                = "./modules/ssm"
  count                                 = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS                          = var.DEFAULT_TAGS
  STAGE                                 = var.STAGE
  datacenter_codes                      = var.datacenter_codes
  open_ai_api                           = var.open_ai_api
  opensearch_host                       = try(module.create_eu_opensearch[0].opensearch_host, "")
  qatalyst_study_details_ddb_stream_arn = try(module.create_eu_dynamodb[0].ddb_stream_arns["qatalyst-study-details"], "")
  qatalyst_lambda_sg_id                 = try(module.create_eu_vpc[0].lambda_security_group_id, "")
  private_subnets                       = try(module.create_eu_vpc[0].private_subnets, "")
  providers = {
    aws.ssm_region = aws.eu_region
    random.random  = random.random
  }
}

module "create_eu_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  service_name = var.service_names["backend"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}

module "create_base_image_eu_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  service_name = join("-", [var.service_names["backend"], "base-image"])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}

module "create_eu_media_convert_queue" {
  source              = "./modules/mediaconvert"
  count               = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.eu_region
  }
}
module "create_eu_sqs" {
  source       = "./modules/sqs"
  count        = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  sqs_details  = var.sqs_details

  providers = {
    aws.sqs_region = aws.eu_region
  }
}

module "create_eu_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  count                            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  bucket_prefix                    = var.qatalyst_media_bucket_transfer_acceleration
  DEFAULT_TAGS                     = var.DEFAULT_TAGS
  STAGE                            = var.STAGE
  datacenter_codes                 = var.datacenter_codes
  tester_view_sub_domain           = var.tester_view_sub_domain
  base_domain                      = var.base_domain
  object_expiration_duration       = var.object_expiration_duration
  is_multi_region                  = true
  reports_sub_domain               = var.reports_sub_domain
  invite_sub_domain                = var.invite_sub_domain
  is_bucket_name                   = true
  is_transfer_acceleration_enabled = true

  providers = {
    aws.s3_region = aws.eu_west_region
  }
}

module "create_eu_opensearch" {
  source            = "./modules/opensearch"
  count             = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  STAGE             = var.STAGE
  datacenter_codes  = var.datacenter_codes
  service_name      = join("-", ["qatalyst", var.service_names["dashboard"]])
  opensearch_config = var.opensearch_config
  vpc_id            = try(module.create_eu_vpc[0].vpc_id, "")
  private_subnets   = try(module.create_eu_vpc[0].private_subnets, [])

  providers = {
    aws.opensearch_region = aws.eu_region
    random.random         = random.random
  }
}

# INDIA Resources
module "create_in_vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  providers = {
    aws.vpc_region = aws.in_region
  }
}

module "create_in_s3_bucket" {
  source                     = "./modules/s3"
  bucket_prefix              = var.media_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.tester_view_sub_domain
  base_domain                = var.base_domain
  reports_sub_domain         = var.reports_sub_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = true
  invite_sub_domain          = var.invite_sub_domain


  providers = {
    aws.s3_region = aws.in_region
  }
}

module "create_in_acm_media_cf" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.in_region
  }
}



module "create_in_meet_acm_cf" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.meet_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.in_region
    aws.datacenter_region = aws.in_region
  }
}

module "create_in_acm_invite_alb" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.invite_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.in_region
    aws.datacenter_region = aws.in_region
  }
}
module "create_in_media_cloudfront" {
  source                      = "./modules/cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_in_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_in_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_in_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_in_acm_media_cf.acm_arn
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.in_region
  }
}

module "create_in_acm_api" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.in_region
    aws.datacenter_region = aws.in_region
  }
}

module "create_in_alb" {
  source              = "./modules/alb"
  vpc_id              = module.create_in_vpc.vpc_id
  alb_subnets         = module.create_in_vpc.public_subnets
  alb_certficate_arn  = module.create_in_acm_api.acm_arn
  reports_acm_arn     = module.create_in_reports_acm.acm_arn
  datacenter_codes    = var.datacenter_codes
  base_domain         = var.base_domain
  sub_domain          = var.api_sub_domain
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  STAGE               = var.STAGE
  meet_acm_arn        = module.create_in_meet_acm_cf.acm_arn
  lb_target_health    = var.lb_target_health
  invite_acm_arn      = module.create_in_acm_invite_alb.acm_arn
  tester_view_acm_arn = module.create_in_tester_view_acm.acm_arn

  providers = {
    aws.alb_region = aws.in_region
  }
}

module "create_in_ecs" {
  source             = "./modules/ecs-cluster"
  ecs_cluster_name   = local.qatalyst_ecs_cluster_name
  vpc_id             = module.create_in_vpc.vpc_id
  alb_security_group = module.create_in_alb.qatalyst_alb_sg_id
  datacenter_codes   = var.datacenter_codes
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_in_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.in_region
    aws.dynamo_eu     = aws.eu_region
    aws.dynamo_in     = aws.in_region
    aws.dynamo_sea    = aws.sea_region
    aws.dynamo_us     = aws.us_region
  }
}

module "create_in_ssm" {
  source                                = "./modules/ssm"
  DEFAULT_TAGS                          = var.DEFAULT_TAGS
  STAGE                                 = var.STAGE
  datacenter_codes                      = var.datacenter_codes
  open_ai_api                           = var.open_ai_api
  opensearch_host                       = module.create_in_opensearch.opensearch_host
  qatalyst_study_details_ddb_stream_arn = module.create_in_dynamodb.ddb_stream_arns["qatalyst-study-details"]
  qatalyst_lambda_sg_id                 = module.create_in_vpc.lambda_security_group_id
  private_subnets                       = module.create_in_vpc.private_subnets

  providers = {
    aws.ssm_region = aws.in_region
    random.random  = random.random
  }
}

module "create_in_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["backend"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_base_image_in_ecr" {
  source       = "./modules/ecr"
  service_name = join("-", [var.service_names["backend"], "base-image"])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_in_media_convert_queue" {
  source              = "./modules/mediaconvert"
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.in_region
  }
}
module "create_in_sqs" {
  source       = "./modules/sqs"
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  sqs_details  = var.sqs_details

  providers = {
    aws.sqs_region = aws.in_region
  }
}

module "create_in_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  bucket_prefix                    = var.qatalyst_media_bucket_transfer_acceleration
  DEFAULT_TAGS                     = var.DEFAULT_TAGS
  STAGE                            = var.STAGE
  datacenter_codes                 = var.datacenter_codes
  tester_view_sub_domain           = var.tester_view_sub_domain
  base_domain                      = var.base_domain
  object_expiration_duration       = var.object_expiration_duration
  is_multi_region                  = true
  reports_sub_domain               = var.reports_sub_domain
  invite_sub_domain                = var.invite_sub_domain
  is_bucket_name                   = true
  is_transfer_acceleration_enabled = true

  providers = {
    aws.s3_region = aws.in_region
  }
}

module "create_in_opensearch" {
  source            = "./modules/opensearch"
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  STAGE             = var.STAGE
  datacenter_codes  = var.datacenter_codes
  service_name      = join("-", ["qatalyst", var.service_names["dashboard"]])
  opensearch_config = var.opensearch_config
  vpc_id            = module.create_in_vpc.vpc_id
  private_subnets   = module.create_in_vpc.private_subnets

  providers = {
    aws.opensearch_region = aws.in_region
    random.random         = random.random
  }
}

# SEA Resources
module "create_sea_vpc" {
  source           = "./modules/vpc"
  cidr_block       = var.cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.vpc_region = aws.sea_region
  }
}

module "create_sea_s3_bucket" {
  source                     = "./modules/s3"
  bucket_prefix              = var.media_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.tester_view_sub_domain
  base_domain                = var.base_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = true
  reports_sub_domain         = var.reports_sub_domain
  invite_sub_domain          = var.invite_sub_domain

  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_sea_acm_media_cf" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.sea_region
  }
}

module "create_sea_meet_acm_cf" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.meet_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.sea_region
    aws.datacenter_region = aws.sea_region
  }
}

module "create_sea_acm_invite_alb" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.invite_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.sea_region
    aws.datacenter_region = aws.sea_region
  }
}
module "create_sea_media_cloudfront" {
  source                      = "./modules/cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_sea_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_sea_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_sea_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_sea_acm_media_cf.acm_arn
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.sea_region
  }
}

module "create_sea_acm_api" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.sea_region
    aws.datacenter_region = aws.sea_region
  }
}

module "create_sea_alb" {
  source              = "./modules/alb"
  vpc_id              = module.create_sea_vpc.vpc_id
  alb_subnets         = module.create_sea_vpc.public_subnets
  alb_certficate_arn  = module.create_sea_acm_api.acm_arn
  reports_acm_arn     = module.create_sea_reports_acm.acm_arn
  datacenter_codes    = var.datacenter_codes
  base_domain         = var.base_domain
  sub_domain          = var.api_sub_domain
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  STAGE               = var.STAGE
  meet_acm_arn        = module.create_sea_meet_acm_cf.acm_arn
  invite_acm_arn      = module.create_sea_acm_invite_alb.acm_arn
  lb_target_health    = var.lb_target_health
  tester_view_acm_arn = module.create_sea_tester_view_acm.acm_arn

  providers = {
    aws.alb_region = aws.sea_region
  }
}

module "create_sea_ecs" {
  source             = "./modules/ecs-cluster"
  ecs_cluster_name   = local.qatalyst_ecs_cluster_name
  vpc_id             = module.create_sea_vpc.vpc_id
  alb_security_group = module.create_sea_alb.qatalyst_alb_sg_id
  datacenter_codes   = var.datacenter_codes
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_sea_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details

  providers = {
    aws.dynamo_region = aws.sea_region
    aws.dynamo_eu     = aws.eu_region
    aws.dynamo_in     = aws.in_region
    aws.dynamo_sea    = aws.sea_region
    aws.dynamo_us     = aws.us_region
  }
}

module "create_sea_ssm" {
  source                                = "./modules/ssm"
  DEFAULT_TAGS                          = var.DEFAULT_TAGS
  STAGE                                 = var.STAGE
  datacenter_codes                      = var.datacenter_codes
  open_ai_api                           = var.open_ai_api
  opensearch_host                       = module.create_sea_opensearch.opensearch_host
  qatalyst_study_details_ddb_stream_arn = module.create_sea_dynamodb.ddb_stream_arns["qatalyst-study-details"]
  qatalyst_lambda_sg_id                 = module.create_sea_vpc.lambda_security_group_id
  private_subnets                       = module.create_sea_vpc.private_subnets
  providers = {
    aws.ssm_region = aws.sea_region
    random.random  = random.random
  }
}

module "create_sea_media_convert_queue" {
  source              = "./modules/mediaconvert"
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.sea_region
  }
}

module "create_sea_sqs" {
  source       = "./modules/sqs"
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  sqs_details  = var.sqs_details

  providers = {
    aws.sqs_region = aws.sea_region
  }
}


module "create_sea_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  bucket_prefix                    = var.qatalyst_media_bucket_transfer_acceleration
  DEFAULT_TAGS                     = var.DEFAULT_TAGS
  STAGE                            = var.STAGE
  datacenter_codes                 = var.datacenter_codes
  tester_view_sub_domain           = var.tester_view_sub_domain
  base_domain                      = var.base_domain
  object_expiration_duration       = var.object_expiration_duration
  is_multi_region                  = true
  reports_sub_domain               = var.reports_sub_domain
  invite_sub_domain                = var.invite_sub_domain
  is_bucket_name                   = true
  is_transfer_acceleration_enabled = true

  providers = {
    aws.s3_region = aws.sea_region
  }
}

module "create_sea_opensearch" {
  source            = "./modules/opensearch"
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  STAGE             = var.STAGE
  datacenter_codes  = var.datacenter_codes
  service_name      = join("-", ["qatalyst", var.service_names["dashboard"]])
  opensearch_config = var.opensearch_config
  vpc_id            = module.create_sea_vpc.vpc_id
  private_subnets   = module.create_sea_vpc.private_subnets

  providers = {
    aws.opensearch_region = aws.sea_region
    random.random         = random.random
  }
}

# US Resources
module "create_us_vpc" {
  source           = "./modules/vpc"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  cidr_block       = var.cidr_block
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.vpc_region = aws.us_region
  }
}

module "create_us_s3_bucket" {
  source                     = "./modules/s3"
  count                      = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  bucket_prefix              = var.media_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.tester_view_sub_domain
  base_domain                = var.base_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = true
  reports_sub_domain         = var.reports_sub_domain
  invite_sub_domain          = var.invite_sub_domain
  providers = {
    aws.s3_region = aws.us_region
  }
}

module "create_common_acm_cf" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.common_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

module "create_common_s3_bucket" {
  source                     = "./modules/s3"
  bucket_prefix              = var.common_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.tester_view_sub_domain
  base_domain                = var.base_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = false
  reports_sub_domain         = var.reports_sub_domain
  invite_sub_domain          = var.invite_sub_domain

  providers = {
    aws.s3_region = aws.us_region
  }
}

module "create_common_cloudfront" {
  source                      = "./modules/cloudfront"
  base_domain                 = var.base_domain
  sub_domain                  = var.common_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_common_s3_bucket.s3_bucket_arn
  bucket_id                   = module.create_common_s3_bucket.s3_bucket_id
  bucket_regional_domain_name = module.create_common_s3_bucket.s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_common_acm_cf.acm_arn
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = false
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}
#ACM or cloudfront & ALB
module "create_cloudfront_meet" {
  source                      = "./modules/cloudfront-fe-be"
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  base_domain                 = var.base_domain
  sub_domain                  = var.meet_sub_domain
  bucket_id                   = module.create_meet_s3_sub_domain.s3_bucket_id
  bucket_arn                  = module.create_meet_s3_sub_domain.s3_bucket_arn
  acm_certificate_arn         = module.create_us_meet_acm_cf.acm_arn
  bucket_regional_domain_name = module.create_meet_s3_sub_domain.s3_bucket_regional_domain_name
  qatalyst_alb_dns_names      = local.alb_dns_names

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}

module "create_meet_s3_sub_domain" {
  source                     = "./modules/s3"
  bucket_prefix              = var.meet_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.meet_sub_domain
  base_domain                = var.base_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = false
  reports_sub_domain         = var.reports_sub_domain
  invite_sub_domain          = var.invite_sub_domain
  providers = {
    aws.s3_region = aws.us_region
  }
}

module "create_invite_s3_sub_domain" {
  source                     = "./modules/s3"
  bucket_prefix              = var.invite_sub_domain
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  datacenter_codes           = var.datacenter_codes
  tester_view_sub_domain     = var.invite_sub_domain
  base_domain                = var.base_domain
  object_expiration_duration = var.object_expiration_duration
  is_multi_region            = false
  reports_sub_domain         = var.reports_sub_domain
  invite_sub_domain          = var.invite_sub_domain
  providers = {
    aws.s3_region = aws.us_region
  }
}

module "create_cloudfront_invite" {
  source                      = "./modules/cloudfront-fe-be"
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  base_domain                 = var.base_domain
  sub_domain                  = var.invite_sub_domain
  bucket_id                   = module.create_invite_s3_sub_domain.s3_bucket_id
  bucket_arn                  = module.create_invite_s3_sub_domain.s3_bucket_arn
  acm_certificate_arn         = module.create_us_invite_acm_cf_alb.acm_arn
  bucket_regional_domain_name = module.create_invite_s3_sub_domain.s3_bucket_regional_domain_name
  qatalyst_alb_dns_names      = local.alb_dns_names

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}
module "create_us_invite_acm_cf_alb" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.invite_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

#Meet ACM or cloudfront & ALB
module "create_us_meet_acm_cf" {
  source           = "./modules/acm"
  base_domain      = var.base_domain
  sub_domain       = var.meet_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = false
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

module "create_us_acm_media_cf" {
  source           = "./modules/acm"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain      = var.base_domain
  sub_domain       = var.media_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

module "create_us_media_cloudfront" {
  source                      = "./modules/cloudfront"
  count                       = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = try(module.create_us_s3_bucket[0].s3_bucket_arn, "")
  bucket_id                   = try(module.create_us_s3_bucket[0].s3_bucket_id, "")
  bucket_regional_domain_name = try(module.create_us_s3_bucket[0].s3_bucket_regional_domain_name, "")
  acm_certificate_arn         = try(module.create_us_acm_media_cf[0].acm_arn, "")
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}

module "create_us_acm_api" {
  source           = "./modules/acm"
  count            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  base_domain      = var.base_domain
  sub_domain       = var.api_sub_domain
  datacenter_codes = var.datacenter_codes
  is_multi_region  = true
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE

  providers = {
    aws.acm_region        = aws.us_region
    aws.datacenter_region = aws.us_region
  }
}

module "create_us_alb" {
  source              = "./modules/alb"
  count               = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  vpc_id              = try(module.create_us_vpc[0].vpc_id, "")
  alb_subnets         = try(module.create_us_vpc[0].public_subnets, [])
  alb_certficate_arn  = try(module.create_us_acm_api[0].acm_arn, "")
  reports_acm_arn     = module.create_reports_acm_cf.acm_arn
  datacenter_codes    = var.datacenter_codes
  base_domain         = var.base_domain
  sub_domain          = var.api_sub_domain
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  STAGE               = var.STAGE
  meet_acm_arn        = module.create_us_meet_acm_cf.acm_arn
  lb_target_health    = var.lb_target_health
  invite_acm_arn      = module.create_us_invite_acm_cf_alb.acm_arn
  tester_view_acm_arn = module.create_tester_view_acm.acm_arn

  providers = {
    aws.alb_region = aws.us_region
  }
}

module "create_us_ecs" {
  source             = "./modules/ecs-cluster"
  count              = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  ecs_cluster_name   = local.qatalyst_ecs_cluster_name
  vpc_id             = try(module.create_us_vpc[0].vpc_id, "")
  alb_security_group = try(module.create_us_alb[0].qatalyst_alb_sg_id, "")
  datacenter_codes   = var.datacenter_codes
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.ecs_region = aws.us_region
  }
}

module "create_us_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  count         = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  STAGE         = var.STAGE
  table_details = var.table_details
  providers = {
    aws.dynamo_region = aws.us_region
    aws.dynamo_eu     = aws.eu_region
    aws.dynamo_in     = aws.in_region
    aws.dynamo_sea    = aws.sea_region
    aws.dynamo_us     = aws.us_region
  }
}

module "create_us_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  count                            = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  bucket_prefix                    = var.qatalyst_media_bucket_transfer_acceleration
  DEFAULT_TAGS                     = var.DEFAULT_TAGS
  STAGE                            = var.STAGE
  datacenter_codes                 = var.datacenter_codes
  tester_view_sub_domain           = var.tester_view_sub_domain
  base_domain                      = var.base_domain
  object_expiration_duration       = var.object_expiration_duration
  is_multi_region                  = true
  reports_sub_domain               = var.reports_sub_domain
  invite_sub_domain                = var.invite_sub_domain
  is_bucket_name                   = true
  is_transfer_acceleration_enabled = true

  providers = {
    aws.s3_region = aws.us_region
  }
}

#Global DDB Tables
module "create_global_dynamodb" {
  source          = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  STAGE           = var.STAGE
  table_details   = var.global_table_details
  replica_regions = contains(["dev", "playground", "qa"], var.STAGE) ? ["ap-south-1", "ap-southeast-1"] : ["eu-north-1", "ap-south-1", "ap-southeast-1"]

  providers = {
    aws.dynamo_region = aws.us_region
    aws.dynamo_eu     = aws.eu_region
    aws.dynamo_in     = aws.in_region
    aws.dynamo_sea    = aws.sea_region
    aws.dynamo_us     = aws.us_region
  }
}

module "create_us_ssm" {
  source                                = "./modules/ssm"
  count                                 = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS                          = var.DEFAULT_TAGS
  STAGE                                 = var.STAGE
  datacenter_codes                      = var.datacenter_codes
  open_ai_api                           = var.open_ai_api
  opensearch_host                       = try(module.create_us_opensearch[0].opensearch_host, "")
  qatalyst_study_details_ddb_stream_arn = try(module.create_us_dynamodb[0].ddb_stream_arns["qatalyst-study-details"], "")
  qatalyst_lambda_sg_id                 = try(module.create_us_vpc[0].lambda_security_group_id, "")
  private_subnets                       = try(module.create_us_vpc[0].private_subnets, "")

  providers = {
    aws.ssm_region = aws.us_region
    random.random  = random.random
  }
}

#ECR 
module "create_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["backend"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}

module "create_base_image_sea_ecr" {
  source       = "./modules/ecr"
  service_name = join("-", [var.service_names["backend"], "base-image"])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}

module "create_us_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  service_name = var.service_names["backend"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

module "create_base_image_us_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  service_name = join("-", [var.service_names["backend"], "base-image"])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

module "create_us_media_convert_queue" {
  source              = "./modules/mediaconvert"
  count               = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.us_region
  }
}

#IAM
module "create_iam" {
  source       = "./modules/iam"
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  # Provider is not used as IAM is global service

  providers = {
    aws.iam_region = aws.us_region
  }
}
module "create_ses" {
  source       = "./modules/ses"
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  base_domain  = var.base_domain

  providers = {
    aws.ses_region = aws.us_west_region
  }
}
module "create_cdn_cache_policy" {
  source = "./modules/cdn-cache-policy"

  providers = {
    aws.cloudfront_region = aws.us_region
  }
}
module "create_us_sqs" {
  source       = "./modules/sqs"
  count        = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  sqs_details  = var.sqs_details

  providers = {
    aws.sqs_region = aws.us_region
  }
}

module "create_us_opensearch" {
  source            = "./modules/opensearch"
  count             = contains(["dev", "playground", "qa"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  STAGE             = var.STAGE
  datacenter_codes  = var.datacenter_codes
  service_name      = join("-", ["qatalyst", var.service_names["dashboard"]])
  opensearch_config = var.opensearch_config
  vpc_id            = try(module.create_us_vpc[0].vpc_id, "")
  private_subnets   = try(module.create_us_vpc[0].private_subnets, [])

  providers = {
    aws.opensearch_region = aws.us_region
    random.random         = random.random
  }
}
