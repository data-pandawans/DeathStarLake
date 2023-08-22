'''
REGRAS DE PADRONIZAÇÃO

1. Para campos com os valores 'unknown', 'N/A', 'n/a' ou 'none', substitua o valor por `NULL`.
2. Para valores grandes (mais de 8 casas) e inteiros, faça um cast para `INT`.
3. Para valores com vírgula que não sejam decimais, mude a vírgula para ponto.
4. Valores com ponto flutuante devem ser convertidos para `DOUBLE`.

'''

SELECT
    name,
    model,
    manufacturer,
    IF(cost_in_credits = 'unknown', NULL, TRY_CAST(cost_in_credits AS INT)) AS cost_in_credits,
    TRY_CAST(REPLACE(length, ',', '') AS DOUBLE) AS length,
    CASE
        WHEN max_atmosphering_speed = 'unknown' THEN NULL
        WHEN max_atmosphering_speed = 'n/a' THEN NULL
        WHEN max_atmosphering_speed LIKE '%km%' THEN TRY_CAST(SUBSTRING(max_atmosphering_speed, 1, length(max_atmosphering_speed)-2) AS INT)
        ELSE TRY_CAST(max_atmosphering_speed AS INT)
    END AS max_atmosphering_speed_km,
    CASE
        WHEN crew = 'unknown' THEN NULL
        WHEN crew = 'N/A' THEN NULL
        ELSE REPLACE(crew, ',', '')
    END AS crew,
    IF(passengers = 'n/a' OR passengers = 'unknown', NULL, TRY_CAST(passengers AS INT)) AS passengers,
    IF(cargo_capacity = 'unknown', NULL, TRY_CAST(cargo_capacity AS INT)) AS cargo_capacity,
    IF(consumables = 'unknown', NULL, consumables) AS consumables,
    IF(hyperdrive_rating = 'unknown', NULL, TRY_CAST(hyperdrive_rating AS DOUBLE)) AS hyperdrive_rating,
    IF(mglt = 'unknown', NULL, TRY_CAST(mglt AS INT)) AS mglt,
    starship_class,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM starships