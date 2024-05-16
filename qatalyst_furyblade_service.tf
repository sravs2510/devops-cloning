#ECR
module "create_in_furyblade_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["furyblade"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_sea_furyblade_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["furyblade"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}

module "create_eu_furyblade_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  service_name = var.service_names["furyblade"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}

module "create_us_furyblade_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  service_name = var.service_names["furyblade"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

#ECS furyblade
module "create_sea_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = module.create_sea_ecs.ecs_cluster_id
  ecs_cluster_name            = module.create_sea_ecs.ecs_cluster_name
  ecs_security_groups         = module.create_sea_ecs.ecs_security_group_ids
  ecs_subnets                 = module.create_sea_vpc.private_subnets
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_cpu_memory
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      { name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_sea_furyblade_eventbridge_group.eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  dd_environment_variables    = local.qatalyst_datadog_environment_variables
  dd_environment_secrets      = local.qatalyst_datadog_environment_secrets
  datadog_docker_image        = var.datadog_docker_image
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = module.create_sea_furyblade_efs.efs_id
  efs_access_point_id         = module.create_sea_furyblade_efs.access_point_id
  efs_configuration           = var.efs_configurations["furyblade"]

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_in_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = module.create_in_ecs.ecs_cluster_id
  ecs_cluster_name            = module.create_in_ecs.ecs_cluster_name
  ecs_security_groups         = module.create_in_ecs.ecs_security_group_ids
  ecs_subnets                 = module.create_in_vpc.private_subnets
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_cpu_memory
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      {
        name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_in_furyblade_eventbridge_group.eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  dd_environment_variables    = local.qatalyst_datadog_environment_variables
  dd_environment_secrets      = local.qatalyst_datadog_environment_secrets
  datadog_docker_image        = var.datadog_docker_image
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = module.create_in_furyblade_efs.efs_id
  efs_access_point_id         = module.create_in_furyblade_efs.access_point_id
  efs_configuration           = var.efs_configurations["furyblade"]

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_us_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  count                       = contains(["dev"], var.STAGE) ? 0 : 1
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = try(module.create_us_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name            = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups         = try(module.create_us_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                 = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_cpu_memory
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      {
        name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_us_furyblade_eventbridge_group[0].eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  dd_environment_variables    = local.qatalyst_datadog_environment_variables
  dd_environment_secrets      = local.qatalyst_datadog_environment_secrets
  datadog_docker_image        = var.datadog_docker_image
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = try(module.create_us_furyblade_efs[0].efs_id, "")
  efs_access_point_id         = try(module.create_us_furyblade_efs[0].access_point_id, "")
  efs_configuration           = var.efs_configurations["furyblade"]

  providers = {
    aws.ecs_region = aws.us_region
  }
}

module "create_eu_ecs_furyblade_service" {
  source                      = "./modules/ecs-service"
  count                       = contains(["dev"], var.STAGE) ? 0 : 1
  ecs_service_name            = local.qatalyst_furyblade_service_name
  ecs_cluster_id              = try(module.create_eu_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name            = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups         = try(module.create_eu_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                 = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn        = ""
  ecs_task_execution_role_arn = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.create_iam.furyblade_ecs_task_role_arn
  fargate_cpu_memory          = var.fargate_cpu_memory
  service_environment_variables = concat(local.qatalyst_furyblade_ecs_task_environment_variables,
    [
      {
        name  = "EVENT_BRIDE_SCHEDULER_GROUP_ARN"
        value = module.create_us_furyblade_eventbridge_group[0].eventbridge_group_arn
      }
    ]
  )
  service_environment_secrets = local.qatalyst_furyblade_ecs_task_environment_secrets
  dd_environment_variables    = local.qatalyst_datadog_environment_variables
  dd_environment_secrets      = local.qatalyst_datadog_environment_secrets
  datadog_docker_image        = var.datadog_docker_image
  datacenter_codes            = var.datacenter_codes
  DEFAULT_TAGS                = var.DEFAULT_TAGS
  STAGE                       = var.STAGE
  repo_name                   = var.service_names["furyblade"]
  service                     = var.service_names["furyblade"]
  efs_file_system_id          = try(module.create_eu_furyblade_efs[0].efs_id, "")
  efs_access_point_id         = try(module.create_eu_furyblade_efs[0].access_point_id, "")
  efs_configuration           = var.efs_configurations["furyblade"]

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_eu_furyblade_efs" {
  source            = "./modules/efs"
  count             = contains(["dev"], var.STAGE) ? 0 : 1
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["furyblade"]
  private_subnets   = try(module.create_eu_vpc[0].private_subnets, [])
  sg_id             = try(module.create_eu_vpc[0].security_group_id, "")

  providers = {
    aws.efs_region = aws.eu_region
  }
}

module "create_in_furyblade_efs" {
  source            = "./modules/efs"
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["furyblade"]
  private_subnets   = module.create_in_vpc.private_subnets
  sg_id             = module.create_in_vpc.security_group_id

  providers = {
    aws.efs_region = aws.in_region
  }
}

module "create_sea_furyblade_efs" {
  source            = "./modules/efs"
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["furyblade"]
  private_subnets   = module.create_sea_vpc.private_subnets
  sg_id             = module.create_sea_vpc.security_group_id

  providers = {
    aws.efs_region = aws.sea_region
  }
}

module "create_us_furyblade_efs" {
  source            = "./modules/efs"
  count             = contains(["dev"], var.STAGE) ? 0 : 1
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["furyblade"]
  private_subnets   = try(module.create_us_vpc[0].private_subnets, [])
  sg_id             = try(module.create_us_vpc[0].security_group_id, "")

  providers = {
    aws.efs_region = aws.us_region
  }
}

#Event Bridge Scheduler Group
module "create_eu_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.eu_region
  }
}

module "create_in_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.in_region
  }
}

module "create_sea_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.sea_region
  }
}

module "create_us_furyblade_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.service_names["furyblade"]

  providers = {
    aws.eventbridge_region = aws.us_region
  }
}