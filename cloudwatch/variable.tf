
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

variable "ecs_task_execution_role_arn" {
  type        = string
  description = "ECS Task Execution Role Arn"
}

variable "ecs_task_role_arn" {
  type        = string
  description = "ECS Task Role Arn"
}

variable "cognito_user_pool_id" {
  type        = string
  description = "cognito user pool id"
}

variable "qatalyst_domain" {
  type        = string
  description = "Qatalyst Domain"
}

variable "cw_logs_retention_in_days" {
  type        = string
  description = "CloudWatch Logs Retention Period in Days"
}

variable "fe_tester_view_domain_name" {
  type        = string
  description = "FE test view domain name"
}

variable "qatalyst_ecs_autoscale_role_arn" {
  type        = string
  description = "Qatalyst ECS AutoScale Arn"
}
