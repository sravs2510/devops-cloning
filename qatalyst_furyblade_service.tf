#ECS furyblade
module "create_sea_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  count                       = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = module.create_sea_ecs[0].cluster_id
  ecs_cluster_name            = module.create_sea_ecs[0].ecs_cluster_name
  ecs_security_groups         = module.create_sea_ecs[0].ecs_security_group_id
  ecs_subnets                 = module.create_sea_vpc[0].private_subnets
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_service_configurations["default"]
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      { name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_sea_furyblade_eventbridge_group[0].eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = module.create_sea_efs[0].efs_id
  efs_access_point_id         = module.create_sea_efs[0].access_point_id
  efs_configuration           = var.efs_configurations["furyblade"]
  logs_retention_in_days      = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_in_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  count                       = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = module.create_in_ecs[0].cluster_id
  ecs_cluster_name            = module.create_in_ecs[0].ecs_cluster_name
  ecs_security_groups         = module.create_in_ecs[0].ecs_security_group_id
  ecs_subnets                 = module.create_in_vpc[0].private_subnets
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_service_configurations["default"]
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      {
        name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_in_furyblade_eventbridge_group[0].eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = module.create_in_efs[0].efs_id
  efs_access_point_id         = module.create_in_efs[0].access_point_id
  efs_configuration           = var.efs_configurations["furyblade"]
  logs_retention_in_days      = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_us_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  count                       = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = try(module.create_us_ecs[0].cluster_id, "")
  ecs_cluster_name            = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups         = try(module.create_us_ecs[0].ecs_security_group_id, [])
  ecs_subnets                 = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_service_configurations["default"]
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      {
        name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_us_furyblade_eventbridge_group[0].eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = try(module.create_us_efs[0].efs_id, "")
  efs_access_point_id         = try(module.create_us_efs[0].access_point_id, "")
  efs_configuration           = var.efs_configurations["furyblade"]
  logs_retention_in_days      = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.us_region
  }
}

module "create_eu_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  count                       = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = try(module.create_eu_ecs[0].cluster_id, "")
  ecs_cluster_name            = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups         = try(module.create_eu_ecs[0].ecs_security_group_id, [])
  ecs_subnets                 = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_service_configurations["default"]
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      {
        name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_us_furyblade_eventbridge_group[0].eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = try(module.create_eu_efs[0].efs_id, "")
  efs_access_point_id         = try(module.create_eu_efs[0].access_point_id, "")
  efs_configuration           = var.efs_configurations["furyblade"]
  logs_retention_in_days      = var.cw_logs_retention_in_days

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

#Event Bridge Scheduler Group
module "create_eu_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.eu_region
  }
}

module "create_in_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.in_region
  }
}

module "create_sea_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.sea_region
  }
}

module "create_us_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.us_region
  }
}