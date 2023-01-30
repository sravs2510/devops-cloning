variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "alb_subnets" {
  type        = list(string)
  description = "List of public subnets for ALB"
}

variable "alb_certficate_arn" {
  type        = string
  description = "ALB Certficate ARN"
}