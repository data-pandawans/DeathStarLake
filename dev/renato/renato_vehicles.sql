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
    IF(length = 'unknown', NULL, TRY_CAST(length AS INT)) AS length,
    IF(max_atmosphering_speed = 'unknown', NULL, TRY_CAST(max_atmosphering_speed AS INT)) AS max_atmosphering_speed,
    crew,
    IF(passengers = 'unknown', NULL, TRY_CAST(passengers AS INT)) AS passengers,
    IF(cargo_capacity = 'unknown' OR cargo_capacity = 'none', NULL, TRY_CAST(cargo_capacity AS INT)) AS cargo_capacity,
    IF(consumables = 'unknown' OR consumables = 'none', NULL, consumables) AS consumables,
    vehicle_class,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM vehicles