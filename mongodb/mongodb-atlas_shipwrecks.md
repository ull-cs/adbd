# Ejercicios MongoDB Atlas - Shipwrecks

1. Buscar los naufragios producidos a una distancia en [1000..5000] de [-73.9667, 40.78].
```json
{
  coordinates: { 
    $near: {
      $geometry: { 
        type: "Point",
        coordinates: [-73.9667, 40.78]   
      },
      $minDistance: 1000,
      $maxDistance: 5000
    }
  }
}
```

2. Buscar los naufragios producidos en la zona delimitada por los puntos [-73.9667, 40.78], [-72.1234, 45.13] y [-72.8123, 44.51].
```json
{
  coordinates: {
    $geoIntersects: {
      $geometry: {
        type: "Polygon",
        coordinates: [
          [ 
            [-73.9667, 40.78],
            [-72.1234, 45.13],
            [-72.8123, 44.51],
            [-73.9667, 40.78]
          ]
        ]
      }
    }
  }
}
```

3. Buscar los naufragios producidos a una distancia mínima de 1000 metros y máxima de 2500 metros de [-73.9667, 40.78].
```json
{
  coordinates: { 
    $nearSphere: {
      $geometry: { 
        type: "Point",
        coordinates: [-73.9667, 40.78]   
      },
      $minDistance: 1000,
      $maxDistance: 2500
    }
  }
}
```

4. Buscar los naufragios producidos a una distancia máxima de 10 del punto [-74, 40.74].
```json
{ 
  coordinates: { 
    $geoWithin: { 
      $center: [ 
        [-74, 40.74],
        10 
      ] 
    } 
  } 
}
```

5. Buscar los naufragios producidos en la caja delimitada por las coordenadas [ -75, 41.2 ] y [ -74, 41.6 ].
```json
{
  coordinates: { 
    $geoWithin: { 
      $box:  [ 
        [ -75, 41.2 ],
        [ -74, 41.6 ]
      ] 
    } 
  }
}
```