# MongoDB Atlas - Sales

1. Buscar las ventas realizadas a través de tiendas de Seatle.
```json
{
  "storeLocation": "Seatle"
}
```

2. Buscar las ventas realizadas a hombres.
```json
{
  "customer.gender": "M",
}
```

3. Buscar las ventas realizadas a mujeres de más de 50 de Austin.
```json
{
  "storeLocation": "Austin",
  "customer.gender": "F",
  "customer.age": {
    $gt: 50
  }
}
```

4. Buscar las ventas de 2 productos donde uno sea un notepad por un precio inferior a 100 dólares.
```json
{ 
  "items": {
    $size: 2
  },
  "items.name": "notepad",
  "items.price": {
    $gt: 100
  }
}
```

5. Buscar las ventas online realizadas entre el 01/03/2015 y el 17/05/2017. Revise el formato ISODate de MongoDB para esto.
```json
{
  saleDate: {
    $gte: ISODate("2015-03-01"),
    $lt: ISODate("2017-05-17")
  },
  purchaseMethod: "Online"
}
```

6. Buscar las ventas telefónicas realizadas antes del 17/05/2017 por clientes con cuentas de correo @hem.uy.
```json
{
  "saleDate": {
    $lt: ISODate("2017-05-17")
  },
  "purchaseMethod": "Phone",
  "customer.email": /hem.uy/
}
```

7. Buscar las ventas con algún producto de escritura (writing).
```json
{
  "items.tags": { 
    $elemMatch: { 
      $eq: "writing" 
    } 
  } 
}
```

8. Buscar las ventas realizadas en la tienda después del 06/03/2015. Mostrar únicamente el correo electrónico y la edad del cliente.

Filter:
```json
{
  "saleDate": {
    $gte: ISODate("2017-03-06")
  },
  "purchaseMethod": "In store"
}
```
Project:
```json
{
  "customer.email": 1, 
  "customer.age": 1
}
```

9. Buscar las ventas de sobres realizadas online después del 14/04/2017. Ordenar las ventas por fecha de venta. Mostrar únicamente la fecha de venta, el correo electrónico y la edad del cliente.

Filter:
```json
{
  "saleDate": {
    $gte: ISODate("2017-04-14")
  },
  "purchaseMethod": "Online"
}
```
Project:
```json
{
  "saleDate": 1,
  "customer.email": 1,
  "customer.age": 1
}
```
Sort:
```json
{ 
  "saleDate": 1
}
```