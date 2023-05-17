
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

variable "qatalyst_bitly_token" {
  type        = string
  description = "Qatalyst Bearer Token"
}

variable "qatalyst_sendgrid_key" {
  type        = string
  description = "Qatalyst Sendgrid Key"
}

variable "qatalyst_figma_token" {
  type        = string
  description = "Qatalyst Figma Access Token"
}

variable "uvicorn_workers_count" {
  type        = string
  description = "Uvicorn Workers Count in Container"
}
variable "base_domain" {
  type        = string
  description = "base domain"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog Api Key"
}

variable "datadog_docker_image" {
  type        = string
  description = "Datadog Docker Image"
}

variable "alb_target_group_reports_arn" {
  type        = string
  description = "ALB Reports Security Group"
}

variable "alb_target_group_tester_view_arn" {
  type        = string
  description = "ALB Tester View Security Group"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "qatalyst_dashboard_service_name" {
  type        = string
  description = "Dashboard service"
}

variable "qatalyst_reports_service_name" {
  type        = string
  description = "reports service"
}

variable "qatalyst_tester_view_service_name" {
  type        = string
  description = " tester view service"
}

variable "qatalyst_ecs_cluster_name" {
  type        = string
  description = "ECS Cluster"
}