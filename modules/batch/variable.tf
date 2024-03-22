variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "security_group_id" {
  type        = string
  description = "Id of the Security Group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Id of the private subnet 1 and 2"
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

variable "batch_iam_instance_profile" {
  type        = string
  description = "EC2 Instance Profile Role ARN"
}

variable "datacenter_codes" {
  type        = map(any)
  description = "Datacenter Codes"
}

variable "batch_job_configuration" {
  type        = any
  description = "Batch Jobs Configuration"
}

variable "file_system_id" {
  type        = string
  description = "EFS File System ID"
}

variable "access_point_id" {
  type        = string
  description = "EFS Access Point ID"
}