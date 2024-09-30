
variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "ecs_service_name" {
  type        = string
  description = " ecs service name"
}

variable "fargate_cpu_memory" {
  type        = map(any)
  description = "Fargate CPU and Memory Details"
}

variable "alb_target_group_arn" {
  type        = string
  description = "ALB Target Group Arn"
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

variable "ecs_cluster_id" {
  type        = string
  description = "ECS Cluster ID"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster name"
}

variable "ecs_security_groups" {
  type        = list(any)
  description = "ECS Security Groups List"
}

variable "service_environment_variables" {
  type        = list(any)
  description = "ECS Service Environment Variables"
}

variable "service_environment_secrets" {
  type        = list(any)
  description = "ECS Service Environment Secrets"
}

variable "repo_name" {
  type        = string
  description = "Repo name suffix"
}

variable "service" {
  type        = string
  description = "name of the services"
}

variable "efs_file_system_id" {
  type        = string
  default     = ""
  description = "EFS arn"
}

variable "efs_access_point_id" {
  type        = string
  default     = ""
  description = "EFS access point arn"
}

variable "efs_configuration" {
  type        = any
  description = "EFS Configurations"
  default     = null
}

variable "logs_retention_in_days" {
  type        = string
  description = "CloudWatch Logs Retention Period in Days"
}