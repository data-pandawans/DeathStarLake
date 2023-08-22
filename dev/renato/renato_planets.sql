'''
REGRAS DE PADRONIZAÇÃO

1. Para campos com os valores 'unknown', 'N/A', 'n/a' ou 'none', substitua o valor por `NULL`.
2. Para valores grandes (mais de 8 casas) e inteiros, faça um cast para `INT`.
3. Para valores com vírgula que não sejam decimais, mude a vírgula para ponto.
4. Valores com ponto flutuante devem ser convertidos para `DOUBLE`.

'''

SELECT
    name,
    TRY_CAST(IF(rotation_period = 'unknown', NULL, rotation_period) AS INT) AS rotation_period,
    TRY_CAST(IF(orbital_period = 'unknown', NULL, orbital_period) AS INT) AS orbital_period,
    TRY_CAST(IF(diameter = 'unknown', NULL, diameter) AS INT) AS diameter,
    IF(climate = 'unknown', NULL, REPLACE(climate, ',',' |')) AS climate,
    CASE
        WHEN gravity = 'unknown' THEN NULL
        WHEN gravity = 'N/A' THEN NULL
        ELSE CAST(SPLIT(gravity,' ')[1] AS DOUBLE)
    END AS gravity,
    IF(terrain = 'unknown', NULL, REPLACE(terrain, ',',' |')) AS terrain,
    IF(surface_water = 'unknown', NULL, TRY_CAST(surface_water AS DOUBLE)) AS surface_water,
    IF(population = 'unknown', NULL, TRY_CAST(population AS INT)) AS population,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM planets