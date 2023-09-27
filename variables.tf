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

variable "base_domain" {
  type        = string
  description = "Dashboard Domain Name"
}

variable "api_sub_domain" {
  type        = string
  description = "API Domain Name"
}

variable "media_sub_domain" {
  type        = string
  description = "Media Domain Name"
}

variable "tester_view_sub_domain" {
  type        = string
  description = "Tester View Domain Name"
}

variable "meet_sub_domain" {
  type        = string
  description = "Meet Domain Name"
}

variable "invite_sub_domain" {
  type        = string
  description = "Invite Domain Name"
}

variable "user_pool_name" {
  type        = string
  description = "Cognito user pool name"
}

variable "user_pool_web_client_name" {
  type        = string
  description = "Cognito web app client name"
}

variable "global_ddb_table_details" {
  type        = list(any)
  description = "DDB Global Tables details"
}

variable "global_ddb_tables_without_range" {
  type        = list(any)
  description = "DDB Global Tables details without range key"
}

variable "gsi_global_table_details_without_range" {
  type        = any
  description = "List of global ddb tables and properties"
}

variable "fargate_cpu_memory" {
  type        = map(any)
  description = "Fargate CPU and Memory Details"
}

variable "cw_logs_retention_in_days" {
  type        = string
  description = "CloudWatch Logs Retention Period in Days"
}

variable "table_details" {
  type        = any
  description = "DDB Tables details"
}

variable "tables_without_range_key" {
  type        = map(any)
  description = "DDB Tables(without range key) details"
}

variable "gsi_table_details" {
  type        = any
  description = "DDB Tables with GSI details"
}

variable "point_in_time_recovery" {
  type        = bool
  description = "Point in time recovery value"
  default     = false
}

variable "dashboard_acm_arn" {
  type        = string
  description = "Dashboard ACM ARN"
}

variable "object_expiration_duration" {
  type        = string
  description = "Bucket objects expiration in Days"
}

variable "uvicorn_workers_count" {
  type        = string
  description = "Uvicorn Workers Count in Container"
}

variable "common_s3_sub_domain" {
  type        = string
  description = "Sub domain to serve common assets"
}

variable "datadog_docker_image" {
  type        = string
  description = "Datadog Docker Image"
}

variable "reports_s3_sub_domain" {
  type        = string
  description = "Sub domain to serve reports"
}

variable "meet_s3_sub_domain" {
  type        = string
  description = "Sub domain to meet"
}

variable "invite_s3_sub_domain" {
  type        = string
  description = "Sub domain to invite"
}

variable "ecr_repo_name" {
  type        = string
  description = "Repo name suffix"
}

variable "mediaconvert_queues" {
  type        = map(any)
  description = "Mediaconvert Queues"
}

variable "lb_target_health" {
  type        = map(string)
  description = "ALB target health checks"
}

variable "sqs_details" {
  type        = map(any)
  description = "SQS details"
}

variable "cyborg_repo_name" {
  type        = string
  description = "Repo name suffix"
}

variable "cyborg_efs_configurations" {
  type        = any
  description = "EFS Configurations"
}

variable "service_environment_secrets" {
  type        = list(any)
  default     = []
  description = "ECS Service Environment Secrets"
}