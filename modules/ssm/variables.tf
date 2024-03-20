variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "open_ai_api" {
  type        = map(string)
  description = "Openai keys"
}

variable "opensearch_host" {
  type        = string
  description = "Qatalyst opensearch host"
}

variable "qatalyst_study_details_ddb_stream_arn" {
  type = string
}

variable "qatalyst_lambda_sg_id" {
  type        = string
  description = "security group id for ssm"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private Subnets for SSM parameters"
}
