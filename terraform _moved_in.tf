moved {
  from = module.create_in_ecs.aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_in_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
}

moved {
  from = module.create_in_ecs.aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_in_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
}

moved {
  from = module.create_in_ecs.aws_security_group.qatalyst_ecs_sg
  to   = module.create_in_ecs[0].aws_security_group.qatalyst_ecs_sg
}

moved {
  from = module.create_in_ecs_copilot_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_copilot_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_copilot_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_copilot_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_copilot_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_copilot_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_copilot_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_copilot_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_copilot_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_copilot_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_copilot_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_copilot_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_copilot_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_copilot_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_appautoscaling_policy.qatalyst_ecs_asp_sqs_sum[0]
  to   = module.create_in_ecs_cyborg_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_sqs_sum[0]
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_cyborg_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_cyborg_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_cyborg_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_cyborg_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_cyborg_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_cyborg_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_dashboard_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_dashboard_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_dashboard_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_dashboard_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_dashboard_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_dashboard_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_dashboard_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_dashboard_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_appautoscaling_policy.qatalyst_ecs_asp_sqs_sum[0]
  to   = module.create_in_ecs_furyblade_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_sqs_sum[0]
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_furyblade_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_furyblade_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_furyblade_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_furyblade_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_furyblade_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_furyblade_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_appautoscaling_policy.qatalyst_ecs_asp_sqs_sum[0]
  to   = module.create_in_ecs_mammoth_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_sqs_sum[0]
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_mammoth_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_mammoth_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_mammoth_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_mammoth_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_mammoth_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_mammoth_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}

moved {
  from = module.create_in_ecs_reports_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_reports_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_reports_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_reports_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_reports_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_reports_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_reports_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_reports_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_reports_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_reports_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_reports_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_reports_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_reports_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_reports_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}

moved {
  from = module.create_in_ecs_testerview_service.aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
  to   = module.create_in_ecs_testerview_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_cpu_average
}

moved {
  from = module.create_in_ecs_testerview_service.aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
  to   = module.create_in_ecs_testerview_service[0].aws_appautoscaling_policy.qatalyst_ecs_asp_memory_average
}

moved {
  from = module.create_in_ecs_testerview_service.aws_appautoscaling_target.qatalyst_ecs_ast
  to   = module.create_in_ecs_testerview_service[0].aws_appautoscaling_target.qatalyst_ecs_ast
}

moved {
  from = module.create_in_ecs_testerview_service.aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
  to   = module.create_in_ecs_testerview_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_cpu_cw_alarm
}

moved {
  from = module.create_in_ecs_testerview_service.aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
  to   = module.create_in_ecs_testerview_service[0].aws_cloudwatch_metric_alarm.ecs_cluster_memory_cw_alarm
}

moved {
  from = module.create_in_ecs_testerview_service.aws_ecs_service.qatalyst_ecs_service
  to   = module.create_in_ecs_testerview_service[0].aws_ecs_service.qatalyst_ecs_service
}

moved {
  from = module.create_in_ecs_testerview_service.aws_ecs_task_definition.qatalyst_ecs_task_definition
  to   = module.create_in_ecs_testerview_service[0].aws_ecs_task_definition.qatalyst_ecs_task_definition
}
moved {
  from = module.create_base_image_in_ecr.data.aws_region.ecr_region
  to   = module.create_base_image_in_ecr[0].data.aws_region.ecr_region
}
moved {
  from = module.create_base_image_in_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_base_image_in_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}
moved {
  from = module.create_base_image_in_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_base_image_in_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_in_acm_api.aws_acm_certificate.acm_domain_name
  to   = module.create_in_acm_api[0].aws_acm_certificate.acm_domain_name
}

moved {
  from = module.create_in_acm_api.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_in_acm_api[0].aws_acm_certificate_validation.acm_domain_validation
}

moved {
  from = module.create_in_acm_api.aws_route53_record.domain_record_sets["in.dev.api.getqatalyst.io"]
  to   = module.create_in_acm_api[0].aws_route53_record.domain_record_sets["in.dev.api.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_api.aws_route53_record.domain_record_sets["in.qa.api.getqatalyst.io"]
  to   = module.create_in_acm_api[0].aws_route53_record.domain_record_sets["in.qa.api.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_api.aws_route53_record.domain_record_sets["in.staging.getqatalyst.io"]
  to   = module.create_in_acm_api[0].aws_route53_record.domain_record_sets["in.staging.api.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_api.aws_route53_record.domain_record_sets["in.api.getqatalyst.io"]
  to   = module.create_in_acm_api[0].aws_route53_record.domain_record_sets["in.api.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_invite_alb.aws_acm_certificate.acm_domain_name
  to   = module.create_in_acm_invite_alb[0].aws_acm_certificate.acm_domain_name
}

moved {
  from = module.create_in_acm_invite_alb.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_in_acm_invite_alb[0].aws_acm_certificate_validation.acm_domain_validation
}

moved {
  from = module.create_in_acm_invite_alb.aws_route53_record.domain_record_sets["dev.invite.getqatalyst.io"]
  to   = module.create_in_acm_invite_alb[0].aws_route53_record.domain_record_sets["dev.invite.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_invite_alb.aws_route53_record.domain_record_sets["qa.invite.getqatalyst.io"]
  to   = module.create_in_acm_invite_alb[0].aws_route53_record.domain_record_sets["qa.invite.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_invite_alb.aws_route53_record.domain_record_sets["staging.invite.getqatalyst.io"]
  to   = module.create_in_acm_invite_alb[0].aws_route53_record.domain_record_sets["staging.invite.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_invite_alb.aws_route53_record.domain_record_sets["invite.getqatalyst.io"]
  to   = module.create_in_acm_invite_alb[0].aws_route53_record.domain_record_sets["invite.getqatalyst.io"]
}

moved {
  from = module.create_in_acm_media_cf.aws_acm_certificate.acm_domain_name
  to   = module.create_in_acm_media_cf[0].aws_acm_certificate.acm_domain_name
}

moved {
  from = module.create_in_acm_media_cf.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_in_acm_media_cf[0].aws_acm_certificate_validation.acm_domain_validation
}

moved {
  from = module.create_in_acm_media_cf.aws_route53_record.domain_record_sets["in.dev.media.getqatalyst.io"]
  to   = module.create_in_acm_media_cf[0].aws_route53_record.domain_record_sets["in.dev.media.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_media_cf.aws_route53_record.domain_record_sets["in.qa.media.getqatalyst.io"]
  to   = module.create_in_acm_media_cf[0].aws_route53_record.domain_record_sets["in.qa.media.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_media_cf.aws_route53_record.domain_record_sets["in.staging.media.getqatalyst.io"]
  to   = module.create_in_acm_media_cf[0].aws_route53_record.domain_record_sets["in.staging.media.getqatalyst.io"]
}
moved {
  from = module.create_in_acm_media_cf.aws_route53_record.domain_record_sets["in.media.getqatalyst.io"]
  to   = module.create_in_acm_media_cf[0].aws_route53_record.domain_record_sets["in.media.getqatalyst.io"]
}

moved {
  from = module.create_in_alb.aws_cloudwatch_metric_alarm.error_monitoring_alarm
  to   = module.create_in_alb[0].aws_cloudwatch_metric_alarm.error_monitoring_alarm
}

moved {
  from = module.create_in_alb.aws_cloudwatch_metric_alarm.target_response_time_alarm
  to   = module.create_in_alb[0].aws_cloudwatch_metric_alarm.target_response_time_alarm
}

moved {
  from = module.create_in_alb.aws_lb.qatalyst_alb
  to   = module.create_in_alb[0].aws_lb.qatalyst_alb
}

moved {
  from = module.create_in_alb.aws_lb_listener.qatalyst_alb_listener
  to   = module.create_in_alb[0].aws_lb_listener.qatalyst_alb_listener
}

moved {
  from = module.create_in_alb.aws_lb_listener_certificate.qatalyst_invite_listener_certificate
  to   = module.create_in_alb[0].aws_lb_listener_certificate.qatalyst_invite_listener_certificate
}

moved {
  from = module.create_in_alb.aws_lb_listener_certificate.qatalyst_meet_listener_certificate
  to   = module.create_in_alb[0].aws_lb_listener_certificate.qatalyst_meet_listener_certificate
}

moved {
  from = module.create_in_alb.aws_lb_listener_certificate.qatalyst_reports_listener_certificate
  to   = module.create_in_alb[0].aws_lb_listener_certificate.qatalyst_reports_listener_certificate
}

moved {
  from = module.create_in_alb.aws_lb_listener_certificate.qatalyst_tester_view_listener_certificate
  to   = module.create_in_alb[0].aws_lb_listener_certificate.qatalyst_tester_view_listener_certificate
}

moved {
  from = module.create_in_alb.aws_lb_listener_rule.qatalyst_alb_listener_copilot_rule
  to   = module.create_in_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_copilot_rule
}

moved {
  from = module.create_in_alb.aws_lb_listener_rule.qatalyst_alb_listener_reports_rule
  to   = module.create_in_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_reports_rule
}

moved {
  from = module.create_in_alb.aws_lb_listener_rule.qatalyst_alb_listener_tester_view_rule
  to   = module.create_in_alb[0].aws_lb_listener_rule.qatalyst_alb_listener_tester_view_rule
}

moved {
  from = module.create_in_alb.aws_lb_target_group.qatalyst_copilot_tg
  to   = module.create_in_alb[0].aws_lb_target_group.qatalyst_copilot_tg
}

moved {
  from = module.create_in_alb.aws_lb_target_group.qatalyst_reports_tg
  to   = module.create_in_alb[0].aws_lb_target_group.qatalyst_reports_tg
}

moved {
  from = module.create_in_alb.aws_lb_target_group.qatalyst_tester_view_tg
  to   = module.create_in_alb[0].aws_lb_target_group.qatalyst_tester_view_tg
}

moved {
  from = module.create_in_alb.aws_lb_target_group.qatalyst_tg
  to   = module.create_in_alb[0].aws_lb_target_group.qatalyst_tg
}

moved {
  from = module.create_in_alb.aws_route53_record.qatalyst_api_domain_record
  to   = module.create_in_alb[0].aws_route53_record.qatalyst_api_domain_record
}

moved {
  from = module.create_in_alb.aws_security_group.qatalyst_alb_sg
  to   = module.create_in_alb[0].aws_security_group.qatalyst_alb_sg
}
moved {
  from = module.create_in_batch_helios.aws_batch_compute_environment.qatalyst_compute_environment
  to   = module.create_in_batch_helios[0].aws_batch_compute_environment.qatalyst_compute_environment
}

moved {
  from = module.create_in_batch_helios.aws_batch_job_definition.qatalyst-media-processing-job-definition
  to   = module.create_in_batch_helios[0].aws_batch_job_definition.qatalyst-media-processing-job-definition
}

moved {
  from = module.create_in_batch_helios.aws_batch_job_queue.qatalyst_job_queue
  to   = module.create_in_batch_helios[0].aws_batch_job_queue.qatalyst_job_queue
}
moved {
  from = module.create_in_cloudwatch_copilot_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_in_cloudwatch_copilot_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_in_cloudwatch_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_in_cloudwatch_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_in_cloudwatch_reports_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_in_cloudwatch_reports_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_in_cloudwatch_tester_view_dashboard.aws_cloudwatch_dashboard.qatalyst_cw_dashboard
  to   = module.create_in_cloudwatch_tester_view_dashboard[0].aws_cloudwatch_dashboard.qatalyst_cw_dashboard
}
moved {
  from = module.create_in_cyborg_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_in_cyborg_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}

moved {
  from = module.create_in_cyborg_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_in_cyborg_ecr[0].aws_ecr_repository.qatalyst_repository
}

moved {
  from = module.create_in_cyborg_efs.aws_efs_access_point.access_point
  to   = module.create_in_cyborg_efs[0].aws_efs_access_point.access_point
}

moved {
  from = module.create_in_cyborg_efs.aws_efs_file_system.efs
  to   = module.create_in_cyborg_efs[0].aws_efs_file_system.efs
}

moved {
  from = module.create_in_cyborg_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_in_cyborg_efs[0].aws_efs_file_system_policy.efs_policy
}

moved {
  from = module.create_in_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_in_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}

moved {
  from = module.create_in_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_in_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}

moved {
  from = module.create_in_cyborg_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_in_cyborg_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_in_furyblade_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_in_furyblade_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}

moved {
  from = module.create_in_furyblade_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_in_furyblade_ecr[0].aws_ecr_repository.qatalyst_repository
}

moved {
  from = module.create_in_furyblade_efs.aws_efs_access_point.access_point
  to   = module.create_in_furyblade_efs[0].aws_efs_access_point.access_point
}

moved {
  from = module.create_in_furyblade_efs.aws_efs_file_system.efs
  to   = module.create_in_furyblade_efs[0].aws_efs_file_system.efs
}

moved {
  from = module.create_in_furyblade_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_in_furyblade_efs[0].aws_efs_file_system_policy.efs_policy
}

moved {
  from = module.create_in_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_in_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}

moved {
  from = module.create_in_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_in_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}

moved {
  from = module.create_in_furyblade_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_in_furyblade_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}

moved {
  from = module.create_in_furyblade_eventbridge_group.aws_scheduler_schedule_group.qatalyst_schedule_group
  to   = module.create_in_furyblade_eventbridge_group[0].aws_scheduler_schedule_group.qatalyst_schedule_group
}
moved {
  from = module.create_in_mammoth_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_in_mammoth_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}

moved {
  from = module.create_in_mammoth_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_in_mammoth_ecr[0].aws_ecr_repository.qatalyst_repository
}

moved {
  from = module.create_in_mammoth_efs.aws_efs_access_point.access_point
  to   = module.create_in_mammoth_efs[0].aws_efs_access_point.access_point
}

moved {
  from = module.create_in_mammoth_efs.aws_efs_file_system.efs
  to   = module.create_in_mammoth_efs[0].aws_efs_file_system.efs
}

moved {
  from = module.create_in_mammoth_efs.aws_efs_file_system_policy.efs_policy
  to   = module.create_in_mammoth_efs[0].aws_efs_file_system_policy.efs_policy
}

moved {
  from = module.create_in_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_1"]
  to   = module.create_in_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_1"]
}

moved {
  from = module.create_in_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_2"]
  to   = module.create_in_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_2"]
}

moved {
  from = module.create_in_mammoth_efs.aws_efs_mount_target.efs_mount_target["subnet_id_3"]
  to   = module.create_in_mammoth_efs[0].aws_efs_mount_target.efs_mount_target["subnet_id_3"]
}
moved {
  from = module.create_in_media_cloudfront.aws_cloudfront_distribution.media_cf_distribution
  to   = module.create_in_media_cloudfront[0].aws_cloudfront_distribution.media_cf_distribution
}

moved {
  from = module.create_in_media_cloudfront.aws_cloudfront_origin_access_identity.media_s3_origin_identity
  to   = module.create_in_media_cloudfront[0].aws_cloudfront_origin_access_identity.media_s3_origin_identity
}

moved {
  from = module.create_in_media_cloudfront.aws_route53_record.media_cf_r53_record
  to   = module.create_in_media_cloudfront[0].aws_route53_record.media_cf_r53_record
}

moved {
  from = module.create_in_media_cloudfront.aws_s3_bucket_policy.media_s3_bucket_policy
  to   = module.create_in_media_cloudfront[0].aws_s3_bucket_policy.media_s3_bucket_policy
}
moved {
  from = module.create_in_meet_acm_cf.aws_acm_certificate.acm_domain_name
  to   = module.create_in_meet_acm_cf[0].aws_acm_certificate.acm_domain_name
}

moved {
  from = module.create_in_meet_acm_cf.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_in_meet_acm_cf[0].aws_acm_certificate_validation.acm_domain_validation
}

moved {
  from = module.create_in_meet_acm_cf.aws_route53_record.domain_record_sets["qa.meet.getqatalyst.io"]
  to   = module.create_in_meet_acm_cf[0].aws_route53_record.domain_record_sets["qa.meet.getqatalyst.io"]
}
moved {
  from = module.create_in_meet_acm_cf.aws_route53_record.domain_record_sets["dev.meet.getqatalyst.io"]
  to   = module.create_in_meet_acm_cf[0].aws_route53_record.domain_record_sets["dev.meet.getqatalyst.io"]
}
moved {
  from = module.create_in_meet_acm_cf.aws_route53_record.domain_record_sets["staging.meet.getqatalyst.io"]
  to   = module.create_in_meet_acm_cf[0].aws_route53_record.domain_record_sets["staging.meet.getqatalyst.io"]
}
moved {
  from = module.create_in_meet_acm_cf.aws_route53_record.domain_record_sets["meet.getqatalyst.io"]
  to   = module.create_in_meet_acm_cf[0].aws_route53_record.domain_record_sets["meet.getqatalyst.io"]
}
moved {
  from = module.create_in_qatalyst_media_bucket.aws_s3_bucket.s3_bucket
  to   = module.create_in_qatalyst_media_bucket[0].aws_s3_bucket.s3_bucket
}

moved {
  from = module.create_in_qatalyst_media_bucket.aws_s3_bucket_accelerate_configuration.s3_transfer_acceleration[0]
  to   = module.create_in_qatalyst_media_bucket[0].aws_s3_bucket_accelerate_configuration.s3_transfer_acceleration[0]
}

moved {
  from = module.create_in_qatalyst_media_bucket.aws_s3_bucket_cors_configuration.aws_cors_config
  to   = module.create_in_qatalyst_media_bucket[0].aws_s3_bucket_cors_configuration.aws_cors_config
}

moved {
  from = module.create_in_qatalyst_media_bucket.aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
  to   = module.create_in_qatalyst_media_bucket[0].aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
}

moved {
  from = module.create_in_qatalyst_media_bucket.aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
  to   = module.create_in_qatalyst_media_bucket[0].aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
}

moved {
  from = module.create_in_qatalyst_media_bucket.aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  to   = module.create_in_qatalyst_media_bucket[0].aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
moved {
  from = module.create_in_reports_acm.aws_acm_certificate.acm_domain_name
  to   = module.create_in_reports_acm[0].aws_acm_certificate.acm_domain_name
}

moved {
  from = module.create_in_reports_acm.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_in_reports_acm[0].aws_acm_certificate_validation.acm_domain_validation
}

moved {
  from = module.create_in_reports_acm.aws_route53_record.domain_record_sets["dev.reports.getqatalyst.io"]
  to   = module.create_in_reports_acm[0].aws_route53_record.domain_record_sets["dev.reports.getqatalyst.io"]
}
moved {
  from = module.create_in_reports_acm.aws_route53_record.domain_record_sets["qa.reports.getqatalyst.io"]
  to   = module.create_in_reports_acm[0].aws_route53_record.domain_record_sets["qa.reports.getqatalyst.io"]
}
moved {
  from = module.create_in_reports_acm.aws_route53_record.domain_record_sets["staging.reports.getqatalyst.io"]
  to   = module.create_in_reports_acm[0].aws_route53_record.domain_record_sets["staging.reports.getqatalyst.io"]
}
moved {
  from = module.create_in_reports_acm.aws_route53_record.domain_record_sets["reports.getqatalyst.io"]
  to   = module.create_in_reports_acm[0].aws_route53_record.domain_record_sets["reports.getqatalyst.io"]
}
moved {
  from = module.create_in_s3_bucket.aws_s3_bucket.s3_bucket
  to   = module.create_in_s3_bucket[0].aws_s3_bucket.s3_bucket
}

moved {
  from = module.create_in_s3_bucket.aws_s3_bucket_cors_configuration.aws_cors_config
  to   = module.create_in_s3_bucket[0].aws_s3_bucket_cors_configuration.aws_cors_config
}

moved {
  from = module.create_in_s3_bucket.aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
  to   = module.create_in_s3_bucket[0].aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle
}

moved {
  from = module.create_in_s3_bucket.aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
  to   = module.create_in_s3_bucket[0].aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls
}

moved {
  from = module.create_in_s3_bucket.aws_s3_bucket_public_access_block.s3_bucket_public_access_block
  to   = module.create_in_s3_bucket[0].aws_s3_bucket_public_access_block.s3_bucket_public_access_block
}
moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-cyborg-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-cyborg-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-furyblade-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-furyblade-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-mammoth-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-mammoth-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-user-journey-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_age_cw_alarm["qatalyst-user-journey-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-cyborg-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-cyborg-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-furyblade-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-furyblade-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-mammoth-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-mammoth-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-user-journey-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_cw_alarm["qatalyst-user-journey-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-cyborg-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-cyborg-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-furyblade-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-furyblade-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-mammoth-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-mammoth-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-user-journey-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_age_cw_alarm["qatalyst-user-journey-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-cyborg-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-cyborg-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-furyblade-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-furyblade-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-mammoth-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-mammoth-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-user-journey-processing-sqs"]
  to   = module.create_in_sqs[0].aws_cloudwatch_metric_alarm.qatalyst_sqs_dl_cw_alarm["qatalyst-user-journey-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-cyborg-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-furyblade-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-mammoth-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue["qatalyst-user-journey-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue["qatalyst-user-journey-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-cyborg-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-furyblade-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-mammoth-processing-sqs"]
}

moved {
  from = module.create_in_sqs.aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-user-journey-processing-sqs"]
  to   = module.create_in_sqs[0].aws_sqs_queue.qatalyst_service_queue_deadletter["qatalyst-user-journey-processing-sqs"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-dev-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-dev-api-key"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-qa-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-qa-api-key"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-staging-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-staging-api-key"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-prod-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["datadog-prod-api-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-eu"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-in"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-sea"]
}


moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-us"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-realm-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-eu"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-in"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-sea"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-us"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-access-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-secret-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-feature-flag-auth"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-figma-access-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-fingerprint-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-api-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-product-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-open-ai-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-sendgrid-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-api-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-eu"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-in"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-sea"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-us"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-realm-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-eu"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-in"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-sea"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-us"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-access-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-secret-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-feature-flag-auth"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-figma-access-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-fingerprint-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-api-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-product-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-open-ai-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-sendgrid-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-api-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-in"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-us"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-sea"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-eu"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-realm-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-eu"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-in"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-sea"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-us"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-access-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-secret-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-feature-flag-auth"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-figma-access-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-fingerprint-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-api-token"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-product-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-open-ai-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-sendgrid-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-api-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
}

moved {
  from = module.create_in_ssm.aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
}

moved {
  from = module.create_in_ssm.random_uuid.feature_flag_auth
  to   = module.create_in_ssm[0].random_uuid.feature_flag_auth
}
moved {
  from = module.create_in_tester_view_acm.aws_acm_certificate.acm_domain_name
  to   = module.create_in_tester_view_acm[0].aws_acm_certificate.acm_domain_name
}

moved {
  from = module.create_in_tester_view_acm.aws_acm_certificate_validation.acm_domain_validation
  to   = module.create_in_tester_view_acm[0].aws_acm_certificate_validation.acm_domain_validation
}

moved {
  from = module.create_in_tester_view_acm.aws_route53_record.domain_record_sets["qa.studyview.getqatalyst.io"]
  to   = module.create_in_tester_view_acm[0].aws_route53_record.domain_record_sets["qa.studyview.getqatalyst.io"]
}
moved {
  from = module.create_in_tester_view_acm.aws_route53_record.domain_record_sets["staging.studyview.getqatalyst.io"]
  to   = module.create_in_tester_view_acm[0].aws_route53_record.domain_record_sets["staging.studyview.getqatalyst.io"]
}
moved {
  from = module.create_in_tester_view_acm.aws_route53_record.domain_record_sets["studyview.getqatalyst.io"]
  to   = module.create_in_tester_view_acm[0].aws_route53_record.domain_record_sets["studyview.getqatalyst.io"]
}
moved {
  from = module.create_in_tester_view_acm.aws_route53_record.domain_record_sets["dev.studyview.getqatalyst.io"]
  to   = module.create_in_tester_view_acm[0].aws_route53_record.domain_record_sets["dev.studyview.getqatalyst.io"]
}
moved {
  from = module.create_in_vpc.aws_eip.eip_nat_gateway
  to   = module.create_in_vpc[0].aws_eip.eip_nat_gateway
}

moved {
  from = module.create_in_vpc.aws_internet_gateway.vpc_gateway
  to   = module.create_in_vpc[0].aws_internet_gateway.vpc_gateway
}

moved {
  from = module.create_in_vpc.aws_main_route_table_association.route_table_association
  to   = module.create_in_vpc[0].aws_main_route_table_association.route_table_association
}

moved {
  from = module.create_in_vpc.aws_nat_gateway.nat_gateway
  to   = module.create_in_vpc[0].aws_nat_gateway.nat_gateway
}

moved {
  from = module.create_in_vpc.aws_route_table.main_routetable
  to   = module.create_in_vpc[0].aws_route_table.main_routetable
}

moved {
  from = module.create_in_vpc.aws_route_table.private_route_table
  to   = module.create_in_vpc[0].aws_route_table.private_route_table
}

moved {
  from = module.create_in_vpc.aws_route_table.public_route_table
  to   = module.create_in_vpc[0].aws_route_table.public_route_table
}

moved {
  from = module.create_in_vpc.aws_route_table_association.private[0]
  to   = module.create_in_vpc[0].aws_route_table_association.private[0]
}

moved {
  from = module.create_in_vpc.aws_route_table_association.private[1]
  to   = module.create_in_vpc[0].aws_route_table_association.private[1]
}

moved {
  from = module.create_in_vpc.aws_route_table_association.private[2]
  to   = module.create_in_vpc[0].aws_route_table_association.private[2]
}

moved {
  from = module.create_in_vpc.aws_route_table_association.public[0]
  to   = module.create_in_vpc[0].aws_route_table_association.public[0]
}

moved {
  from = module.create_in_vpc.aws_route_table_association.public[1]
  to   = module.create_in_vpc[0].aws_route_table_association.public[1]
}

moved {
  from = module.create_in_vpc.aws_route_table_association.public[2]
  to   = module.create_in_vpc[0].aws_route_table_association.public[2]
}

moved {
  from = module.create_in_vpc.aws_security_group.cyborg_security_group
  to   = module.create_in_vpc[0].aws_security_group.cyborg_security_group
}

moved {
  from = module.create_in_vpc.aws_security_group.lambda_security_group
  to   = module.create_in_vpc[0].aws_security_group.lambda_security_group
}

moved {
  from = module.create_in_vpc.aws_subnet.private_subnet[0]
  to   = module.create_in_vpc[0].aws_subnet.private_subnet[0]
}

moved {
  from = module.create_in_vpc.aws_subnet.private_subnet[1]
  to   = module.create_in_vpc[0].aws_subnet.private_subnet[1]
}

moved {
  from = module.create_in_vpc.aws_subnet.private_subnet[2]
  to   = module.create_in_vpc[0].aws_subnet.private_subnet[2]
}

moved {
  from = module.create_in_vpc.aws_subnet.public_subnet[0]
  to   = module.create_in_vpc[0].aws_subnet.public_subnet[0]
}

moved {
  from = module.create_in_vpc.aws_subnet.public_subnet[1]
  to   = module.create_in_vpc[0].aws_subnet.public_subnet[1]
}

moved {
  from = module.create_in_vpc.aws_subnet.public_subnet[2]
  to   = module.create_in_vpc[0].aws_subnet.public_subnet[2]
}

moved {
  from = module.create_in_vpc.aws_vpc.main
  to   = module.create_in_vpc[0].aws_vpc.main
}

moved {
  from = module.create_in_vpc.aws_vpc_endpoint.dynamodb_endpoint
  to   = module.create_in_vpc[0].aws_vpc_endpoint.dynamodb_endpoint
}

moved {
  from = module.create_in_vpc.aws_vpc_endpoint.efs_endpoint
  to   = module.create_in_vpc[0].aws_vpc_endpoint.efs_endpoint
}

moved {
  from = module.create_in_vpc.aws_vpc_endpoint.s3_endpoint
  to   = module.create_in_vpc[0].aws_vpc_endpoint.s3_endpoint
}
moved {
  from = module.create_in_media_cloudfront.aws_cloudfront_distribution.media_cf_distribution
  to   = module.create_in_media_cloudfront[0].aws_cloudfront_distribution.media_cf_distribution
}

moved {
  from = module.create_in_media_cloudfront.aws_cloudfront_origin_access_identity.media_s3_origin_identity
  to   = module.create_in_media_cloudfront[0].aws_cloudfront_origin_access_identity.media_s3_origin_identity
}

moved {
  from = module.create_in_media_cloudfront.aws_route53_record.media_cf_r53_record
  to   = module.create_in_media_cloudfront[0].aws_route53_record.media_cf_r53_record
}

moved {
  from = module.create_in_media_cloudfront.aws_s3_bucket_policy.media_s3_bucket_policy
  to   = module.create_in_media_cloudfront[0].aws_s3_bucket_policy.media_s3_bucket_policy
}

moved {
  from = module.create_in_media_convert_queue.aws_media_convert_queue.mediaconvert_queue["qatalyst"]
  to   = module.create_in_media_convert_queue[0].aws_media_convert_queue.mediaconvert_queue["qatalyst"]
}
moved {
  from = module.create_in_ecr_helios.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_in_ecr_helios[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}

moved {
  from = module.create_in_ecr_helios.aws_ecr_repository.qatalyst_repository
  to   = module.create_in_ecr_helios[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_in_ecr.aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
  to   = module.create_in_ecr[0].aws_ecr_lifecycle_policy.qatalyst_repository_lifecycle
}

moved {
  from = module.create_in_ecr.aws_ecr_repository.qatalyst_repository
  to   = module.create_in_ecr[0].aws_ecr_repository.qatalyst_repository
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-block-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-block-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-copilot"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-copilot"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-custom-insights"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-custom-insights"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-external-panel-project"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-external-panel-project"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-media-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-media-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-media-notes"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-media-notes"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-report-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-report-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-reports-collab"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-reports-collab"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-session-meetings"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-session-meetings"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-stripe-events"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-stripe-events"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-study-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-study-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-study-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-study-publish"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-study-publish"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-subscription-orders"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-subscription-orders"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-teams"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-teams"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-events"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-events"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-logs"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-logs"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-responses"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-tester-responses"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-transcripts-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-transcripts-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-transcripts-highlights"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-transcripts-tags"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workflow-management"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workflow-management"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-configurations"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-metrics"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-testers-email"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-usage"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_read_capacity["qatalyst-workspace-usage"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-block-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-block-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-copilot"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-copilot"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-custom-insights"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-custom-insights"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-external-panel-project"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-external-panel-project"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-media-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-media-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-media-notes"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-media-notes"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-report-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-report-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-reports-collab"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-reports-collab"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-session-meetings"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-session-meetings"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-stripe-events"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-stripe-events"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-study-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-study-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-study-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-study-publish"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-study-publish"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-subscription-orders"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-subscription-orders"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-teams"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-teams"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-events"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-events"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-logs"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-logs"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-responses"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-tester-responses"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-transcripts-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-transcripts-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-transcripts-highlights"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-transcripts-tags"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workflow-management"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workflow-management"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-configurations"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-metrics"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-testers-email"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-usage"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_consumed_write_capacity["qatalyst-workspace-usage"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-block-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-block-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-copilot"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-copilot"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-custom-insights"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-custom-insights"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-external-panel-project"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-external-panel-project"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-media-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-media-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-media-notes"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-media-notes"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-report-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-report-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-reports-collab"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-reports-collab"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-session-meetings"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-session-meetings"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-stripe-events"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-stripe-events"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-study-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-study-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-study-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-study-publish"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-study-publish"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-subscription-orders"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-subscription-orders"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-teams"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-teams"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-events"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-events"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-logs"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-logs"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-responses"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-tester-responses"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-transcripts-details"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-transcripts-details"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-transcripts-highlights"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-transcripts-tags"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workflow-management"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workflow-management"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-configurations"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-metrics"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-testers-email"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_in_dynamodb.aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-usage"]
  to   = module.create_in_dynamodb[0].aws_cloudwatch_metric_alarm.dynamodb_successful_request_latency_alarm["qatalyst-workspace-usage"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-block-details"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-block-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-copilot"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-copilot"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-custom-insights"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-custom-insights"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-external-panel-project"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-external-panel-project"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-media-details"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-media-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-media-notes"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-media-notes"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-report-details"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-report-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-reports-collab"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-reports-collab"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-session-meetings"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-session-meetings"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-stripe-events"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-stripe-events"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-study-details"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-study-panel-testers"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-panel-testers"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-study-publish"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-study-publish"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-subscription-orders"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-subscription-orders"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-teams"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-teams"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-details"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-events"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-events"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-logs"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-logs"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-tester-responses"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-tester-responses"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-details"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-details"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-highlights"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-highlights"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-transcripts-tags"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-transcripts-tags"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workflow-management"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-workflow-management"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-configurations"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-configurations"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-metrics"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-metrics"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-testers-email"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-testers-email"]
}
moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.table["qatalyst-workspace-usage"]
  to   = module.create_in_dynamodb[0].aws_dynamodb_table.table["qatalyst-workspace-usage"]
}
moved {
  from = module.create_in_vpc.aws_flow_log.vpc_main_flow_logs[0]
to = module.create_in_vpc[0].aws_flow_log.vpc_main_flow_logs[0]
}