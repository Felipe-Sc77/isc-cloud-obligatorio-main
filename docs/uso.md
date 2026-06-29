# Uso

La guia principal de uso esta en `README.md`. Este archivo resume el flujo de
trabajo.

## Preparacion

1. Instalar Terraform.
2. Configurar credenciales temporales de AWS Academy como variables de entorno.
3. Copiar `terraform.tfvars.example` a `terraform.tfvars`.
4. Completar `terraform.tfvars` con valores reales del despliegue.

`terraform.tfvars` no se sube a GitHub.

## Comandos

```powershell
terraform init
terraform validate
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

En esta fase se validan `init` y `validate`. `plan` y `apply` quedan para cuando
la configuracion sea revisada.

## Pendiente

- Elegir AMI real para la region.
- Revisar valores reales de CIDR y tamanos.
- Integrar monitoring en una fase posterior.
