data "aws_caller_identity" "current" {
  provider = aws.in_region
}

data "aws_region" "current"{
  provider = aws.batch_region
}

locals {
  dasboard_domain                   = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  tester_view_domain                = var.STAGE == "prod" ? join(".", [var.tester_view_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.tester_view_sub_domain, var.base_domain])
  calendar_domain                   = var.STAGE == "prod" ? join(".", [var.calendar_sub_domain, var.base_domain]) : join(".", [var.STAGE, var.calendar_sub_domain, var.base_domain])
  qatalyst_ecs_cluster_name         = "qatalyst-ecs-cluster"
  qatalyst_dashboard_service_name   = "qatalyst-dashboard-service"
  qatalyst_reports_service_name     = "qatalyst-reports-service"
  qatalyst_tester_view_service_name = "qatalyst-tester-view-service"
  qatalyst_sender_email             = var.STAGE == "prod" ? join("", ["noreply@", var.base_domain]) : join("", ["noreply@", var.STAGE, ".", var.base_domain])
  qatalyst_cyborg_service_name      = "qatalyst-cyborg-service"
  qatalyst_furyblade_service_name   = "qatalyst-furyblade-service"
  qatalyst_prototype_service_name   = "qatalyst-prototype-service"
  qatalyst_mammoth_service_name     = "qatalyst-mammoth-service"
  qatalyst_copilot_service_name     = "qatalyst-copilot-service"
  qatalyst_helios_service_name      = "qatalyst-helios-service"
  account_id                        = data.aws_caller_identity.current.account_id
  qatalyst_healthcheck_api          = "GET /health,GET */health"
  qatalyst_batch_job_definition     = "qatalyst-helios-job-definition"
  qatalyst_batch_compute            = "qatalyst-helios-batch-compute"
  qatalyst_batch_job_queue          = "qatalyst-helios-batch-job-queue"
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
    },
    {
      name      = "QATALYST_G2_API_TOKEN"
      valueFrom = join("-", ["qatalyst", var.STAGE, "g2-api-token"])
    },
    {
      name      = "QATALYST_G2_PRODUCT_ID"
      valueFrom = join("-", ["qatalyst", var.STAGE, "g2-product-id"])
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
      valueFrom = join("-", ["qatalyst", var.STAGE, "google-credentials"])
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

  helios_batch_environment_variables = [
      {
        name  = "STAGE"
        value = var.STAGE
      },
      {
        name  = "REGION_NAME",
        value = data.aws_region.current.name
      },
      {
        name  = "DATACENTER_CODE",
        value = lookup(var.datacenter_codes, data.aws_region.current.name)
      },
      {
        name  = "AWS_ACCOUNT_ID",
        value = data.aws_caller_identity.current.account_id
      },
      {
        name  = "LOG_LEVEL"
        value = "INFO"
      },
      {
        name  = "SENTRY_SAMPLE_RATE"
        value = "1"
      },
      {
        name  = "SENTRY_TRACES_SAMPLE_RATE"
        value = "0"
      },
      {
        name  = "SENTRY_PROFILING_SAMPLE_RATE"
        value = "0"
      }
  ]

  eu_alb_dns_name  = lookup(var.deploy_regions, data.aws_region.eu.name) ? { "eu" = try(module.create_eu_alb[0].qatalyst_alb_dns_name, null) } : {}
  us_alb_dns_name  = lookup(var.deploy_regions, data.aws_region.us.name) ? { "us" = try(module.create_us_alb[0].qatalyst_alb_dns_name, null) } : {}
  in_alb_dns_name  = lookup(var.deploy_regions, data.aws_region.in.name) ? { "in" = try(module.create_in_alb[0].qatalyst_alb_dns_name, null) } : {}
  sea_alb_dns_name = lookup(var.deploy_regions, data.aws_region.sea.name) ? { "sea" = try(module.create_sea_alb[0].qatalyst_alb_dns_name, null) } : {}
  alb_dns_names    = merge(local.eu_alb_dns_name, local.us_alb_dns_name, local.in_alb_dns_name, local.sea_alb_dns_name)

  replica_region_in  = lookup(var.deploy_regions, data.aws_region.in.name) ? [data.aws_region.in.name] : []
  replica_region_sea = lookup(var.deploy_regions, data.aws_region.sea.name) ? [data.aws_region.sea.name] : []
  replica_region_eu  = lookup(var.deploy_regions, data.aws_region.eu.name) ? [data.aws_region.eu.name] : []
  replica_regions    = concat(local.replica_region_eu, local.replica_region_in, local.replica_region_sea)

}


