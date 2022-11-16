# Buscar todos los restaurantes.
```
db.collection.find()
```
# Mostrar el identificador, nombre, ciudad y tipo de cocina de los restaurantes.
```
db.collection.find({},
{
  "restaurant_id": 1,
  "name": 1,
  "borough": 1,
  "cuisine": 1
})
```
# Mostrar el identificador, nombre, ciudad y tipo de cocina de los restaurantes. Hay que excluir `_id`.
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
# Mostrar el identificador, nombre, ciudad y código postal de los restaurantes. Hay que excluir _id.
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
# Mostrar todos los restaurantes del Bronx.
```
db.collection.find({
  "borough": "Bronx"
})
```
# Mostrar los 5 primeros restaurantes del Bronx.
```
db.collection.find({
  "borough": "Bronx"
}).limit(5);
```
# Buscar los restaurantes con una puntuación superior a 30.
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
# Buscar los restaurantes con una puntuación superior a 30 pero inferior a 50.
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
# Buscar los restaurantes con una puntuación superior a 30 pero inferior a 50.
```
db.collection.find({
  "address.coord": {
    $lt: -72.0135
  }
})
```
# Buscar los restaurantes ubicados en latitudes inferiores a 72.0135.
```
db.collection.find({
  "address.coord": {
    $lt: -72.0135
  }
})
```
# Buscar los restaurantes que no preparan comida americana con puntuación superior a 30 y ubicados en latitudes inferiores a 72.0135.
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
# Buscar los restaurantes que no preparan comida americana, que al alcanzado una puntuación 'A' y que no se encuentran en Brooklyn.
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