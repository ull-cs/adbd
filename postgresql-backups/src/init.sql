
-- Crear tabla de clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

-- Insertar algunos datos en la tabla de clientes
INSERT INTO clientes (nombre, correo) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María García', 'maria.garcia@example.com'),
('Carlos Martínez', 'carlos.martinez@example.com');

-- Crear tabla de pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    fecha DATE,
    monto NUMERIC(10, 2)
);

-- Insertar algunos datos en la tabla de pedidos
INSERT INTO pedidos (cliente_id, fecha, monto) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 250.75),
(3, '2023-03-05', 99.99);
