SELECT 
    name,
    TRY_CAST(rotation_period AS INT) AS rotation_period,
    TRY_CAST(orbital_period AS INT) AS orbital_period,
    TRY_CAST(diameter AS INT) AS diameter,
    IF(climate LIKE '%hot%', TRUE, FALSE) AS is_hot,
    IF(climate LIKE '%arid%', TRUE, FALSE) AS is_arid,
    IF(climate LIKE '%rocky%', TRUE, FALSE) AS is_rocky,
    IF(climate LIKE '%windy%', TRUE, FALSE) AS is_windy,
    IF(climate LIKE '%temperate%', TRUE, FALSE) AS is_temperate,
    IF(climate LIKE '%frigid%', TRUE, FALSE) AS is_frigid,
    IF(climate LIKE '%frozen%', TRUE, FALSE) AS is_frozen,
    IF(climate LIKE '%polluted%', TRUE, FALSE) AS is_polluted,
    IF(climate LIKE '%tropical%', TRUE, FALSE) AS is_tropical,
    CASE 
        WHEN gravity = 'unknown' THEN NULL
        WHEN gravity = 'N/A' THEN NULL
        ELSE CAST(SPLIT(gravity, ' ')[1] AS double)
    END AS gravity,
    TRY_CAST(surface_water AS INT) AS surface_water,
    TRY_CAST(population AS INT) AS population,
    CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited
FROM planets
WHERE name != 'unknown'