# Evidencias del despliegue

| Archivo | Qué demuestra |
|---|---|
| 01-app-alb-funcionando.png | La aplicación responde desde el DNS público del ALB. |
| 02-target-group-healthy.png | El Target Group tiene 2 instancias saludables. |
| 03-auto-scaling-group.png | El Auto Scaling Group mantiene 2 instancias activas y saludables. |
| 04-ec2-instancias-privadas.png | Las instancias EC2 de aplicación están corriendo sin IP pública. |
| 05-rds-multiaz.png | La base de datos RDS MySQL está disponible y tiene Multi-AZ habilitado. |
| 06-rds-backups.png | RDS tiene backups automáticos habilitados por 7 días. |
| 07-route-table-publica-asociaciones.png | La route table pública está asociada a las subnets públicas. |
| 08-route-table-publica-rutas.png | La route table pública tiene salida a internet mediante Internet Gateway. |
| 09-route-table-private-app-rutas.png | La route table privada de aplicación tiene salida mediante NAT Gateway. |
| 10-route-table-private-db-rutas.png | La route table privada de base de datos queda aislada, solo con ruta local. |
| 11-terraform-output-state-list.png | Terraform muestra outputs principales y recursos registrados en el state. |
| 12-alb-resource-map.png | El ALB tiene listener HTTP, Target Group y targets saludables. |
| 13-auto-scaling-group-detalle.png | El Auto Scaling Group tiene capacidad deseada 2 y límites de escalado 2 a 4. |
| 14-cloudwatch-alarms.png | CloudWatch muestra las alarmas de monitoreo para ALB, ASG y RDS. |
