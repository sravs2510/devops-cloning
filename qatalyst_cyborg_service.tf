#EFS (Common for all services)
module "create_eu_efs" {
  source            = "git@github.com:EntropikTechnologies/terraform-modules.git//efs"
  count             = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["qatalyst"]
  private_subnets   = try(module.create_eu_vpc[0].private_subnets, [])
  sg_id             = try(module.create_eu_vpc[0].security_group_id, "")

  providers = {
    aws.efs_region = aws.eu_region
  }
}

module "create_in_efs" {
  source            = "git@github.com:EntropikTechnologies/terraform-modules.git//efs"
  count             = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["qatalyst"]
  private_subnets   = module.create_in_vpc[0].private_subnets
  sg_id             = module.create_in_vpc[0].security_group_id

  providers = {
    aws.efs_region = aws.in_region
  }
}

module "create_sea_efs" {
  source            = "git@github.com:EntropikTechnologies/terraform-modules.git//efs"
  count             = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["qatalyst"]
  private_subnets   = module.create_sea_vpc[0].private_subnets
  sg_id             = module.create_sea_vpc[0].security_group_id

  providers = {
    aws.efs_region = aws.sea_region
  }
}

module "create_us_efs" {
  source            = "git@github.com:EntropikTechnologies/terraform-modules.git//efs"
  count             = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["qatalyst"]
  private_subnets   = try(module.create_us_vpc[0].private_subnets, [])
  sg_id             = try(module.create_us_vpc[0].security_group_id, "")

  providers = {
    aws.efs_region = aws.us_region
  }
}

#ECS
module "create_eu_ecs_cyborg_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_cyborg_service_name
  ecs_cluster_id                = try(module.create_eu_ecs[0].cluster_id, "")
  ecs_cluster_name              = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_eu_ecs[0].ecs_security_group_id, [])
  ecs_subnets                   = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.cyborg_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["default"]
  service_environment_variables = local.qatalyst_cyborg_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_cyborg_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["cyborg"]
  service                       = var.service_names["cyborg"]
  efs_file_system_id            = try(module.create_eu_efs[0].efs_id, "")
  efs_access_point_id           = try(module.create_eu_efs[0].access_point_id, "")
  efs_configuration             = var.efs_configurations["cyborg"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_in_ecs_cyborg_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_cyborg_service_name
  ecs_cluster_id                = module.create_in_ecs[0].cluster_id
  ecs_cluster_name              = module.create_in_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs[0].ecs_security_group_id
  ecs_subnets                   = module.create_in_vpc[0].private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.cyborg_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["default"]
  service_environment_variables = local.qatalyst_cyborg_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_cyborg_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["cyborg"]
  service                       = var.service_names["cyborg"]
  efs_file_system_id            = module.create_in_efs[0].efs_id
  efs_access_point_id           = module.create_in_efs[0].access_point_id
  efs_configuration             = var.efs_configurations["cyborg"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_sea_ecs_cyborg_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_cyborg_service_name
  ecs_cluster_id                = module.create_sea_ecs[0].cluster_id
  ecs_cluster_name              = module.create_sea_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs[0].ecs_security_group_id
  ecs_subnets                   = module.create_sea_vpc[0].private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.cyborg_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["default"]
  service_environment_variables = local.qatalyst_cyborg_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_cyborg_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["cyborg"]
  service                       = var.service_names["cyborg"]
  efs_file_system_id            = module.create_sea_efs[0].efs_id
  efs_access_point_id           = module.create_sea_efs[0].access_point_id
  efs_configuration             = var.efs_configurations["cyborg"]
  logs_retention_in_days        = var.cw_logs_retention_in_days


  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_cyborg_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_cyborg_service_name
  ecs_cluster_id                = try(module.create_us_ecs[0].cluster_id, "")
  ecs_cluster_name              = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_us_ecs[0].ecs_security_group_id, [])
  ecs_subnets                   = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.cyborg_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["default"]
  service_environment_variables = local.qatalyst_cyborg_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_cyborg_ecs_task_environment_secrets
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["cyborg"]
  service                       = var.service_names["cyborg"]
  efs_file_system_id            = try(module.create_us_efs[0].efs_id, "")
  efs_access_point_id           = try(module.create_us_efs[0].access_point_id, "")
  efs_configuration             = var.efs_configurations["cyborg"]
  logs_retention_in_days        = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.us_region
  }
}