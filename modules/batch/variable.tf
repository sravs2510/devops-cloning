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

variable "qatalyst_aws_iam_instance_profile" {
  type        = string
  description = "qatalyst ECS Instance Role ARN"
}

variable "qatalyst_aws_batch_service_role" {
  type        = string
  description = "qatalyst AWS Batch Service Role"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private Subnets for Mount target"
}

variable "sg_id" {
  type        = string
  description = "security group id"
}