- [Introducción](#introducción)
  - [Organización de PostgreSQL](#organización-de-postgresql)
- [Instalación de PostgreSQL](#instalación-de-postgresql)
  - [Linux (Ubuntu)](#linux-ubuntu)
  - [Windows](#windows)
  - [macOS](#macos)
- [Configuración inicial](#configuración-inicial)
  - [Iniciar el servicio](#iniciar-el-servicio)
  - [Cambiar la contraseña de usuario predeterminada](#cambiar-la-contraseña-de-usuario-predeterminada)
- [Creación de una base de datos](#creación-de-una-base-de-datos)
- [Conexión a la base de datos](#conexión-a-la-base-de-datos)
- [Comandos básicos de PostgreSQL](#comandos-básicos-de-postgresql)
  - [Crear una Tabla](#crear-una-tabla)
  - [Insertar datos](#insertar-datos)
  - [Consultar datos](#consultar-datos)
  - [Actualizar datos](#actualizar-datos)
  - [Eliminar datos](#eliminar-datos)
  - [Cierre de la conexión](#cierre-de-la-conexión)
  - [Varios](#varios)
- [Tipos de datos](#tipos-de-datos)


En este tutorial, aprenderás los conceptos básicos de PostgreSQL, un sistema de gestión de bases de datos relacional de código abierto ampliamente utilizado.

# Introducción

PostgreSQL es un sistema de gestión de bases de datos relacionales (RDBMS) de código abierto y uno de los sistemas de bases de datos más avanzados y populares disponibles en la actualidad. Fue creado en la década de 1980 en la Universidad de California, Berkeley, y desde entonces ha experimentado un desarrollo constante y una amplia adopción en la comunidad de desarrollo de software y en la industria.

A continuación, se proporciona una descripción detallada de las características y conceptos clave de PostgreSQL:

- Base de Datos Relacional: PostgreSQL es un sistema de bases de datos relacionales, lo que significa que se basa en el modelo de datos relacional. Los datos se almacenan en tablas con filas y columnas, y se pueden establecer relaciones entre estas tablas.
- Código Abierto: PostgreSQL es un proyecto de código abierto y se distribuye bajo una licencia de código abierto (PostgreSQL License), lo que significa que es gratuito y se puede utilizar, modificar y distribuir de forma gratuita. Esto lo hace accesible para una amplia comunidad de usuarios y desarrolladores.
- Soporte Multiplataforma: PostgreSQL es compatible con una variedad de sistemas operativos, incluyendo Linux, Windows, macOS y otros sistemas Unix-like. Esto le permite funcionar en una amplia gama de entornos.
- Extensibilidad: PostgreSQL es altamente extensible. Los usuarios pueden crear sus propias funciones, operadores, tipos de datos y lenguajes de programación personalizados, lo que lo convierte en una elección popular para proyectos que requieren una funcionalidad específica y personalizada.
- Soporte para SQL Avanzado: PostgreSQL cumple con los estándares SQL y ofrece soporte para características avanzadas de SQL, como subconsultas, transacciones anidadas y desencadenadores (triggers).
- Escalabilidad: PostgreSQL es escalable tanto vertical como horizontalmente. Puede manejar grandes volúmenes de datos y se puede configurar en clústeres para lograr alta disponibilidad y redundancia.
- Seguridad: PostgreSQL tiene sólidas características de seguridad, incluyendo autenticación, autorización y cifrado de datos. También ofrece extensiones para habilitar políticas de seguridad personalizadas.
- Replicación y Recuperación ante Desastres: PostgreSQL admite replicación y permite configurar estrategias de recuperación ante desastres para garantizar la disponibilidad y la integridad de los datos.
- Amplia Comunidad y Ecosistema: PostgreSQL tiene una gran comunidad de usuarios y desarrolladores que contribuyen activamente al proyecto y proporcionan soporte en línea a través de foros, listas de correo y otros recursos.
- Múltiples Lenguajes de Programación: PostgreSQL es compatible con varios lenguajes de programación, lo que facilita la integración con aplicaciones y sistemas existentes.

## Organización de PostgreSQL

PostgreSQL se organiza de una manera estructurada y jerárquica que facilita su administración y uso. A continuación, describiré cómo se organiza PostgreSQL en varios componentes clave:

- Clusters: Un cluster en PostgreSQL es una instancia independiente del motor de la base de datos. Cada cluster tiene su propio conjunto de bases de datos, tablas y configuración. Puedes pensar en un cluster como una instalación de PostgreSQL independiente en tu sistema. Cada cluster se asocia con un puerto y una ubicación en el sistema de archivos.
- Bases de Datos: Cada cluster puede contener una o más bases de datos. Las bases de datos son unidades lógicas de organización que almacenan conjuntos de tablas, funciones, secuencias y otros objetos relacionados. PostgreSQL permite crear múltiples bases de datos dentro de un solo cluster, y cada una de ellas es independiente de las demás.
- Tablas: Las tablas son los objetos fundamentales en una base de datos relacional. Almacenan los datos en filas y columnas. Cada tabla se organiza en un esquema (schema) específico, que actúa como un contenedor lógico para las tablas relacionadas. PostgreSQL admite múltiples esquemas en una base de datos, lo que permite una mejor organización de las tablas.
- Esquemas (Schemas): Los esquemas son contenedores lógicos que se utilizan para organizar y separar las tablas, vistas, funciones y otros objetos en una base de datos. Los esquemas ayudan a evitar conflictos de nombres y facilitan la gestión de bases de datos con múltiples objetos.
- Funciones y Procedimientos Almacenados: PostgreSQL permite la creación de funciones y procedimientos almacenados que se pueden utilizar para realizar operaciones específicas en la base de datos. Estas funciones se almacenan en la base de datos y pueden ser invocadas desde consultas SQL u otras funciones.
- Vistas: Las vistas son consultas SQL predefinidas que actúan como tablas virtuales. Proporcionan una forma de acceder y presentar datos almacenados en tablas de una manera particular, sin necesidad de duplicar físicamente los datos.
- Secuencias (Sequences): Las secuencias son objetos que se utilizan para generar valores numéricos únicos, como identificadores de fila. Son comunes en situaciones en las que se necesita un valor único para una columna en una tabla.
- Índices: PostgreSQL permite crear índices en columnas de tablas para acelerar las consultas y mejorar el rendimiento de la base de datos. Los índices ayudan a buscar datos de manera eficiente.
- Roles y Permisos: PostgreSQL administra la seguridad y el acceso a través de roles de usuario y permisos. Los roles son similares a usuarios y grupos, y se pueden asignar permisos a nivel de base de datos, esquema o tabla para controlar quién puede acceder y modificar los datos.
- Extensiones: PostgreSQL admite extensiones que agregan funcionalidades adicionales a la base de datos. Las extensiones pueden proporcionar características específicas, como el soporte de tipos de datos geoespaciales o capacidades de búsqueda avanzadas.

# Instalación de PostgreSQL

## Linux (Ubuntu)

Puedes instalar PostgreSQL en Ubuntu con el siguiente comando:
```shell
sudo apt update
sudo apt install postgresql
```

## Windows

Descarga el instalador oficial de PostgreSQL desde [el sitio web de PostgreSQL](https://www.postgresql.org/download/windows) y sigue las instrucciones de instalación.

## macOS

Puedes usar Homebrew para instalar PostgreSQL en macOS:
```shell
brew update
brew install postgresql
```

# Configuración inicial

## Iniciar el servicio

En la mayoría de los sistemas, PostgreSQL se inicia automáticamente después de la instalación. Si no, puedes iniciar el servicio de PostgreSQL con:

```shell
sudo service postgresql start
```

## Cambiar la contraseña de usuario predeterminada

La instalación de PostgreSQL crea un usuario llamado `postgres`. Debes cambiar su contraseña:
```shell
sudo -u postgres psql
\password postgres
```

# Creación de una base de datos

Para crear una base de datos, usa el comando `createdb`. Por ejemplo, para crear una base de datos llamada `mi_basededatos`, ejecuta:
```shell
createdb mi_basededatos
```
# Conexión a la base de datos

Puedes conectarte a la base de datos con el comando psql:
```shell
psql -d mi_basededatos
```

# Comandos básicos de PostgreSQL

## Crear una Tabla

Para crear una tabla, usa el comando `CREATE TABLE`. Por ejemplo:
```shell
CREATE TABLE empleados (
    id serial PRIMARY KEY,
    nombre VARCHAR (50),
    salario real
);
```
## Insertar datos

Para insertar datos en la tabla, utiliza INSERT INTO:
```
INSERT INTO empleados (nombre, salario) VALUES ('Juan', 50000);
```
## Consultar datos

Puedes consultar datos utilizando SELECT:
```
SELECT * FROM empleados;
```
## Actualizar datos

Para actualizar datos, usa UPDATE:
```
UPDATE empleados
SET salario = 55000
WHERE nombre = 'Juan';
```
## Eliminar datos

Para eliminar datos, utiliza DELETE:
```
DELETE FROM empleados WHERE nombre = 'Juan';
```

## Cierre de la conexión
Puedes salir de la interfaz de PostgreSQL con:
```
\q
```
## Varios

Listar las bases de datos en el servidor
```
$ \l
```
Conectar a una base de datos:    
```
$ \c dbname username
```
Listar las tablas en la base de datos actual:
```
$ \dt    
```
Ayuda:  
```
$ \?
$ \h nombre comando
```
Grabar el histórico de comandos a un fichero
```
$ \s
```
Ejecutar comandos desde un fichero
```
$\i
```
Salir:
```
\q
```


# Tipos de datos

PostgreSQL es conocido por su rica variedad de tipos de datos, que van más allá de los tipos de datos básicos que se encuentran en la mayoría de los sistemas de gestión de bases de datos. A continuación, se describen algunos de los tipos de datos más comunes y útiles disponibles en PostgreSQL:

1. Números enteros:
- `smallint`: Entero pequeño (de 2 bytes).
- `integer`: Entero (de 4 bytes).
- `bigint`: Entero largo (de 8 bytes).
2. Números de punto flotante:
- `real`: Número real de precisión simple.
- `double precision`: Número real de precisión doble.
3. Números decimales:
- `numeric(p, s)`: Número decimal con precisión y escala definidas.
4. Texto y caracteres:
- `char(n)`: Cadena de caracteres de longitud fija.
- `varchar(n)`: Cadena de caracteres de longitud variable.
- `text`: Cadena de caracteres de longitud variable sin límite.
5. Fecha y hora:
- `date`: Fecha (año, mes, día).
- `time`: Hora del día.
- `timestamp`: Fecha y hora.
- `interval`: Intervalo de tiempo.
- `timestamptz`: Marca de tiempo con zona horaria.
6. Booleanos:
- `boolean`: Valores true o false.
7. Enumerados:
- `enum`: Tipo de datos enumerado definido por el usuario.
8. Redes y Direcciones IP:
- `inet`: Dirección IP o rango de direcciones IP.
- `cidr`: Dirección IP en notación CIDR.
- `macaddr`: Dirección MAC.
9. Geoespaciales:
- `point`: Coordenadas 2D (x, y).
- `line`: Línea.
- `lseg`: Segmento de línea.
- `box`: Cuadro delimitador.
- `path`: Camino.
- `polygon`: Polígono.
- `circle`: Círculo.
- `geography`: Datos geoespaciales en la Tierra.
10. Binarios:
- `bytea`: Tipo de datos binario, se utiliza para almacenar datos en formato binario.
11. Texto de Formato Libre:
- `tsvector`: Vector de búsqueda de texto.
- `tsquery`: Consulta de búsqueda de texto.
12. UUID:
- `uuid`: Identificador único universal.
13. Vectores:
- `array`: Arreglo de elementos del mismo tipo.
14. JSON y JSONB:
- `json`: Datos en formato JSON.
- `jsonb`: Datos en formato JSON binario.
15. Rangos:
- `int4range`, `int8range`, etc.: Rango de valores enteros.
- `tsrange`, `tstzrange`: Rango de marcas de tiempo.
16. Otras Extensiones:
- `PostgreSQL admite la creación de tipos de datos personalizados y extensiones, lo que permite a los usuarios definir sus propios tipos de datos específicos.

Estos son solo algunos ejemplos de los tipos de datos disponibles en PostgreSQL. La versatilidad de los tipos de datos de PostgreSQL es una de las razones por las cuales es ampliamente utilizado en una variedad de aplicaciones, desde sistemas de bases de datos tradicionales hasta aplicaciones geoespaciales y proyectos de datos no estructurados. La elección del tipo de datos adecuado es esencial para el diseño de bases de datos eficientes y funcionales.