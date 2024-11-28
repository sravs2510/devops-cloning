STAGE                      = "prod"
cw_logs_retention_in_days  = 90
object_expiration_duration = 18250 #50 Years
dashboard_acm_arn          = "arn:aws:acm:us-east-1:726303662212:certificate/3b7a1243-a088-4ef3-ab9b-3cf86956adcd"

fargate_service_configurations = {
  "default" = {
    cpu    = 2048
    memory = 4096
  }
  "copilot" = {
    cpu    = 1024
    memory = 3072
  }
  "reports" = {
    cpu    = 1024
    memory = 3072
  }
  "mammoth" = {
    cpu    = 2048
    memory = 4096
  }
  "dashboard" = {
    cpu    = 2048
    memory = 4096
  }
}
opensearch_config = {
  domain_name             = "qatalyst-dashboard"
  instance_type           = "t3.medium.search"
  instance_count          = 2
  availability_zone_count = 2
  ebs_volume_size         = 50
  engine_version          = "OpenSearch_2.11"
}
