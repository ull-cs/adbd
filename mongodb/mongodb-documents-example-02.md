// Documento tipo 1: Información general de una granja
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e5a"),
    "tipo_documento": "granja",
    "nombre": "Granja El Palmar",
    "ubicación": {
        "pais": "España",
        "región": "Canarias",
        "coordenadas": {
            "latitud": 28.1235,
            "longitud": -15.4362
        }
    },
    "tamaño_hectareas": 50,
    "cultivos": ["papas", "plátanos", "tomates"]
}

// Documento tipo 2: Datos climáticos registrados en una fecha específica
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e5b"),
    "tipo_documento": "datos_climaticos",
    "fecha": ISODate("2024-10-14T08:00:00Z"),
    "ubicación_id": ObjectId("651a2b47b1f0a12a6c3e6e5a"),
    "temperatura": {
        "max": 28,
        "min": 18
    },
    "humedad": 65,
    "precipitacion_mm": 12
}

// Documento tipo 3: Registro de plagas detectadas
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e5c"),
    "tipo_documento": "plagas",
    "ubicación_id": ObjectId("651a2b47b1f0a12a6c3e6e5a"),
    "fecha_detectada": ISODate("2024-10-10T14:00:00Z"),
    "tipo_plaga": "pulgón",
    "severidad": "alta",
    "acciones_tomadas": ["aplicación de pesticidas", "monitoreo adicional"]
}

// Documento tipo 4: Registro de prácticas de cultivo
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e5d"),
    "tipo_documento": "practica_cultivo",
    "ubicación_id": ObjectId("651a2b47b1f0a12a6c3e6e5a"),
    "fecha": ISODate("2024-09-25T07:30:00Z"),
    "actividad": "riego",
    "detalles": {
        "tipo_riego": "por goteo",
        "cantidad_agua_litros": 200
    }
}
