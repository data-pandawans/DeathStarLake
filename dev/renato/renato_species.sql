'''
REGRAS DE PADRONIZAÇÃO

1. Para campos com os valores 'unknown', 'N/A', 'n/a' ou 'none', substitua o valor por `NULL`.
2. Para valores grandes (mais de 8 casas) e inteiros, faça um cast para `INT`.
3. Para valores com vírgula que não sejam decimais, mude a vírgula para ponto.
4. Valores com ponto flutuante devem ser convertidos para `DOUBLE`.

'''
SELECT 
    name,
    IF(classification = 'unknown', NULL, classification) AS classification,
    CASE
        WHEN average_height = 'unknown' OR average_height = 'n/a' THEN NULL
        ELSE CAST(average_height AS DOUBLE)
    END AS average_height,
    IF(skin_colors = 'n/a', NULL, skin_colors) AS skin_colors,
    IF(hair_colors = 'unknown' OR hair_colors = 'n/a' OR hair_colors = 'none', NULL, hair_colors) AS hair_colors,
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
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM species