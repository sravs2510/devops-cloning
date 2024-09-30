#ECS
module "create_eu_ecs_dashboard_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_dashboard_service_name
  ecs_cluster_id                = try(module.create_eu_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name              = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_eu_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                   = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn          = try(module.create_eu_alb[0].qatalyst_alb_target_group_arn, "")
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["dashboard"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["dashboard"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.eu_region
  }
}
module "create_in_ecs_dashboard_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_dashboard_service_name
  ecs_cluster_id                = module.create_in_ecs[0].ecs_cluster_id
  ecs_cluster_name              = module.create_in_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs[0].ecs_security_group_ids
  ecs_subnets                   = module.create_in_vpc[0].private_subnets
  alb_target_group_arn          = module.create_in_alb[0].qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["dashboard"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["dashboard"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_sea_ecs_dashboard_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_dashboard_service_name
  ecs_cluster_id                = module.create_sea_ecs[0].ecs_cluster_id
  ecs_cluster_name              = module.create_sea_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs[0].ecs_security_group_ids
  ecs_subnets                   = module.create_sea_vpc[0].private_subnets
  alb_target_group_arn          = module.create_sea_alb[0].qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["dashboard"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["dashboard"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_dashboard_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_dashboard_service_name
  ecs_cluster_id                = try(module.create_us_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name              = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_us_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                   = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn          = try(module.create_us_alb[0].qatalyst_alb_target_group_arn, "")
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["dashboard"]
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["dashboard"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.us_region
  }
}

#Cloudwatch
module "create_eu_cloudwatch_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_dashboard_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = try(module.create_eu_alb[0].qatalyst_alb_arn_suffix, "")
  tg_arn_suffix    = try(module.create_eu_alb[0].qatalyst_tg_arn_suffix, "")
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["dashboard"]
  providers = {
    aws.cw_region = aws.eu_region
  }
}

module "create_in_cloudwatch_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_dashboard_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_in_alb[0].qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_in_alb[0].qatalyst_tg_arn_suffix
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["dashboard"]
  providers = {
    aws.cw_region = aws.in_region
  }
}

module "create_sea_cloudwatch_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_dashboard_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_sea_alb[0].qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_sea_alb[0].qatalyst_tg_arn_suffix
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["dashboard"]
  providers = {
    aws.cw_region = aws.sea_region
  }
}

module "create_us_cloudwatch_dashboard" {
  source           = "./modules/cloudwatch"
  count            = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_dashboard_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = try(module.create_us_alb[0].qatalyst_alb_arn_suffix, "")
  tg_arn_suffix    = try(module.create_us_alb[0].qatalyst_tg_arn_suffix, "")
  datacenter_codes = var.datacenter_codes
  service          = var.service_names["dashboard"]
  providers = {
    aws.cw_region = aws.us_region
  }
}