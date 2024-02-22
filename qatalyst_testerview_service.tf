#ECS
module "create_eu_ecs_testerview_service" {
  source                        = "./modules/ecs-service"
  count                         = contains(["dev"], var.STAGE) ? 0 : 1
  ecs_service_name              = local.qatalyst_tester_view_service_name
  ecs_cluster_id                = try(module.create_eu_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name              = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_eu_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                   = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn          = try(module.create_eu_alb[0].qatalyst_alb_target_group_tester_view_arn, "")
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["testerview"]

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_in_ecs_testerview_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_tester_view_service_name
  ecs_cluster_id                = module.create_in_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_in_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_in_vpc.private_subnets
  alb_target_group_arn          = module.create_in_alb.qatalyst_alb_target_group_tester_view_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["testerview"]

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_sea_ecs_testerview_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_tester_view_service_name
  ecs_cluster_id                = module.create_sea_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_sea_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_sea_vpc.private_subnets
  alb_target_group_arn          = module.create_sea_alb.qatalyst_alb_target_group_tester_view_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["testerview"]

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_testerview_service" {
  source                        = "./modules/ecs-service"
  count                         = contains(["dev"], var.STAGE) ? 0 : 1
  ecs_service_name              = local.qatalyst_tester_view_service_name
  ecs_cluster_id                = try(module.create_us_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name              = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_us_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                   = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn          = try(module.create_us_alb[0].qatalyst_alb_target_group_tester_view_arn, "")
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["backend"]
  service                       = var.service_names["testerview"]

  providers = {
    aws.ecs_region = aws.us_region
  }
}

#Cloudwatch
module "create_eu_cloudwatch_tester_view_dashboard" {
  source           = "./modules/cloudwatch"
  count            = contains(["dev"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_tester_view_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = try(module.create_eu_alb[0].qatalyst_alb_arn_suffix, "")
  tg_arn_suffix    = try(module.create_eu_alb[0].qatalyst_alb_target_group_tester_view_arn_suffix, "")
  datacenter_codes = var.datacenter_codes
  dashboard_name   = local.qatalyst_cloudwatch_dashboard_name_tester_view

  providers = {
    aws.cw_region = aws.eu_region
  }
}

module "create_in_cloudwatch_tester_view_dashboard" {
  source           = "./modules/cloudwatch"
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_tester_view_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_in_alb.qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_in_alb.qatalyst_alb_target_group_tester_view_arn_suffix
  datacenter_codes = var.datacenter_codes
  dashboard_name   = local.qatalyst_cloudwatch_dashboard_name_tester_view

  providers = {
    aws.cw_region = aws.in_region
  }
}

module "create_sea_cloudwatch_tester_view_dashboard" {
  source           = "./modules/cloudwatch"
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_tester_view_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = module.create_sea_alb.qatalyst_alb_arn_suffix
  tg_arn_suffix    = module.create_sea_alb.qatalyst_alb_target_group_tester_view_arn_suffix
  datacenter_codes = var.datacenter_codes
  dashboard_name   = local.qatalyst_cloudwatch_dashboard_name_tester_view

  providers = {
    aws.cw_region = aws.sea_region
  }
}

module "create_us_cloudwatch_tester_view_dashboard" {
  source           = "./modules/cloudwatch"
  count            = contains(["dev"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS     = var.DEFAULT_TAGS
  STAGE            = var.STAGE
  ecs_service_name = local.qatalyst_tester_view_service_name
  ecs_cluster_name = local.qatalyst_ecs_cluster_name
  alb_arn_suffix   = try(module.create_us_alb[0].qatalyst_alb_arn_suffix, "")
  tg_arn_suffix    = try(module.create_us_alb[0].qatalyst_alb_target_group_tester_view_arn_suffix, "")
  datacenter_codes = var.datacenter_codes
  dashboard_name   = local.qatalyst_cloudwatch_dashboard_name_tester_view

  providers = {
    aws.cw_region = aws.us_region
  }
}

module "create_in_tester_view_acm" {
  source       = "./modules/acm-fe"
  base_domain  = var.base_domain
  domain_name  = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.acm_region = aws.in_region
  }
}
module "create_sea_tester_view_acm" {
  source       = "./modules/acm-fe"
  base_domain  = var.base_domain
  domain_name  = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.acm_region = aws.sea_region
  }
}
module "create_eu_tester_view_acm" {
  source       = "./modules/acm-fe"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  base_domain  = var.base_domain
  domain_name  = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.acm_region = aws.eu_region
  }
}