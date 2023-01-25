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

variable "global_ddb_table_details" {
  type = list
  description = "DDB Global Tables details"
}

variable "global_ddb_tables_without_range" {
  type = list
  description = "DDB Global Tables details without range key"
}