
#EFS
module "create_eu_mammoth_efs" {
  source            = "./modules/efs"
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  EFS_CONFIGURATION = var.mammoth_efs_configurations
  private_subnets   = module.create_eu_vpc.private_subnets
  sg_id             = module.create_eu_vpc.security_group_id

  providers = {
    aws.efs_region = aws.eu_region
  }
}

module "create_in_mammoth_efs" {
  source            = "./modules/efs"
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  EFS_CONFIGURATION = var.mammoth_efs_configurations
  private_subnets   = module.create_in_vpc.private_subnets
  sg_id             = module.create_in_vpc.security_group_id

  providers = {
    aws.efs_region = aws.in_region
  }
}

module "create_sea_mammoth_efs" {
  source            = "./modules/efs"
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  EFS_CONFIGURATION = var.mammoth_efs_configurations
  private_subnets   = module.create_sea_vpc.private_subnets
  sg_id             = module.create_sea_vpc.security_group_id

  providers = {
    aws.efs_region = aws.sea_region
  }
}

module "create_us_mammoth_efs" {
  source            = "./modules/efs"
  STAGE             = var.STAGE
  DEFAULT_TAGS      = var.DEFAULT_TAGS
  EFS_CONFIGURATION = var.mammoth_efs_configurations
  private_subnets   = module.create_us_vpc.private_subnets
  sg_id             = module.create_us_vpc.security_group_id

  providers = {
    aws.efs_region = aws.us_region
  }
}

#ECS
module "create_eu_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = module.create_eu_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_eu_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_eu_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_eu_vpc.private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = module.create_eu_mammoth_efs.efs_id
  efs_access_point_id           = module.create_eu_mammoth_efs.access_point_id
  EFS_CONFIGURATION             = var.mammoth_efs_configurations

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_in_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = module.create_in_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_in_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_in_vpc.private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = module.create_in_mammoth_efs.efs_id
  efs_access_point_id           = module.create_in_mammoth_efs.access_point_id
  EFS_CONFIGURATION             = var.mammoth_efs_configurations

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_sea_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = module.create_sea_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_sea_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_sea_vpc.private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = module.create_sea_mammoth_efs.efs_id
  efs_access_point_id           = module.create_sea_mammoth_efs.access_point_id
  EFS_CONFIGURATION             = var.mammoth_efs_configurations


  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_mammoth_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_mammoth_service_name
  ecs_cluster_id                = module.create_us_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_us_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_us_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_us_vpc.private_subnets
  alb_target_group_arn          = ""
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.mammoth_ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_mammoth_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_mammoth_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["mammoth"]
  efs_file_system_id            = module.create_us_mammoth_efs.efs_id
  efs_access_point_id           = module.create_us_mammoth_efs.access_point_id
  EFS_CONFIGURATION             = var.mammoth_efs_configurations

  providers = {
    aws.ecs_region = aws.us_region
  }
}