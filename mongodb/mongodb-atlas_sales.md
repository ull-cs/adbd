# Ejercicios MongoDB Atlas - Sales

1. xxx
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
