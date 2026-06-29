module "network" {
  source = "git::https://github.com/Felipe-Sc77/terraform-aws-vpc-module.git?ref=v0.1.0"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr                 = var.vpc_cidr
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs  = var.private_db_subnet_cidrs
  availability_zones       = var.availability_zones
  enable_nat_gateway       = var.enable_nat_gateway

  common_tags = var.common_tags
}

module "alb" {
  source = "git::https://github.com/Felipe-Sc77/terraform-aws-alb-module.git?ref=v0.1.0"

  project_name = var.project_name
  environment  = var.environment

  vpc_id            = module.network.vpc_id
  vpc_cidr_block    = module.network.vpc_cidr_block
  public_subnet_ids = module.network.public_subnet_ids

  alb_port          = var.app_port
  app_port          = var.app_port
  health_check_path = "/"

  common_tags = var.common_tags
}

module "app" {
  source = "git::https://github.com/Felipe-Sc77/terraform-aws-asg-module.git?ref=v0.1.0"

  project_name = var.project_name
  environment  = var.environment

  vpc_id                 = module.network.vpc_id
  private_app_subnet_ids = module.network.private_app_subnet_ids
  alb_sg_id              = module.alb.alb_sg_id
  target_group_arn       = module.alb.target_group_arn

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  app_port         = var.app_port
  min_size         = var.asg_min_size
  desired_capacity = var.asg_desired_capacity
  max_size         = var.asg_max_size

  common_tags = var.common_tags
}

module "database" {
  source = "git::https://github.com/Felipe-Sc77/terraform-aws-rds-module.git?ref=v0.1.0"

  project_name = var.project_name
  environment  = var.environment

  vpc_id                = module.network.vpc_id
  private_db_subnet_ids = module.network.private_db_subnet_ids
  app_sg_id             = module.app.app_sg_id

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  db_port     = var.db_port

  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage

  multi_az                = var.db_multi_az
  backup_retention_period = var.db_backup_retention_period
  skip_final_snapshot     = var.db_skip_final_snapshot
  deletion_protection     = var.db_deletion_protection

  common_tags = var.common_tags
}

module "monitoring" {
  source = "git::https://github.com/Felipe-Sc77/terraform-aws-monitoring-module.git?ref=v0.1.0"

  project_name = var.project_name
  environment  = var.environment

  alb_arn_suffix          = module.alb.alb_arn_suffix
  target_group_arn_suffix = module.alb.target_group_arn_suffix
  asg_name                = module.app.asg_name
  db_instance_id          = module.database.db_instance_id

  cpu_threshold             = var.monitoring_cpu_threshold
  rds_cpu_threshold         = var.monitoring_rds_cpu_threshold
  unhealthy_hosts_threshold = var.monitoring_unhealthy_hosts_threshold

  common_tags = var.common_tags
}
