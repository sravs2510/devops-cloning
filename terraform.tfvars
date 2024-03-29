DEFAULT_TAGS = {
  CreatedBy = "Terraform"
  Product   = "QATALYST"
}

datacenter_codes = {
  "ap-southeast-1" : "sea"
  "ap-south-1" : "in"
  "us-east-1" : "us"
  "eu-north-1" : "eu"
  "eu-west-1" : "eu"
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
reports_sub_domain     = "reports"
common_sub_domain      = "common"

user_pool_name            = "qatalyst-user-pool"
user_pool_web_client_name = "qatalyst-web-app"

global_table_details = {
  "qatalyst-configurations" = {
    table_name = "qatalyst-configurations"
    hash_key   = "PK"
    range_key  = "SK"
    is_global  = true
  },
  "qatalyst-user-workspace-mapping" = {
    table_name = "qatalyst-user-workspace-mapping"
    hash_key   = "user_id"
    range_key  = "workspace_id"
    is_global  = true
    attributes = []
    "global_secondary_indexes" = [{
      name            = "qatalyst-workspace-user-mapping-gsi"
      hash_key        = "workspace_id"
      range_key       = "user_id"
      projection_type = "ALL"
    }]
  },
  "qatalyst-user-invites" = {
    table_name = "qatalyst-user-invites"
    hash_key   = "workspace_id"
    range_key  = "email_id"
    is_global  = true
    attributes = [
      {
        name = "invitee_id"
        type = "S"
      }
    ]
    global_secondary_indexes = [{
      name            = "qatalyst-user-invitee-gsi"
      hash_key        = "invitee_id"
      range_key       = "workspace_id"
      projection_type = "ALL"
    }]
  },
  "workspaces" = {
    table_name = "qatalyst-workspace-info"
    hash_key   = "workspace_id"
    is_global  = true
    attributes = [
      {
        name = "name"
        type = "S"
      }
    ]
    "global_secondary_indexes" = [{
      name            = "qatalyst-workspace-name-gsi"
      hash_key        = "name"
      projection_type = "ALL"
    }]
  },
  "user_profile" = {
    table_name = "qatalyst-user-profile"
    hash_key   = "user_id"
    is_global  = true
    attributes = [
      {
        name = "email_id"
        type = "S"
      }
    ]
    "global_secondary_indexes" = [{
      name            = "qatalyst-user-email-gsi"
      hash_key        = "email_id"
      is_global       = true
      projection_type = "ALL"
      }
    ]
  },
  "qatalyst-cognito-mapping" = {
    table_name = "qatalyst-cognito-mapping"
    hash_key   = "cognito_user_id"
    is_global  = true
  }
}

table_details = {
  "study_details" : {
    table_name = "qatalyst-study-details"
    hash_key   = "workspace_id"
    range_key  = "study_id"
    stream = {
      enabled = true
    }
    attributes = [
      {
        name = "last_modified_date"
        type = "S"
      }
    ]
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
  },
  "block-details" : {
    table_name = "qatalyst-block-details"
    hash_key   = "study_id"
    range_key  = "block_id"
  },
  "tester-details" : {
    table_name = "qatalyst-tester-details"
    hash_key   = "study_id"
    range_key  = "tester_id"
  },
  "tester-response-details" : {
    table_name = "qatalyst-tester-responses"
    hash_key   = "block_id"
    range_key  = "tester_id"
    stream = {
      enabled = true
    }
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
    table_name = "qatalyst-tester-events"
    hash_key   = "block_id"
    range_key  = "tester_id"
  },
  "workspace-configurations" : {
    table_name = "qatalyst-workspace-configurations"
    hash_key   = "workspace_id"
    range_key  = "organisation_id"
  },
  "workspace-testers-email" : {
    table_name = "qatalyst-workspace-testers-email"
    hash_key   = "workspace_id"
    range_key  = "tester_email_id"
  },
  "reports-collab-info" : {
    table_name = "qatalyst-reports-collab"
    hash_key   = "report_id"
    range_key  = "user_id"
  },
  "workspace-metrics" : {
    table_name = "qatalyst-workspace-metrics"
    hash_key   = "workspace_id"
    range_key  = "organisation_id"
  },
  "session-meetings" : {
    table_name = "qatalyst-session-meetings"
    hash_key   = "block_id"
    range_key  = "meeting_id"
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
    table_name = "qatalyst-tester-logs"
    hash_key   = "block_id"
    range_key  = "tester_id"
  }
  "media-details" : {
    table_name = "qatalyst-media-details"
    hash_key   = "block_id"
    range_key  = "media_id"
    global_secondary_indexes = [
      {
        name            = "qatalyst-media-id-gsi"
        hash_key        = "media_id"
        projection_type = "ALL"
      }
    ]
  },
  "transcripts-details" : {
    table_name = "qatalyst-transcripts-details"
    hash_key   = "media_id"
    range_key  = "transcript_id"
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
    table_name = "qatalyst-panel-testers"
    hash_key   = "workspace_id"
    range_key  = "email_id"
  },
  "study_panel_testers" : {
    table_name = "qatalyst-study-panel-testers"
    hash_key   = "study_id"
    range_key  = "email_id"
  },
  "study_custom_insights" : {
    table_name = "qatalyst-custom-insights"
    hash_key   = "study_id"
    range_key  = "custom_insight_id"
  },
  "subscription_orders" : {
    table_name = "qatalyst-subscription-orders"
    hash_key   = "workspace_id"
    range_key  = "SK"
    attributes = [
      {
        name = "latest"
        type = "S"
      }
    ]
    global_secondary_indexes = [
      {
        name            = "qatalyst-subscription-latest-gsi"
        hash_key        = "workspace_id"
        range_key       = "latest"
        projection_type = "ALL"
      }
    ]
  },
  "external-panel-project" : {
    table_name = "qatalyst-external-panel-project"
    hash_key   = "study_id"
    range_key  = "project_id"
  },
  "reports-lookup" : {
    table_name = "qatalyst-report-details"
    hash_key   = "report_id"
  },
  "stripe-events" : {
    table_name = "qatalyst-stripe-events"
    hash_key   = "event_id"
  },
  "workspace-usage" : {
    table_name = "qatalyst-workspace-usage"
    hash_key   = "workspace_id"
  },
  "study-publish-details" : {
    table_name = "qatalyst-study-publish"
    hash_key   = "study_id"
    range_key  = "published_version"
  },
  "workflow-management" : {
    table_name = "qatalyst-workflow-management"
    hash_key   = "workspace_id"
    range_key  = "workflow_id"
    attributes = [
      {
        name = "last_modified_date"
        type = "S"
      }
    ]
    global_secondary_indexes = [{
      name            = "qatalyst-workflow-modified-date-gsi"
      hash_key        = "workspace_id"
      range_key       = "last_modified_date"
      projection_type = "ALL"
    }]
  },
  "media_notes" : {
    table_name = "qatalyst-media-notes"
    hash_key   = "media_id"
    range_key  = "note_id"
  },
    "qatalyst_copilot" : {
    table_name = "qatalyst-copilot"
    hash_key   = "workspace_id"
    range_key  = "query_id"
    attributes = [
      {
        name = "created_date"
        type = "S"
      }
    ]
    global_secondary_indexes = [
      {
        name            = "qatalyst-query-details-date-gsi"
        hash_key        = "workspace_id"
        range_key       = "created_date"
        projection_type = "ALL"
      }
    ]
  }
}


fargate_cpu_memory = {
  "cpu" : 1024
  "memory" : 2048
}

fargate_cpu_memory_qa_eu = {
  "cpu" : 2048
  "memory" : 4096
}

uvicorn_workers_count = 4

# Datadog
datadog_docker_image = "public.ecr.aws/datadog/agent:latest"

mediaconvert_queues = {
  "qatalyst" : {
    name         = "qatalyst"
    pricing_plan = "ON_DEMAND"
    status       = "ACTIVE"
  }
}

lb_target_health = {
  "lb_target_interval"            = 30
  "lb_target_timeout"             = 25
  "lb_target_healthy_threshold"   = 2
  "lb_target_unhealthy_threshold" = 2
}

sqs_details = {
  "qatalyst-cyborg-processing-sqs" : {
    queue_name                 = "qatalyst-cyborg-processing-queue"
    delay_seconds              = 0
    max_message_size           = 262144 # 256KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
  },
  "qatalyst-furyblade-processing-sqs" : {
    queue_name                 = "qatalyst-furyblade-processing-queue"
    delay_seconds              = 0
    max_message_size           = 262144 # 256KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
  },
  "qatalyst-mammoth-processing-sqs" : {
    queue_name                 = "qatalyst-mammoth-processing-queue"
    delay_seconds              = 0
    max_message_size           = 131072 # 128KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
  },
  "qatalyst-user-journey-processing-sqs" : {
    queue_name                 = "qatalyst-user-journey-processing-queue"
    delay_seconds              = 0
    max_message_size           = 262144 # 128KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
  }
}
# EFS
efs_configurations = {
  cyborg = {
    name = "cyborg"
    path = "/cyborg"
  }
  furyblade = {
    name = "furyblade"
    path = "/furyblade"
  }
  mammoth = {
    name = "mammoth"
    path = "/mammoth"
  }
}

service_names = {
  dashboard  = "dashboard"
  reports    = "reports"
  testerview = "testerview"
  cyborg     = "cyborg"
  furyblade  = "furyblade"
  prototype  = "prototype"
  mammoth    = "mammoth"
  backend    = "backend"
  helios     = "helios"
}

open_ai_api = {
  "ap-southeast-1" = "#OPENAI_API_SEA"
  "ap-south-1"     = "#OPENAI_API_IN"
  "us-east-1"      = "#OPENAI_API_US"
  "eu-north-1"     = "#OPENAI_API_EU"
}

#S3
qatalyst_media_bucket_transfer_acceleration = "qatalyst-media"

# Batch
batch_configurations = {
  helios = {
    service_name    = "helios"
    max_vcpus       = 200
    min_vcpus       = 0
    type            = "FARGATE"
    required_vcpus  = "4"
    required_gpu    = "1"
    required_memory = "8192"
    image           = "com/qatalyst-helios:latest"
  }
}

opensearch_config = {
  domain_name     = "qatalyst"
  instance_type   = "t3.small.search"
  instance_count  = 3
  ebs_volume_size = 10
}
