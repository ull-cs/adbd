# Ejercicios MongoDB Atlas - Sales

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
