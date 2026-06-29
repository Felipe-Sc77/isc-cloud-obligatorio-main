variable "aws_region" {
  description = "Region de AWS donde se despliega la infraestructura."
  type        = string
}

variable "project_name" {
  description = "Nombre corto del proyecto, usado para nombrar recursos."
  type        = string
}

variable "environment" {
  description = "Ambiente de trabajo, por ejemplo dev."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDRs de las subnets publicas."
  type        = list(string)
}

variable "private_app_subnet_cidrs" {
  description = "CIDRs de las subnets privadas de aplicacion."
  type        = list(string)
}

variable "private_db_subnet_cidrs" {
  description = "CIDRs de las subnets privadas de base de datos."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones usadas por las subnets."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Habilita NAT Gateway para salida desde subnets privadas de aplicacion."
  type        = bool
  default     = true
}

variable "ami_id" {
  description = "AMI usada por las instancias EC2 de aplicacion."
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para la aplicacion."
  type        = string
  default     = "t2.micro"
}

variable "app_port" {
  description = "Puerto usado por ALB y aplicacion."
  type        = number
  default     = 80
}

variable "asg_min_size" {
  description = "Cantidad minima de instancias en el ASG."
  type        = number
  default     = 2
}

variable "asg_desired_capacity" {
  description = "Cantidad deseada de instancias en el ASG."
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Cantidad maxima de instancias en el ASG."
  type        = number
  default     = 4
}

variable "db_name" {
  description = "Nombre de la base de datos inicial."
  type        = string
}

variable "db_username" {
  description = "Usuario administrador de la base de datos."
  type        = string
}

variable "db_password" {
  description = "Password del usuario administrador de la base de datos."
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Puerto de la base de datos."
  type        = number
  default     = 3306
}

variable "db_engine" {
  description = "Motor de base de datos."
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Version del motor de base de datos."
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "Clase de instancia RDS."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Almacenamiento asignado a RDS en GB."
  type        = number
  default     = 20
}

variable "db_multi_az" {
  description = "Habilita Multi-AZ en RDS."
  type        = bool
  default     = true
}

variable "db_backup_retention_period" {
  description = "Dias de retencion de backups de RDS."
  type        = number
  default     = 7
}

variable "db_skip_final_snapshot" {
  description = "Omite snapshot final al destruir RDS."
  type        = bool
  default     = true
}

variable "db_deletion_protection" {
  description = "Habilita proteccion contra eliminacion de RDS."
  type        = bool
  default     = false
}

variable "monitoring_cpu_threshold" {
  description = "Umbral de CPU para la alarma del ASG/EC2."
  type        = number
  default     = 70
}

variable "monitoring_rds_cpu_threshold" {
  description = "Umbral de CPU para la alarma de RDS."
  type        = number
  default     = 70
}

variable "monitoring_unhealthy_hosts_threshold" {
  description = "Cantidad de targets no saludables que dispara la alarma del ALB."
  type        = number
  default     = 1
}

variable "common_tags" {
  description = "Tags comunes aplicados a los recursos."
  type        = map(string)
  default     = {}
}
