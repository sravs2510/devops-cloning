moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.table["user_profile"]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-user-profile"]
}
moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.table["workspaces"]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-info"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["block-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-block-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["external-panel-project"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-external-panel-project"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["media-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-media-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["media_notes"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-media-notes"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["panel_testers"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst_copilot"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-copilot"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["reports-collab-info"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-reports-collab"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["reports-lookup"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-report-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["session-meetings"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-session-meetings"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["stripe-events"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-stripe-events"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["study-publish-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-study-publish"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["study_custom_insights"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-custom-insights"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["study_details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-study-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["study_panel_testers"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["subscription_orders"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-subscription-orders"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["teams_details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-teams"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["tester-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["tester-events-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-events"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["tester-logs"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-logs"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["tester-response-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-responses"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts-details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["workflow-management"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workflow-management"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["workspace-configurations"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["workspace-metrics"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["workspace-testers-email"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["workspace-usage"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-usage"]
}

moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["block-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-block-details"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["external-panel-project"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-external-panel-project"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["media-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-media-details"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["media_notes"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-media-notes"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["panel_testers"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-panel-testers"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst_copilot"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-copilot"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["reports-collab-info"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-reports-collab"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["reports-lookup"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-report-details"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["session-meetings"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-session-meetings"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["stripe-events"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-stripe-events"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study-publish-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-publish"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study_custom_insights"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-custom-insights"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study_details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-details"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study_panel_testers"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["subscription_orders"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-subscription-orders"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["teams_details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-teams"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-details"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-events-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-events"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-logs"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-logs"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-response-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-responses"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["transcripts-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-details"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["transcripts_highlights"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["transcripts_tags"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workflow-management"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-workflow-management"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-configurations"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-metrics"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-testers-email"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-usage"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-usage"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["block-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-block-details"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["external-panel-project"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-external-panel-project"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["media-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-media-details"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["media_notes"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-media-notes"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["panel_testers"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-panel-testers"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst_copilot"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-copilot"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["reports-collab-info"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-reports-collab"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["reports-lookup"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-report-details"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["session-meetings"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-session-meetings"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["stripe-events"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-stripe-events"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["study-publish-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-study-publish"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["study_custom_insights"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-custom-insights"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["study_details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-study-details"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["study_panel_testers"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["subscription_orders"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-subscription-orders"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["teams_details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-teams"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["tester-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-tester-details"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["tester-events-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-tester-events"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["tester-logs"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-tester-logs"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["tester-response-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-tester-responses"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts-details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-details"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["workflow-management"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-workflow-management"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["workspace-configurations"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["workspace-metrics"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["workspace-testers-email"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.table["workspace-usage"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-usage"]
}

moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["block-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-block-details"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["external-panel-project"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-external-panel-project"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["media-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-media-details"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["media_notes"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-media-notes"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["panel_testers"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-panel-testers"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst_copilot"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-copilot"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["reports-collab-info"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-reports-collab"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["reports-lookup"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-report-details"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["session-meetings"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-session-meetings"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["stripe-events"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-stripe-events"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["study-publish-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-publish"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["study_custom_insights"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-custom-insights"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["study_details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-details"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["study_panel_testers"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["subscription_orders"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-subscription-orders"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["teams_details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-teams"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-details"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-events-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-events"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-logs"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-logs"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-response-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-responses"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["transcripts-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-details"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["transcripts_highlights"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["transcripts_tags"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["workflow-management"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-workflow-management"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-configurations"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-metrics"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-testers-email"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-usage"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-usage"]
}
moved {
  from = module.create_in_opensearch.aws_cloudwatch_metric_alarm.opensearch_cluster_status_cw_alarm
  to   = module.create_in_opensearch[0].aws_cloudwatch_metric_alarm.opensearch_cluster_status_cw_alarm
}
moved {
  from = module.create_in_opensearch.aws_cloudwatch_metric_alarm.opensearch_cpu_cw_alarm
  to   = module.create_in_opensearch[0].aws_cloudwatch_metric_alarm.opensearch_cpu_cw_alarm
}
moved {
  from = module.create_in_opensearch.aws_opensearch_domain.opensearch_domain
  to   = module.create_in_opensearch[0].aws_opensearch_domain.opensearch_domain
}
moved {
  from = module.create_in_opensearch.aws_security_group.opensearch_sg
  to   = module.create_in_opensearch[0].aws_security_group.opensearch_sg
}
moved {
  from = module.create_in_opensearch.aws_ssm_parameter.ssm_opensearch_master_password
  to   = module.create_in_opensearch[0].aws_ssm_parameter.ssm_opensearch_master_password
}
moved {
  from = module.create_in_opensearch.random_password.opensearch_master_password
  to   = module.create_in_opensearch[0].random_password.opensearch_master_password
}
moved {
  from = module.create_sea_opensearch.aws_cloudwatch_metric_alarm.opensearch_cluster_status_cw_alarm
  to   = module.create_sea_opensearch[0].aws_cloudwatch_metric_alarm.opensearch_cluster_status_cw_alarm
}

moved {
  from = module.create_sea_opensearch.aws_cloudwatch_metric_alarm.opensearch_cpu_cw_alarm
  to   = module.create_sea_opensearch[0].aws_cloudwatch_metric_alarm.opensearch_cpu_cw_alarm
}

moved {
  from = module.create_sea_opensearch.aws_opensearch_domain.opensearch_domain
  to   = module.create_sea_opensearch[0].aws_opensearch_domain.opensearch_domain
}

moved {
  from = module.create_sea_opensearch.aws_security_group.opensearch_sg
  to   = module.create_sea_opensearch[0].aws_security_group.opensearch_sg
}

moved {
  from = module.create_sea_opensearch.aws_ssm_parameter.ssm_opensearch_master_password
  to   = module.create_sea_opensearch[0].aws_ssm_parameter.ssm_opensearch_master_password
}

moved {
  from = module.create_sea_opensearch.random_password.opensearch_master_password
  to   = module.create_sea_opensearch[0].random_password.opensearch_master_password
}
moved {
  from = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-user-journey-processing-sqs"]
to = module.create_us_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-user-journey-processing-queue"]
}
moved {
  from =  module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
  to =  module.create_us_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-mammoth-processing-queue"]
}
moved {
  from = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
  to = module.create_us_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-furyblade-processing-queue"]
}
moved {
  from =  module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
  to = module.create_us_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-cyborg-processing-queue"]
}
moved {
  from = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-user-journey-processing-sqs"]
  to = module.create_us_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-user-journey-processing-queue"]
}
moved {
  from =  module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
  to =  module.create_us_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-mammoth-processing-queue"]
}
moved {
  from = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
  to = module.create_us_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-furyblade-processing-queue"]
}
moved {
  from = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
  to = module.create_us_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-cyborg-processing-queue"]
}
  

#EU
moved {
  from = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-user-journey-processing-sqs"]
to = module.create_eu_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-user-journey-processing-queue"]
}
moved {
  from =  module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
  to =  module.create_eu_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-mammoth-processing-queue"]
}
moved {
  from = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
  to = module.create_eu_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-furyblade-processing-queue"]
}
moved {
  from =  module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
  to = module.create_eu_sqs[0].aws_sqs_queue.sqs_queues_deadletter["qatalyst-cyborg-processing-queue"]
}
moved {
  from = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-user-journey-processing-sqs"]
  to = module.create_eu_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-user-journey-processing-queue"]
}
moved {
  from =  module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
  to =  module.create_eu_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-mammoth-processing-queue"]
}
moved {
  from = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
  to = module.create_eu_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-furyblade-processing-queue"]
}
moved {
  from = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
  to = module.create_eu_sqs[0].aws_sqs_queue.sqs_queues["qatalyst-cyborg-processing-queue"]
}
  