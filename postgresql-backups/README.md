# Backups

Este proyecto simula un esceario en el que buscamos hacer copias de seguridad a la base de datos `clientesdb`. Nos hemos basado en Docker Compose para desplegar los siguientes servicios:

1. **pgdb:** Servidor de PostgreSQL en el que se encuentra la bases de datos `clientesdb`. Para crear tablas en `clientesdb`, hemos incluido el script `init.sql`, que será ejecutado por el contenedor **pgdb**, justo después de inicializarse.

2. **pgbackup:** Servicio de copias de seguridad. En este último, se ha automatizado con `crontabs` la realización de las copias. En concreto, hemos planificado que se ejecute el script `pg_backup.sh` cada minuto, el cual accedería al servidor PostgreSQL con privilegios suficientes para hacer una copia de seguridad de `clientesdb`. Para no saturar el espacio de almacenamiento del servidor de copias, el script también incluye el borrado de las copias antiguas, esto es, aquellas que sean anteriores a los últimos 5 minutos.