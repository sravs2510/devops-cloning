moved {
  from = module.create_in_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_in_ecs[0].aws_ecs_cluster.ecs_cluster
}
moved {
  from = module.create_us_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_us_ecs[0].aws_ecs_cluster.ecs_cluster
}
moved {
  from = module.create_sea_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_sea_ecs[0].aws_ecs_cluster.ecs_cluster
}
moved {
  from = module.create_eu_ecs[0].aws_ecs_cluster.qatalyst_ecs_cluster
  to   = module.create_eu_ecs[0].aws_ecs_cluster.ecs_cluster
}
moved {
  from = module.create_in_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_in_ecs[0].aws_ecs_cluster_capacity_providers.ecs_cluster_capacity_providers
}
moved {
  from = module.create_us_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_us_ecs[0].aws_ecs_cluster_capacity_providers.ecs_cluster_capacity_providers
}
moved {
  from = module.create_sea_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_sea_ecs[0].aws_ecs_cluster_capacity_providers.ecs_cluster_capacity_providers
}
moved {
  from = module.create_eu_ecs[0].aws_ecs_cluster_capacity_providers.qatalyst_ecs_cluster_capacity_provider
  to   = module.create_eu_ecs[0].aws_ecs_cluster_capacity_providers.ecs_cluster_capacity_providers
}
moved {
  from = module.create_in_ecs[0].aws_security_group.qatalyst_ecs_sg
  to   = module.create_in_ecs[0].aws_security_group.ecs_sg
}
moved {
  from = module.create_sea_ecs[0].aws_security_group.qatalyst_ecs_sg
  to   = module.create_sea_ecs[0].aws_security_group.ecs_sg
}
moved {
  from = module.create_us_ecs[0].aws_security_group.qatalyst_ecs_sg
  to   = module.create_us_ecs[0].aws_security_group.ecs_sg
}
moved {
  from = module.create_eu_ecs[0].aws_security_group.qatalyst_ecs_sg
  to   = module.create_eu_ecs[0].aws_security_group.ecs_sg
}

moved {
  from = module.create_in_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-client-id-eu"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-client-id-in"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-client-id-sea"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-client-id-us"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-realm-id"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-secret-eu"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-secret-in"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-secret-sea"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-secret-us"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-access-key"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-secret-key"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-bitly-bearer-token"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-feature-flag-auth"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-figma-access-token"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-fingerprint-token"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-api-token"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-product-id"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-google-credentials"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-open-ai-key"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-sendgrid-key"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-api-key"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-webhook-secret"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}

moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_sea_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-realm-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-access-key"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-secret-key"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-bitly-bearer-token"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-feature-flag-auth"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-figma-access-token"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-fingerprint-token"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-api-token"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-product-id"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-google-credentials"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-open-ai-key"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-sendgrid-key"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-api-key"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-webhook-secret"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}

moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_us_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-realm-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-access-key"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-secret-key"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-bitly-bearer-token"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-feature-flag-auth"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-figma-access-token"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-fingerprint-token"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-api-token"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-product-id"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-google-credentials"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-open-ai-key"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-sendgrid-key"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-api-key"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-webhook-secret"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}

moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_eu_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-realm-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-access-key"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-100ms-secret-key"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-bitly-bearer-token"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-feature-flag-auth"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-figma-access-token"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-fingerprint-token"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-api-token"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-g2-product-id"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-google-credentials"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-open-ai-key"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-sendgrid-key"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-api-key"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-stripe-webhook-secret"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}

moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}