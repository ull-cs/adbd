- [Secuencias en PostgreSQL](#secuencias-en-postgresql)
  - [Características de las secuencias](#características-de-las-secuencias)
  - [Creación de una secuencia](#creación-de-una-secuencia)
  - [Uso de una secuencia en una tabla](#uso-de-una-secuencia-en-una-tabla)
  - [Obtener el siguiente valor de una secuencia](#obtener-el-siguiente-valor-de-una-secuencia)
  - [Ejemplo](#ejemplo)


# Secuencias en PostgreSQL

Las **secuencias** en PostgreSQL son objetos especiales que generan una sucesión de números enteros, generalmente utilizados para proporcionar valores únicos, como los identificadores de las filas de una tabla. Las secuencias son muy útiles para crear campos con valores únicos que no se repiten, como las claves primarias.

Las secuencias en PostgreSQL permiten una gestión eficiente y segura de valores únicos, siendo muy útiles en bases de datos relacionales para asegurar la unicidad y simplificar la inserción de datos.

## Características de las secuencias

- Son independientes de las tablas, lo cual permite compartirlas entre diferentes tablas o columnas.
- Generalmente se usan junto con la función `nextval()` para obtener el siguiente valor de la secuencia.
- Se pueden personalizar parámetros como el valor inicial (`START`), el incremento (`INCREMENT`), y el valor máximo (`MAXVALUE`).

## Creación de una secuencia

Para crear una secuencia, se utiliza el comando `CREATE SEQUENCE`. Un ejemplo básico sería:

```sql
CREATE SEQUENCE ejemplo_secuencia
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;
```

En este ejemplo, la secuencia `ejemplo_secuencia` comenzará en el valor `1` y se incrementará en `1` cada vez que se llame.

## Uso de una secuencia en una tabla

Una secuencia se puede utilizar para llenar automáticamente una columna de una tabla. Aquí hay un ejemplo:

```sql
CREATE TABLE empleados (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
```

En este caso, la columna `id` es del tipo `SERIAL`, que internamente crea y utiliza una secuencia para generar valores únicos.

## Obtener el siguiente valor de una secuencia

Se puede obtener el siguiente valor de una secuencia utilizando la función `nextval()`:

```sql
INSERT INTO empleados (id, nombre) VALUES (nextval('ejemplo_secuencia'), 'Juan Pérez');
```

También es posible utilizar `currval()` para obtener el valor actual de la secuencia y `setval()` para establecer un valor específico.

## Ejemplo

1. Crear una secuencia:

    ```sql
    CREATE SEQUENCE cliente_id_seq
      START WITH 1
      INCREMENT BY 1;
    ```

2. Crear una tabla que utilice la secuencia:

    ```sql
    CREATE TABLE clientes (
      id INTEGER NOT NULL DEFAULT nextval('cliente_id_seq'),
      nombre VARCHAR(100)
    );
    ```

3. Insertar valores en la tabla:

    ```sql
    INSERT INTO clientes (nombre) VALUES ('Ana González');
    INSERT INTO clientes (nombre) VALUES ('Carlos Martínez');
    ```

En este ejemplo, la columna `id` tomará automáticamente los valores generados por la secuencia `cliente_id_seq`.