FROM alpine:latest

# Instalar los paquetes necesarios (PostgreSQL cliente, bash y cron)
RUN apk add --no-cache postgresql-client bash curl

# Copiar el script de backup al contenedor
COPY pg_backup.sh /usr/local/bin/pg_backup.sh

# Hacer el script ejecutable
RUN chmod +x /usr/local/bin/pg_backup.sh

# Añadir el cron job para que se ejecute cada minuto
RUN echo "* * * * * /usr/local/bin/pg_backup.sh >> /var/log/cron.log 2>&1" > /etc/crontabs/root

# Comando para ejecutar cron en modo foreground
CMD ["crond", "-f"]