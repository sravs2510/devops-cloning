# EU Resources

module "create_eu_vpc" {
  source           = "./modules/vpc"
  count            = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
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
  count                      = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
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
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.media_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.eu.name), var.media_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.eu.name), var.STAGE, var.media_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_eu_meet_acm_cf" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.meet_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.eu_region
  }
}

module "create_eu_acm_invite_alb" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.invite_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.eu_region
  }
}
module "create_eu_media_cloudfront" {
  source                      = "./modules/cloudfront"
  count                       = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = try(module.create_eu_s3_bucket[0].s3_bucket_arn, "")
  bucket_id                   = try(module.create_eu_s3_bucket[0].s3_bucket_id, "")
  bucket_regional_domain_name = try(module.create_eu_s3_bucket[0].s3_bucket_regional_domain_name, "")
  acm_certificate_arn         = try(module.create_eu_acm_media_cf[0].acm_arn, "")
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.eu_region
  }
}

module "create_eu_acm_api" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.api_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.eu.name), var.api_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.eu.name), var.STAGE, var.api_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.eu_region
  }
}

module "create_eu_alb" {
  source              = "./modules/alb"
  count               = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
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
  calendar_acm_arn    = try(module.create_eu_calendar_acm[0].acm_arn, "")

  providers = {
    aws.alb_region = aws.eu_region
  }
}

module "create_eu_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  count         = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
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
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ssm"
  count        = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  ssm_config = {
    parameters = merge(var.qatalyst_ssm_config.parameters,
      {
        "qatalyst-private-1"                    = try("${module.create_eu_vpc[0].private_subnets[0]}", ""),
        "qatalyst-private-2"                    = try("${module.create_eu_vpc[0].private_subnets[1]}", ""),
        "qatalyst-private-3"                    = try("${module.create_eu_vpc[0].private_subnets[2]}", ""),
        "qatalyst-study-details-ddb-stream-arn" = module.create_eu_dynamodb[0].ddb_stream_arns["qatalyst-study-details"],
        "qatalyst-lambda-sg-id"                 = module.create_eu_vpc[0].lambda_security_group_id
    }),
    secure_parameters = merge(var.qatalyst_ssm_config.secure_parameters,
      {
        "qatalyst-open-ai-key"                   = lookup(var.open_ai_api, data.aws_region.eu.name)
        "qatalyst-feature-flag-auth"             = random_uuid.feature_flag_auth.result
        "qatalyst-dashboard-opensearch-endpoint" = join("", ["https://", try(module.create_eu_opensearch[0].opensearch_host, "NA")])
    })
  }
  providers = {
    aws.ssm_region = aws.eu_region
  }
}

module "create_eu_ecr" {
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ecr"
  count        = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  repo_details = var.repo_details
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}

module "create_eu_media_convert_queue" {
  source              = "git@github.com:EntropikTechnologies/terraform-modules.git//mediaconvert"
  count               = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.eu_region
  }
}
module "create_eu_sqs" {
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//sqs"
  count            = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  sqs_queues       = var.sqs_queues
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.sqs_region = aws.eu_region
  }
}

module "create_eu_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  count                            = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
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
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//opensearch"
  count            = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  opensearch_config = merge(var.opensearch_config, {
    vpc_id          = try(module.create_eu_vpc[0].vpc_id, ""),
    private_subnets = slice(try(module.create_eu_vpc[0].private_subnets, []), 0, var.opensearch_config.availability_zone_count)
  })
  providers = {
    aws.opensearch_region = aws.eu_region
    random.random         = random.random
  }
}

module "create_eu_ecs" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//ecs-cluster"
  count              = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  vpc_id             = module.create_eu_vpc[0].vpc_id
  alb_security_group = module.create_eu_alb[0].qatalyst_alb_sg_id
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE
  product_name       = "qatalyst"
  datacenter_codes   = var.datacenter_codes

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

# INDIA Resources
module "create_in_vpc" {
  source           = "./modules/vpc"
  count            = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
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
  count                      = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
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
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.media_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.in.name), var.media_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.in.name), var.STAGE, var.media_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}



module "create_in_meet_acm_cf" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.meet_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.in_region
  }
}

module "create_in_acm_invite_alb" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.invite_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.in_region
  }
}
module "create_in_media_cloudfront" {
  source                      = "./modules/cloudfront"
  count                       = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_in_s3_bucket[0].s3_bucket_arn
  bucket_id                   = module.create_in_s3_bucket[0].s3_bucket_id
  bucket_regional_domain_name = module.create_in_s3_bucket[0].s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_in_acm_media_cf[0].acm_arn
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.in_region
  }
}

module "create_in_acm_api" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.api_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.in.name), var.api_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.in.name), var.STAGE, var.api_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.in_region
  }
}

module "create_in_alb" {
  source              = "./modules/alb"
  count               = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  vpc_id              = module.create_in_vpc[0].vpc_id
  alb_subnets         = module.create_in_vpc[0].public_subnets
  alb_certficate_arn  = module.create_in_acm_api[0].acm_arn
  reports_acm_arn     = module.create_in_reports_acm[0].acm_arn
  datacenter_codes    = var.datacenter_codes
  base_domain         = var.base_domain
  sub_domain          = var.api_sub_domain
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  STAGE               = var.STAGE
  meet_acm_arn        = module.create_in_meet_acm_cf[0].acm_arn
  lb_target_health    = var.lb_target_health
  invite_acm_arn      = module.create_in_acm_invite_alb[0].acm_arn
  tester_view_acm_arn = module.create_in_tester_view_acm[0].acm_arn
  calendar_acm_arn    = module.create_in_calendar_acm[0].acm_arn

  providers = {
    aws.alb_region = aws.in_region
  }
}

module "create_in_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  DEFAULT_TAGS  = var.DEFAULT_TAGS
  count         = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
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
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ssm"
  count        = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  ssm_config = {
    parameters = merge(var.qatalyst_ssm_config.parameters,
      {
        "qatalyst-private-1"                    = try("${module.create_in_vpc[0].private_subnets[0]}", ""),
        "qatalyst-private-2"                    = try("${module.create_in_vpc[0].private_subnets[1]}", ""),
        "qatalyst-private-3"                    = try("${module.create_in_vpc[0].private_subnets[2]}", ""),
        "qatalyst-study-details-ddb-stream-arn" = module.create_in_dynamodb[0].ddb_stream_arns["qatalyst-study-details"],
        "qatalyst-lambda-sg-id"                 = module.create_in_vpc[0].lambda_security_group_id
    }),
    secure_parameters = merge(var.qatalyst_ssm_config.secure_parameters,
      {
        "qatalyst-open-ai-key"                   = lookup(var.open_ai_api, data.aws_region.in.name)
        "qatalyst-feature-flag-auth"             = random_uuid.feature_flag_auth.result
        "qatalyst-dashboard-opensearch-endpoint" = join("", ["https://", try(module.create_in_opensearch[0].opensearch_host, "NA")])
    })
  }

  providers = {
    aws.ssm_region = aws.in_region
  }
}

module "create_in_ecr" {
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ecr"
  count        = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  repo_details = var.repo_details
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_in_media_convert_queue" {
  source              = "git@github.com:EntropikTechnologies/terraform-modules.git//mediaconvert"
  count               = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.in_region
  }
}
module "create_in_sqs" {
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//sqs"
  count            = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  sqs_queues       = var.sqs_queues
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.sqs_region = aws.in_region
  }
}

module "create_in_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  count                            = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
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
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//opensearch"
  count            = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  opensearch_config = merge(var.opensearch_config, {
    vpc_id          = try(module.create_in_vpc[0].vpc_id, ""),
    private_subnets = slice(try(module.create_in_vpc[0].private_subnets, []), 0, var.opensearch_config.availability_zone_count)
  })
  providers = {
    aws.opensearch_region = aws.in_region
    random.random         = random.random
  }
}

module "create_in_ecs" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//ecs-cluster"
  count              = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  vpc_id             = module.create_in_vpc[0].vpc_id
  alb_security_group = module.create_in_alb[0].qatalyst_alb_sg_id
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE
  product_name       = "qatalyst"
  datacenter_codes   = var.datacenter_codes

  providers = {
    aws.ecs_region = aws.in_region
  }
}

# SEA Resources
module "create_sea_vpc" {
  source           = "./modules/vpc"
  count            = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
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
  count                      = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
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
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.media_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.sea.name), var.media_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.sea.name), var.STAGE, var.media_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_sea_meet_acm_cf" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.meet_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.sea_region
  }
}

module "create_sea_acm_invite_alb" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.invite_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.sea_region
  }
}
module "create_sea_media_cloudfront" {
  source                      = "./modules/cloudfront"
  count                       = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = module.create_sea_s3_bucket[0].s3_bucket_arn
  bucket_id                   = module.create_sea_s3_bucket[0].s3_bucket_id
  bucket_regional_domain_name = module.create_sea_s3_bucket[0].s3_bucket_regional_domain_name
  acm_certificate_arn         = module.create_sea_acm_media_cf[0].acm_arn
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.sea_region
  }
}

module "create_sea_acm_api" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.api_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.sea.name), var.api_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.sea.name), var.STAGE, var.api_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.sea_region
  }
}

module "create_sea_alb" {
  source              = "./modules/alb"
  count               = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  vpc_id              = module.create_sea_vpc[0].vpc_id
  alb_subnets         = module.create_sea_vpc[0].public_subnets
  alb_certficate_arn  = module.create_sea_acm_api[0].acm_arn
  reports_acm_arn     = module.create_sea_reports_acm[0].acm_arn
  datacenter_codes    = var.datacenter_codes
  base_domain         = var.base_domain
  sub_domain          = var.api_sub_domain
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  STAGE               = var.STAGE
  meet_acm_arn        = module.create_sea_meet_acm_cf[0].acm_arn
  invite_acm_arn      = module.create_sea_acm_invite_alb[0].acm_arn
  lb_target_health    = var.lb_target_health
  tester_view_acm_arn = module.create_sea_tester_view_acm[0].acm_arn
  calendar_acm_arn    = module.create_sea_calendar_acm[0].acm_arn

  providers = {
    aws.alb_region = aws.sea_region
  }
}

module "create_sea_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  count         = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
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
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ssm"
  count        = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  ssm_config = {
    parameters = merge(var.qatalyst_ssm_config.parameters,
      {
        "qatalyst-private-1"                    = try("${module.create_sea_vpc[0].private_subnets[0]}", ""),
        "qatalyst-private-2"                    = try("${module.create_sea_vpc[0].private_subnets[1]}", ""),
        "qatalyst-private-3"                    = try("${module.create_sea_vpc[0].private_subnets[2]}", ""),
        "qatalyst-study-details-ddb-stream-arn" = module.create_sea_dynamodb[0].ddb_stream_arns["qatalyst-study-details"],
        "qatalyst-lambda-sg-id"                 = module.create_sea_vpc[0].lambda_security_group_id
    }),
    secure_parameters = merge(var.qatalyst_ssm_config.secure_parameters,
      {
        "qatalyst-open-ai-key"                   = lookup(var.open_ai_api, data.aws_region.sea.name)
        "qatalyst-feature-flag-auth"             = random_uuid.feature_flag_auth.result
        "qatalyst-dashboard-opensearch-endpoint" = join("", ["https://", try(module.create_sea_opensearch[0].opensearch_host, "NA")])
    })
  }
  providers = {
    aws.ssm_region = aws.sea_region
  }
}

module "create_sea_media_convert_queue" {
  source              = "git@github.com:EntropikTechnologies/terraform-modules.git//mediaconvert"
  count               = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  mediaconvert_queues = var.mediaconvert_queues
  DEFAULT_TAGS        = var.DEFAULT_TAGS
  providers = {
    aws.mediaconvert_region = aws.sea_region
  }
}

module "create_sea_sqs" {
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//sqs"
  count            = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  sqs_queues       = var.sqs_queues
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.sqs_region = aws.sea_region
  }
}


module "create_sea_qatalyst_media_bucket" {
  source                           = "./modules/s3"
  count                            = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
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
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//opensearch"
  count            = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  opensearch_config = merge(var.opensearch_config, {
    vpc_id          = try(module.create_sea_vpc[0].vpc_id, ""),
    private_subnets = slice(try(module.create_sea_vpc[0].private_subnets, []), 0, var.opensearch_config.availability_zone_count)
  })
  providers = {
    aws.opensearch_region = aws.sea_region
    random.random         = random.random
  }
}

module "create_sea_ecs" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//ecs-cluster"
  count              = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  vpc_id             = module.create_sea_vpc[0].vpc_id
  alb_security_group = module.create_sea_alb[0].qatalyst_alb_sg_id
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE
  product_name       = "qatalyst"
  datacenter_codes   = var.datacenter_codes


  providers = {
    aws.ecs_region = aws.sea_region
  }
}

# US Resources
module "create_us_vpc" {
  source           = "./modules/vpc"
  count            = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
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
  count                      = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
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
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.common_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.common_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.common_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
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
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}

module "create_us_ecs" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//ecs-cluster"
  count              = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  vpc_id             = module.create_us_vpc[0].vpc_id
  alb_security_group = module.create_us_alb[0].qatalyst_alb_sg_id
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE
  product_name       = "qatalyst"
  datacenter_codes   = var.datacenter_codes

  providers = {
    aws.ecs_region = aws.us_region
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
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id

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
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}
module "create_us_invite_acm_cf_alb" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.invite_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.invite_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

#Meet ACM or cloudfront & ALB
module "create_us_meet_acm_cf" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.meet_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.meet_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_us_acm_media_cf" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.media_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.us.name), var.media_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.us.name), var.STAGE, var.media_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_us_media_cloudfront" {
  source                      = "./modules/cloudfront"
  count                       = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  base_domain                 = var.base_domain
  sub_domain                  = var.media_sub_domain
  datacenter_codes            = var.datacenter_codes
  bucket_arn                  = try(module.create_us_s3_bucket[0].s3_bucket_arn, "")
  bucket_id                   = try(module.create_us_s3_bucket[0].s3_bucket_id, "")
  bucket_regional_domain_name = try(module.create_us_s3_bucket[0].s3_bucket_regional_domain_name, "")
  acm_certificate_arn         = try(module.create_us_acm_media_cf[0].acm_arn, "")
  cache_policy_id             = module.create_cdn_cache_policy.cdn_cache_policy_id
  is_multi_region             = true
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}

module "create_us_acm_api" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.api_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.us.name), var.api_sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.us.name), var.STAGE, var.api_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_us_alb" {
  source              = "./modules/alb"
  count               = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
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
  calendar_acm_arn    = module.create_calendar_acm.acm_arn

  providers = {
    aws.alb_region = aws.us_region
  }
}

module "create_us_dynamodb" {
  source        = "git@github.com:EntropikTechnologies/terraform-modules.git//dynamodb"
  count         = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
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
  count                            = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
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
  replica_regions = local.replica_regions
  providers = {
    aws.dynamo_region = aws.us_region
    aws.dynamo_eu     = aws.eu_region
    aws.dynamo_in     = aws.in_region
    aws.dynamo_sea    = aws.sea_region
    aws.dynamo_us     = aws.us_region
  }
}

module "create_us_ssm" {
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ssm"
  count        = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE
  ssm_config = {
    parameters = merge(var.qatalyst_ssm_config.parameters,
      {
        "qatalyst-private-1"                    = try("${module.create_us_vpc[0].private_subnets[0]}", ""),
        "qatalyst-private-2"                    = try("${module.create_us_vpc[0].private_subnets[1]}", ""),
        "qatalyst-private-3"                    = try("${module.create_us_vpc[0].private_subnets[2]}", ""),
        "qatalyst-study-details-ddb-stream-arn" = module.create_us_dynamodb[0].ddb_stream_arns["qatalyst-study-details"],
        "qatalyst-lambda-sg-id"                 = module.create_us_vpc[0].lambda_security_group_id
    }),
    secure_parameters = merge(var.qatalyst_ssm_config.secure_parameters,
      {
        "qatalyst-open-ai-key"                   = lookup(var.open_ai_api, data.aws_region.us.name)
        "qatalyst-feature-flag-auth"             = random_uuid.feature_flag_auth.result
        "qatalyst-dashboard-opensearch-endpoint" = join("", ["https://", try(module.create_us_opensearch[0].opensearch_host, "NA")])
    })
  }
  providers = {
    aws.ssm_region = aws.us_region
  }
}

#ECR 
module "create_ecr" {
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ecr"
  count        = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  repo_details = var.repo_details
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}

module "create_us_ecr" {
  source       = "git@github.com:EntropikTechnologies/terraform-modules.git//ecr"
  count        = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  repo_details = var.repo_details
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

module "create_us_media_convert_queue" {
  source              = "git@github.com:EntropikTechnologies/terraform-modules.git//mediaconvert"
  count               = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
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
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//sqs"
  count            = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  sqs_queues       = var.sqs_queues
  datacenter_codes = var.datacenter_codes

  providers = {
    aws.sqs_region = aws.us_region
  }
}

module "create_us_opensearch" {
  source           = "git@github.com:EntropikTechnologies/terraform-modules.git//opensearch"
  count            = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  datacenter_codes = var.datacenter_codes
  opensearch_config = merge(var.opensearch_config, {
    vpc_id          = try(module.create_us_vpc[0].vpc_id, ""),
    private_subnets = slice(try(module.create_us_vpc[0].private_subnets, []), 0, var.opensearch_config.availability_zone_count)
  })
  providers = {
    aws.opensearch_region = aws.us_region
    random.random         = random.random
  }
}
