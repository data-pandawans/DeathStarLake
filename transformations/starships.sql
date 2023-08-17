SELECT 
    name,
    model,
    manufacturer,
    CASE 
        WHEN cost_in_credits = 'unknown' THEN NULL
        WHEN cost_in_credits = 'N/A' THEN NULL
        ELSE CAST(cost_in_credits  AS BIGINT)
    END AS cost_in_credits,
    length,
    CASE 
        WHEN max_atmosphering_speed = 'unknown' THEN NULL
        WHEN max_atmosphering_speed = 'N/A' THEN NULL
        ELSE TRY_CAST(REPLACE(max_atmosphering_speed, 'km', '') AS INT)
    END AS max_atmosphering_speed_km,
    REPLACE(crew, ',', '.') AS crew,
    CASE 
        WHEN passengers = 'unknown' THEN NULL
        WHEN passengers = 'N/A' THEN NULL
        WHEN passengers = 'n/a' THEN NULL
        ELSE REPLACE(passengers, ',', '.')
    END AS passengers,
    CASE 
        WHEN cargo_capacity = 'unknown' THEN NULL
        WHEN cargo_capacity = 'N/A' THEN NULL
        WHEN cargo_capacity = 'n/a' THEN NULL        
        ELSE CAST(cargo_capacity  AS BIGINT)
    END AS cargo_capacity,
    CASE 
        WHEN consumables = 'unknown' THEN NULL
        ELSE consumables
    END AS consumables,
    hyperdrive_rating,
    CASE 
        WHEN mglt = 'unknown' THEN NULL
        ELSE mglt
    END AS mglt,
    starship_class,
    pilots,
    films
FROM starships;