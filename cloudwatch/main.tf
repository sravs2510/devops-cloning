terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cw_region]
    }
  }
}

locals {
  ist_timezone    = "+0530" #IST
  period          = 300     #Seconds
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.current.name)
}

data "aws_region" "current" {
  provider = aws.cw_region
}

# Create CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "qatalyst_cw_dashboard" {
  provider       = aws.cw_region
  dashboard_name = join("-", ["Qatalyst", "Dashboard", local.datacenter_code])

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ECS",
              "CPUUtilization",
              "ClusterName",
              var.ecs_cluster_name,
              "ServiceName",
              var.ecs_service_name
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Average"
          title    = "Average CPUUtilization"
        }
      },
      # Widget for MemoryUtilization metric
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ECS",
              "MemoryUtilization",
              "ClusterName",
              var.ecs_cluster_name,
              "ServiceName",
              var.ecs_service_name
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Average"
          title    = "Average MemoryUtilization",
        }
      },
      # Widget for HTTPCode_Target_3XX_Count metric
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_Target_3XX_Count",
              "TargetGroup",
              var.tg_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "HTTPCode_Target_3XX_Count"
        }
      },
      # Widget for HTTPCode_Target_4XX_Count metric
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_Target_4XX_Count",
              "TargetGroup",
              var.tg_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "HTTPCode_Target_4XX_Count",
        }
      },
      # Widget for HTTPCode_Target_5XX_Count metric
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_Target_5XX_Count",
              "TargetGroup",
              var.tg_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "HTTPCode_Target_5XX_Count",
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HealthyHostCount",
              "TargetGroup",
              var.tg_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Minimum"
          title    = "HealthyHostCount"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "UnHealthyHostCount",
              "TargetGroup",
              var.tg_arn_suffix,
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Maximum"
          title    = "UnHealthyHostCount"
        }
      },
      #LoadBalancer
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "ActiveConnectionCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "ActiveConnectionCount"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "ClientTLSNegotiationErrorCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "ClientTLSNegotiationErrorCount"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_3XX_Count",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "HTTPCode_ELB_3XX_Countt"
        }
      },
      {
        type = "metric",
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_4XX_Count",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "HTTPCode_ELB_4XX_Count"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "HTTPCode_ELB_5XX_Count",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "HTTPCode_ELB_5XX_Count"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "RejectedConnectionCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "RejectedConnectionCount"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "TargetResponseTime",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Maximum"
          title    = "TargetResponseTime"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            [
              "AWS/ApplicationELB",
              "TargetTLSNegotiationErrorCount",
              "LoadBalancer",
              var.alb_arn_suffix
            ]
          ],
          view     = "timeSeries"
          stacked  = false
          period   = local.period
          timezone = local.ist_timezone
          region   = data.aws_region.current.name
          stat     = "Sum"
          title    = "TargetTLSNegotiationErrorCount"
        }
      }
    ]
  })
}

