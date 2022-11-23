# Ejercicios MongoDB Playground - Restaurants

1. Buscar todos los restaurantes.
```
db.collection.find()
```
2. Mostrar el identificador, nombre, ciudad y tipo de cocina de los restaurantes.
```
db.collection.find({},
{
  "restaurant_id": 1,
  "name": 1,
  "borough": 1,
  "cuisine": 1
})
```
3. Mostrar el identificador, nombre, ciudad y tipo de cocina de los restaurantes. Hay que excluir `_id`.
```
db.collection.find({},
{
  "restaurant_id": 1,
  "name": 1,
  "borough": 1,
  "cuisine": 1,
  "_id": 0
})
```
4. Mostrar el identificador, nombre, ciudad y código postal de los restaurantes. Hay que excluir _id.
```
db.collection.find({},
{
  "restaurant_id": 1,
  "name": 1,
  "borough": 1,
  "address.zipcode": 1,
  "_id": 0
})
```
5. Mostrar todos los restaurantes del Bronx.
```
db.collection.find({
  "borough": "Bronx"
})
```
6. Mostrar los 5 primeros restaurantes del Bronx.
```
db.collection.find({
  "borough": "Bronx"
}).limit(5);
```
7. Mostrar los restaurantes con una puntuación superior a 30.
```
db.collection.find({
  grades: {
    $elemMatch: {
      "score": {
        $gt: 30
      }
    }
  }
})
```
8. Mostrar los restaurantes con una puntuación superior a 30 pero inferior a 50.
```
db.collection.find({
  grades: {
    $elemMatch: {
      "score": {
        $gt: 30,
        $lt: 50
      }
    }
  }
})
```
9. Mostrar los restaurantes ubicados en latitudes inferiores a 72.0135.
```
db.collection.find({
  "address.coord": {
    $lt: -72.0135
  }
})
```
10. Mostrar los restaurantes que no preparan comida americana con puntuación superior a 30 y ubicados en latitudes inferiores a 72.0135.
```
db.collection.find({
  $and: [
    {
      "cuisine": {
        $ne: "American "
      }
    },
    {
      "grades.score": {
        $gt: 30
      }
    },
    {
      "address.coord": {
        $lt: -72.754168
      }
    }
  ]
})
```
11. Buscar los restaurantes que no preparan comida americana, que han alcanzado una puntuación 'A' y que no se encuentran en Brooklyn.
```
db.collection.find({
  "cuisine": {
    $ne: "American"
  },
  "grades.grade": "A",
  "borough": {
    $ne: "Brooklyn"
  }
})
```
12. Mostrar el identificador, nombre, ciudad y tipo de cocina de los restaurantes que contienen `Wil` como primeras letras de su nombre.
```
db.collection.find(
    {name: /^Wil/},
    {
        "restaurant_id" : 1,
        "name":1,"borough":1,
        "cuisine" :1
    }
)
```

13. Mostrar restaurantes que se encuentren en el Bronx y que preparen comida americana o china.
```
db.collection.find({
  "borough": "Bronx",
  $or: [
    {
      "cuisine": "American "
    },
    {
      "cuisine": "Chinese"
    }
  ]
})
```

14. Mostrar el identificador, nombre, ciudad y tipo de cocina de restaurantes ubicados en Staten Island, Queens, Bronx o Brooklyn.
```
db.collection.find({
  "borough": {
    $in: [
      "Staten Island",
      "Queens",
      "Bronx",
      "Brooklyn"
    ]
  }
},
{
  "restaurant_id": 1,
  "name": 1,
  "borough": 1,
  "cuisine": 1
})
```
15. Mostrar los restaurantes de los que se sepa la calle.
```
db.collection.find({
  "address.street": {
    $exists: true
  }
})
```