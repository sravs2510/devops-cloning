data "aws_caller_identity" "current" {
  provider = aws.in_region
}

locals {
  dasboard_domain                                = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  tester_view_domain                             = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
  qatalyst_ecs_cluster_name                      = "qatalyst-ecs-cluster"
  qatalyst_dashboard_service_name                = "qatalyst-dashboard-service"
  qatalyst_reports_service_name                  = "qatalyst-reports-service"
  qatalyst_tester_view_service_name              = "qatalyst-tester-view-service"
  qatalyst_cloudwatch_dashboard_name_dashboard   = "Qatalyst-Dashboard"
  qatalyst_cloudwatch_dashboard_name_reports     = "Qatalyst-Reports"
  qatalyst_cloudwatch_dashboard_name_tester_view = "Qatalyst-Tester-View"
  qatalyst_cloudwatch_dashboard_name_prototype   = "Qatalyst-Prototype"
  qatalyst_cloudwatch_dashboard_name_copilot     = "Qatalyst-copilot"
  qatalyst_cloudwatch_dashboard_name_cyborg      = "Qatalyst-cyborg"
  qatalyst_cloudwatch_dashboard_name_furyblade   = "Qatalyst-furyblade"
  qatalyst_cloudwatch_dashboard_name_mammoth     = "Qatalyst-mammoth"
  qatalyst_cloudwatch_dashboard_name_helios      = "Qatalyst-helios"
  qatalyst_sender_email                          = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
  qatalyst_cyborg_service_name                   = "qatalyst-cyborg-service"
  qatalyst_furyblade_service_name                = "qatalyst-furyblade-service"
  qatalyst_prototype_service_name                = "qatalyst-prototype-service"
  qatalyst_mammoth_service_name                  = "qatalyst-mammoth-service"
  qatalyst_copilot_service_name                  = "qatalyst-copilot-service"
  qatalyst_helios_service_name                   = "qatalyst-helios-service"
  fargate_cpu_memory                             = var.STAGE == "qa" ? var.fargate_cpu_memory_qa_eu : var.fargate_cpu_memory
  account_id                                     = data.aws_caller_identity.current.account_id
  qatalyst_healthcheck_api                       = "GET /health,GET */health"
  qatalyst_batch_job_definition                  = "qatalyst-helios-job-definition"
  qatalyst_batch_compute                         = "qatalyst-helios-batch-compute"
  qatalyst_batch_job_queue                       = "qatalyst-helios-batch-job-queue"
  qatalyst_ecs_task_environment_variables = [
    {
      name  = "COGNITO_USER_POOL_ID"
      value = module.create_cognito_user_pool.user_pool_id
    },
    {
      name  = "LOCAL_RUN"
      value = "false"
    },
    {
      name  = "QATALYST_DOMAIN"
      value = local.dasboard_domain
    },
    {
      name  = "FE_TESTER_VIEW_DOMAIN_NAME"
      value = local.tester_view_domain
    },
    {
      name  = "WEB_CONCURRENCY"
      value = var.uvicorn_workers_count
    },
    {
      name  = "QATALYST_SENDER_EMAIL"
      value = local.qatalyst_sender_email
    },
    {
      name  = "OPENSEARCH_VERIFY_CERTS"
      value = "true"
    }
  ]
  qatalyst_cyborg_ecs_task_environment_variables = []
  qatalyst_furyblade_ecs_task_environment_variables = [
    {
      name  = "EVENT_BRIDGE_SCHEDULER_ROLE_ARN"
      value = module.create_iam.event_bridge_scheduler_role_arn
    }
  ]
  qatalyst_mammoth_ecs_task_environment_variables = [
    {
      name  = "COGNITO_USER_POOL_ID"
      value = module.create_cognito_user_pool.user_pool_id
    },
    {
      name  = "LOCAL_RUN"
      value = "false"
    },
    {
      name  = "QATALYST_DOMAIN"
      value = local.dasboard_domain
    },
    {
      name  = "FE_TESTER_VIEW_DOMAIN_NAME"
      value = local.tester_view_domain
    },
    {
      name  = "WEB_CONCURRENCY"
      value = var.uvicorn_workers_count
    },
    {
      name  = "QATALYST_SENDER_EMAIL"
      value = local.qatalyst_sender_email
    }
  ]
  qatalyst_ecs_task_environment_secrets = [
    {
      name      = "BITLY_BEARER"
      valueFrom = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
    },
    {
      name      = "FIGMA_ACCESS_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
    },
    {
      name      = "SENDGRID_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
    },
    {
      name      = "FINGERPRINT_API_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "fingerprint-token"])
    },
    {
      name      = "FEATURE_FLAG_AUTH"
      valueFrom = join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])
    },
    {
      name      = "100MS_ACCESS_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "100ms-access-key"])
    },
    {
      name      = "100MS_SECRET_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "100ms-secret-key"])
    },
    {
      name      = "PLATFORM_REALM_ID"
      valueFrom = join("-", ["platform", var.STAGE, "realm-id"])
    },
    {
      name      = "STRIPE_API_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "stripe-api-key"])
    },
    {
      name      = "STRIPE_WEBHOOK_SECRET"
      valueFrom = join("-", ["qatalyst", var.STAGE, "stripe-webhook-secret"])
    },
    {
      name      = "OPENSEARCH_DOMAIN"
      valueFrom = "qatalyst-dashboard-opensearch-endpoint"
    },
    {
      name      = "OPENAI_API_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "open-ai-key"])
    },
    {
      name      = "LUCID_SHA1_KEY"
      valueFrom = join("-", ["qatalyst", "lucid", "sha1", "key"])
    }
  ]
  qatalyst_cyborg_ecs_task_environment_secrets = [

    {
      name      = "100MS_ACCESS_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "100ms-access-key"])
    },
    {
      name      = "100MS_SECRET_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "100ms-secret-key"])
    },
    {
      name      = "PLATFORM_REALM_ID"
      valueFrom = join("-", ["platform", var.STAGE, "realm-id"])
    }
  ]

  qatalyst_prototype_ecs_task_environment_secrets = [
    {
      name      = "BITLY_BEARER"
      valueFrom = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
    },
    {
      name      = "FIGMA_ACCESS_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
    },
    {
      name      = "SENDGRID_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
    },
    {
      name      = "FINGERPRINT_API_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "fingerprint-token"])
    },
    {
      name      = "FEATURE_FLAG_AUTH"
      valueFrom = join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])
    },
    {
      name      = "100MS_ACCESS_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "100ms-access-key"])
    },
    {
      name      = "100MS_SECRET_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "100ms-secret-key"])
    },
    {
      name      = "PLATFORM_REALM_ID"
      valueFrom = join("-", ["platform", var.STAGE, "realm-id"])
    },
    {
      name      = "STRIPE_API_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "stripe-api-key"])
    },
    {
      name      = "STRIPE_WEBHOOK_SECRET"
      valueFrom = join("-", ["qatalyst", var.STAGE, "stripe-webhook-secret"])
    }
  ]
  qatalyst_furyblade_ecs_task_environment_secrets = [
    {
      name      = "GOOGLE_AUTHENTICATION_DATA"
      valueFrom = "GOOGLE_AUTHENTICATION_DATA"
    },
    {
      name      = "OPENAI_API_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "open-ai-key"])
    }
  ]

  qatalyst_mammoth_ecs_task_environment_secrets = [
    {
      name      = "BITLY_BEARER"
      valueFrom = join("-", ["qatalyst", var.STAGE, "bitly-bearer-token"])
    },
    {
      name      = "FIGMA_ACCESS_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
    },
    {
      name      = "SENDGRID_KEY"
      valueFrom = join("-", ["qatalyst", var.STAGE, "sendgrid-key"])
    },
    {
      name      = "FINGERPRINT_API_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "fingerprint-token"])
    },
    {
      name      = "FEATURE_FLAG_AUTH"
      valueFrom = join("-", ["qatalyst", var.STAGE, "feature-flag-auth"])
    },
    {
      name      = "PLATFORM_REALM_ID"
      valueFrom = join("-", ["platform", var.STAGE, "realm-id"])
    }
  ]
  qatalyst_datadog_environment_variables = [
    {
      name  = "DD_APM_ENABLED",
      value = "true"
    },
    {
      name  = "ECS_FARGATE",
      value = "true"
    },
    {
      name  = "DD_LOGS_INJECTION",
      value = "true"
    },
    {
      name  = "DD_ENV",
      value = var.STAGE
    },
    {
      name  = "DD_TRACE_TELEMETRY_ENABLED",
      value = "false"
    },
    {
      name  = "DD_APM_IGNORE_RESOURCES"
      value = local.qatalyst_healthcheck_api
    }
  ]

  qatalyst_datadog_environment_secrets = [
    {
      name      = "DD_API_KEY",
      valueFrom = join("-", ["datadog", var.STAGE, "api-key"])
    }
  ]

  # Append EU if not null
  eu_dns_names = try(module.create_eu_alb[0].qatalyst_alb_dns_name, null) != null ? { "eu" = try(module.create_eu_alb[0].qatalyst_alb_dns_name, null) } : {}
  eu_in_sea_dns_names = merge({
    "in"  = module.create_in_alb.qatalyst_alb_dns_name
    "sea" = module.create_sea_alb.qatalyst_alb_dns_name
  }, local.eu_dns_names)
  # Append US if not null
  alb_dns_names = try(module.create_us_alb[0].qatalyst_alb_dns_name, null) != null ? merge(local.eu_in_sea_dns_names, { "us" = try(module.create_us_alb[0].qatalyst_alb_dns_name, null) }) : local.eu_in_sea_dns_names
}
