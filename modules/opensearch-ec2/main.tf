terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.os_region]
    }
  }
}

locals {
  prefix_name = join("-", ["qatalyst", "opensearch", var.STAGE, var.datacenter_code, ])
}

data "aws_region" "current" {
  provider = aws.os_region
}

data "aws_ami" "ubuntu_2024_ami" {
  provider    = aws.os_region
  most_recent = true
  filter {
    name   = "image-id"
    values = [var.ami_id]
  }
  filter {
    name   = "name"
    values = ["ubuntu*24.04*"] # Ubuntu 24.04 LTS
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_network_interface" "network_interface" {
  provider        = aws.os_region
  subnet_id       = var.subnet_ids[0]
  security_groups = [aws_security_group.security_group.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "aws_instance" {
  provider = aws.os_region
  credit_specification {
    cpu_credits = "standard"
  }

  ami                                  = data.aws_ami.ubuntu_2024_ami.id
  disable_api_termination              = true
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  key_name                             = join("-", ["qatalyst", var.STAGE, var.datacenter_code])

  network_interface {
    network_interface_id = aws_network_interface.network_interface.id
    device_index         = 0
  }

  root_block_device {
    volume_size           = var.volume_size #GB
    volume_type           = "gp3"
    delete_on_termination = "true"
    encrypted             = "true"
  }
  user_data = filebase64("${path.module}/opensearch.sh")
  tags      = merge(tomap({ "Name" : local.prefix_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_security_group" "security_group" {
  provider    = aws.os_region
  name        = join("-", [local.prefix_name, "sg"])
  description = "Opensearch EC2 Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description = "OpenSearch Port"
    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"] #Private IP
  }

  ingress {
    description = "OpenSearch Dashboard Port"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"] #Private IP
  }

  egress {
    description = "All Traffic Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(tomap({ "Name" : join("-", [local.prefix_name, "sg"]) }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
