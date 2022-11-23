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
  "customer.gender": "H",
}
```

3. Buscar las ventas realizadas a mujeres de más de 50 de Austin.
```json
{
  "storeLocation": "Austin",
  "customer.gender": "M",
  "customer.age": {
    $gt: 50
  }
}
```

4. Buscar las ventas de notepads por un precio inferior a 100 dólares.
```json
{
  "items.name": "notepad",
  "items.price": {
    $gt: 100
  }
}
```