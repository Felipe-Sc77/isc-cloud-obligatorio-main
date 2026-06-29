# Decisiones

Este archivo lista decisiones de apoyo. La explicacion principal esta en
`README.md`.

## Repositorios y modulos

Decision: usar un repositorio principal y repositorios separados para modulos
Terraform propios.

Modulos integrados en esta fase:

- `terraform-aws-vpc-module` con `ref=v0.1.0`
- `terraform-aws-alb-module` con `ref=v0.1.0`
- `terraform-aws-asg-module` con `ref=v0.1.0`
- `terraform-aws-rds-module` con `ref=v0.1.0`

El modulo `terraform-aws-monitoring-module` queda diferido.

## Security Groups

Decision: no crear modulo separado de Security Groups.

- El modulo ALB crea el Security Group del ALB.
- El modulo ASG crea el Security Group de la aplicacion y recibe `alb_sg_id`.
- El modulo RDS crea el Security Group de la base de datos y recibe `app_sg_id`.

## Credenciales y archivos locales

Decision: no guardar credenciales en Terraform ni en Git.

- Las credenciales AWS Academy se configuran por variables de entorno.
- `terraform.tfvars` es local y esta ignorado.
- `terraform.tfvars.example` queda versionado solo como ejemplo.
- `.terraform.lock.hcl` se puede versionar porque no contiene secretos y fija la version del provider.

## Alcance actual

Decision: no integrar monitoring, HTTPS, IAM ni Secrets Manager en esta fase.

La prioridad es una version simple y defendible para el obligatorio.
