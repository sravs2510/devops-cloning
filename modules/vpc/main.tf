terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.vpc_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.vpc_region
}

data "aws_availability_zones" "available" {
  provider = aws.vpc_region
}

resource "aws_vpc" "main" {
  provider   = aws.vpc_region
  cidr_block = lookup(var.cidr_block, data.aws_region.current.name)
  tags       = merge(tomap({ "Name" : "qatalyst-vpc" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_internet_gateway" "vpc_gateway" {
  provider = aws.vpc_region
  vpc_id   = aws_vpc.main.id
  tags     = merge(tomap({ "Name" : "qatalyst-igw" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_route_table" "main_routetable" {
  provider = aws.vpc_region
  vpc_id   = aws_vpc.main.id
  tags     = merge(tomap({ "Name" : "qatalyst-main-rt" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_main_route_table_association" "route_table_association" {
  provider = aws.vpc_region

  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.main_routetable.id
}

resource "aws_subnet" "public_subnet" {
  count             = length(lookup(var.public_subnets, data.aws_region.current.name))
  provider          = aws.vpc_region
  vpc_id            = aws_vpc.main.id
  cidr_block        = lookup(var.public_subnets, data.aws_region.current.name)[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags              = merge(tomap({ "Name" : "qatalyst-public-${count.index + 1}" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_route_table" "public_route_table" {
  vpc_id   = aws_vpc.main.id
  provider = aws.vpc_region
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_gateway.id
  }
  tags = merge(tomap({ "Name" : "qatalyst-public-rt" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_route_table_association" "public" {
  count          = length(lookup(var.public_subnets, data.aws_region.current.name))
  provider       = aws.vpc_region
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "private_subnet" {
  count             = length(lookup(var.private_subnets, data.aws_region.current.name))
  provider          = aws.vpc_region
  vpc_id            = aws_vpc.main.id
  cidr_block        = lookup(var.private_subnets, data.aws_region.current.name)[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags              = merge(tomap({ "Name" : "qatalyst-private-${count.index + 1}" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_eip" "eip_nat_gateway" {
  provider         = aws.vpc_region
  public_ipv4_pool = "amazon"
  tags             = merge(tomap({ "Name" : "qatalyst-nat-eip" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_nat_gateway" "nat_gateway" {
  provider      = aws.vpc_region
  allocation_id = aws_eip.eip_nat_gateway.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags          = merge(tomap({ "Name" : "qatalyst-nat-gw" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
  depends_on    = [aws_internet_gateway.vpc_gateway, aws_eip.eip_nat_gateway]
}

resource "aws_route_table" "private_route_table" {
  vpc_id   = aws_vpc.main.id
  provider = aws.vpc_region
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(tomap({ "Name" : "qatalyst-private-rt" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_route_table_association" "private" {
  count          = length(lookup(var.private_subnets, data.aws_region.current.name))
  provider       = aws.vpc_region
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  provider          = aws.vpc_region
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private_route_table.id]
  tags              = merge(tomap({ "Name" : "qatalyst-ddb-gateway-endpoint" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  provider          = aws.vpc_region
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private_route_table.id]
  tags              = merge(tomap({ "Name" : "qatalyst-s3-gateway-endpoint" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_vpc_endpoint" "efs_endpoint" {
  provider           = aws.vpc_region
  vpc_id             = aws_vpc.main.id
  service_name       = "com.amazonaws.${data.aws_region.current.name}.elasticfilesystem"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = toset([for subnet in aws_subnet.private_subnet : subnet.id])
  security_group_ids = [aws_security_group.cyborg_security_group.id]

  tags = merge(tomap({ "Name" : "qatalyst-cyborg-efs-gateway-endpoint" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
resource "aws_security_group" "cyborg_security_group" {
  provider    = aws.vpc_region
  name        = "qatalyst-cyborg-ecs-sg"
  description = "cyborg Group for Lambda to Deploy in VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "EFS Mount"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound All Traffic"
  }

  tags = merge(tomap({ "Name" : "qatalyst-cyborg-ecs-sg" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}