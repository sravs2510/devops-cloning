
variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "alb_security_group" {
  type        = string
  description = "ALB Security Group"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster Name"

}