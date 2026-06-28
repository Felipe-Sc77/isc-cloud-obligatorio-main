# Arquitectura

Estado actual: propuesta modular validada, sin implementacion Terraform.

## Componentes previstos

- VPC
- Subnets publicas
- Subnets privadas
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Application Load Balancer
- Auto Scaling Group
- EC2
- RDS Multi-AZ
- CloudWatch

## Flujo de alto nivel

1. El trafico publico ingresara por el Application Load Balancer.
2. El ALB enviara trafico a instancias EC2 administradas por un Auto Scaling Group.
3. Las instancias de aplicacion se ubicaran en subnets privadas.
4. RDS Multi-AZ se ubicara en subnets privadas.
5. CloudWatch monitoreara componentes definidos.

