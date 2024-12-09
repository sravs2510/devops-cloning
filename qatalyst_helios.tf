module "create_eu_batch_helios" {
  source                          = "git@github.com:EntropikTechnologies/terraform-modules.git//batch"
  count                           = lookup(var.deploy_regions, data.aws_region.eu.name) ? 1 : 0
  private_subnets                 = module.create_eu_vpc[0].private_subnets
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE
  sg_id                           = module.create_eu_vpc[0].security_group_id
  batch_service_role              = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role                  = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role            = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes                = var.datacenter_codes
  batch_job_configuration         = var.batch_configurations["helios"]
  container_environment_variables = concat(local.helios_batch_environment_variables, 
                                    [{
                                      name  = "REGION_NAME"
                                      value = data.aws_region.eu.name
                                    },
                                    {
                                      name  = "DATACENTER_CODE"
                                      value = lookup(var.datacenter_codes, data.aws_region.eu.name)
                                    }])
  batch_compute_name              = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-compute"])
  batch_job_queue_name            = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-queue"])
  batch_job_definition_name       = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-definition"])
  providers = {
    aws.batch_region = aws.eu_region
  }
}

module "create_in_batch_helios" {
  source                          = "git@github.com:EntropikTechnologies/terraform-modules.git//batch"
  count                           = lookup(var.deploy_regions, data.aws_region.in.name) ? 1 : 0
  private_subnets                 = module.create_in_vpc[0].private_subnets
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE
  sg_id                           = module.create_in_vpc[0].security_group_id
  batch_service_role              = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role                  = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role            = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes                = var.datacenter_codes
  batch_job_configuration         = var.batch_configurations["helios"]
  container_environment_variables = concat(local.helios_batch_environment_variables, 
                                    [{
                                      name  = "REGION_NAME"
                                      value = data.aws_region.in.name
                                    },
                                    {
                                      name  = "DATACENTER_CODE"
                                      value = lookup(var.datacenter_codes, data.aws_region.in.name)
                                    }])
  batch_compute_name              = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-compute"])
  batch_job_queue_name            = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-queue"])
  batch_job_definition_name       = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-definition"])

  providers = {
    aws.batch_region = aws.in_region
  }
}

module "create_sea_batch_helios" {
  source                          = "git@github.com:EntropikTechnologies/terraform-modules.git//batch"
  count                           = lookup(var.deploy_regions, data.aws_region.sea.name) ? 1 : 0
  private_subnets                 = module.create_sea_vpc[0].private_subnets
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE
  sg_id                           = module.create_sea_vpc[0].security_group_id
  batch_service_role              = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role                  = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role            = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes                = var.datacenter_codes
  batch_job_configuration         = var.batch_configurations["helios"]
  container_environment_variables = concat(local.helios_batch_environment_variables, 
                                    [{
                                      name  = "REGION_NAME"
                                      value = data.aws_region.sea.name
                                    },
                                    {
                                      name  = "DATACENTER_CODE"
                                      value = lookup(var.datacenter_codes, data.aws_region.sea.name)
                                    }])
  batch_compute_name              = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-compute"])
  batch_job_queue_name            = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-queue"])
  batch_job_definition_name       = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-definition"])
  providers = {
    aws.batch_region = aws.sea_region
  }
}

module "create_us_batch_helios" {
  source                          = "git@github.com:EntropikTechnologies/terraform-modules.git//batch"
  count                           = lookup(var.deploy_regions, data.aws_region.us.name) ? 1 : 0
  private_subnets                 = module.create_us_vpc[0].private_subnets
  DEFAULT_TAGS                    = var.DEFAULT_TAGS
  STAGE                           = var.STAGE
  sg_id                           = module.create_us_vpc[0].security_group_id
  batch_service_role              = module.create_iam.qatalyst_batch_service_role_arn
  batch_job_role                  = module.create_iam.qatalyst_ecs_task_role_arn
  batch_execution_role            = module.create_iam.qatalyst_ecs_task_execution_role_arn
  datacenter_codes                = var.datacenter_codes
  batch_job_configuration         = var.batch_configurations["helios"]
  container_environment_variables = concat(local.helios_batch_environment_variables, 
                                    [{
                                      name  = "REGION_NAME"
                                      value = data.aws_region.us.name
                                    },
                                    {
                                      name  = "DATACENTER_CODE"
                                      value = lookup(var.datacenter_codes, data.aws_region.us.name)
                                    }])
  batch_compute_name              = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-compute"])
  batch_job_queue_name            = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-queue"])
  batch_job_definition_name       = join("-", ["qatalyst", var.batch_configurations["helios"].service_name, "batch-job-definition"])
  providers = {
    aws.batch_region = aws.us_region
  }
}