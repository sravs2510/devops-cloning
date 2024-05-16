terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.cw_region]
    }
  }
}

locals {
  ist_timezone     = "+0530" #IST
  period           = 300     #Seconds
  datacenter_code  = lookup(var.datacenter_codes, data.aws_region.current.name)
  ecs_service_name = join("-", [var.ecs_service_name, var.STAGE, local.datacenter_code])
  ecs_cluster_name = join("-", [var.ecs_cluster_name, var.STAGE, local.datacenter_code])
}

data "aws_region" "current" {
  provider = aws.cw_region
}
data "aws_sns_topic" "current" {
  name     = "DevOps-Alerts-Topic"
  provider = aws.cw_region
}

# Create CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "qatalyst_cw_dashboard" {
  provider       = aws.cw_region
  dashboard_name = join("-", [var.dashboard_name, local.datacenter_code])

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
              local.ecs_cluster_name,
              "ServiceName",
              local.ecs_service_name
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
              local.ecs_cluster_name,
              "ServiceName",
              local.ecs_service_name
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
          title    = "Sum HTTPCode_Target_3XX_Count"
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
          title    = "Sum HTTPCode_Target_4XX_Count",
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
          title    = "Sum HTTPCode_Target_5XX_Count",
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
          title    = "Minimum HealthyHostCount"
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
          title    = "Maximum UnHealthyHostCount"
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
          title    = "Sum ActiveConnectionCount"
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
          title    = "Sum ClientTLSNegotiationErrorCount"
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
          title    = "Sum HTTPCode_ELB_3XX_Countt"
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
          title    = "Sum HTTPCode_ELB_4XX_Count"
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
          title    = "Sum HTTPCode_ELB_5XX_Count"
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
          title    = "Sum RejectedConnectionCount"
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
          title    = "Maximum TargetResponseTime"
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
          title    = "Sum TargetTLSNegotiationErrorCount"
        }
      }
    ]
  })
}

locals {

}
#Cloudwatch Metrics
resource "aws_cloudwatch_metric_alarm" "qatalyst_sqs_cw_alarm" {
  provider            = aws.cw_region
  alarm_name          = "sqs-queue-visibility-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = "300" // 5 minutes
  statistic           = "SampleCount"
  threshold           = "300" // 5 minutes
  alarm_description   = "Alarm if the age of the oldest message in the queue is greater than 5 minutes."

  dimensions = {
    name  = "QueueName"
    value = join("-", ["qatalyst", var.service, "processing-queue"])
  }
  alarm_actions = [data.aws_sns_topic.current.arn] // Define actions to take when the alarm state changes
}