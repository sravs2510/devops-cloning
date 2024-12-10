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