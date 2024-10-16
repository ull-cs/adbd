# Usar PostgreSQL mediante Docker

Docker es una herramienta muy útil para ejecutar bases de datos como PostgreSQL de manera rápida y sencilla. A continuación, te mostraré cómo puedes configurar y ejecutar PostgreSQL usando Docker.

## Prerrequisitos

Antes de comenzar, asegúrate de tener lo siguiente instalado:

- [Docker](https://docs.docker.com/get-docker/): Docker es necesario para crear contenedores y gestionar imágenes. Puedes instalarlo siguiendo la guía oficial.
- [Docker Compose](https://docs.docker.com/compose/install/) (opcional): Si deseas manejar configuraciones más complejas, Docker Compose facilita el despliegue de múltiples servicios.

## Paso 1: Descargar la Imagen de PostgreSQL

Para empezar, descarga la imagen oficial de PostgreSQL desde Docker Hub. Esto se puede hacer con el siguiente comando:

```shell
docker pull postgres
```

Este comando descarga la última versión de PostgreSQL. Si quieres una versión específica, puedes agregar el número de versión, por ejemplo:

```shell
docker pull postgres:13
```

## Paso 2: Ejecutar un Contenedor de PostgreSQL

Ahora que tienes la imagen, puedes ejecutar PostgreSQL en un contenedor. Utiliza el siguiente comando:

```shell
docker run --name nombre_del_contenedor -e POSTGRES_PASSWORD=tu_contraseña -d -p 5432:5432 postgres
```

Desglose del comando:

- `--name nombre_del_contenedor`: Especifica un nombre para el contenedor.
- `-e POSTGRES_PASSWORD=tu_contraseña`: Establece la contraseña del usuario "postgres".
- `-d`: Ejecuta el contenedor en segundo plano.
- `-p 5432:5432`: Mapea el puerto local 5432 al puerto 5432 del contenedor, que es donde PostgreSQL escucha por defecto.

## Paso 3: Crear un Volumen para la Persistencia de Datos

Para asegurarte de que los datos de la base de datos se conserven, incluso si el contenedor se detiene o elimina, es recomendable usar un volumen:

```shell
docker run --name nombre_del_contenedor -e POSTGRES_PASSWORD=tu_contraseña -v pg_data:/var/lib/postgresql/data -d -p 5432:5432 postgres
```

- `-v pg_data:/var/lib/postgresql/data`: Crea un volumen llamado `pg_data` para almacenar los datos de la base de datos.

## Paso 4: Conectar a PostgreSQL

Una vez que el contenedor esté en ejecución, puedes conectarte a PostgreSQL de varias formas:

### Conectar desde el Contenedor
Puedes conectarte directamente al contenedor usando el siguiente comando:

```shell
docker exec -it nombre_del_contenedor psql -U postgres
```

Esto te abrirá una consola de PostgreSQL donde puedes ejecutar comandos SQL.

### Conectar desde una Aplicación Externa
También puedes conectarte usando una aplicación externa, como pgAdmin o cualquier cliente SQL. Solo necesitas los siguientes datos:

- **Host**: `localhost` o la dirección IP del servidor donde está corriendo Docker.
- **Puerto**: `5432` (u otro si lo configuraste diferente).
- **Usuario**: `postgres`.
- **Contraseña**: La que definiste con el parámetro `POSTGRES_PASSWORD`.

## Paso 5: Usar Docker Compose (Opcional)

Si deseas usar Docker Compose para simplificar la administración del contenedor, puedes crear un archivo `docker-compose.yml` como el siguiente:

```yaml
version: '3.1'

services:
  db:
    image: postgres
    container_name: nombre_del_contenedor
    environment:
      POSTGRES_PASSWORD: tu_contraseña
    ports:
      - "5432:5432"
    volumes:
      - pg_data:/var/lib/postgresql/data

volumes:
  pg_data:
```

Para iniciar el contenedor con Docker Compose, ejecuta:

```shell
docker-compose up -d
```

Este comando lanzará el contenedor en segundo plano.

## Paso 6: Detener y Eliminar el Contenedor

Para detener el contenedor, puedes usar el siguiente comando:

```shell
docker stop nombre_del_contenedor
```

Y para eliminarlo definitivamente:

```shell
docker rm nombre_del_contenedor
```