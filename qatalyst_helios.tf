#ECR
module "create_in_qatalyst_helios_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_in_qatalyst_fargate_batch" {
  source                  = "./modules/batch"
  STAGE                   = var.STAGE
  DEFAULT_TAGS            = var.DEFAULT_TAGS
  batch_job_configuration = var.batch_configurations["qatalyst-helios"]
  batch_job_definition    = local.qatalyst_batch_job_definition
  batch_service_role      = module.create_iam.batch_service_role_arn
  batch_job_role          = module.create_iam.batch_job_role_arn
  batch_execution_role    = module.create_iam.batch_execution_role_arn
  batch_compute           = local.qatalyst_batch_compute
  batch_job_queue         = local.qatalyst_batch_job_queue
  private_subnets         = module.create_in_vpc.private_subnets
  sg_id                   = module.create_in_vpc.security_group_id
  datacenter_codes        = var.datacenter_codes
  providers = {
    aws.batch_region = aws.in_region
  }
}
module "create_sea_qatalyst_helios_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}
module "create_sea_qatalyst_fargate_batch" {
  source                  = "./modules/batch"
  STAGE                   = var.STAGE
  DEFAULT_TAGS            = var.DEFAULT_TAGS
  batch_job_configuration = var.batch_configurations["qatalyst-helios"]
  batch_job_definition    = local.qatalyst_batch_job_definition
  batch_service_role      = module.create_iam.batch_service_role_arn
  batch_job_role          = module.create_iam.batch_job_role_arn
  batch_execution_role    = module.create_iam.batch_execution_role_arn
  batch_compute           = local.qatalyst_batch_compute
  batch_job_queue         = local.qatalyst_batch_job_queue
  private_subnets         = module.create_in_vpc.private_subnets
  sg_id                   = module.create_in_vpc.security_group_id
  datacenter_codes        = var.datacenter_codes
  providers = {
    aws.batch_region = aws.in_region
  }
}

module "create_eu_qatalyst_helios_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}
module "create_eu_qatalyst_fargate_batch" {
  source                  = "./modules/batch"
  STAGE                   = var.STAGE
  count                   = contains(["dev"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS            = var.DEFAULT_TAGS
  batch_job_configuration = var.batch_configurations["qatalyst-helios"]
  batch_job_definition    = local.qatalyst_batch_job_definition
  batch_service_role      = module.create_iam.batch_service_role_arn
  batch_job_role          = module.create_iam.batch_job_role_arn
  batch_execution_role    = module.create_iam.batch_execution_role_arn
  batch_compute           = local.qatalyst_batch_compute
  batch_job_queue         = local.qatalyst_batch_job_queue
  private_subnets         = module.create_in_vpc[0].private_subnets
  sg_id                   = module.create_in_vpc[0].security_group_id
  datacenter_codes        = var.datacenter_codes
  providers = {
    aws.batch_region = aws.eu_region
  }
}

module "create_us_qatalyst_helios_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  service_name = var.service_names["helios"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

module "create_us_qatalyst_fargate_batch" {
  source                  = "./modules/batch"
  STAGE                   = var.STAGE
  count                   = contains(["dev"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS            = var.DEFAULT_TAGS
  batch_job_configuration = var.batch_configurations["qatalyst-helios"]
  batch_job_definition    = local.qatalyst_batch_job_definition
  batch_service_role      = module.create_iam.batch_service_role_arn
  batch_job_role          = module.create_iam.batch_job_role_arn
  batch_execution_role    = module.create_iam.batch_execution_role_arn
  batch_compute           = local.qatalyst_batch_compute
  batch_job_queue         = local.qatalyst_batch_job_queue
  private_subnets         = module.create_in_vpc[0].private_subnets
  sg_id                   = module.create_in_vpc[0].security_group_id
  datacenter_codes        = var.datacenter_codes
  providers = {
    aws.batch_region = aws.us_region
  }
}
