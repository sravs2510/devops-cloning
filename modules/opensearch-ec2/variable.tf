variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "volume_size" {
  type        = number
  description = "EC2 Instance volume size in GB"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of Subnet Ids to lauch the intances"
}

variable "vpc_id" {
  type        = string
  description = "VPC Id"
}

variable "datacenter_code" {
  type        = string
  description = "Data Center code"
}

variable "ami_id" {
  type        = string
  description = "AMI ID"
}
