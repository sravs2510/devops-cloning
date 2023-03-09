terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cw_region]
    }
  }
}
locals {
  ist_timezone = "+0530"
  period       = "300"
}

# Create CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "qatalyst_cw_dashboard" {
  provider       = aws.cw_region
  dashboard_name = "Qatalyst-Dashboard"
  
  dashboard_body = jsonencode({
    widgets = [
      {
        type    = "metric"
        properties = {
        metrics = [
          [
            "AWS/ECS", 
            "CPUUtilization", 
            "ClusterName", 
            "qatalyst-ecs-cluster", 
            "ServiceName", 
            "qatalyst-ecs-service"
          ]
        ],
        view    = "timeSeries"
        stacked = false
        period  = local.period
        timezone= local.ist_timezone
        stat    = "Average"
        title   = "Average CPUUtilization"
      }
      },

      # Widget for MemoryUtilization metric
      {
        type   = "metric"
        properties = {
          metrics = [
            [
               "AWS/ECS", 
               "MemoryUtilization", 
               "ClusterName", 
               "qatalyst-ecs-cluster", 
               "ServiceName", 
               "qatalyst-ecs-service"
            ]
          ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "Average"
          title   = "Average MemoryUtilization",
        }
      },
      # Widget for HTTPCode_Target_3XX_Count metric
      {
        type   = "metric"
        properties = {
          metrics = [
            [
              "AWS/ECS", 
              "HTTPCode_Target_3XX_Count", 
              "ClusterName", 
              "qatalyst-ecs-cluster", 
              "ServiceName", 
              "qatalyst-ecs-service"
            ]
          ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat  = "SampleCount"
          title = "HTTPCode_Target_3XX_Count"
        }
      },
      # Widget for HTTPCode_Target_4XX_Count metric
      {
        type   = "metric"
        properties = {
          metrics = [
            [
              "AWS/ECS", 
              "HTTPCode_Target_4XX_Count", 
              "ClusterName", 
              "qatalyst-ecs-cluster", 
              "ServiceName", 
              "qatalyst-ecs-service"
            ]
          ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title = "HTTPCode_Target_4XX_Count",
        }
      },
      # Widget for HTTPCode_Target_5XX_Count metric
      {
        type   = "metric"
        properties = {
          metrics = [
            [
              "AWS/ECS", 
              "HTTPCode_Target_5XX_Count", 
              "ClusterName", 
              "qatalyst-ecs-cluster", 
              "ServiceName", 
              "qatalyst_ecs_service"
            ]
          ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title   = "HTTPCode_Target_5XX_Count",
        }
      },
      {
      type   = "metric"
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "ActiveConnectionCount", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title   = "ActiveConnectionCount"
      }
    },
    {
      type   = "metric"
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "HealthyHostCount", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title = "HealthyHostCount"
      }
    },
    {
      type   = "metric"
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "ClientTLSNegotiationErrorCount", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title   = "ClientTLSNegotiationErrorCount"
      }
    },
    {
      type   = "metric"
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "HTTPCode_ELB_3XX_Count", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title   = "HTTPCode_ELB_3XX_Countt"
      }
    },
    {
      type   = "metric",
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "HTTPCode_ELB_4XX_Count", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title   = "HTTPCode_ELB_4XX_Count"
      }
    },
    {
      type   = "metric"
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "HTTPCode_ELB_5XX_Count", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title   = "HTTPCode_ELB_5XX_Count"
      }
    },
    {
      type   = "metric"
      properties = {
        metrics = [
          [
            "AWS/ApplicationELB", 
            "RejectedConnectionCount", 
            "LoadBalancer", 
            var.qatalyst_alb_arn
          ]
        ],
          view    = "timeSeries"
          stacked = false
          period  = local.period
          timezone= local.ist_timezone
          stat    = "SampleCount"
          title = "RejectedConnectionCount"
      }
    }
    ]
  })
}

