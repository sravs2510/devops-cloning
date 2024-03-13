STAGE                      = "prod"
cw_logs_retention_in_days  = 90
point_in_time_recovery     = true
object_expiration_duration = 18250 #50 Years
dashboard_acm_arn          = "arn:aws:acm:us-east-1:726303662212:certificate/3b7a1243-a088-4ef3-ab9b-3cf86956adcd"
fargate_cpu_memory = {
  "cpu" : 2048
  "memory" : 4096
}