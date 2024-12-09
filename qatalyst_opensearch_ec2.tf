module "create_opensearch_eu_ec2" {
  source          = "./modules/opensearch-ec2"
  count           = lookup(var.deploy_regions, data.aws_region.eu.name) && var.STAGE != "prod" ? 1 : 0
  instance_type   = "t3.large"
  volume_size     = 50
  subnet_ids      = module.create_eu_vpc[0].private_subnets
  vpc_id          = module.create_eu_vpc[0].vpc_id
  STAGE           = var.STAGE
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.eu.name)

  providers = {
    aws.os_region = aws.eu_region
  }
}

module "create_opensearch_in_ec2" {
  source          = "./modules/opensearch-ec2"
  count           = lookup(var.deploy_regions, data.aws_region.in.name) && var.STAGE != "prod" ? 1 : 0
  instance_type   = "t3.large"
  volume_size     = 50
  subnet_ids      = module.create_in_vpc[0].private_subnets
  vpc_id          = module.create_in_vpc[0].vpc_id
  STAGE           = var.STAGE
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.in.name)

  providers = {
    aws.os_region = aws.in_region
  }
}

module "create_opensearch_sea_ec2" {
  source          = "./modules/opensearch-ec2"
  count           = lookup(var.deploy_regions, data.aws_region.sea.name) && var.STAGE != "prod" ? 1 : 0
  instance_type   = "t3.large"
  volume_size     = 50
  subnet_ids      = module.create_sea_vpc[0].private_subnets
  vpc_id          = module.create_sea_vpc[0].vpc_id
  STAGE           = var.STAGE
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.sea.name)

  providers = {
    aws.os_region = aws.sea_region
  }
}

module "create_opensearch_us_ec2" {
  source          = "./modules/opensearch-ec2"
  count           = lookup(var.deploy_regions, data.aws_region.us.name) && var.STAGE != "prod" ? 1 : 0
  instance_type   = "t3.large"
  volume_size     = 50
  subnet_ids      = module.create_us_vpc[0].private_subnets
  vpc_id          = module.create_us_vpc[0].vpc_id
  STAGE           = var.STAGE
  DEFAULT_TAGS    = var.DEFAULT_TAGS
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.us.name)

  providers = {
    aws.os_region = aws.us_region
  }
}