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
  to   = random_uuid.feature_flag_auth_in
}
moved {
  from = module.create_us_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth_us
}
moved {
  from = module.create_eu_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth_eu
}
moved {
  from = module.create_sea_ssm[0].random_uuid.feature_flag_auth
  to   = random_uuid.feature_flag_auth_sea
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-api-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-sendgrid-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-open-ai-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-google-credentials"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-product-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-api-token"]

}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-fingerprint-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-figma-access-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-access-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-realm-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-realm-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-api-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-sendgrid-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-open-ai-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-google-credentials"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-google-credentials"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-product-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-api-token"]

}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-fingerprint-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-figma-access-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-feature-flag-auth"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-secret-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-access-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-realm-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-api-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-sendgrid-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-open-ai-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-google-credentials"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-google-credentials"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-product-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-api-token"]

}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-fingerprint-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-figma-access-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-feature-flag-auth"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-secret-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-access-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-realm-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-realm-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-us"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-us"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-sea"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-sea"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-in"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-in"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-eu"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-eu"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-api-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-api-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-sendgrid-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-sendgrid-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-open-ai-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-open-ai-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-google-credentials"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-google-credentials"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-product-id"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-product-id"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-api-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-api-token"]

}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-fingerprint-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-fingerprint-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-figma-access-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-figma-access-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-feature-flag-auth"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-feature-flag-auth"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-secret-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-secret-key"]
}
moved {
  from = module.create_in_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-access-key"]
  to   = module.create_in_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-access-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-api-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-sendgrid-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-open-ai-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-google-credentials"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-product-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-api-token"]

}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-fingerprint-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-figma-access-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-access-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-realm-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-realm-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-realm-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-api-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-api-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-sendgrid-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-sendgrid-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-open-ai-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-open-ai-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-google-credentials"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-google-credentials"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-product-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-product-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-api-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-api-token"]

}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-fingerprint-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-fingerprint-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-figma-access-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-figma-access-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-feature-flag-auth"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-feature-flag-auth"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-secret-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-secret-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-access-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-access-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-realm-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-realm-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-api-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-api-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-sendgrid-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-sendgrid-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-open-ai-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-open-ai-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-google-credentials"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-google-credentials"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-product-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-product-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-api-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-api-token"]

}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-fingerprint-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-fingerprint-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-figma-access-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-figma-access-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-feature-flag-auth"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-feature-flag-auth"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-secret-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-secret-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-access-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-access-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-realm-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-realm-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-us"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-us"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-sea"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-sea"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-in"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-in"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-eu"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-eu"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-api-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-api-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-sendgrid-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-sendgrid-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-open-ai-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-open-ai-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-google-credentials"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-google-credentials"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-product-id"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-product-id"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-api-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-api-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-fingerprint-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-fingerprint-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-figma-access-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-figma-access-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-feature-flag-auth"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-feature-flag-auth"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-secret-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-secret-key"]
}
moved {
  from = module.create_sea_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-access-key"]
  to   = module.create_sea_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst--prod100ms-access-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-api-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-sendgrid-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-open-ai-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-google-credentials"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-product-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-api-token"]

}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-fingerprint-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-figma-access-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-access-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-realm-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-realm-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-realm-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-api-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-sendgrid-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-sendgrid-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-open-ai-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-open-ai-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-google-credentials"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-google-credentials"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-product-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-product-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-api-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-api-token"]

}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-fingerprint-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-fingerprint-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-figma-access-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-figma-access-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-feature-flag-auth"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-feature-flag-auth"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-secret-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-secret-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-access-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-access-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-realm-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-realm-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-api-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-sendgrid-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-sendgrid-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-open-ai-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-open-ai-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-google-credentials"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-google-credentials"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-product-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-product-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-api-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-api-token"]

}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-fingerprint-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-fingerprint-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-figma-access-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-figma-access-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-feature-flag-auth"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-feature-flag-auth"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-secret-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-secret-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-access-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-access-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-realm-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-realm-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-us"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-us"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-sea"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-sea"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-in"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-in"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-eu"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-eu"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-api-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-api-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-sendgrid-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-sendgrid-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-open-ai-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-open-ai-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-google-credentials"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-google-credentials"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-product-id"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-product-id"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-api-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-api-token"]

}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-fingerprint-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-fingerprint-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-figma-access-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-figma-access-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-feature-flag-auth"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-feature-flag-auth"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-secret-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-secret-key"]
}
moved {
  from = module.create_us_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-access-key"]
  to   = module.create_us_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-access-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-study-details-ddb-stream-arn"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-study-details-ddb-stream-arn"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-3"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-3"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-2"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-2"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-private-1"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-private-1"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_values["qatalyst-lambda-sg-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_values["qatalyst-lambda-sg-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-lucid-sha1-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-lucid-sha1-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-webhook-secret"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-stripe-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-stripe-api-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-sendgrid-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-sendgrid-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-open-ai-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-open-ai-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-google-credentials"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-google-credentials"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-product-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-product-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-g2-api-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-g2-api-token"]

}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-fingerprint-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-fingerprint-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-figma-access-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-figma-access-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-feature-flag-auth"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-feature-flag-auth"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-bitly-bearer-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-secret-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-secret-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dev-100ms-access-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dev-100ms-access-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-dashboard-opensearch-endpoint"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-secret-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-secret-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-realm-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-realm-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-dev-client-id-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-dev-client-id-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-secret-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-secret-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-realm-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-realm-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-qa-client-id-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-qa-client-id-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-webhook-secret"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-stripe-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-stripe-api-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-sendgrid-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-sendgrid-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-open-ai-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-open-ai-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-google-credentials"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-google-credentials"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-product-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-product-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-g2-api-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-g2-api-token"]

}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-fingerprint-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-fingerprint-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-figma-access-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-figma-access-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-feature-flag-auth"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-feature-flag-auth"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-bitly-bearer-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-secret-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-secret-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-qa-100ms-access-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-qa-100ms-access-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-secret-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-secret-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-realm-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-realm-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-staging-client-id-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-staging-client-id-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-webhook-secret"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-stripe-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-stripe-api-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-sendgrid-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-sendgrid-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-open-ai-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-open-ai-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-google-credentials"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-google-credentials"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-product-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-product-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-g2-api-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-g2-api-token"]

}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-fingerprint-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-fingerprint-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-figma-access-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-figma-access-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-feature-flag-auth"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-feature-flag-auth"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-bitly-bearer-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-secret-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-secret-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-staging-100ms-access-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-staging-100ms-access-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-secret-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-secret-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-realm-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-realm-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-us"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-us"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-sea"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-sea"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-in"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-in"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["platform-prod-client-id-eu"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["platform-prod-client-id-eu"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-webhook-secret"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-stripe-api-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-stripe-api-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-sendgrid-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-sendgrid-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-open-ai-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-open-ai-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-google-credentials"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-google-credentials"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-product-id"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-product-id"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-g2-api-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-g2-api-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-fingerprint-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-fingerprint-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-figma-access-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-figma-access-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-feature-flag-auth"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-feature-flag-auth"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-bitly-bearer-token"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-secret-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-secret-key"]
}
moved {
  from = module.create_eu_ssm[0].aws_ssm_parameter.qatalyst_ssm_secure_values["qatalyst-prod-100ms-access-key"]
  to   = module.create_eu_ssm[0].aws_ssm_parameter.ssm_secure_values["qatalyst-prod-100ms-access-key"]
}
moved {
  from = module.create_in_batch_helios[0].aws_batch_compute_environment.qatalyst_compute_environment
  to   = module.create_in_batch_helios[0].aws_batch_compute_environment.batch_compute_environment
}
moved {
  from = module.create_in_batch_helios[0].aws_batch_job_definition.qatalyst-media-processing-job-definition
  to   = module.create_in_batch_helios[0].aws_batch_job_definition.batch_job_definition
}
moved {
  from = module.create_in_batch_helios[0].aws_batch_job_queue.qatalyst_job_queue
  to   = module.create_in_batch_helios[0].aws_batch_job_queue.batch_job_queue
}
moved {
  from = module.create_eu_batch_helios[0].aws_batch_compute_environment.qatalyst_compute_environment
  to   = module.create_eu_batch_helios[0].aws_batch_compute_environment.batch_compute_environment
}
moved {
  from = module.create_eu_batch_helios[0].aws_batch_job_definition.qatalyst-media-processing-job-definition
  to   = module.create_eu_batch_helios[0].aws_batch_job_definition.batch_job_definition
}
moved {
  from = module.create_eu_batch_helios[0].aws_batch_job_queue.qatalyst_job_queue
  to   = module.create_eu_batch_helios[0].aws_batch_job_queue.batch_job_queue
}
moved {
  from = module.create_sea_batch_helios[0].aws_batch_compute_environment.qatalyst_compute_environment
  to   = module.create_sea_batch_helios[0].aws_batch_compute_environment.batch_compute_environment
}
moved {
  from = module.create_sea_batch_helios[0].aws_batch_job_definition.qatalyst-media-processing-job-definition
  to   = module.create_sea_batch_helios[0].aws_batch_job_definition.batch_job_definition
}
moved {
  from = module.create_sea_batch_helios[0].aws_batch_job_queue.qatalyst_job_queue
  to   = module.create_sea_batch_helios[0].aws_batch_job_queue.batch_job_queue
}
moved {
  from = module.create_us_batch_helios[0].aws_batch_compute_environment.qatalyst_compute_environment
  to   = module.create_us_batch_helios[0].aws_batch_compute_environment.batch_compute_environment
}
moved {
  from = module.create_us_batch_helios[0].aws_batch_job_definition.qatalyst-media-processing-job-definition
  to   = module.create_us_batch_helios[0].aws_batch_job_definition.batch_job_definition
}
moved {
  from = module.create_us_batch_helios[0].aws_batch_job_queue.qatalyst_job_queue
  to   = module.create_us_batch_helios[0].aws_batch_job_queue.batch_job_queue
}