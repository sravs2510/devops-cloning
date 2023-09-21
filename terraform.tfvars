DEFAULT_TAGS = {
  CreatedBy = "Terraform"
  Product   = "QATALYST"
}

datacenter_codes = {
  "ap-southeast-1" : "sea"
  "ap-south-1" : "in"
  "us-east-1" : "us"
  "eu-north-1" : "eu"
}

cidr_block = {
  "ap-southeast-1" : "10.12.0.0/16"
  "ap-south-1" : "10.22.0.0/16"
  "us-east-1" : "10.32.0.0/16"
  "eu-north-1" : "10.42.0.0/16"
}
public_subnets = {
  "ap-southeast-1" : ["10.12.10.0/24", "10.12.20.0/24", "10.12.30.0/24"]
  "ap-south-1" : ["10.22.10.0/24", "10.22.20.0/24", "10.22.30.0/24"]
  "us-east-1" : ["10.32.10.0/24", "10.32.20.0/24", "10.32.30.0/24"]
  "eu-north-1" : ["10.42.10.0/24", "10.42.20.0/24", "10.42.30.0/24"]
}

private_subnets = {
  "ap-southeast-1" : ["10.12.110.0/24", "10.12.120.0/24", "10.12.130.0/24"]
  "ap-south-1" : ["10.22.110.0/24", "10.22.120.0/24", "10.22.130.0/24"]
  "us-east-1" : ["10.32.110.0/24", "10.32.120.0/24", "10.32.130.0/24"]
  "eu-north-1" : ["10.42.110.0/24", "10.42.120.0/24", "10.42.130.0/24"]
}

base_domain            = "getqatalyst.io"
api_sub_domain         = "api"
media_sub_domain       = "media"
tester_view_sub_domain = "studyview"
meet_sub_domain        = "meet"
invite_sub_domain      = "invite"

user_pool_name            = "qatalyst-user-pool"
user_pool_web_client_name = "qatalyst-web-app"

global_ddb_table_details = [
  {
    table_name = "qatalyst-configurations"
    hash_key   = "PK"
    range_key  = "SK"
  },
  {
    table_name = "qatalyst-user-workspace-mapping"
    hash_key   = "user_id"
    range_key  = "workspace_id"
  },
  {
    table_name = "qatalyst-user-invites"
    hash_key   = "workspace_id"
    range_key  = "email_id"
  }
]

global_ddb_tables_without_range = [
  {
    table_name = "qatalyst-cognito-mapping"
    hash_key   = "cognito_user_id"
  }
]

gsi_global_table_details_without_range = {
  "workspaces" : {
    table_name  = "qatalyst-workspace-info"
    hash_key    = "workspace_id"
    attribute_1 = "name"
    "gsi_1" : {
      name     = "qatalyst-workspace-name-gsi"
      hash_key = "name"
    }
  },
  "user_profile" : {
    table_name  = "qatalyst-user-profile"
    hash_key    = "user_id"
    attribute_1 = "email_id"
    "gsi_1" : {
      name     = "qatalyst-user-email-gsi"
      hash_key = "email_id"
    }
  }
}

gsi_table_details = {
  "study_details" : {
    table_name = "qatalyst-study-details"
    hash_key   = "workspace_id"
    range_key  = "study_id"
    attributes = [
      {
        name = "last_modified_date"
        type = "S"
      }
    ]
    stream_enabled = false
    global_secondary_indexes = [
      {
        name            = "qatalyst-study-details-date-gsi"
        hash_key        = "workspace_id"
        range_key       = "last_modified_date"
        projection_type = "ALL"
      }
    ]
  },
  "transcripts_highlights" : {
    table_name = "qatalyst-transcripts-highlights"
    hash_key   = "transcript_id"
    range_key  = "highlight_id"
    attributes = [
      {
        name = "media_id"
        type = "S"
      }
    ]
    stream_enabled = false
    global_secondary_indexes = [
      {
        name            = "qatalyst-highlights-media-id-gsi"
        hash_key        = "media_id"
        range_key       = "transcript_id"
        projection_type = "ALL"
      },
    ]
  },
  "transcripts_tags" : {
    table_name = "qatalyst-transcripts-tags"
    hash_key   = "highlight_id"
    range_key  = "tag_id"
    attributes = [
      {
        name = "workspace_id"
        type = "S"
      },
      {
        name = "lower_tag_text"
        type = "S"
      },
      {
        name = "media_id"
        type = "S"
      }
    ]
    stream_enabled = false
    global_secondary_indexes = [
      {
        name            = "qatalyst-tags-media-id-gsi"
        hash_key        = "media_id"
        range_key       = "tag_id"
        projection_type = "ALL"
      },
      {
        name            = "qatalyst-tags-search-gsi"
        hash_key        = "workspace_id"
        range_key       = "lower_tag_text"
        projection_type = "ALL"
      },
    ]
  }
}

table_details = {
  "block-details" : {
    table_name     = "qatalyst-block-details"
    hash_key       = "study_id"
    range_key      = "block_id"
    stream_enabled = false
  },
  "tester-details" : {
    table_name     = "qatalyst-tester-details"
    hash_key       = "study_id"
    range_key      = "tester_id"
    stream_enabled = false
  },
  "tester-response-details" : {
    table_name     = "qatalyst-tester-responses"
    hash_key       = "block_id"
    range_key      = "tester_id"
    stream_enabled = true
    global_secondary_indexes = [
      {
        name            = "qatalyst-tester-responses-tester-gsi"
        hash_key        = "tester_id"
        range_key       = "block_id"
        projection_type = "ALL"
      }
    ]
  },
  "tester-events-details" : {
    table_name     = "qatalyst-tester-events"
    hash_key       = "block_id"
    range_key      = "tester_id"
    stream_enabled = false
  },
  "workspace-configurations" : {
    table_name     = "qatalyst-workspace-configurations"
    hash_key       = "workspace_id"
    range_key      = "organisation_id"
    stream_enabled = false
  },
  "workspace-testers-email" : {
    table_name     = "qatalyst-workspace-testers-email"
    hash_key       = "workspace_id"
    range_key      = "tester_email_id"
    stream_enabled = false
  },
  "reports-collab-info" : {
    table_name     = "qatalyst-reports-collab"
    hash_key       = "report_id"
    range_key      = "user_id"
    stream_enabled = false
  },
  "workspace-metrics" : {
    table_name     = "qatalyst-workspace-metrics"
    hash_key       = "workspace_id"
    range_key      = "organisation_id"
    stream_enabled = false
  },
  "session-meetings" : {
    table_name     = "qatalyst-session-meetings"
    hash_key       = "block_id"
    range_key      = "meeting_id"
    stream_enabled = false
    global_secondary_indexes = [
      {
        name            = "qatalyst-meeting-id-gsi"
        hash_key        = "meeting_id"
        range_key       = "block_id"
        projection_type = "ALL"
      }
    ]
  },
  "tester-logs" : {
    table_name     = "qatalyst-tester-logs"
    hash_key       = "block_id"
    range_key      = "tester_id"
    stream_enabled = false
  }
  "media-details" : {
    table_name     = "qatalyst-media-details"
    hash_key       = "block_id"
    range_key      = "media_id"
    stream_enabled = false
  },
  "transcripts-details" : {
    table_name     = "qatalyst-transcripts-details"
    hash_key       = "media_id"
    range_key      = "transcript_id"
    stream_enabled = false
    attributes = [
      {
        name = "created_date"
        type = "S"
      }
    ]
    global_secondary_indexes = [{
      name            = "qatalyst-created-date-gsi"
      hash_key        = "media_id"
      range_key       = "created_date"
      projection_type = "ALL"
      }
    ]
  },
  "panel_testers" : {
    table_name     = "qatalyst-panel-testers"
    hash_key       = "workspace_id"
    range_key      = "email_id"
    stream_enabled = false
  },
  "study_panel_testers" : {
    table_name     = "qatalyst-study-panel-testers"
    hash_key       = "study_id"
    range_key      = "email_id"
    stream_enabled = false
  },
  "study_custom_insights" : {
    table_name     = "qatalyst-custom-insights"
    hash_key       = "study_id"
    range_key      = "custom_insight_id"
    stream_enabled = false
  },
  "subscription_orders" : {
    table_name     = "qatalyst-subscription-orders"
    hash_key       = "workspace_id"
    range_key      = "order_id"
    stream_enabled = false
  }
}

tables_without_range_key = {
  "reports-lookup" : {
    table_name     = "qatalyst-report-details"
    hash_key       = "report_id"
    stream_enabled = false
  }
}

fargate_cpu_memory = {
  "cpu" : 1024
  "memory" : 2048
}

uvicorn_workers_count = 4

common_s3_sub_domain  = "common"
reports_s3_sub_domain = "reports"
meet_s3_sub_domain    = "meet"
invite_s3_sub_domain  = "invite"

# Datadog
datadog_docker_image = "public.ecr.aws/datadog/agent:latest"
ecr_repo_name        = "qatalyst-backend"
cyborg_repo_name     = "qatalyst-cyborg"

mediaconvert_queues = {
  "qatalyst" : {
    name         = "qatalyst"
    pricing_plan = "ON_DEMAND"
    status       = "ACTIVE"
  }
}

lb_target_health = {
  "lb_target_interval" : "30"
  "lb_target_timeout" : "25"
  "lb_target_healthy_threshold" : "2"
  "lb_target_unhealthy_threshold" : "2"
}

sqs_details = {
  "qatalyst-cyborg-processing-sqs" : {
    queue_name                 = "qatalyst-cyborg-processing-queue"
    delay_seconds              = "0"
    max_message_size           = "2048"
    message_retention_seconds  = "86400"
    receive_wait_time_seconds  = "20"
    visibility_timeout_seconds = "1200"
  }
}
# EFS
cyborg_efs_configurations = {
  "name" = "cyborg",
  "path" = "/cyborg",
}
