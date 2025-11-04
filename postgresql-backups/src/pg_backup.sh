#!/bin/bash

PG_USER="admin"
PG_PASSWORD="admin123"
PG_HOST="db"
PG_DB="clientesdb"
BACKUP_DIR="/backups"

# Obtener la fecha y hora actuales en formato: YYYY-MM-DD_HH-MM
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")

# Nombre del archivo de backup con la marca de tiempo
BACKUP_FILE="${BACKUP_DIR}/${PG_DB}_backup_${TIMESTAMP}.sql"

echo "Realizando copia de seguridad en $BACKUP_FILE"

# Ejecutar el comando pg_dump
PGPASSWORD=$PG_PASSWORD pg_dump -U $PG_USER -h $PG_HOST -d $PG_DB > $BACKUP_FILE

# Verificar si la copia fue exitosa
if [ $? -eq 0 ]; then
  echo "Copia de seguridad completada: $BACKUP_FILE"
else
  echo "Error en la copia de seguridad" >&2
fi

cd $BACKUP_DIR

# Contar cuántos archivos hay y eliminar los más antiguos si hay más de 5
ls -t | tail -n +6 | xargs rm -f