1) Mostrar todos los documentos (solo el nombre)
```json
[
  { $project: { _id: 0, name: 1 } }
]
```

2) Contar cuántos documentos hay en total
```json
[
  { $count: "total" }
]
```

3) Listar los tipos de habitación disponibles (valores únicos)
```json
[
  { $group: { _id: "$room_type" } },
  { $project: { _id: 0, room_type: "$_id" } },
  { $sort: { room_type: 1 } }
]
```

4) Filtrar solo “Entire home/apt”
```json
[
  { $match: { room_type: "Entire home/apt" } },
  { $limit: 50 } // opcional: limita la salida
]
```

5) Alojamientos con precio por noche < 100
```json
[
  { $match: { pricePerNight: { $lt: 100 } } }
]
```

6) Alojamientos para 4 o más personas
```json
[
  { $match: { accommodates: { $gte: 4 } } }
]
```

7) Alojamientos para ≥4 personas y precio ≤200
```json
[
  { $match: { accommodates: { $gte: 4 }, pricePerNight: { $lte: 200 } } }
]
```

8) Buscar por palabra en el nombre (contiene “beach”, sin mayúsculas/minúsculas)
```json
[
  { $match: { name: { $regex: "beach", $options: "i" } } },
  { $project: { _id: 0, name: 1 } }
]
```

9) Los 10 más baratos (nombre y precio), orden ascendente
```json
[
  { $sort: { pricePerNight: 1 } },
  { $limit: 10 },
  { $project: { _id: 0, name: 1, pricePerNight: 1 } }
]
```

10) Precio medio global (agregación muy básica)
```json
[
  { $group: { _id: null, avgPrice: { $avg: "$pricePerNight" } } },
  { $project: { _id: 0, avgPrice: 1 } }
]
```

11) Número de hosts únicos (por email)
```json
[
  { $group: { _id: "$host_email" } },
  { $count: "distinctHosts" }
]
```

12) Top 5 hosts con más anuncios
```json
[  
  { $group: { _id: "$host_email", host_name: { $first: "$host_name" }, ads: { $sum: 1 } } },
  { $sort: { ads: -1 } },
  { $limit: 5 },
  { $project: { _id: 0, host_email: "$_id", host_name: 1, ads: 1 } }
]
```

13) Precio medio por tipo de habitación (redondeado a 2 decimales)
```json
[  
  { $group: { _id: "$room_type", avgPrice: { $avg: "$pricePerNight" } } },
  { $project: { _id: 0, room_type: "$_id", avgPrice: { $round: ["$avgPrice", 2] } } },
  { $sort: { avgPrice: 1 } }
]
```

14) Top 5 alojamientos de gran capacidad (≥ 6), orden por capacidad y precio
```json
[ 
  { $match: { accommodates: { $gte: 6 } } },
  { $project: { _id: 0, name: 1, accommodates: 1, pricePerNight: 1 } },
  { $sort: { accommodates: -1, pricePerNight: 1 } },
  { $limit: 5 }
]
```

15) Paginación sencilla: ordenar por nombre, saltar 10 y mostrar 5
```json
[ 
  { $sort: { name: 1 } },
  { $skip: 10 },
  { $limit: 5 },
  { $project: { _id: 0, name: 1 } }
]
```

16) Alojamientos con precio entre 100 y 200 (inclusive), mostrar nombre y precio
```json
[  
  { $match: { pricePerNight: { $gte: 100, $lte: 200 } } },
  { $project: { _id: 0, name: 1, pricePerNight: 1 } },
  { $sort: { name: 1 } }
]
```

17) Calcular precio por persona y listar los 10 más baratos por persona
```json
[  
  { $match: { accommodates: { $gt: 0 } } },
  { $addFields: { pricePerPerson: { $divide: ["$pricePerNight", "$accommodates"] } } },
  { $project: { _id: 0, name: 1, accommodates: 1, pricePerNight: 1, pricePerPerson: { $round: ["$pricePerPerson", 2] } } },
  { $sort: { pricePerPerson: 1 } },
  { $limit: 10 }
]
```

18) Distribución automática de precios en 5 grupos (bucket auto)
```json
[  
  { $bucketAuto: { groupBy: "$pricePerNight", buckets: 5, output: { count: { $sum: 1 } } } }
]
```

19) Contar anuncios por dominio del email del host (ej. gmail.com)
```json
[  
  { $match: { host_email: { $type: "string" } } },
  { $addFields: { domain: { $arrayElemAt: [{ $split: ["$host_email", "@"] }, 1] } } },
  { $group: { _id: "$domain", count: { $sum: 1 } } },
  { $project: { _id: 0, domain: "$_id", count: 1 } },
  { $sort: { count: -1, domain: 1 } }
]
```

20) Filtrar por varios tipos de habitación a la vez
```json
[  
  { $match: { room_type: { $in: ["Private room", "Entire home/apt"] } } },
  { $project: { _id: 0, name: 1, room_type: 1 } },
  { $limit: 20 }
]
```