#EFS
module "create_eu_mammoth_efs" {
  source            = "./modules/efs"
  count             = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["mammoth"]
  private_subnets   = try(module.create_eu_vpc[0].private_subnets, [])
  sg_id             = try(module.create_eu_vpc[0].security_group_id, "")

  providers = {
    aws.efs_region = aws.eu_region
  }
}

module "create_in_mammoth_efs" {
  source            = "./modules/efs"
  count             = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["mammoth"]
  private_subnets   = module.create_in_vpc[0].private_subnets
  sg_id             = module.create_in_vpc[0].security_group_id

  providers = {
    aws.efs_region = aws.in_region
  }
}

module "create_sea_mammoth_efs" {
  source            = "./modules/efs"
  count             = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["mammoth"]
  private_subnets   = module.create_sea_vpc[0].private_subnets
  sg_id             = module.create_sea_vpc[0].security_group_id

  providers = {
    aws.efs_region = aws.sea_region
  }
}

module "create_us_mammoth_efs" {
  source            = "./modules/efs"
  count             = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  efs_configuration = var.efs_configurations["mammoth"]
  private_subnets   = try(module.create_us_vpc[0].private_subnets, [])
  sg_id             = try(module.create_us_vpc[0].security_group_id, "")

  providers = {
    aws.efs_region = aws.us_region
  }
}

#ECS
module "create_eu_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = try(module.create_eu_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name              = try(module.create_eu_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_eu_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                   = try(module.create_eu_vpc[0].private_subnets, [])
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["mammoth"]
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["mammoth"]
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = try(module.create_eu_mammoth_efs[0].efs_id, "")
  efs_access_point_id           = try(module.create_eu_mammoth_efs[0].access_point_id, "")
  efs_configuration             = var.efs_configurations["mammoth"]

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_in_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = module.create_in_ecs[0].ecs_cluster_id
  ecs_cluster_name              = module.create_in_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs[0].ecs_security_group_ids
  ecs_subnets                   = module.create_in_vpc[0].private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["mammoth"]
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["mammoth"]
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = module.create_in_mammoth_efs[0].efs_id
  efs_access_point_id           = module.create_in_mammoth_efs[0].access_point_id
  efs_configuration             = var.efs_configurations["mammoth"]

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_sea_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = module.create_sea_ecs[0].ecs_cluster_id
  ecs_cluster_name              = module.create_sea_ecs[0].ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs[0].ecs_security_group_ids
  ecs_subnets                   = module.create_sea_vpc[0].private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["mammoth"]
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["mammoth"]
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = module.create_sea_mammoth_efs[0].efs_id
  efs_access_point_id           = module.create_sea_mammoth_efs[0].access_point_id
  efs_configuration             = var.efs_configurations["mammoth"]


  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  count                         = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = try(module.create_us_ecs[0].ecs_cluster_id, "")
  ecs_cluster_name              = try(module.create_us_ecs[0].ecs_cluster_name, "")
  ecs_security_groups           = try(module.create_us_ecs[0].ecs_security_group_ids, [])
  ecs_subnets                   = try(module.create_us_vpc[0].private_subnets, [])
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  fargate_cpu_memory            = var.fargate_service_configurations["mammoth"]
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.service_names["mammoth"]
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = try(module.create_us_mammoth_efs[0].efs_id, "")
  efs_access_point_id           = try(module.create_us_mammoth_efs[0].access_point_id, "")
  efs_configuration             = var.efs_configurations["mammoth"]

  providers = {
    aws.ecs_region = aws.us_region
  }
}

#Event bridge schedule groups
module "create_in_precomputation_eventbridge_group" {
  source          = "./modules/eventbridge"
  count           = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  STAGE           = var.STAGE
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  service         = var.schedule_group_names["precomputation"]

  providers = {
    aws.eventbridge_region = aws.in_region
  }
}

module "create_sea_precomputation_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.schedule_group_names["precomputation"]

  providers = {
    aws.eventbridge_region = aws.sea_region
  }
}

module "create_us_precomputation_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.schedule_group_names["precomputation"]

  providers = {
    aws.eventbridge_region = aws.us_region
  }
}

module "create_eu_precomputation_eventbridge_group" {
  source       = "./modules/eventbridge"
  count        = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  STAGE        = var.STAGE
  DEFAULT_TAGS = var.DEFAULT_TAGS
  service      = var.schedule_group_names["precomputation"]

  providers = {
    aws.eventbridge_region = aws.eu_region
  }
}