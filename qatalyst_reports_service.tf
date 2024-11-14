#ECS

module "create_in_ecs_reports_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_reports_service_name
  ecs_cluster_id                = module.create_in_ecs[0].cluster_id
  ecs_cluster_name              = module.create_in_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs[0].ecs_security_group_id
  ecs_subnets                   = module.create_in_vpc[0].private_subnets
  alb_target_group_arn          = module.create_in_alb[0].qatalyst_alb_target_group_reports_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["reports"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["reports"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_eu_ecs_reports_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_reports_service_name
  ecs_cluster_id                = try(module.create_eu_ecs[0].cluster_id, "")
  ecs_cluster_name              = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_eu_ecs[0].ecs_security_group_id, [])
  ecs_subnets                   = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn          = try(module.create_eu_alb[0].qatalyst_alb_target_group_reports_arn, "")
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["reports"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["reports"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_sea_ecs_reports_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_reports_service_name
  ecs_cluster_id                = module.create_sea_ecs[0].cluster_id
  ecs_cluster_name              = module.create_sea_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs[0].ecs_security_group_id
  ecs_subnets                   = module.create_sea_vpc[0].private_subnets
  alb_target_group_arn          = module.create_sea_alb[0].qatalyst_alb_target_group_reports_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["reports"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["reports"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_reports_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_reports_service_name
  ecs_cluster_id                = try(module.create_us_ecs[0].cluster_id, "")
  ecs_cluster_name              = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_us_ecs[0].ecs_security_group_id, [])
  ecs_subnets                   = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn          = try(module.create_us_alb[0].qatalyst_alb_target_group_reports_arn, "")
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["reports"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["reports"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.us_region
  }
}

#Cloudwatch
module "create_eu_cloudwatch_reports_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.cloudwatch_deploy_regions, data.aws_region.eu.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_reports_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = try(module.create_eu_alb[0].qatalyst_alb_arn_suffix, "")
  tg_arn_suffix    = try(module.create_eu_alb[0].qatalyst_alb_target_group_reports_arn_suffix, "")
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["reports"]
  providers = {
    aws.cw_region = aws.eu_region
  }
}

module "create_in_cloudwatch_reports_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.cloudwatch_deploy_regions, data.aws_region.in.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_reports_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_in_alb[0].qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_in_alb[0].qatalyst_alb_target_group_reports_arn_suffix
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["reports"]
  providers = {
    aws.cw_region = aws.in_region
  }
}

module "create_sea_cloudwatch_reports_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.cloudwatch_deploy_regions, data.aws_region.sea.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_reports_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_sea_alb[0].qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_sea_alb[0].qatalyst_alb_target_group_reports_arn_suffix
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["reports"]
  providers = {
    aws.cw_region = aws.sea_region
  }
}

module "create_us_cloudwatch_reports_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.cloudwatch_deploy_regions, data.aws_region.us.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_reports_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = try(module.create_us_alb[0].qatalyst_alb_arn_suffix, "")
  tg_arn_suffix    = try(module.create_us_alb[0].qatalyst_alb_target_group_reports_arn_suffix, "")
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["reports"]
  providers = {
    aws.cw_region = aws.us_region
  }
}

#ACM
module "create_in_reports_acm" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.reports_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.in_region
  }
}

module "create_sea_reports_acm" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.reports_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.sea_region
  }
}

module "create_reports_acm_cf" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.reports_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.us_region
  }
}

module "create_eu_reports_acm" {
  source             = "git@github.com:EntropikTechnologies/terraform-modules.git//acm"
  count              = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  hosted_zone_domain = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  domain_name        = var.STAGE == "prod" ? join(".", [var.reports_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.reports_sub_domain, var.base_domain])
  DEFAULT_TAGS       = var.DEFAULT_TAGS
  STAGE              = var.STAGE

  providers = {
    aws.acm_region = aws.eu_region
  }
}

module "create_reports_s3_sub_domain" {
  source                     = "./modules/s3"
  bucket_prefix              = var.reports_sub_domain
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

module "create_cloudfront_reports" {
  source                      = "./modules/cloudfront-fe-be"
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  base_domain                 = var.base_domain
  sub_domain                  = var.reports_sub_domain
  bucket_id                   = module.create_reports_s3_sub_domain.s3_bucket_id
  bucket_arn                  = module.create_reports_s3_sub_domain.s3_bucket_arn
  acm_certificate_arn         = module.create_reports_acm_cf.acm_arn
  bucket_regional_domain_name = module.create_reports_s3_sub_domain.s3_bucket_regional_domain_name
  qatalyst_alb_dns_names      = local.alb_dns_names
  s3_origin_access_control_id = module.create_cdn_cache_policy.s3_origin_access_control_id

  providers = {
    aws.cloudfront_region = aws.us_region
    aws.bucket_region     = aws.us_region
  }
}
