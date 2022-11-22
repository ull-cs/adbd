# Ejercicios MongoDB GeoSpatial

1. Buscar los naufragios producir a una distancia en [1000..5000] de [-73.9667,40.78].
```
{
  coordinates: { 
    $near: {
      $geometry: { 
        type: "Point",
        coordinates: [-73.9667,40.78]   
      },
      $minDistance: 1000,
      $maxDistance: 5000
    }
  }
}
```
