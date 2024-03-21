variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}
variable "batch_job_configuration" {
  type        = any
  description = "Batch Jobs Configuration"
}

variable "batch_service_role" {
  type        = string
  description = "Arn for batch service"
}

variable "batch_job_role" {
  type        = string
  description = "Arn for job role for container"
}

variable "batch_execution_role" {
  type        = string
  description = "Arn for job role for container"
}

variable "datacenter_codes" {
  type        = map(any)
  description = "Datacenter Codes"
}

variable "batch_compute" {
  type        = string
  description = "Arn for job role for container"
}

variable "batch_job_queue" {
  type        = string
  description = "Arn for job role for container"
}

variable "batch_job_definition" {
  type        = string
  description = "Arn for job role for container"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private Subnets for Mount target"
}

variable "sg_id" {
  type        = string
  description = "security group id"
}