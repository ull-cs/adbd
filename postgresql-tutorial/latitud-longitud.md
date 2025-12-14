
- [Latitud y Longitud en PostgreSQL](#latitud-y-longitud-en-postgresql)
  - [Creación de Tabla con Latitud y Longitud](#creación-de-tabla-con-latitud-y-longitud)
    - [Explicación del código](#explicación-del-código)
  - [Uso de PostGIS para datos geoespaciales](#uso-de-postgis-para-datos-geoespaciales)
  - [Consultas Comunes](#consultas-comunes)

# Latitud y Longitud en PostgreSQL

PostgreSQL proporciona capacidad para trabajar con datos geoespaciales, incluyendo la latitud y longitud. Al almacenar coordenadas geográficas, es importante asegurarse de que los valores estén dentro de los rangos permitidos y considerar la opción de extender las capacidades de la base de datos con la extensión PostGIS para funciones avanzadas de análisis geoespacial.

## Creación de Tabla con Latitud y Longitud

A continuación, se presenta un ejemplo de cómo crear una tabla en PostgreSQL que almacene latitud y longitud con restricciones para garantizar que los valores se encuentren en el rango adecuado:

```sql
CREATE TABLE ubicaciones (
    id SERIAL PRIMARY KEY,
    latitud NUMERIC(9, 6) CHECK (latitud >= -90 AND latitud <= 90),
    longitud NUMERIC(9, 6) CHECK (longitud >= -180 AND longitud <= 180)
);
```

### Explicación del código

- `id SERIAL PRIMARY KEY`: Este atributo crea un identificador único para cada registro en la tabla.
- `latitud NUMERIC(9, 6)`: El tipo `NUMERIC(9, 6)` permite almacenar la latitud con hasta 6 decimales, lo cual ofrece una buena precisión para ubicaciones geográficas.
  - `CHECK (latitud >= -90 AND latitud <= 90)`: Este `CHECK` garantiza que los valores de la latitud se encuentren dentro del rango válido, que va de -90 a 90 grados.
- `longitud NUMERIC(9, 6)`: Similar a la latitud, este atributo almacena la longitud con 6 decimales.
  - `CHECK (longitud >= -180 AND longitud <= 180)`: Este `CHECK` asegura que los valores de la longitud estén dentro del rango permitido, de -180 a 180 grados.

## Uso de PostGIS para datos geoespaciales

Si necesitas funcionalidades más avanzadas, como cálculos de distancias, áreas, o trabajar con diferentes sistemas de coordenadas, se recomienda instalar la extensión PostGIS. Para instalar PostGIS, puedes utilizar el siguiente comando:

```sql
CREATE EXTENSION postgis;
```

Una vez que PostGIS esté habilitado, podrás definir una columna de geometría para almacenar puntos geográficos:

```sql
CREATE TABLE ubicaciones_geograficas (
    id SERIAL PRIMARY KEY,
    coordenadas GEOGRAPHY(POINT, 4326)
);
```

En este caso, la columna `coordenadas` almacena un punto geográfico usando el sistema de referencia espacial WGS 84 (EPSG:4326), que es el más común para coordenadas de latitud y longitud.

## Consultas Comunes
Con PostGIS, puedes ejecutar consultas como la de encontrar la distancia entre dos puntos:

```sql
SELECT ST_Distance(
    ST_SetSRID(ST_MakePoint(long1, lat1), 4326),
    ST_SetSRID(ST_MakePoint(long2, lat2), 4326)
) AS distancia;
```

Este ejemplo calcula la distancia entre dos puntos dados en el sistema de referencia WGS 84.