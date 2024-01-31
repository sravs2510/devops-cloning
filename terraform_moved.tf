moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_eu_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_eu_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_eu_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_in_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_in_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_in_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_sea_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_sea_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_sea_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_us_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_us_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_us_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.global_ddb_table_gsi_without_range["workspaces"]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["workspaces"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.global_ddb_table_gsi_without_range["user_profile"]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["user_profile"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table[1]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-user-workspace-mapping"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table[2]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-user-invites"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table[0]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-configurations"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table_without_range[0]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-cognito-mapping"]
}

moved {
  from = module.create_eu_acm_api.data.aws_region.datacenter_region
  to   = module.create_eu_acm_api[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_eu_acm_api.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_eu_acm_api[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_eu_acm_api.aws_acm_certificate.acm_domain_name
  to   = module.create_eu_acm_api[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_eu_acm_api.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_eu_acm_api[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_eu_acm_api.aws_route53_record.domain_record_sets["eu.dev.api.getqatalyst.io"]
  to   = module.create_eu_acm_api[0].aws_route53_record.domain_record_sets["eu.dev.api.getqatalyst.io"]
}
moved {
  from = module.create_eu_acm_invite_alb.data.aws_region.datacenter_region
  to   = module.create_eu_acm_invite_alb[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_eu_acm_invite_alb.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_eu_acm_invite_alb[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_eu_acm_invite_alb.aws_acm_certificate.acm_domain_name
  to   = module.create_eu_acm_invite_alb[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_eu_acm_invite_alb.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_eu_acm_invite_alb[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_eu_acm_invite_alb.aws_route53_record.domain_record_sets["dev.invite.getqatalyst.io"]
  to   = module.create_eu_acm_invite_alb[0].aws_route53_record.domain_record_sets["dev.invite.getqatalyst.io"]
}
moved {
  from = module.create_eu_acm_media_cf.data.aws_region.datacenter_region
  to   = module.create_eu_acm_media_cf[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_eu_acm_media_cf.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_eu_acm_media_cf[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_eu_acm_media_cf.aws_acm_certificate.acm_domain_name
  to   = module.create_eu_acm_media_cf[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_eu_acm_media_cf.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_eu_acm_media_cf[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_eu_acm_media_cf.aws_route53_record.domain_record_sets["eu.dev.media.getqatalyst.io"]
  to   = module.create_eu_acm_media_cf[0].aws_route53_record.domain_record_sets["eu.dev.media.getqatalyst.io"]
}
moved {
  from = module.create_eu_alb.data.aws_region.current
  to   = module.create_eu_alb[0].data.aws_region.current
}
moved {
  from = module.create_eu_alb.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_eu_alb[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_eu_alb.aws_lb.qatalyst_alb
  to   = module.create_eu_alb[0].aws_lb.qatalyst_alb
}
moved {
  from = module.create_eu_alb.aws_lb_listener.qatalyst_alb_listener
  to   = module.create_eu_alb[0].aws_lb_listener.qatalyst_alb_listener
}
moved {
  from = module.create_eu_alb.aws_lb_listener_certificate.qatalyst_invite_listener_certificate
  to   = module.create_eu_alb[0].aws_lb_listener_certificate.qatalyst_invite_listener_certificate
}
moved {
  from = module.create_eu_alb.aws_lb_listener_certificate.qatalyst_meet_listener_certificate
  to   = module.create_eu_alb[0].aws_lb_listener_certificate.qatalyst_meet_listener_certificate
}
moved {
  from = module.create_eu_alb.aws_lb_listener_certificate.qatalyst_reports_listener_certificate
  to   = module.create_eu_alb[0].aws_lb_listener_certificate.qatalyst_reports_listener_certificate
}
moved {
  from = module.create_eu_alb.aws_lb_listener_rule.qatalyst_alb_listener_prototype_rule
  to   = module.create_eu_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_prototype_rule
}
moved {
  from = module.create_eu_alb.aws_lb_listener_rule.qatalyst_alb_listener_reports_rule
  to   = module.create_eu_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_reports_rule
}
moved {
  from = module.create_eu_alb.aws_lb_listener_rule.qatalyst_alb_listener_tester_view_rule
  to   = module.create_eu_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_tester_view_rule
}
moved {
  from = module.create_eu_alb.aws_lb_target_group.qatalyst_prototype_tg
  to   = module.create_eu_alb[0].aws_lb_target_group.qatalyst_prototype_tg
}
moved {
  from = module.create_eu_alb.aws_lb_target_group.qatalyst_reports_tg
  to   = module.create_eu_alb[0].aws_lb_target_group.qatalyst_reports_tg
}
moved {
  from = module.create_eu_alb.aws_lb_target_group.qatalyst_tester_view_tg
  to   = module.create_eu_alb[0].aws_lb_target_group.qatalyst_tester_view_tg
}
moved {
  from = module.create_eu_alb.aws_lb_target_group.qatalyst_tg
  to   = module.create_eu_alb[0].aws_lb_target_group.qatalyst_tg
}
moved {
  from = module.create_eu_alb.aws_route53_record.qatalyst_api_domain_record
  to   = module.create_eu_alb[0].aws_route53_record.qatalyst_api_domain_record
}
moved {
  from = module.create_eu_alb.aws_security_group.qatalyst_alb_sg
  to   = module.create_eu_alb[0].aws_security_group.qatalyst_alb_sg
}
moved {
  from = module.create_eu_cloudwatch_dashboard.data.aws_region.current
  to   = module.create_eu_cloudwatch_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_eu_cloudwatch_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_eu_cloudwatch_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_eu_cloudwatch_prototype_dashboard.data.aws_region.current
  to   = module.create_eu_cloudwatch_prototype_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_eu_cloudwatch_prototype_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_eu_cloudwatch_prototype_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_eu_cloudwatch_reports_dashboard.data.aws_region.current
  to   = module.create_eu_cloudwatch_reports_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_eu_cloudwatch_reports_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_eu_cloudwatch_reports_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_eu_cloudwatch_tester_view_dashboard.data.aws_region.current
  to   = module.create_eu_cloudwatch_tester_view_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_eu_cloudwatch_tester_view_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_eu_cloudwatch_tester_view_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_eu_cyborg_ecr.data.aws_region.ecr_region
  to   = module.create_eu_cyborg_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_eu_cyborg_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_eu_cyborg_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_eu_cyborg_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_eu_cyborg_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_eu_cyborg_efs.data.aws_iam_policy_document.efs_policy
  to   = module.create_eu_cyborg_efs[0].data.aws_iam_policy_document.efs_policy
}
moved {
  from = module.create_eu_cyborg_efs.data.aws_region.current
  to   = module.create_eu_cyborg_efs[0].data.aws_region.current
}
moved {
  from = module.create_eu_cyborg_efs.aws_efs_access_point.access_point
  to   = module.create_eu_cyborg_efs[0].aws_efs_access_point.access_point
}
moved {
  from = module.create_eu_cyborg_efs.aws_efs_file_system.efs
  to   = module.create_eu_cyborg_efs[0].aws_efs_file_system.efs
}
moved {
  from = module.create_eu_cyborg_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_eu_cyborg_efs[0].aws_efs_file_system_policy.efs_policy
}
moved {
  from = module.create_eu_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_eu_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}
moved {
  from = module.create_eu_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_eu_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}
moved {
  from = module.create_eu_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_eu_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["block-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["block-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["external-panel-project"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["external-panel-project"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["media-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["media-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["panel_testers"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["panel_testers"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["reports-collab-info"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["reports-collab-info"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["reports-lookup"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["reports-lookup"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["session-meetings"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["session-meetings"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["stripe-events"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["stripe-events"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["study-publish-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study-publish-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["study_custom_insights"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study_custom_insights"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["study_details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study_details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["study_panel_testers"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["study_panel_testers"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["subscription_orders"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["subscription_orders"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["tester-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["tester-events-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-events-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["tester-logs"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-logs"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["tester-response-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["tester-response-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts-details"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["transcripts-details"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["transcripts_highlights"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["transcripts_tags"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["workspace-configurations"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-configurations"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["workspace-metrics"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-metrics"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["workspace-testers-email"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-testers-email"]
}
moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.table["workspace-usage"]
  to   = module.create_eu_dynamodb[0].aws_dynamodb_table.table["workspace-usage"]
}
moved {
  from = module.create_eu_ecr.data.aws_region.ecr_region
  to   = module.create_eu_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_eu_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_eu_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_eu_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_eu_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_eu_ecs.data.aws_caller_identity.current
  to   = module.create_eu_ecs[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs.data.aws_region.ecs_region
  to   = module.create_eu_ecs[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs.aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_eu_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
}
moved {
  from = module.create_eu_ecs.aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_eu_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
}
moved {
  from = module.create_eu_ecs.aws_security_group.qatalyst_ecs_sg
  to   = module.create_eu_ecs[0].aws_security_group.qatalyst_ecs_sg
}
moved {
  from = module.create_eu_ecs_cyborg_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_cyborg_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_cyborg_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_cyborg_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_cyborg_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_cyborg_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_cyborg_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_cyborg_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_cyborg_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_cyborg_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_ecs_dashboard_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_dashboard_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_dashboard_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_dashboard_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_dashboard_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_dashboard_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_dashboard_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_dashboard_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_dashboard_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_dashboard_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_dashboard_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_dashboard_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_dashboard_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_dashboard_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_ecs_furyblade_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_furyblade_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_furyblade_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_furyblade_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_furyblade_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_furyblade_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_furyblade_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_furyblade_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_furyblade_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_furyblade_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_ecs_mammoth_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_mammoth_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_mammoth_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_mammoth_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_mammoth_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_mammoth_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_mammoth_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_mammoth_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_mammoth_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_mammoth_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_ecs_prototype_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_prototype_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_prototype_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_prototype_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_prototype_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_prototype_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_prototype_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_prototype_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_prototype_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_prototype_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_prototype_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_prototype_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_prototype_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_prototype_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_ecs_reports_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_reports_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_reports_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_reports_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_reports_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_reports_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_reports_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_reports_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_reports_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_reports_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_reports_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_reports_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_reports_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_reports_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_ecs_testerview_service.data.aws_caller_identity.current
  to   = module.create_eu_ecs_testerview_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_eu_ecs_testerview_service.data.aws_region.ecs_region
  to   = module.create_eu_ecs_testerview_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_eu_ecs_testerview_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_eu_ecs_testerview_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_eu_ecs_testerview_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_eu_ecs_testerview_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_eu_ecs_testerview_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_eu_ecs_testerview_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_eu_ecs_testerview_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_eu_ecs_testerview_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_eu_ecs_testerview_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_eu_ecs_testerview_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_eu_furyblade_ecr.data.aws_region.ecr_region
  to   = module.create_eu_furyblade_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_eu_furyblade_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_eu_furyblade_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_eu_furyblade_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_eu_furyblade_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_eu_furyblade_efs.data.aws_iam_policy_document.efs_policy
  to   = module.create_eu_furyblade_efs[0].data.aws_iam_policy_document.efs_policy
}
moved {
  from = module.create_eu_furyblade_efs.data.aws_region.current
  to   = module.create_eu_furyblade_efs[0].data.aws_region.current
}
moved {
  from = module.create_eu_furyblade_efs.aws_efs_access_point.access_point
  to   = module.create_eu_furyblade_efs[0].aws_efs_access_point.access_point
}
moved {
  from = module.create_eu_furyblade_efs.aws_efs_file_system.efs
  to   = module.create_eu_furyblade_efs[0].aws_efs_file_system.efs
}
moved {
  from = module.create_eu_furyblade_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_eu_furyblade_efs[0].aws_efs_file_system_policy.efs_policy
}
moved {
  from = module.create_eu_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_eu_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}
moved {
  from = module.create_eu_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_eu_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}
moved {
  from = module.create_eu_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_eu_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_eu_mammoth_ecr.data.aws_region.ecr_region
  to   = module.create_eu_mammoth_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_eu_mammoth_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_eu_mammoth_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_eu_mammoth_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_eu_mammoth_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_eu_mammoth_efs.data.aws_iam_policy_document.efs_policy
  to   = module.create_eu_mammoth_efs[0].data.aws_iam_policy_document.efs_policy
}
moved {
  from = module.create_eu_mammoth_efs.data.aws_region.current
  to   = module.create_eu_mammoth_efs[0].data.aws_region.current
}
moved {
  from = module.create_eu_mammoth_efs.aws_efs_access_point.access_point
  to   = module.create_eu_mammoth_efs[0].aws_efs_access_point.access_point
}
moved {
  from = module.create_eu_mammoth_efs.aws_efs_file_system.efs
  to   = module.create_eu_mammoth_efs[0].aws_efs_file_system.efs
}
moved {
  from = module.create_eu_mammoth_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_eu_mammoth_efs[0].aws_efs_file_system_policy.efs_policy
}
moved {
  from = module.create_eu_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_eu_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}
moved {
  from = module.create_eu_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_eu_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}
moved {
  from = module.create_eu_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_eu_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_eu_media_cloudfront.data.aws_cloudfront_response_headers_policy.response_headers_policy
  to   = module.create_eu_media_cloudfront[0].data.aws_cloudfront_response_headers_policy.response_headers_policy
}
moved {
  from = module.create_eu_media_cloudfront.data.aws_iam_policy_document.media_s3_bucket_policy_document
  to   = module.create_eu_media_cloudfront[0].data.aws_iam_policy_document.media_s3_bucket_policy_document
}
moved {
  from = module.create_eu_media_cloudfront.data.aws_region.current
  to   = module.create_eu_media_cloudfront[0].data.aws_region.current
}
moved {
  from = module.create_eu_media_cloudfront.data.aws_route53_zone.route53_zone
  to   = module.create_eu_media_cloudfront[0].data.aws_route53_zone.route53_zone
}
moved {
  from = module.create_eu_media_cloudfront.aws_cloudfront_distribution.media_cf_distribution
  to   = module.create_eu_media_cloudfront[0].aws_cloudfront_distribution.media_cf_distribution
}
moved {
  from = module.create_eu_media_cloudfront.aws_cloudfront_origin_access_identity.media_s3_origin_identity
  to   = module.create_eu_media_cloudfront[0].aws_cloudfront_origin_access_identity.media_s3_origin_identity
}
moved {
  from = module.create_eu_media_cloudfront.aws_route53_record.media_cf_r53_record
  to   = module.create_eu_media_cloudfront[0].aws_route53_record.media_cf_r53_record
}
moved {
  from = module.create_eu_media_cloudfront.aws_s3_bucket_policy.media_s3_bucket_policy
  to   = module.create_eu_media_cloudfront[0].aws_s3_bucket_policy.media_s3_bucket_policy
}
moved {
  from = module.create_eu_media_convert_queue.data.aws_region.current
  to   = module.create_eu_media_convert_queue[0].data.aws_region.current
}
moved {
  from = module.create_eu_media_convert_queue.aws_media_convert_queue.mediaconvert_queue["qatalyst"]
  to   = module.create_eu_media_convert_queue[0].aws_media_convert_queue.mediaconvert_queue["qatalyst"]
}
moved {
  from = module.create_eu_meet_acm_cf.data.aws_region.datacenter_region
  to   = module.create_eu_meet_acm_cf[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_eu_meet_acm_cf.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_eu_meet_acm_cf[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_eu_meet_acm_cf.aws_acm_certificate.acm_domain_name
  to   = module.create_eu_meet_acm_cf[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_eu_meet_acm_cf.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_eu_meet_acm_cf[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_eu_meet_acm_cf.aws_route53_record.domain_record_sets["dev.meet.getqatalyst.io"]
  to   = module.create_eu_meet_acm_cf[0].aws_route53_record.domain_record_sets["dev.meet.getqatalyst.io"]
}
moved {
  from = module.create_eu_qatalyst_media_bucket.data.aws_region.current
  to   = module.create_eu_qatalyst_media_bucket[0].data.aws_region.current
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket.s3_bucket
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket.s3_bucket
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket_accelerate_configuration.s3_transfer_acceleration[0]
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket_accelerate_configuration.s3_transfer_acceleration[0]
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket_acl.s3_bucket_acl
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket_acl.s3_bucket_acl
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket_cors_configuration.aws_cors_config
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket_cors_configuration.aws_cors_config
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
}
moved {
  from = module.create_eu_qatalyst_media_bucket.aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  to   = module.create_eu_qatalyst_media_bucket[0].aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
moved {
  from = module.create_eu_reports_acm.data.aws_region.datacenter_region
  to   = module.create_eu_reports_acm[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_eu_reports_acm.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_eu_reports_acm[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_eu_reports_acm.aws_acm_certificate.acm_domain_name
  to   = module.create_eu_reports_acm[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_eu_reports_acm.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_eu_reports_acm[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_eu_reports_acm.aws_route53_record.domain_record_sets["dev.reports.getqatalyst.io"]
  to   = module.create_eu_reports_acm[0].aws_route53_record.domain_record_sets["dev.reports.getqatalyst.io"]
}
moved {
  from = module.create_eu_s3_bucket.data.aws_region.current
  to   = module.create_eu_s3_bucket[0].data.aws_region.current
}
moved {
  from = module.create_eu_s3_bucket.aws_s3_bucket.s3_bucket
  to   = module.create_eu_s3_bucket[0].aws_s3_bucket.s3_bucket
}
moved {
  from = module.create_eu_s3_bucket.aws_s3_bucket_acl.s3_bucket_acl
  to   = module.create_eu_s3_bucket[0].aws_s3_bucket_acl.s3_bucket_acl
}
moved {
  from = module.create_eu_s3_bucket.aws_s3_bucket_cors_configuration.aws_cors_config
  to   = module.create_eu_s3_bucket[0].aws_s3_bucket_cors_configuration.aws_cors_config
}
moved {
  from = module.create_eu_s3_bucket.aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
  to   = module.create_eu_s3_bucket[0].aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
}
moved {
  from = module.create_eu_s3_bucket.aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
  to   = module.create_eu_s3_bucket[0].aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
}
moved {
  from = module.create_eu_s3_bucket.aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  to   = module.create_eu_s3_bucket[0].aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
moved {
  from = module.create_eu_sqs.data.aws_region.current
  to   = module.create_eu_sqs[0].data.aws_region.current
}
moved {
  from = module.create_eu_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
  to   = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
}
moved {
  from = module.create_eu_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
  to   = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
}
moved {
  from = module.create_eu_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
  to   = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
}
moved {
  from = module.create_eu_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
  to   = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
}
moved {
  from = module.create_eu_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
  to   = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
}
moved {
  from = module.create_eu_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
  to   = module.create_eu_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
}
moved {
  from = module.create_eu_ssm.data.aws_region.ssm_region
  to   = module.create_eu_ssm[0].data.aws_region.ssm_region
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-dev-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-dev-api-key"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
}
moved {
  from = module.create_eu_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_eu_ssm.random_uuid.feature_flag_auth
  to   = module.create_eu_ssm[0].random_uuid.feature_flag_auth
}
moved {
  from = module.create_eu_vpc.data.aws_availability_zones.available
  to   = module.create_eu_vpc[0].data.aws_availability_zones.available
}
moved {
  from = module.create_eu_vpc.data.aws_region.current
  to   = module.create_eu_vpc[0].data.aws_region.current
}
moved {
  from = module.create_eu_vpc.aws_eip.eip_nat_gateway
  to   = module.create_eu_vpc[0].aws_eip.eip_nat_gateway
}
moved {
  from = module.create_eu_vpc.aws_internet_gateway.vpc_gateway
  to   = module.create_eu_vpc[0].aws_internet_gateway.vpc_gateway
}
moved {
  from = module.create_eu_vpc.aws_main_route_table_association.route_table_association
  to   = module.create_eu_vpc[0].aws_main_route_table_association.route_table_association
}
moved {
  from = module.create_eu_vpc.aws_nat_gateway.nat_gateway
  to   = module.create_eu_vpc[0].aws_nat_gateway.nat_gateway
}
moved {
  from = module.create_eu_vpc.aws_route_table.main_routetable
  to   = module.create_eu_vpc[0].aws_route_table.main_routetable
}
moved {
  from = module.create_eu_vpc.aws_route_table.private_route_table
  to   = module.create_eu_vpc[0].aws_route_table.private_route_table
}
moved {
  from = module.create_eu_vpc.aws_route_table.public_route_table
  to   = module.create_eu_vpc[0].aws_route_table.public_route_table
}
moved {
  from = module.create_eu_vpc.aws_route_table_association.private[0]
  to   = module.create_eu_vpc[0].aws_route_table_association.private[0]
}
moved {
  from = module.create_eu_vpc.aws_route_table_association.private[1]
  to   = module.create_eu_vpc[0].aws_route_table_association.private[1]
}
moved {
  from = module.create_eu_vpc.aws_route_table_association.private[2]
  to   = module.create_eu_vpc[0].aws_route_table_association.private[2]
}
moved {
  from = module.create_eu_vpc.aws_route_table_association.public[0]
  to   = module.create_eu_vpc[0].aws_route_table_association.public[0]
}
moved {
  from = module.create_eu_vpc.aws_route_table_association.public[1]
  to   = module.create_eu_vpc[0].aws_route_table_association.public[1]
}
moved {
  from = module.create_eu_vpc.aws_route_table_association.public[2]
  to   = module.create_eu_vpc[0].aws_route_table_association.public[2]
}
moved {
  from = module.create_eu_vpc.aws_security_group.cyborg_security_group
  to   = module.create_eu_vpc[0].aws_security_group.cyborg_security_group
}
moved {
  from = module.create_eu_vpc.aws_subnet.private_subnet[0]
  to   = module.create_eu_vpc[0].aws_subnet.private_subnet[0]
}
moved {
  from = module.create_eu_vpc.aws_subnet.private_subnet[1]
  to   = module.create_eu_vpc[0].aws_subnet.private_subnet[1]
}
moved {
  from = module.create_eu_vpc.aws_subnet.private_subnet[2]
  to   = module.create_eu_vpc[0].aws_subnet.private_subnet[2]
}
moved {
  from = module.create_eu_vpc.aws_subnet.public_subnet[0]
  to   = module.create_eu_vpc[0].aws_subnet.public_subnet[0]
}
moved {
  from = module.create_eu_vpc.aws_subnet.public_subnet[1]
  to   = module.create_eu_vpc[0].aws_subnet.public_subnet[1]
}
moved {
  from = module.create_eu_vpc.aws_subnet.public_subnet[2]
  to   = module.create_eu_vpc[0].aws_subnet.public_subnet[2]
}
moved {
  from = module.create_eu_vpc.aws_vpc.main
  to   = module.create_eu_vpc[0].aws_vpc.main
}
moved {
  from = module.create_eu_vpc.aws_vpc_endpoint.dynamodb_endpoint
  to   = module.create_eu_vpc[0].aws_vpc_endpoint.dynamodb_endpoint
}
moved {
  from = module.create_eu_vpc.aws_vpc_endpoint.efs_endpoint
  to   = module.create_eu_vpc[0].aws_vpc_endpoint.efs_endpoint
}
moved {
  from = module.create_eu_vpc.aws_vpc_endpoint.s3_endpoint
  to   = module.create_eu_vpc[0].aws_vpc_endpoint.s3_endpoint
}
moved {
  from = module.create_us_acm_api.data.aws_region.datacenter_region
  to   = module.create_us_acm_api[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_us_acm_api.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_us_acm_api[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_us_acm_api.aws_acm_certificate.acm_domain_name
  to   = module.create_us_acm_api[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_us_acm_api.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_us_acm_api[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_us_acm_api.aws_route53_record.domain_record_sets["us.dev.api.getqatalyst.io"]
  to   = module.create_us_acm_api[0].aws_route53_record.domain_record_sets["us.dev.api.getqatalyst.io"]
}
moved {
  from = module.create_us_acm_media_cf.data.aws_region.datacenter_region
  to   = module.create_us_acm_media_cf[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_us_acm_media_cf.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_us_acm_media_cf[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_us_acm_media_cf.aws_acm_certificate.acm_domain_name
  to   = module.create_us_acm_media_cf[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_us_acm_media_cf.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_us_acm_media_cf[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_us_acm_media_cf.aws_route53_record.domain_record_sets["us.dev.media.getqatalyst.io"]
  to   = module.create_us_acm_media_cf[0].aws_route53_record.domain_record_sets["us.dev.media.getqatalyst.io"]
}
moved {
  from = module.create_us_alb.data.aws_region.current
  to   = module.create_us_alb[0].data.aws_region.current
}
moved {
  from = module.create_us_alb.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_us_alb[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_us_alb.aws_lb.qatalyst_alb
  to   = module.create_us_alb[0].aws_lb.qatalyst_alb
}
moved {
  from = module.create_us_alb.aws_lb_listener.qatalyst_alb_listener
  to   = module.create_us_alb[0].aws_lb_listener.qatalyst_alb_listener
}
moved {
  from = module.create_us_alb.aws_lb_listener_certificate.qatalyst_invite_listener_certificate
  to   = module.create_us_alb[0].aws_lb_listener_certificate.qatalyst_invite_listener_certificate
}
moved {
  from = module.create_us_alb.aws_lb_listener_certificate.qatalyst_meet_listener_certificate
  to   = module.create_us_alb[0].aws_lb_listener_certificate.qatalyst_meet_listener_certificate
}
moved {
  from = module.create_us_alb.aws_lb_listener_certificate.qatalyst_reports_listener_certificate
  to   = module.create_us_alb[0].aws_lb_listener_certificate.qatalyst_reports_listener_certificate
}
moved {
  from = module.create_us_alb.aws_lb_listener_rule.qatalyst_alb_listener_prototype_rule
  to   = module.create_us_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_prototype_rule
}
moved {
  from = module.create_us_alb.aws_lb_listener_rule.qatalyst_alb_listener_reports_rule
  to   = module.create_us_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_reports_rule
}
moved {
  from = module.create_us_alb.aws_lb_listener_rule.qatalyst_alb_listener_tester_view_rule
  to   = module.create_us_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_tester_view_rule
}
moved {
  from = module.create_us_alb.aws_lb_target_group.qatalyst_prototype_tg
  to   = module.create_us_alb[0].aws_lb_target_group.qatalyst_prototype_tg
}
moved {
  from = module.create_us_alb.aws_lb_target_group.qatalyst_reports_tg
  to   = module.create_us_alb[0].aws_lb_target_group.qatalyst_reports_tg
}
moved {
  from = module.create_us_alb.aws_lb_target_group.qatalyst_tester_view_tg
  to   = module.create_us_alb[0].aws_lb_target_group.qatalyst_tester_view_tg
}
moved {
  from = module.create_us_alb.aws_lb_target_group.qatalyst_tg
  to   = module.create_us_alb[0].aws_lb_target_group.qatalyst_tg
}
moved {
  from = module.create_us_alb.aws_route53_record.qatalyst_api_domain_record
  to   = module.create_us_alb[0].aws_route53_record.qatalyst_api_domain_record
}
moved {
  from = module.create_us_alb.aws_security_group.qatalyst_alb_sg
  to   = module.create_us_alb[0].aws_security_group.qatalyst_alb_sg
}
moved {
  from = module.create_us_cloudwatch_dashboard.data.aws_region.current
  to   = module.create_us_cloudwatch_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_us_cloudwatch_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_us_cloudwatch_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_us_cloudwatch_prototype_dashboard.data.aws_region.current
  to   = module.create_us_cloudwatch_prototype_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_us_cloudwatch_prototype_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_us_cloudwatch_prototype_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_us_cloudwatch_reports_dashboard.data.aws_region.current
  to   = module.create_us_cloudwatch_reports_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_us_cloudwatch_reports_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_us_cloudwatch_reports_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_us_cloudwatch_tester_view_dashboard.data.aws_region.current
  to   = module.create_us_cloudwatch_tester_view_dashboard[0].data.aws_region.current
}
moved {
  from = module.create_us_cloudwatch_tester_view_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_us_cloudwatch_tester_view_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_us_cyborg_ecr.data.aws_region.ecr_region
  to   = module.create_us_cyborg_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_us_cyborg_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_us_cyborg_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_us_cyborg_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_us_cyborg_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_us_cyborg_efs.data.aws_iam_policy_document.efs_policy
  to   = module.create_us_cyborg_efs[0].data.aws_iam_policy_document.efs_policy
}
moved {
  from = module.create_us_cyborg_efs.data.aws_region.current
  to   = module.create_us_cyborg_efs[0].data.aws_region.current
}
moved {
  from = module.create_us_cyborg_efs.aws_efs_access_point.access_point
  to   = module.create_us_cyborg_efs[0].aws_efs_access_point.access_point
}
moved {
  from = module.create_us_cyborg_efs.aws_efs_file_system.efs
  to   = module.create_us_cyborg_efs[0].aws_efs_file_system.efs
}
moved {
  from = module.create_us_cyborg_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_us_cyborg_efs[0].aws_efs_file_system_policy.efs_policy
}
moved {
  from = module.create_us_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_us_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}
moved {
  from = module.create_us_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_us_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}
moved {
  from = module.create_us_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_us_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["block-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["block-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["external-panel-project"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["external-panel-project"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["media-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["media-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["panel_testers"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["panel_testers"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["reports-collab-info"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["reports-collab-info"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["reports-lookup"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["reports-lookup"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["session-meetings"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["session-meetings"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["stripe-events"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["stripe-events"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["study-publish-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["study-publish-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["study_custom_insights"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["study_custom_insights"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["study_details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["study_details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["study_panel_testers"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["study_panel_testers"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["subscription_orders"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["subscription_orders"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["tester-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["tester-events-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-events-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["tester-logs"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-logs"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["tester-response-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["tester-response-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts-details"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["transcripts-details"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["transcripts_highlights"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["transcripts_tags"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["workspace-configurations"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-configurations"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["workspace-metrics"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-metrics"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["workspace-testers-email"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-testers-email"]
}
moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.table["workspace-usage"]
  to   = module.create_us_dynamodb[0].aws_dynamodb_table.table["workspace-usage"]
}
moved {
  from = module.create_us_ecr.data.aws_region.ecr_region
  to   = module.create_us_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_us_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_us_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_us_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_us_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_us_ecs.data.aws_caller_identity.current
  to   = module.create_us_ecs[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs.data.aws_region.ecs_region
  to   = module.create_us_ecs[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs.aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_us_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
}
moved {
  from = module.create_us_ecs.aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_us_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
}
moved {
  from = module.create_us_ecs.aws_security_group.qatalyst_ecs_sg
  to   = module.create_us_ecs[0].aws_security_group.qatalyst_ecs_sg
}
moved {
  from = module.create_us_ecs_cyborg_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_cyborg_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_cyborg_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_cyborg_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_cyborg_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_cyborg_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_cyborg_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_cyborg_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_cyborg_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_cyborg_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_ecs_dashboard_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_dashboard_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_dashboard_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_dashboard_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_dashboard_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_dashboard_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_dashboard_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_dashboard_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_dashboard_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_dashboard_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_dashboard_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_dashboard_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_dashboard_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_dashboard_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_ecs_furyblade_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_furyblade_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_furyblade_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_furyblade_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_furyblade_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_furyblade_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_furyblade_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_furyblade_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_furyblade_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_furyblade_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_ecs_mammoth_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_mammoth_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_mammoth_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_mammoth_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_mammoth_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_mammoth_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_mammoth_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_mammoth_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_mammoth_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_mammoth_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_ecs_prototype_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_prototype_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_prototype_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_prototype_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_prototype_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_prototype_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_prototype_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_prototype_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_prototype_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_prototype_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_prototype_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_prototype_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_prototype_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_prototype_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_ecs_reports_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_reports_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_reports_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_reports_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_reports_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_reports_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_reports_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_reports_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_reports_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_reports_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_reports_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_reports_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_reports_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_reports_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_ecs_testerview_service.data.aws_caller_identity.current
  to   = module.create_us_ecs_testerview_service[0].data.aws_caller_identity.current
}
moved {
  from = module.create_us_ecs_testerview_service.data.aws_region.ecs_region
  to   = module.create_us_ecs_testerview_service[0].data.aws_region.ecs_region
}
moved {
  from = module.create_us_ecs_testerview_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_us_ecs_testerview_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}
moved {
  from = module.create_us_ecs_testerview_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_us_ecs_testerview_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}
moved {
  from = module.create_us_ecs_testerview_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_us_ecs_testerview_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}
moved {
  from = module.create_us_ecs_testerview_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_us_ecs_testerview_service[0].aws_ecs_service.qatalyst_ecs_service
}
moved {
  from = module.create_us_ecs_testerview_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_us_ecs_testerview_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_us_furyblade_ecr.data.aws_region.ecr_region
  to   = module.create_us_furyblade_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_us_furyblade_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_us_furyblade_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_us_furyblade_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_us_furyblade_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_us_furyblade_efs.data.aws_iam_policy_document.efs_policy
  to   = module.create_us_furyblade_efs[0].data.aws_iam_policy_document.efs_policy
}
moved {
  from = module.create_us_furyblade_efs.data.aws_region.current
  to   = module.create_us_furyblade_efs[0].data.aws_region.current
}
moved {
  from = module.create_us_furyblade_efs.aws_efs_access_point.access_point
  to   = module.create_us_furyblade_efs[0].aws_efs_access_point.access_point
}
moved {
  from = module.create_us_furyblade_efs.aws_efs_file_system.efs
  to   = module.create_us_furyblade_efs[0].aws_efs_file_system.efs
}
moved {
  from = module.create_us_furyblade_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_us_furyblade_efs[0].aws_efs_file_system_policy.efs_policy
}
moved {
  from = module.create_us_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_us_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}
moved {
  from = module.create_us_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_us_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}
moved {
  from = module.create_us_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_us_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_us_invite_acm_cf_alb.data.aws_region.datacenter_region
  to   = module.create_us_invite_acm_cf_alb[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_us_invite_acm_cf_alb.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_us_invite_acm_cf_alb[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_us_invite_acm_cf_alb.aws_acm_certificate.acm_domain_name
  to   = module.create_us_invite_acm_cf_alb[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_us_invite_acm_cf_alb.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_us_invite_acm_cf_alb[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_us_invite_acm_cf_alb.aws_route53_record.domain_record_sets["dev.invite.getqatalyst.io"]
  to   = module.create_us_invite_acm_cf_alb[0].aws_route53_record.domain_record_sets["dev.invite.getqatalyst.io"]
}
moved {
  from = module.create_us_mammoth_ecr.data.aws_region.ecr_region
  to   = module.create_us_mammoth_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_us_mammoth_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_us_mammoth_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_us_mammoth_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_us_mammoth_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_us_mammoth_efs.data.aws_iam_policy_document.efs_policy
  to   = module.create_us_mammoth_efs[0].data.aws_iam_policy_document.efs_policy
}
moved {
  from = module.create_us_mammoth_efs.data.aws_region.current
  to   = module.create_us_mammoth_efs[0].data.aws_region.current
}
moved {
  from = module.create_us_mammoth_efs.aws_efs_access_point.access_point
  to   = module.create_us_mammoth_efs[0].aws_efs_access_point.access_point
}
moved {
  from = module.create_us_mammoth_efs.aws_efs_file_system.efs
  to   = module.create_us_mammoth_efs[0].aws_efs_file_system.efs
}
moved {
  from = module.create_us_mammoth_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_us_mammoth_efs[0].aws_efs_file_system_policy.efs_policy
}
moved {
  from = module.create_us_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_us_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}
moved {
  from = module.create_us_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_us_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}
moved {
  from = module.create_us_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_us_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_us_media_cloudfront.data.aws_cloudfront_response_headers_policy.response_headers_policy
  to   = module.create_us_media_cloudfront[0].data.aws_cloudfront_response_headers_policy.response_headers_policy
}
moved {
  from = module.create_us_media_cloudfront.data.aws_iam_policy_document.media_s3_bucket_policy_document
  to   = module.create_us_media_cloudfront[0].data.aws_iam_policy_document.media_s3_bucket_policy_document
}
moved {
  from = module.create_us_media_cloudfront.data.aws_region.current
  to   = module.create_us_media_cloudfront[0].data.aws_region.current
}
moved {
  from = module.create_us_media_cloudfront.data.aws_route53_zone.route53_zone
  to   = module.create_us_media_cloudfront[0].data.aws_route53_zone.route53_zone
}
moved {
  from = module.create_us_media_cloudfront.aws_cloudfront_distribution.media_cf_distribution
  to   = module.create_us_media_cloudfront[0].aws_cloudfront_distribution.media_cf_distribution
}
moved {
  from = module.create_us_media_cloudfront.aws_cloudfront_origin_access_identity.media_s3_origin_identity
  to   = module.create_us_media_cloudfront[0].aws_cloudfront_origin_access_identity.media_s3_origin_identity
}
moved {
  from = module.create_us_media_cloudfront.aws_route53_record.media_cf_r53_record
  to   = module.create_us_media_cloudfront[0].aws_route53_record.media_cf_r53_record
}
moved {
  from = module.create_us_media_cloudfront.aws_s3_bucket_policy.media_s3_bucket_policy
  to   = module.create_us_media_cloudfront[0].aws_s3_bucket_policy.media_s3_bucket_policy
}
moved {
  from = module.create_us_media_convert_queue.data.aws_region.current
  to   = module.create_us_media_convert_queue[0].data.aws_region.current
}
moved {
  from = module.create_us_media_convert_queue.aws_media_convert_queue.mediaconvert_queue["qatalyst"]
  to   = module.create_us_media_convert_queue[0].aws_media_convert_queue.mediaconvert_queue["qatalyst"]
}
moved {
  from = module.create_us_meet_acm_cf.data.aws_region.datacenter_region
  to   = module.create_us_meet_acm_cf[0].data.aws_region.datacenter_region
}
moved {
  from = module.create_us_meet_acm_cf.data.aws_route53_zone.domain_hosted_zone
  to   = module.create_us_meet_acm_cf[0].data.aws_route53_zone.domain_hosted_zone
}
moved {
  from = module.create_us_meet_acm_cf.aws_acm_certificate.acm_domain_name
  to   = module.create_us_meet_acm_cf[0].aws_acm_certificate.acm_domain_name
}
moved {
  from = module.create_us_meet_acm_cf.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_us_meet_acm_cf[0].aws_acm_certificate_validation.acm_domain_validation
}
moved {
  from = module.create_us_meet_acm_cf.aws_route53_record.domain_record_sets["dev.meet.getqatalyst.io"]
  to   = module.create_us_meet_acm_cf[0].aws_route53_record.domain_record_sets["dev.meet.getqatalyst.io"]
}
moved {
  from = module.create_us_qatalyst_media_bucket.data.aws_region.current
  to   = module.create_us_qatalyst_media_bucket[0].data.aws_region.current
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket.s3_bucket
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket.s3_bucket
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket_accelerate_configuration.s3_transfer_acceleration[0]
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket_accelerate_configuration.s3_transfer_acceleration[0]
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket_acl.s3_bucket_acl
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket_acl.s3_bucket_acl
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket_cors_configuration.aws_cors_config
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket_cors_configuration.aws_cors_config
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
}
moved {
  from = module.create_us_qatalyst_media_bucket.aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  to   = module.create_us_qatalyst_media_bucket[0].aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
moved {
  from = module.create_us_s3_bucket.data.aws_region.current
  to   = module.create_us_s3_bucket[0].data.aws_region.current
}
moved {
  from = module.create_us_s3_bucket.aws_s3_bucket.s3_bucket
  to   = module.create_us_s3_bucket[0].aws_s3_bucket.s3_bucket
}
moved {
  from = module.create_us_s3_bucket.aws_s3_bucket_acl.s3_bucket_acl
  to   = module.create_us_s3_bucket[0].aws_s3_bucket_acl.s3_bucket_acl
}
moved {
  from = module.create_us_s3_bucket.aws_s3_bucket_cors_configuration.aws_cors_config
  to   = module.create_us_s3_bucket[0].aws_s3_bucket_cors_configuration.aws_cors_config
}
moved {
  from = module.create_us_s3_bucket.aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
  to   = module.create_us_s3_bucket[0].aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
}
moved {
  from = module.create_us_s3_bucket.aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
  to   = module.create_us_s3_bucket[0].aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
}
moved {
  from = module.create_us_s3_bucket.aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  to   = module.create_us_s3_bucket[0].aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
moved {
  from = module.create_us_sqs.data.aws_region.current
  to   = module.create_us_sqs[0].data.aws_region.current
}
moved {
  from = module.create_us_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
  to   = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
}
moved {
  from = module.create_us_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
  to   = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
}
moved {
  from = module.create_us_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
  to   = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
}
moved {
  from = module.create_us_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
  to   = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
}
moved {
  from = module.create_us_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
  to   = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
}
moved {
  from = module.create_us_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
  to   = module.create_us_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
}
moved {
  from = module.create_us_ssm.data.aws_region.ssm_region
  to   = module.create_us_ssm[0].data.aws_region.ssm_region
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-dev-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-dev-api-key"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
}
moved {
  from = module.create_us_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_us_ssm.random_uuid.feature_flag_auth
  to   = module.create_us_ssm[0].random_uuid.feature_flag_auth
}
moved {
  from = module.create_us_vpc.data.aws_availability_zones.available
  to   = module.create_us_vpc[0].data.aws_availability_zones.available
}
moved {
  from = module.create_us_vpc.data.aws_region.current
  to   = module.create_us_vpc[0].data.aws_region.current
}
moved {
  from = module.create_us_vpc.aws_eip.eip_nat_gateway
  to   = module.create_us_vpc[0].aws_eip.eip_nat_gateway
}
moved {
  from = module.create_us_vpc.aws_internet_gateway.vpc_gateway
  to   = module.create_us_vpc[0].aws_internet_gateway.vpc_gateway
}
moved {
  from = module.create_us_vpc.aws_main_route_table_association.route_table_association
  to   = module.create_us_vpc[0].aws_main_route_table_association.route_table_association
}
moved {
  from = module.create_us_vpc.aws_nat_gateway.nat_gateway
  to   = module.create_us_vpc[0].aws_nat_gateway.nat_gateway
}
moved {
  from = module.create_us_vpc.aws_route_table.main_routetable
  to   = module.create_us_vpc[0].aws_route_table.main_routetable
}
moved {
  from = module.create_us_vpc.aws_route_table.private_route_table
  to   = module.create_us_vpc[0].aws_route_table.private_route_table
}
moved {
  from = module.create_us_vpc.aws_route_table.public_route_table
  to   = module.create_us_vpc[0].aws_route_table.public_route_table
}
moved {
  from = module.create_us_vpc.aws_route_table_association.private[0]
  to   = module.create_us_vpc[0].aws_route_table_association.private[0]
}
moved {
  from = module.create_us_vpc.aws_route_table_association.private[1]
  to   = module.create_us_vpc[0].aws_route_table_association.private[1]
}
moved {
  from = module.create_us_vpc.aws_route_table_association.private[2]
  to   = module.create_us_vpc[0].aws_route_table_association.private[2]
}
moved {
  from = module.create_us_vpc.aws_route_table_association.public[0]
  to   = module.create_us_vpc[0].aws_route_table_association.public[0]
}
moved {
  from = module.create_us_vpc.aws_route_table_association.public[1]
  to   = module.create_us_vpc[0].aws_route_table_association.public[1]
}
moved {
  from = module.create_us_vpc.aws_route_table_association.public[2]
  to   = module.create_us_vpc[0].aws_route_table_association.public[2]
}
moved {
  from = module.create_us_vpc.aws_security_group.cyborg_security_group
  to   = module.create_us_vpc[0].aws_security_group.cyborg_security_group
}
moved {
  from = module.create_us_vpc.aws_subnet.private_subnet[0]
  to   = module.create_us_vpc[0].aws_subnet.private_subnet[0]
}
moved {
  from = module.create_us_vpc.aws_subnet.private_subnet[1]
  to   = module.create_us_vpc[0].aws_subnet.private_subnet[1]
}
moved {
  from = module.create_us_vpc.aws_subnet.private_subnet[2]
  to   = module.create_us_vpc[0].aws_subnet.private_subnet[2]
}
moved {
  from = module.create_us_vpc.aws_subnet.public_subnet[0]
  to   = module.create_us_vpc[0].aws_subnet.public_subnet[0]
}
moved {
  from = module.create_us_vpc.aws_subnet.public_subnet[1]
  to   = module.create_us_vpc[0].aws_subnet.public_subnet[1]
}
moved {
  from = module.create_us_vpc.aws_subnet.public_subnet[2]
  to   = module.create_us_vpc[0].aws_subnet.public_subnet[2]
}
moved {
  from = module.create_us_vpc.aws_vpc.main
  to   = module.create_us_vpc[0].aws_vpc.main
}
moved {
  from = module.create_us_vpc.aws_vpc_endpoint.dynamodb_endpoint
  to   = module.create_us_vpc[0].aws_vpc_endpoint.dynamodb_endpoint
}
moved {
  from = module.create_us_vpc.aws_vpc_endpoint.efs_endpoint
  to   = module.create_us_vpc[0].aws_vpc_endpoint.efs_endpoint
}
moved {
  from = module.create_us_vpc.aws_vpc_endpoint.s3_endpoint
  to   = module.create_us_vpc[0].aws_vpc_endpoint.s3_endpoint
}
