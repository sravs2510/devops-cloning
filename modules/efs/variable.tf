variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "EFS_CONFIGURATION" {
  type        = any
  description = "EFS Configurations"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private Subnets for Mount target"
}

variable "sg_id" {
  type        = string
  description = "security group id"
}