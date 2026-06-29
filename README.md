# Obligatorio ISC Cloud - Terraform AWS

## 1. Descripcion del proyecto

Este repositorio principal orquesta la infraestructura del obligatorio de
Implementacion de Soluciones Cloud. La infraestructura se define con Terraform y
usa modulos propios versionados en repositorios separados.

El objetivo es migrar el frontend de una solucion de e-commerce a AWS usando red
base, balanceador de carga, capa de aplicacion con Auto Scaling y base de datos
RDS.

## 2. Arquitectura implementada

La arquitectura queda dividida en cuatro partes:

- Red base con VPC, subnets publicas, subnets privadas de aplicacion y subnets
  privadas de base de datos.
- ALB publico para recibir trafico HTTP.
- Auto Scaling Group con instancias EC2 en subnets privadas de aplicacion.
- RDS MySQL en subnets privadas de base de datos.

El modulo de monitoring queda pendiente para una fase posterior.

## 3. Servicios AWS utilizados

- VPC
- Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Application Load Balancer
- Target Group
- Launch Template
- Auto Scaling Group
- EC2
- RDS MySQL

## 4. Modulos usados y repositorios

Los modulos se consumen desde GitHub usando tags:

- `terraform-aws-vpc-module`: `ref=v0.1.0`
- `terraform-aws-alb-module`: `ref=v0.1.0`
- `terraform-aws-asg-module`: `ref=v0.1.0`
- `terraform-aws-rds-module`: `ref=v0.1.0`

Repositorios:

- `https://github.com/Felipe-Sc77/terraform-aws-vpc-module`
- `https://github.com/Felipe-Sc77/terraform-aws-alb-module`
- `https://github.com/Felipe-Sc77/terraform-aws-asg-module`
- `https://github.com/Felipe-Sc77/terraform-aws-rds-module`

## 5. Estructura de red

La VPC contiene:

- Subnets publicas para el ALB y el NAT Gateway.
- Subnets privadas de aplicacion para las instancias EC2 del ASG.
- Subnets privadas de base de datos para RDS.

Las subnets privadas de aplicacion usan NAT Gateway para descargar paquetes
durante el arranque de las instancias. Las subnets de base de datos quedan
aisladas de Internet.

## 6. Seguridad y firewalling

El ALB acepta trafico HTTP desde Internet.

Las instancias de aplicacion solo aceptan trafico desde el Security Group del
ALB.

RDS solo acepta trafico desde el Security Group de la aplicacion.

No se guardan credenciales de AWS ni passwords reales en el repositorio.

## 7. Tolerancia a fallas

La red se distribuye en dos Availability Zones. El ASG usa subnets privadas de
aplicacion en mas de una zona. RDS puede desplegarse en Multi-AZ mediante la
variable `db_multi_az`.

## 8. Escalabilidad

La capa de aplicacion usa Auto Scaling Group con capacidad minima, deseada y
maxima configurables. El ALB distribuye trafico hacia las instancias registradas
en el Target Group.

## 9. Base de datos y backups

La base de datos usa RDS MySQL. Los backups se controlan con
`db_backup_retention_period`.

Para simplificar el entorno academico, el ejemplo usa
`db_skip_final_snapshot = true`. En un entorno real convendria revisar esa
decision antes de destruir la base de datos.

## 10. Requisitos para ejecutar

- Terraform instalado.
- Credenciales temporales de AWS Academy activas.
- Acceso a Internet para descargar providers y modulos Git.
- Una AMI valida para la region elegida.

## 11. Manejo de credenciales AWS Academy

Las credenciales de AWS Academy no se escriben en archivos Terraform. Se deben
configurar como variables de entorno en PowerShell antes de ejecutar Terraform:

```powershell
$env:AWS_ACCESS_KEY_ID = "..."
$env:AWS_SECRET_ACCESS_KEY = "..."
$env:AWS_SESSION_TOKEN = "..."
```

No subir estos valores a GitHub.

## 12. Variables principales

Las variables principales estan en `variables.tf`. Para preparar un despliegue,
copiar `terraform.tfvars.example` como `terraform.tfvars` y completar valores
reales.

`terraform.tfvars` esta ignorado por Git para evitar subir passwords o datos
sensibles.

## 13. Como ejecutar Terraform

Comandos previstos:

```powershell
terraform init
terraform validate
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

`terraform.tfvars` es un archivo local con valores reales del despliegue. No se
sube a GitHub.

En esta fase de trabajo solo se valida `init` y `validate`. `plan` y `apply` se
ejecutan mas adelante, cuando la configuracion sea revisada.

## 14. Outputs importantes

El repositorio expone:

- ID de la VPC.
- DNS del ALB.
- Security Groups principales.
- Target Group ARN.
- Nombre del ASG.
- Endpoint y datos basicos de RDS.

No se expone `db_password`.

## 15. Buenas practicas Git usadas

- Repositorios separados por modulo.
- Branches por fase de trabajo.
- Commits manuales y revisados.
- Tags para versionar modulos.
- `terraform.tfvars`, state files y credenciales ignoradas por Git.

## 16. Decisiones tecnicas

- Los Security Groups viven dentro de los modulos que los necesitan.
- No se usa modulo separado de Security Groups.
- No se usa HTTPS todavia para evitar certificados ACM en esta primera version.
- No se usa Secrets Manager todavia para mantener el alcance simple.
- No se integra monitoring en esta fase.

## 17. Estado del proyecto

Estado actual: integracion inicial de VPC, ALB, ASG y RDS desde modulos remotos
versionados con `ref=v0.1.0`.
