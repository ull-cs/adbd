- [Restauración de una base de datos](#restauración-de-una-base-de-datos)
  - [Pasos para la restauración](#pasos-para-la-restauración)
  - [Opciones útiles de `pg_restore`](#opciones-útiles-de-pg_restore)

# Restauración de una base de datos

Para restaurar una base de datos PostgreSQL desde un archivo con formato `.tar`, puedes utilizar la herramienta `pg_restore`. A continuación se describen los pasos a seguir:

## Pasos para la restauración

1. **Prepara la base de datos**
   
   Antes de realizar la restauración, es recomendable crear una nueva base de datos donde se cargará el contenido del archivo. Esto se puede hacer con el siguiente comando:

   ```sh
   createdb nombre_base_datos
   ```

2. **Ejecuta `pg_restore`**

   Utiliza el comando `pg_restore` para restaurar el archivo `.tar` a la base de datos. La sintaxis general es:

   ```sh
   pg_restore -d nombre_base_datos -U nombre_usuario -h servidor -p puerto ruta_al_archivo.tar
   ```

   Donde:
   - `-d nombre_base_datos`: Especifica la base de datos destino.
   - `-U nombre_usuario`: Define el usuario de PostgreSQL que ejecutará la restauración.
   - `-h servidor`: Especifica el servidor donde se encuentra la base de datos (puede ser `localhost`).
   - `-p puerto`: Indica el puerto de conexión a PostgreSQL (el puerto por defecto es `5432`).
   - `ruta_al_archivo.tar`: Es la ruta del archivo `.tar` que contiene la copia de seguridad.

   Ejemplo de uso:

   ```sh
   pg_restore -d mi_base_datos -U mi_usuario -h localhost -p 5432 /ruta/a/mi_archivo.tar
   ```

## Opciones útiles de `pg_restore`

- `-c`: Elimina los objetos antes de recrearlos.
- `-v`: Proporciona información detallada durante la restauración (modo verbose).
- `--no-owner`: Ignora las instrucciones de propietario en la restauración, útil si restauras en un servidor diferente al original.