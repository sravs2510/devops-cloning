terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cw_region]
    }
  }
}

data "aws_region" "cw_region" {
  provider = aws.cw_region
}

data "aws_caller_identity" "current" {
  provider = aws.cw_region
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  ecr_repo   = join(".", [local.account_id, "dkr.ecr", data.aws_region.cw_region.name, "amazonaws.com/qatalyst-backend=latest"])
}

# Create CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "qatalyst_cw_dashboard" {
  provider       = aws.cw_region
  dashboard_name = "Qatalyst ECS"
  role_arn       = var.qatalyst_cw_dashboard_role_arn
  #dashboard_arn = aws_iam_role.example_role.arn
  tags           = merge(tomap({ "Name" = "qatalyst_cw_dashboard" }), tomap({ "STAGE" = var.STAGE }), var.DEFAULT_TAGS)
  # Define widgets
  widgets = [
    # Widget for CPUUtilization metric
    {
      type   = "metric"
      x      = 0
      y      = 3
      width  = 12
      height = 12
      properties = jsonencode({
        view    = "timeSeries"
        stacked = false
        metrics = [
          ["AWS/ECS", "CPUUtilization", "ClusterName", "${var.qatalyst_ecs_cluster}", "ServiceName", "qatalyst_ecs_service"],
        ]
        title = "ECS CPUUtilization"
        stat  = "Sum",
        yAxis = {
          left = {
            min = 0
          }
          right = {
            show = false
          }
        }
        annotations = {
          alarms = []
        }
      })
    },
    # Widget for MemoryUtilization metric
    {
      type   = "metric"
      x      = 12
      y      = 3
      width  = 12
      height = 12
      properties = jsonencode({
        view    = "timeSeries"
        stacked = false
        metrics = [
          ["AWS/ECS", "MemoryUtilization", "ClusterName", "${var.qatalyst_ecs_cluster}", "ServiceName", "qatalyst_ecs_service"],
        ]
        title = "ECS MemoryUtilization"
        stat  = "Average",
        yAxis = {
          left = {
            min = 0
          }
          right = {
            show = false
          }
        }
        annotations = {
          alarms = []
        }
      })
    },
    # Widget for HTTPCode_Target_3XX_Count metric
    {
      type   = "metric"
      x      = 0
      y      = 6
      width  = 8
      height = 8
      properties = jsonencode({
        view    = "timeSeries"
        stacked = false
        metrics = [
          ["AWS/ECS", "HTTPCode_Target_3XX_Count", "ClusterName", "${var.qatalyst_ecs_cluster}", "ServiceName", "qatalyst_ecs_service"],
        ]
        title = "HTTPCode_Target_3XX_Count"
        stat  = "Count",
        yAxis = {
          left = {
            min = 0
          }
          right = {
            show = false
          }
        }
        annotations = {
          alarms = []
        }

      })
    },
    # Widget for HTTPCode_Target_4XX_Count metric
    {
      type   = "metric"
      x      = 8
      y      = 6
      width  = 12
      height = 12
      properties = jsonencode({
        view    = "timeSeries"
        stacked = false
        metrics = [
          ["AWS/ECS", "HTTPCode_Target_4XX_Count", "ClusterName", "${var.qatalyst_ecs_cluster}", "ServiceName", "qatalyst_ecs_service"],
        ]
        title = "HTTPCode_Target_4XX_Count"
        stat  = "Count",
        yAxis = {
          left = {
            min = 0
          }
          right = {
            show = false
          }
        }
        annotations = {
          alarms = []
        }

      })
    },
    # Widget for HTTPCode_Target_5XX_Count metric
    {
      type   = "metric"
      x      = 16
      y      = 6
      width  = 12
      height = 12
      properties = jsonencode({
        view    = "timeSeries"
        stacked = false
        metrics = [
          ["AWS/ECS", "HTTPCode_Target_5XX_Count", "ClusterName", "${var.qatalyst_ecs_cluster}", "ServiceName", "qatalyst_ecs_service"],
        ]
        title = "HTTPCode_Target_5XX_Count"
        stat  = "Count",
        yAxis = {
          left = {
            min = 0
          }
          right = {
            show = false
          }
        }
        annotations = {
          alarms = []
        }

      })
    }
  ]
}
# Define the CloudWatch dashboard ALB
resource "aws_cloudwatch_dashboard" "alb_dashboard" {
  provider       = aws.cw_region
  dashboard_name = "Qatalyst ALB"

  # Define the widgets for the dashboard
  dashboard_body = jsonencode([
    {
      type   = "metric",
      x      = 0,
      x      = 0,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "ActiveConnectionCount", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "ActiveConnectionCount"
        stat  = "Average"
      }
    },
    {
      type   = "metric",
      x      = 0,
      x      = 0,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HealthyHostCount", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "HealthyHostCount"
        stat  = "Average"
      }
    },
    {
      type   = "metric",
      x      = 6,
      x      = 0,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "ClientTLSNegotiationErrorCount", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "ClientTLSNegotiationErrorCount"
        stat  = "Average"
      }
    },
    {
      type   = "metric",
      x      = 0,
      x      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HTTPCode_ELB_3XX_Count", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "HTTPCode_ELB_3XX_Countt"
        stat  = "Count"
      }
    },
    {
      type   = "metric",
      x      = 0,
      x      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HTTPCode_ELB_4XX_Count", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "HTTPCode_ELB_4XX_Count"
        stat  = "Count"
      }
    },
    {
      type   = "metric",
      x      = 0,
      x      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HTTPCode_ELB_5XX_Count", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "HTTPCode_ELB_5XX_Count"
        stat  = "Count"
      }
    },
    {
      type   = "metric",
      x      = 0,
      x      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "RejectedConnectionCount", "LoadBalancer", "${aws_lb.qatalyst_alb.arn}"]
        ],
        title = "RejectedConnectionCount"
        stat  = "Average"
      }
    }
  ])
}