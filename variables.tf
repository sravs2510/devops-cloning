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

variable "reports_sub_domain" {
  type        = string
  description = "Reports Domain Name"
}

variable "common_sub_domain" {
  type        = string
  description = "Common Domain Name"
}

variable "user_pool_name" {
  type        = string
  description = "Cognito user pool name"
}

variable "user_pool_web_client_name" {
  type        = string
  description = "Cognito web app client name"
}

variable "global_table_details" {
  type        = any
  description = "DDB Global Tables details"
}

variable "fargate_cpu_memory" {
  type        = map(any)
  description = "Fargate CPU and Memory Details"
}

variable "fargate_cpu_memory_qa_eu" {
  type        = map(any)
  description = "Fargate CPU and Memory Details for qa,eu region"
}

variable "cw_logs_retention_in_days" {
  type        = string
  description = "CloudWatch Logs Retention Period in Days"
}

variable "table_details" {
  type        = any
  description = "DDB Tables details"
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

variable "datadog_docker_image" {
  type        = string
  description = "Datadog Docker Image"
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

variable "service_names" {
  type        = map(string)
  description = "Map of service names"
}

variable "efs_configurations" {
  type        = any
  description = "EFS Configurations for all the services"
}


variable "qatalyst_media_bucket_transfer_acceleration" {
  type        = string
  description = "Bucket name for qatalyst media with transfer acceleration "
}

variable "open_ai_api" {
  type        = map(string)
  description = "Openai keys"
}

variable "batch_configurations" {
  type = map(object({
    name            = string
    instance_types  = optional(list(string))
    max_vcpus       = number
    min_vcpus       = number
    type            = string
    required_vcpus  = string
    required_memory = string
    required_gpu    = optional(number)
    image           = string
    command         = optional(list(string))

  }))
  description = "Batch Jobs Configuration"
  validation {
    condition = alltrue(
      [
        for config in values(var.batch_configurations) : contains(["EC2", "FARGATE"], config.type)
      ]
    )
    error_message = "type must be one of EC2 or FARGATE"
  }
}