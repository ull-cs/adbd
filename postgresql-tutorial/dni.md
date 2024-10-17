- [Ejemplo](#ejemplo)
  - [Alternativa 1](#alternativa-1)
  - [Alternativa 2](#alternativa-2)

Para crear una tabla en PostgreSQL que contenga un atributo "dni" validado, puedes utilizar una restricción de CHECK para asegurarte de que el valor del DNI cumple con el formato esperado. En el caso de un DNI español, debe tener 8 dígitos seguidos de una letra. 

# Ejemplo

## Alternativa 1

A continuación se muestra un ejemplo de código SQL donde se crea una tabla `personas` con un atributo `dni` validado:
```sql
CREATE TABLE personas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    CONSTRAINT dni_valido CHECK (
        dni ~ '^[0-9]{8}[A-Z]$'
    )
);
```
Tal como puede comprobarse, la tabla `personas` contiene una columna `dni` que tiene una restricción `CHECK` para validar el formato del DNI: 8 dígitos seguidos de una letra mayúscula. Sin embargo, es importante notar que, en este caso, no se está comprobando que la letra del DNI sea correcta en función de los dígitos del DNI.

## Alternativa 2

De forma alternativa a la anterior, se puede crear una función para validar la letra del DNI:
```sql
CREATE OR REPLACE FUNCTION validar_dni(dni_texto VARCHAR) RETURNS BOOLEAN AS $$
DECLARE
    numeros VARCHAR;
    letra CHAR;
    letras CHAR(23) := 'TRWAGMYFPDXBNJZSQVHLCKE';
    letra_correcta CHAR;
BEGIN
    -- Extraemos los números y la letra del DNI
    numeros := SUBSTRING(dni_texto FROM 1 FOR 8);
    letra := SUBSTRING(dni_texto FROM 9 FOR 1);

    -- Calculamos la letra correcta
    letra_correcta := SUBSTRING(letras FROM (CAST(numeros AS INTEGER) % 23) + 1 FOR 1);

    -- Comparamos la letra proporcionada con la correcta
    RETURN letra = letra_correcta;
END;
$$ LANGUAGE plpgsql;

-- Añadir un constraint para validar el DNI usando la función
ALTER TABLE personas
    ADD CONSTRAINT dni_letra_valida CHECK (validar_dni(dni));
```

En este caso:
1. La función `validar_dni` comprueba si la letra del DNI es correcta según el algoritmo de verificación del DNI español.
2. Se agrega una restricción adicional a la tabla para validar el DNI utilizando la función `validar_dni`.