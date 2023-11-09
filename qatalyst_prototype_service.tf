#ECS
module "create_eu_ecs_prototype_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_prototype_service_name
  ecs_cluster_id                = module.create_eu_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_eu_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_eu_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_eu_vpc.private_subnets
  alb_target_group_arn          = module.create_eu_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_prototype_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_prototype_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["prototype"]

  providers = {
    aws.ecs_region = aws.eu_region
  }
}

module "create_in_ecs_prototype_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_prototype_service_name
  ecs_cluster_id                = module.create_in_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_in_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_in_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_in_vpc.private_subnets
  alb_target_group_arn          = module.create_in_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_prototype_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_prototype_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["prototype"]

  providers = {
    aws.ecs_region = aws.in_region
  }
}

module "create_sea_ecs_prototype_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_prototype_service_name
  ecs_cluster_id                = module.create_sea_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_sea_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_sea_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_sea_vpc.private_subnets
  alb_target_group_arn          = module.create_sea_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_prototype_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_prototype_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["prototype"]

  providers = {
    aws.ecs_region = aws.sea_region
  }
}

module "create_us_ecs_prototype_service" {
  source                        = "./modules/ecs-service"
  ecs_service_name              = local.qatalyst_prototype_service_name
  ecs_cluster_id                = module.create_us_ecs.ecs_cluster_id
  ecs_cluster_name              = module.create_us_ecs.ecs_cluster_name
  ecs_security_groups           = module.create_us_ecs.ecs_security_group_ids
  ecs_subnets                   = module.create_us_vpc.private_subnets
  alb_target_group_arn          = module.create_us_alb.qatalyst_alb_target_group_arn
  ecs_task_execution_role_arn   = module.create_iam.ecs_task_execution_role_arn
  ecs_task_role_arn             = module.create_iam.ecs_task_role_arn
  ecs_autoscale_role_arn        = module.create_iam.qatalyst_ecs_autoscale_role_arn
  fargate_cpu_memory            = var.fargate_cpu_memory
  service_environment_variables = local.qatalyst_prototype_ecs_task_environment_variables
  service_environment_secrets   = local.qatalyst_prototype_ecs_task_environment_secrets
  dd_environment_variables      = local.qatalyst_datadog_environment_variables
  dd_environment_secrets        = local.qatalyst_datadog_environment_secrets
  datadog_docker_image          = var.datadog_docker_image
  datacenter_codes              = var.datacenter_codes
  DEFAULT_TAGS                  = var.DEFAULT_TAGS
  STAGE                         = var.STAGE
  repo_name                     = var.ecr_repo_name
  service                       = var.service_names["prototype"]

  providers = {
    aws.ecs_region = aws.us_region
  }
}