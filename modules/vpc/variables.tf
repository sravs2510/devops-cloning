variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "cidr_block" {
  type        = map(string)
  description = "CIDR Block for vpc"
}

variable "public_subnets" {
  type        = map(list(string))
  description = "List of public subnet cidrs"
}

variable "private_subnets" {
  type        = map(list(string))
  description = "List of private subnet cidrs"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}