# Arquitectura

Este archivo resume la arquitectura. La documentacion principal esta en
`README.md`.

## Componentes integrados

- VPC con subnets publicas, subnets privadas de aplicacion y subnets privadas de base de datos.
- Internet Gateway y NAT Gateway para salida desde la capa de aplicacion.
- Application Load Balancer publico.
- Auto Scaling Group con instancias EC2 en subnets privadas de aplicacion.
- RDS MySQL en subnets privadas de base de datos.
- CloudWatch con alarmas basicas para ALB, ASG/EC2 y RDS.

## Flujo de alto nivel

1. El trafico HTTP publico ingresa por el ALB.
2. El ALB envia trafico al Target Group.
3. El ASG registra instancias EC2 en ese Target Group.
4. Las instancias de aplicacion se conectan a RDS usando el Security Group de aplicacion.
5. RDS permanece en subnets privadas de base de datos y no es publico.
6. CloudWatch observa targets no saludables, CPU de aplicacion y CPU de RDS.

## Pendiente

- Preparar diagrama final con iconografia de AWS.
