variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private Subnets for SSM parameters"
}

variable "opensearch_config" {
  type        = map(any)
  description = "Opensearch domain configurations"
}
