- [Ejemplo](#ejemplo)

Para crear una tabla en PostgreSQL que contenga un atributo "dni" validado, puedes utilizar una restricción de CHECK para asegurarte de que el valor del DNI cumple con el formato esperado. En el caso de un DNI español, debe tener 8 dígitos seguidos de una letra. 

# Ejemplo
Aquí tienes el código SQL para crear la tabla:
```sql
CREATE TABLE personas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    CONSTRAINT dni_valido CHECK (
        dni ~ '^[0-9]{8}[A-Z]$'
    )
);

-- Opcionalmente, puedes crear una función para validar la letra del DNI
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

En este ejemplo:

1. La tabla `personas` contiene una columna `dni` que tiene una restricción `CHECK` para validar el formato del DNI: 8 dígitos seguidos de una letra mayúscula.
2. La función `validar_dni` comprueba si la letra del DNI es correcta según el algoritmo de verificación del DNI español.
3. Se agrega una restricción adicional a la tabla para validar el DNI utilizando la función `validar_dni`.

Esto asegura que los DNIs insertados en la tabla tengan un formato válido y que la letra sea correcta.