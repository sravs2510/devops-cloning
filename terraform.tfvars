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
calendar_sub_domain    = "calendar"

user_pool_name            = "qatalyst-user-pool"
user_pool_web_client_name = "qatalyst-web-app"

global_table_details = {
  "qatalyst-configurations" = {
    hash_key  = "PK"
    range_key = "SK"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
  },
  "qatalyst-user-workspace-mapping" = {
    hash_key  = "user_id"
    range_key = "workspace_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
    attributes = []
    "global_secondary_indexes" = [{
      name            = "qatalyst-workspace-user-mapping-gsi"
      hash_key        = "workspace_id"
      range_key       = "user_id"
      projection_type = "ALL"
    }]
  },
  "qatalyst-user-invites" = {
    hash_key  = "workspace_id"
    range_key = "email_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
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
  "qatalyst-workspace-info" = {
    hash_key = "workspace_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
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
  "qatalyst-user-profile" = {
    hash_key = "user_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
    attributes = [
      {
        name = "email_id"
        type = "S"
      }
    ]
    "global_secondary_indexes" = [{
      name            = "qatalyst-user-email-gsi"
      hash_key        = "email_id"
      projection_type = "ALL"
      }
    ]
  },
  "qatalyst-cognito-mapping" = {
    hash_key = "cognito_user_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
  }
}

table_details = {
  "qatalyst-study-details" : {
    hash_key  = "workspace_id"
    range_key = "study_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
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
  "qatalyst-transcripts-highlights" : {
    hash_key  = "transcript_id"
    range_key = "highlight_id"
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
  "qatalyst-transcripts-tags" : {
    hash_key  = "highlight_id"
    range_key = "tag_id"
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
  "qatalyst-block-details" : {
    hash_key  = "study_id"
    range_key = "block_id"
  },
  "qatalyst-tester-details" : {
    hash_key  = "study_id"
    range_key = "tester_id"
  },
  "qatalyst-tester-responses" : {
    hash_key  = "block_id"
    range_key = "tester_id"
    stream = {
      enabled   = true
      view_type = "NEW_AND_OLD_IMAGES"
    }
    global_secondary_indexes = [
      {
        name            = "qatalyst-tester-responses-tester-gsi"
        hash_key        = "tester_id"
        range_key       = "block_id"
        projection_type = "ALL"
      }
    ]
    ttl = {
      enabled        = true
      attribute_name = "expiry_time"
    }
  },
  "qatalyst-tester-events" : {
    hash_key  = "block_id"
    range_key = "tester_id"
  },
  "qatalyst-workspace-configurations" : {
    hash_key  = "workspace_id"
    range_key = "organisation_id"
  },
  "qatalyst-workspace-testers-email" : {
    hash_key  = "workspace_id"
    range_key = "tester_email_id"
  },
  "qatalyst-reports-collab" : {
    hash_key  = "report_id"
    range_key = "user_id"
  },
  "qatalyst-workspace-metrics" : {
    hash_key  = "workspace_id"
    range_key = "organisation_id"
  },
  "qatalyst-session-meetings" : {
    hash_key  = "block_id"
    range_key = "meeting_id"
    global_secondary_indexes = [
      {
        name            = "qatalyst-meeting-id-gsi"
        hash_key        = "meeting_id"
        range_key       = "block_id"
        projection_type = "ALL"
      }
    ]
  },
  "qatalyst-tester-logs" : {
    hash_key  = "block_id"
    range_key = "tester_id"
  }
  "qatalyst-media-details" : {
    hash_key  = "block_id"
    range_key = "media_id"
    global_secondary_indexes = [
      {
        name            = "qatalyst-media-id-gsi"
        hash_key        = "media_id"
        projection_type = "ALL"
      }
    ]
  },
  "qatalyst-transcripts-details" : {
    hash_key  = "media_id"
    range_key = "transcript_id"
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
  "qatalyst-panel-testers" : {
    hash_key  = "workspace_id"
    range_key = "email_id"
  },
  "qatalyst-study-panel-testers" : {
    hash_key  = "study_id"
    range_key = "email_id"
  },
  "qatalyst-custom-insights" : {
    hash_key  = "study_id"
    range_key = "custom_insight_id"
  },
  "qatalyst-subscription-orders" : {
    hash_key  = "workspace_id"
    range_key = "SK"
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
  "qatalyst-external-panel-project" : {
    hash_key  = "study_id"
    range_key = "project_id"
  },
  "qatalyst-report-details" : {
    hash_key = "report_id"
  },
  "qatalyst-stripe-events" : {
    hash_key = "event_id"
  },
  "qatalyst-workspace-usage" : {
    hash_key = "workspace_id"
  },
  "qatalyst-study-publish" : {
    hash_key  = "study_id"
    range_key = "published_version"
  },
  "qatalyst-workflow-management" : {
    hash_key  = "workspace_id"
    range_key = "workflow_id"
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
  "qatalyst-media-notes" : {
    hash_key  = "media_id"
    range_key = "note_id"
  },
  "qatalyst-copilot" : {
    hash_key  = "workspace_id"
    range_key = "query_id"
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
  },
  "qatalyst-teams" : {
    hash_key  = "workspace_id"
    range_key = "team_id"
  },
  "qatalyst-website-journeys-info" : {
    hash_key  = "study_id"
    range_key = "block_id"
  },
  "qatalyst-ddb-lock-table" : {
    hash_key  = "lock_key"
    range_key = "sort_key"
    ttl = {
      enabled        = true
      attribute_name = "expiry_time"
    }
  }
}

uvicorn_workers_count = 4

mediaconvert_queues = {
  "qatalyst" : {
    name         = "qatalyst"
    pricing_plan = "ON_DEMAND"
    status       = "ACTIVE"
  }
}

lb_target_health = {
  "lb_target_interval"            = 60
  "lb_target_timeout"             = 30
  "lb_target_healthy_threshold"   = 2
  "lb_target_unhealthy_threshold" = 2
  "lb_deregistration_delay"       = 60
}

sqs_queues = {
  "qatalyst-cyborg-processing-queue" : {
    queue_name                 = "qatalyst-cyborg-processing-queue"
    dl_queue_name              = "qatalyst-cyborg-processing-queue-dl"
    delay_seconds              = 0
    max_message_size           = 262144 # 256KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
    enable_dead_letter_queue   = true
  },
  "qatalyst-furyblade-processing-queue" : {
    queue_name                 = "qatalyst-furyblade-processing-queue"
    dl_queue_name              = "qatalyst-furyblade-processing-queue-dl"
    delay_seconds              = 0
    max_message_size           = 262144 # 256KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
    enable_dead_letter_queue   = true
  },
  "qatalyst-mammoth-processing-queue" : {
    queue_name                 = "qatalyst-mammoth-processing-queue"
    dl_queue_name              = "qatalyst-mammoth-processing-queue-dl"
    delay_seconds              = 0
    max_message_size           = 131072 # 128KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
    enable_dead_letter_queue   = true
  },
  "qatalyst-user-journey-processing-queue" : {
    queue_name                 = "qatalyst-user-journey-processing-queue"
    dl_queue_name              = "qatalyst-user-journey-processing-queue-dl"
    delay_seconds              = 0
    max_message_size           = 262144 # 128KB
    message_retention_seconds  = 86400
    receive_wait_time_seconds  = 20   #Long Polling
    visibility_timeout_seconds = 1200 # 20 Minutes
    enable_dead_letter_queue   = true
  }
}
# EFS
efs_configurations = {
  cyborg = {
    name          = "cyborg"
    path          = "/cyborg"
    enable_backup = false
  }
  furyblade = {
    name          = "furyblade"
    path          = "/furyblade"
    enable_backup = false
  }
  mammoth = {
    name          = "mammoth"
    path          = "/mammoth"
    enable_backup = false
  }
  qatalyst = {
    name          = "qatalyst"
    path          = "/qatalyst"
    enable_backup = false
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
  copilot    = "copilot"
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
    name            = "helios"
  }
}

opensearch_config = {
  domain_name             = "qatalyst-dashboard"
  instance_type           = "t3.medium.search"
  instance_count          = 2
  availability_zone_count = 2
  ebs_volume_size         = 10
  engine_version          = "OpenSearch_2.11"
}

fargate_service_configurations = {
  "mammoth" = {
    cpu    = 2048
    memory = 4096
  }
  "copilot" = {
    cpu    = 1024
    memory = 2048
  }
  "reports" = {
    cpu    = 1024
    memory = 2048
  }
  "dashboard" = {
    cpu    = 2048
    memory = 4096
  }
  "default" = {
    cpu    = 1024
    memory = 2048
  }
}

#ECR
repo_details = {
  "qatalyst-mammoth" = {
    repo_name = "qatalyst-mammoth"
  }

  "qatalyst-backend" = {
    repo_name = "qatalyst-backend"
  }

  "qatalyst-cyborg" = {
    repo_name = "qatalyst-cyborg"
  }

  "qatalyst-helios" = {
    repo_name = "qatalyst-helios"
  }

  "qatalyst-furyblade" = {
    repo_name = "qatalyst-furyblade"
  }

  "qatalyst-backend-base-image" = {
    repo_name = "qatalyst-backend-base-image"
  }
}

# Event bridge schedule group names
schedule_group_names = {
  precomputation = "precomputation"
}

google_config = {
  client_id     = "#QATALYST_GOOGLE_CLIENT_ID"
  client_secret = "#QATALYST_GOOGLE_CLIENT_SECRET"
}
amazon_config = {
  client_id     = "#QATALYST_AMAZON_CLIENT_ID"
  client_secret = "#QATALYST_AMAZON_CLIENT_SECRET"
}
auth0_config = {
  client_id     = "#QATALYST_AUTH0_CLIENT_ID"
  client_secret = "#QATALYST_AUTH0_CLIENT_SECRET"
  oidc_issuer   = "https://getqatalyst.us.auth0.com"
}
