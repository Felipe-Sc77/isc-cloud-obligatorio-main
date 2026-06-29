output "vpc_id" {
  description = "ID de la VPC."
  value       = module.network.vpc_id
}

output "alb_dns_name" {
  description = "DNS publico del ALB."
  value       = module.alb.alb_dns_name
}

output "alb_security_group_id" {
  description = "Security Group del ALB."
  value       = module.alb.alb_sg_id
}

output "target_group_arn" {
  description = "ARN del Target Group del ALB."
  value       = module.alb.target_group_arn
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group."
  value       = module.app.asg_name
}

output "app_security_group_id" {
  description = "Security Group de la aplicacion."
  value       = module.app.app_sg_id
}

output "db_endpoint" {
  description = "Endpoint completo de RDS."
  value       = module.database.db_endpoint
}

output "db_address" {
  description = "Direccion DNS de RDS."
  value       = module.database.db_address
}

output "db_port" {
  description = "Puerto de RDS."
  value       = module.database.db_port
}

output "db_name" {
  description = "Nombre de la base de datos."
  value       = module.database.db_name
}

output "alb_unhealthy_hosts_alarm_name" {
  description = "Nombre de la alarma de targets no saludables del ALB."
  value       = module.monitoring.alb_unhealthy_hosts_alarm_name
}

output "asg_cpu_alarm_name" {
  description = "Nombre de la alarma de CPU alta del ASG/EC2."
  value       = module.monitoring.asg_cpu_alarm_name
}

output "rds_cpu_alarm_name" {
  description = "Nombre de la alarma de CPU alta de RDS."
  value       = module.monitoring.rds_cpu_alarm_name
}
