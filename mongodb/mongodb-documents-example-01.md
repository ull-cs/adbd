// Documento 1: Registro de un cultivo de papas
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e5f"),
    "tipo_cultivo": "papas",
    "ubicación": "Parcela 1",
    "fecha_siembra": ISODate("2024-05-01T08:00:00Z"),
    "tiempo_cosecha_dias": 120,
    "detalles_cultivo": {
        "profundidad_siembra_cm": 10,
        "espaciado_cm": 30,
        "variedad": "Spunta"
    }
}

// Documento 2: Registro de un cultivo de plátanos, con datos de monitoreo de crecimiento
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e60"),
    "tipo_cultivo": "plátanos",
    "ubicación": "Parcela 3",
    "fecha_siembra": ISODate("2023-08-15T08:00:00Z"),
    "altura_inicial_cm": 30,
    "detalles_cultivo": {
        "variedad": "Cavendish",
        "riego": "goteo",
        "monitoreo_crecimiento": [
            {
                "fecha": ISODate("2023-09-15T08:00:00Z"),
                "altura_cm": 45
            },
            {
                "fecha": ISODate("2023-10-15T08:00:00Z"),
                "altura_cm": 70
            }
        ]
    }
}

// Documento 3: Registro de un cultivo de tomates con detalles de fertilización
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e61"),
    "tipo_cultivo": "tomates",
    "ubicación": "Parcela 5",
    "fecha_siembra": ISODate("2024-03-01T08:00:00Z"),
    "detalles_cultivo": {
        "variedad": "Cherry",
        "fertilizacion": [
            {
                "fecha": ISODate("2024-03-15T08:00:00Z"),
                "tipo_fertilizante": "Orgánico",
                "cantidad_kg": 2
            },
            {
                "fecha": ISODate("2024-04-15T08:00:00Z"),
                "tipo_fertilizante": "Nitrógeno",
                "cantidad_kg": 1.5
            }
        ],
        "soporte": "tutor"
    }
}

// Documento 4: Registro de un cultivo de fresas con datos de control de plagas
{
    "_id": ObjectId("651a2b47b1f0a12a6c3e6e62"),
    "tipo_cultivo": "fresas",
    "ubicación": "Parcela 2",
    "fecha_siembra": ISODate("2024-02-10T08:00:00Z"),
    "detalles_cultivo": {
        "variedad": "Albión",
        "control_plagas": [
            {
                "fecha": ISODate("2024-03-10T08:00:00Z"),
                "plaga": "Ácaro",
                "tratamiento": "Pesticida orgánico",
                "dosis_ml": 50
            },
            {
                "fecha": ISODate("2024-04-10T08:00:00Z"),
                "plaga": "Pulgón",
                "tratamiento": "Jabón potásico",
                "dosis_ml": 30
            }
        ]
    }
}
