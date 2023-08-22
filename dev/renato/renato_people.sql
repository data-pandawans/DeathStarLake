'''
REGRAS DE PADRONIZAÇÃO

1. Para campos com os valores 'unknown', 'N/A', 'n/a' ou 'none', substitua o valor por `NULL`.
2. Para valores grandes (mais de 8 casas) e inteiros, faça um cast para `INT`.
3. Para valores com vírgula que não sejam decimais, mude a vírgula para ponto.
4. Valores com ponto flutuante devem ser convertidos para `DOUBLE`.

'''

SELECT
    name,
    TRY_CAST(height AS DOUBLE) AS height,
    TRY_CAST(mass AS DOUBLE) AS mass,
    IF(hair_color = 'n/a' OR hair_color = 'none', NULL, hair_color) AS hair_color,
    IF(skin_color = 'unknown', NULL, skin_color) AS skin_color,
    IF(eye_color = 'unknown', NULL, eye_color) AS eye_color,
    TRY_CAST(SUBSTRING(IF(birth_year = 'unknown', NULL, birth_year), 1, length(birth_year)-3) AS DOUBLE) AS birth_year,
    IF(gender = 'n/a', NULL, gender) AS gender,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM people