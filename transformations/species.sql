SELECT 
    name,
    IF(classification = 'unknown', NULL, classification) AS classification,
    CASE
        WHEN average_height = 'unknown' OR average_height = 'n/a' THEN NULL
        ELSE CAST(average_height AS INT)
    END AS average_height,
    IF(skin_colors = 'n/a', NULL, skin_colors) AS skin_colors,
    CASE
        WHEN hair_colors = 'unknown' OR hair_colors = 'n/a' THEN NULL
        WHEN hair_colors = 'none' THEN 'no hair'
        ELSE hair_colors
    END AS hair_colors,
    CASE
        WHEN eye_colors = 'unknown' OR eye_colors = 'n/a' THEN NULL
        ELSE eye_colors
    END AS eye_colors,
    CASE
        WHEN average_lifespan = 'unknown' OR average_lifespan = 'indefinite' THEN NULL
        ELSE CAST(average_lifespan AS INT)
    END AS average_lifespan,
    IF(language = 'unknown' OR language = 'n/a', NULL, language) AS language,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited
FROM species