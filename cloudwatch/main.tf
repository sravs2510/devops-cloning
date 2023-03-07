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
  ecs_metric=["AWS/ECS", "CPUUtilization", "ClusterName", "qatalyst-ecs-cluster", "ServiceName", "qatalyst-ecs-service"]
}
# Create CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "qatalyst_cw_dashboard" {
  provider       = aws.cw_region
  dashboard_name = "Qatalyst-Dashboard"
  
  dashboard_body = jsonencode({
    widgets = [
      {
        type    = "metric"
        x       = 0
        y       = 3
        width   = 12
        height  = 12
        view    = "timeSeries"
        stacked = false
        metrics = [
          ["AWS/ECS", "CPUUtilization", "ClusterName", "qatalyst-ecs-cluster", "ServiceName", "qatalyst-ecs-service"],
        ]
        title = "ECS CPUUtilization"
        stat  = "Sum",

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
            ["AWS/ECS", "MemoryUtilization", "ClusterName", "qatalyst-ecs-cluster", "ServiceName", "qatalyst-ecs-service"],
          ]
          title = "ECS MemoryUtilization"
          stat  = "Average",

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
            ["AWS/ECS", "HTTPCode_Target_3XX_Count", "ClusterName", "qatalyst-ecs-cluster", "ServiceName", "qatalyst-ecs-service"],
          ]
          title = "HTTPCode_Target_3XX_Count"
          stat  = "Count",


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
            ["AWS/ECS", "HTTPCode_Target_4XX_Count", "ClusterName", "qatalyst-ecs-cluster", "ServiceName", "qatalyst-ecs-service"],
          ]
          title = "HTTPCode_Target_4XX_Count"
          stat  = "Count",


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
            ["AWS/ECS", "HTTPCode_Target_5XX_Count", "ClusterName", "qatalyst-ecs-cluster", "ServiceName", "qatalyst_ecs_service"],
          ]
          title = "HTTPCode_Target_5XX_Count"
          stat  = "Count",

        })
      },
      {
      type   = "metric",
      x      = 0,
      y      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "ActiveConnectionCount", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "ActiveConnectionCount"
        stat  = "Average"
      }
    },
    {
      type   = "metric",
      x      = 0,
      y      = 0,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HealthyHostCount", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "HealthyHostCount"
        stat  = "Average"
      }
    },
    {
      type   = "metric",
      x      = 6,
      y      = 0,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "ClientTLSNegotiationErrorCount", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "ClientTLSNegotiationErrorCount"
        stat  = "Average"
      }
    },
    {
      type   = "metric",
      x      = 0,
      y      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HTTPCode_ELB_3XX_Count", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "HTTPCode_ELB_3XX_Countt"
        stat  = "Count"
      }
    },
    {
      type   = "metric",
      x      = 0,
      y      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HTTPCode_ELB_4XX_Count", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "HTTPCode_ELB_4XX_Count"
        stat  = "Count"
      }
    },
    {
      type   = "metric",
      x      = 0,
      y      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "HTTPCode_ELB_5XX_Count", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "HTTPCode_ELB_5XX_Count"
        stat  = "Count"
      }
    },
    {
      type   = "metric",
      x      = 0,
      y      = 6,
      width  = 6,
      height = 6,
      properties = {
        metrics = [
          ["AWS/ApplicationELB", "RejectedConnectionCount", "LoadBalancer", var.qatalyst_alb_arn]
        ],
        title = "RejectedConnectionCount"
        stat  = "Count"

      }
    }
    ]
  })
}

