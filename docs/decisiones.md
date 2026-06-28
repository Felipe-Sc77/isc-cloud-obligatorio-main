# Decisiones

## Estructura modular inicial

Decision: usar un repositorio principal y cinco repositorios de modulos Terraform propios.

Repositorios:

- `isc-cloud-obligatorio-main`
- `terraform-aws-vpc-module`
- `terraform-aws-alb-module`
- `terraform-aws-asg-module`
- `terraform-aws-rds-module`
- `terraform-aws-monitoring-module`

## Security Groups

Decision: no crear modulo separado de Security Groups.

Reglas:

- `alb-module` crea el Security Group del ALB.
- `asg-module` crea el Security Group de EC2/app y recibe `alb_sg_id`.
- `rds-module` crea el Security Group de RDS y recibe `app_sg_id`.
- `monitoring-module` no crea Security Groups.

## Modulos diferidos

Decision: no agregar por ahora modulos extra de security, storage, notification ni IAM.

Primero se construira una version funcional minima. Luego se evaluaran mejoras.

