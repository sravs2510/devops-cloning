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
  qatalyst_sender_email                          = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
  qatalyst_cyborg_service_name                   = "qatalyst-cyborg-service"
  qatalyst_furyblade_service_name                = "qatalyst-furyblade-service"
  qatalyst_prototype_service_name                = "qatalyst-prototype-service"
  qatalyst_furyblade_secrets                     = []
  fargate_cpu_memory                             = var.STAGE == "qa" ? var.fargate_cpu_memory_qa_eu : var.fargate_cpu_memory
  account_id                                     = data.aws_caller_identity.current.account_id
  qatalyst_ecs_task_environment_variables = [
    {
      name  = "COGNITO_USER_POOL_ID"
      value = module.create_cognito_user_pool.user_pool_id
    },
    {
      name  = "STAGE"
      value = var.STAGE
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
  qatalyst_cyborg_ecs_task_environment_variables = [
    {
      name  = "STAGE"
      value = var.STAGE
    },
    {
      name  = "LOG_LEVEL"
      value = "INFO"
    },
    {
      name  = "AWS_ACCOUNT_ID"
      value = local.account_id
    }
  ]
  qatalyst_furyblade_ecs_task_environment_variables = [
    {
      name  = "STAGE"
      value = var.STAGE
    },
    {
      name  = "LOG_LEVEL"
      value = "INFO"
    },
    {
      name  = "AWS_ACCOUNT_ID"
      value = local.account_id
    }
  ]
  qatalyst_prototype_ecs_task_environment_variables = [
    {
      name  = "STAGE"
      value = var.STAGE
    },
    {
      name  = "LOG_LEVEL"
      value = "INFO"
    },
    {
      name  = "AWS_ACCOUNT_ID"
      value = local.account_id
    },
    {
      name  = "WEB_CONCURRENCY"
      value = var.uvicorn_workers_count
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
      name      = "SENTRY_SDK_DSN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "sentry-dsn-value"])
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
      name      = "FIGMA_ACCESS_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "figma-access-token"])
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
    }
  ]
  qatalyst_datadog_environment_secrets = [
    {
      name      = "DD_API_KEY",
      valueFrom = join("-", ["datadog", var.STAGE, "api-key"])
    }
  ]
}