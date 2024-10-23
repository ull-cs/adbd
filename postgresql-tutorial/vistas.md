- [Vistas en PostgreSQL](#vistas-en-postgresql)
  - [¿Por qué utilizar vistas?](#por-qué-utilizar-vistas)
  - [Ejemplos](#ejemplos)

# Vistas en PostgreSQL

Las **vistas** en PostgreSQL son una forma de simplificar el acceso a datos y mejorar la seguridad y la administración de la base de datos. Una vista es esencialmente una **consulta almacenada** que se comporta como una tabla virtual. Aunque no almacena datos por sí misma, presenta un resultado específico que puede ser usado como si fuera una tabla, lo cual permite una interacción más sencilla con datos complejos.

## ¿Por qué utilizar vistas?

- **Simplificación**: Las vistas permiten encapsular consultas complejas, de modo que los usuarios pueden realizar operaciones sobre la vista sin preocuparse por la lógica subyacente.
- **Seguridad**: Puedes otorgar permisos sobre la vista, de modo que ciertos usuarios puedan acceder solo a partes específicas de la base de datos, sin ver el contenido completo de las tablas subyacentes.
- **Reutilización**: Si necesitas ejecutar una consulta compleja con frecuencia, puedes definirla como una vista y reutilizarla en vez de escribir el SQL cada vez.

## Ejemplos

1. **Vista simple para mostrar información filtrada**:

   Supongamos que tienes una tabla `clientes` y deseas crear una vista que solo muestre a los clientes activos:

   ```sql
   CREATE VIEW clientes_activos AS
   SELECT id, nombre, email
   FROM clientes
   WHERE estado = 'activo';
   ```

   Ahora, puedes tratar `clientes_activos` como una tabla y realizar consultas como:

   ```sql
   SELECT * FROM clientes_activos;
   ```

2. **Vista con combinación de múltiples tablas**:

   Imagina que tienes dos tablas: `pedidos` y `clientes`, y quieres crear una vista que muestre el nombre del cliente junto con la información del pedido. Puedes definir la vista como:

   ```sql
   CREATE VIEW vista_pedidos_clientes AS
   SELECT c.nombre, p.id_pedido, p.fecha_pedido, p.total
   FROM pedidos p
   JOIN clientes c ON p.id_cliente = c.id;
   ```

   Esto te permite consultar directamente la vista:

   ```sql
   SELECT * FROM vista_pedidos_clientes WHERE total > 100;
   ```