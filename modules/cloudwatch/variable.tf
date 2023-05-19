
variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "alb_arn_suffix" {
  type        = string
  description = "ALB Arn Suffix"
}

variable "tg_arn_suffix" {
  type        = string
  description = "TG Arn Suffix"
}

variable "ecs_service_name" {
  type        = string
  description = "ECS service name"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS cluster name"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "dashboard_name" {
  type        = string
  description = "Name of the Cloudwatch Dashboard"
}