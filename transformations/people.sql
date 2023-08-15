SELECT
    name,
    CASE 
        WHEN height = 'unknown' THEN NULL 
        ELSE TRY_CAST(height AS INT)
    END AS height,
    CASE
        WHEN mass = 'unknown' THEN NULL
        ELSE TRY_CAST(mass AS INT)
    END AS mass,
    CASE
        WHEN hair_color = 'n/a' or hair_color = 'unkown' THEN NULL
        ELSE TRY_CAST(hair_color AS VARCHAR(20))
    END AS hair_color,
    IF(hair_color LIKE '%blond%', TRUE, FALSE) AS hair_blond,
    IF(hair_color LIKE '%auburn%', TRUE, FALSE) AS hair_auburn,
    IF(hair_color LIKE '%brown%', TRUE, FALSE) AS hair_brown,
    IF(hair_color LIKE '%black%', TRUE, FALSE) AS hair_black,
    IF(hair_color LIKE '%grey%', TRUE, FALSE) AS hair_grey,
    IF(hair_color LIKE '%white%', TRUE, FALSE) AS hair_white,
    CASE
        WHEN skin_color = 'unkown' THEN NULL 
        ELSE TRY_CAST(skin_color AS VARCHAR(20))
    END AS skin_color,
    IF(skin_color LIKE '%grey%', TRUE, FALSE) AS skin_grey,
    IF(skin_color LIKE '%fair%', TRUE, FALSE) AS skin_fair,
    IF(skin_color LIKE '%blue%', TRUE, FALSE) AS skin_blue,
    IF(skin_color LIKE '%yellow%', TRUE, FALSE) AS skin_yellow,
    IF(skin_color LIKE '%tan%', TRUE, FALSE) AS skin_tan,
    IF(skin_color LIKE '%green%', TRUE, FALSE) AS skin_green,
    IF(skin_color LIKE '%red%', TRUE, FALSE) AS skin_red,
    IF(skin_color LIKE '%white%', TRUE, FALSE) AS skin_white,
    IF(skin_color LIKE '%orange%', TRUE, FALSE) AS skin_orange,
    IF(skin_color LIKE '%silver%', TRUE, FALSE) AS skin_silver,
    IF(skin_color LIKE '%light%', TRUE, FALSE) AS skin_light,
    IF(skin_color LIKE '%brown%', TRUE, FALSE) AS skin_brown,
    IF(skin_color LIKE '%gold%', TRUE, FALSE) AS skin_gold,
    IF(skin_color LIKE '%pale%', TRUE, FALSE) AS skin_pale,
    IF(skin_color LIKE '%metal%', TRUE, FALSE) AS skin_metal,
    IF(skin_color LIKE '%dark%', TRUE, FALSE) AS skin_dark,
    CASE
        WHEN eye_color = 'unkown' THEN NULL
        ELSE TRY_CAST(eye_color AS VARCHAR(15))
    END AS eye_color,
    IF( eye_color LIKE '%brown%', TRUE, FALSE) AS eye_brown,
    IF( eye_color LIKE '%black%', TRUE, FALSE) AS eye_black,
    IF( eye_color LIKE '%hazel%', TRUE, FALSE) AS eye_brown,
    IF( eye_color LIKE '%red%', TRUE, FALSE) AS eye_red,
    IF( eye_color LIKE '%blue%', TRUE, FALSE) AS eye_bluen,
    IF( eye_color LIKE '%gold%', TRUE, FALSE) AS eye_brown,
    IF( eye_color LIKE '%yellow%', TRUE, FALSE) AS eye_yellow,
    IF( eye_color LIKE '%white%', TRUE, FALSE) AS eye_white,
    IF( eye_color LIKE '%grey%', TRUE, FALSE) AS eye_gray,
    IF( eye_color LIKE '%orange%', TRUE, FALSE) AS eye_orange,
    IF( eye_color LIKE '%pink%', TRUE, FALSE) AS eye_pink,
    IF( eye_color LIKE '%green%', TRUE, FALSE) AS eye_green,
    CASE 
        WHEN birth_year = 'unknown' THEN NULL 
        ELSE TRY_CAST(REGEXP_EXTRACT(birth_year, '([0-9.]+)') AS DOUBLE)
    END AS birth_year,
    CASE
        WHEN gender = 'unkown' OR gender = 'n/a' THEN NULL
        ELSE TRY_CAST(gender AS VARCHAR(15))
    END AS gender,
    homeworld,
    CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM people;