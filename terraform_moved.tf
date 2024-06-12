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