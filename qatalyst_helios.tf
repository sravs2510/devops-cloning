module "create_eu_ecr_helios" {
  source       = "./modules/ecr"
  count        = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}

module "create_eu_batch_helios" {
  source                     = "./modules/batch"
  count                      = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  subnet_ids                 = module.create_eu_vpc[0].private_subnets
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  security_group_id          = module.create_eu_vpc[0].security_group_id
  batch_service_role         = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role             = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role       = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes           = var.datacenter_codes
  batch_job_configuration    = var.batch_configurations["helios"]
  file_system_id             = ""
  batch_iam_instance_profile = ""
  access_point_id            = ""
  providers = {
    aws.batch_region = aws.eu_region
  }
}

module "create_in_ecr_helios" {
  source       = "./modules/ecr"
  count        = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_in_batch_helios" {
  source                     = "./modules/batch"
  count                      = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  subnet_ids                 = module.create_in_vpc[0].private_subnets
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  security_group_id          = module.create_in_vpc[0].security_group_id
  batch_service_role         = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role             = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role       = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes           = var.datacenter_codes
  batch_job_configuration    = var.batch_configurations["helios"]
  file_system_id             = ""
  batch_iam_instance_profile = ""
  access_point_id            = ""

  providers = {
    aws.batch_region = aws.in_region
  }
}

module "create_sea_ecr_helios" {
  source       = "./modules/ecr"
  count        = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}

module "create_sea_batch_helios" {
  source                     = "./modules/batch"
  count                      = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  subnet_ids                 = module.create_sea_vpc[0].private_subnets
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  security_group_id          = module.create_sea_vpc[0].security_group_id
  batch_service_role         = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role             = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role       = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes           = var.datacenter_codes
  batch_job_configuration    = var.batch_configurations["helios"]
  file_system_id             = ""
  batch_iam_instance_profile = ""
  access_point_id            = ""
  providers = {
    aws.batch_region = aws.sea_region
  }
}

module "create_us_ecr_helios" {
  source       = "./modules/ecr"
  count        = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

module "create_us_batch_helios" {
  source                     = "./modules/batch"
  count                      = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  subnet_ids                 = module.create_us_vpc[0].private_subnets
  DEFAULT_TAGS               = var.DEFAULT_TAGS
  STAGE                      = var.STAGE
  security_group_id          = module.create_us_vpc[0].security_group_id
  batch_service_role         = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role             = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role       = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes           = var.datacenter_codes
  batch_job_configuration    = var.batch_configurations["helios"]
  file_system_id             = ""
  batch_iam_instance_profile = ""
  access_point_id            = ""
  providers = {
    aws.batch_region = aws.us_region
  }
}