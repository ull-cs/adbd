1. Guardar `init.sql` en la misma carpeta.
2. Guardar `docker-compose.yml` con el siguiente contenido:
```
version: '3.8'

services:

  postgres:
    image: postgres:latest
    container_name: postgres_db
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydb
    volumes:
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
    ports:
      - "5432:5432"
```
3. `docker compose up`
4. Conectarse al contenedor: `docker exec -it postgres_db bash`
5. `psql -U myuser -d mydb`
