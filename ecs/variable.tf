
variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "fargate_cpu_memory" {
  type        = map(any)
  description = "Fargate CPU and Memory Details"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "alb_security_group" {
  type        = string
  description = "ALB Security Group"
}

variable "alb_target_group_arn" {
  type        = string
  description = "ALB Security Group"
}

variable "ecs_subnets" {
  type        = list(string)
  description = "Private Subnets for ECS Service"

}