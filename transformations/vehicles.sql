SELECT 
    name,
    model,
    manufacturer,
    CASE 
        WHEN cost_in_credits = 'unknown' THEN NULL
        WHEN cost_in_credits = 'N/A' THEN NULL
        ELSE TRY_CAST(cost_in_credits  AS INT)
    END AS cost_in_credits,
    TRY_CAST(length  AS DOUBLE) AS length,
    TRY_CAST(max_atmosphering_speed  AS INT) AS max_atmosphering_speed,
    TRY_CAST(crew  AS INT) AS crew,
    TRY_CAST(passengers  AS INT) AS passengers,
    CASE 
        WHEN cargo_capacity = 'unknown' THEN NULL
        WHEN cargo_capacity = 'N/A' THEN NULL
        WHEN cargo_capacity = 'none' THEN NULL
        ELSE TRY_CAST(cargo_capacity  AS INT)
    END AS cargo_capacity,
    CASE 
        WHEN consumables = 'unknown' THEN NULL
        WHEN consumables = 'N/A' THEN NULL
        WHEN consumables = 'none' THEN NULL
        ELSE consumables
    END AS consumables,
    vehicle_class,
    pilots,
    films
FROM "vehicles"