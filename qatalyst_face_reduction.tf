#ECR
module "create_in_qatalyst_face_reduction_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["face_reduction"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.in_region
  }
}

module "create_in_qatalyst_fargate_batch" {
  source                            = "./modules/batch"
  STAGE                             = var.STAGE
  DEFAULT_TAGS                      = var.DEFAULT_TAGS
  batch_job_configuration           = var.batch_configurations["qatalyst-face-reduction"]
  qatalyst_aws_iam_instance_profile = module.create_iam.qatalyst_aws_iam_instance_profile
  qatalyst_aws_batch_service_role   = module.create_iam.qatalyst_aws_batch_service_role
  private_subnets                   = module.create_in_vpc.private_subnets
  sg_id                             = module.create_in_vpc.security_group_id
  providers = {
    aws.batch_region = aws.in_region
  }
}
module "create_sea_qatalyst_face_reduction_ecr" {
  source       = "./modules/ecr"
  service_name = var.service_names["face_reduction"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.sea_region
  }
}
module "create_sea_qatalyst_fargate_batch" {
  source                            = "./modules/batch"
  STAGE                             = var.STAGE
  DEFAULT_TAGS                      = var.DEFAULT_TAGS
  batch_job_configuration           = var.batch_configurations["qatalyst-face-reduction"]
  qatalyst_aws_iam_instance_profile = module.create_iam.qatalyst_aws_iam_instance_profile
  qatalyst_aws_batch_service_role   = module.create_iam.qatalyst_aws_batch_service_role
  private_subnets                   = module.create_sea_vpc.private_subnets
  sg_id                             = module.create_sea_vpc.security_group_id
  providers = {
    aws.batch_region = aws.sea_region
  }
}

module "create_eu_qatalyst_face_reduction_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  service_name = var.service_names["face_reduction"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.eu_region
  }
}
module "create_eu_qatalyst_fargate_batch" {
  source                            = "./modules/batch"
  STAGE                             = var.STAGE
  count                             = contains(["dev"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS                      = var.DEFAULT_TAGS
  batch_job_configuration           = var.batch_configurations["qatalyst-face-reduction"]
  qatalyst_aws_iam_instance_profile = module.create_iam.qatalyst_aws_iam_instance_profile
  qatalyst_aws_batch_service_role   = module.create_iam.qatalyst_aws_batch_service_role
  private_subnets                   = module.create_eu_vpc[0].private_subnets
  sg_id                             = module.create_eu_vpc[0].security_group_id
  providers = {
    aws.batch_region = aws.eu_region
  }
}

module "create_us_qatalyst_face_reduction_ecr" {
  source       = "./modules/ecr"
  count        = contains(["dev"], var.STAGE) ? 0 : 1
  service_name = var.service_names["face_reduction"]
  DEFAULT_TAGS = var.DEFAULT_TAGS
  STAGE        = var.STAGE

  providers = {
    aws.ecr_region = aws.us_region
  }
}

module "create_us_qatalyst_fargate_batch" {
  source                            = "./modules/batch"
  STAGE                             = var.STAGE
  count                             = contains(["dev"], var.STAGE) ? 0 : 1
  DEFAULT_TAGS                      = var.DEFAULT_TAGS
  batch_job_configuration           = var.batch_configurations["qatalyst-face-reduction"]
  qatalyst_aws_iam_instance_profile = module.create_iam.qatalyst_aws_iam_instance_profile
  qatalyst_aws_batch_service_role   = module.create_iam.qatalyst_aws_batch_service_role
  private_subnets                   = module.create_us_vpc[0].private_subnets
  sg_id                             = module.create_us_vpc[0].security_group_id
  providers = {
    aws.batch_region = aws.us_region
  }
}
