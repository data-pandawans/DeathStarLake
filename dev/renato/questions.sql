-- 1. Quais são os nomes dos personagens que aparecem em mais filmes da franquia Star Wars?

WITH explode AS (
    SELECT name, films_exploded
    FROM "raw-anakin".people
    CROSS JOIN UNNEST(films) AS t(films_exploded)
)

SELECT 
    name, 
    CARDINALITY(SPLIT(films_exploded, ',')) AS qtd_films
FROM explode
ORDER BY qtd_films DESC
LIMIT 10

-- 2. Quais são os planetas com a maior população dentro do universo de Star Wars?

SELECT 
    name,
    CAST(population AS BIGINT) AS max_population
FROM "raw-anakin".planets
WHERE population != 'unknown'
ORDER BY max_population DESC
LIMIT 5

-- 3. Quais são as espaçonaves mais rápidas da saga Star Wars?

SELECT 
    name
FROM "silver-darthvader".starships
ORDER BY max_atmosphering_speed_km DESC
LIMIT 5

-- 4. Quais os nomes, as classes e a velocidade dos veículos com capacidade de carga maior que 200 Kg? Ordene do mais rápido ao mais lento.

SELECT 
    name,
    vehicle_class,
    cargo_capacity,
    max_atmosphering_speed
FROM "silver-darthvader".vehicles
WHERE cargo_capacity > 200
ORDER BY max_atmosphering_speed DESC

-- 5. Qual é o personagem mais alto e o personagem mais baixo na franquia Star Wars?

SELECT 
    name,
    height
FROM "silver-darthvader".people
WHERE height = (SELECT MIN(height) FROM "silver-darthvader".people) OR
      height = (SELECT MAX(height) FROM "silver-darthvader".people)

-- 6. Quais são os filmes em que o personagem Luke Skywalker aparece e qual é a ordem cronológica desses filmes?

WITH explode AS (
    SELECT name, film_explode
    FROM "raw-anakin".people
    CROSS JOIN UNNEST(films) AS t(film_explode)
    WHERE name = 'Luke Skywalker'
),
films_url AS (
    SELECT name, TRIM(TRIM(splitted, '[]'), ' ') AS url
    FROM explode
    CROSS JOIN UNNEST(SPLIT(film_explode, ',')) AS t(splitted)
),
films_url_clean AS (
    SELECT name, SUBSTRING(url,2,length(url)-2) AS url
    FROM films_url
)

SELECT 
    title,
    episode_id,
    release_date
FROM "silver-darthvader".films AS 
WHERE url IN (
                SELECT
                    url
                FROM 
                    films_url_clean
                )
ORDER BY release_date ASC

-- 7. Quais são as espécies residentes do planeta Tatooine e quais são suas características distintas?

WITH explode AS (
    SELECT name, resident_explode
    FROM "raw-anakin".planets
    CROSS JOIN UNNEST(residents) AS t(resident_explode)
    WHERE name = 'Tatooine'
),
planets_url AS (
    SELECT name, TRIM(TRIM(splitted, '[]'), ' ') AS url
    FROM explode
    CROSS JOIN UNNEST(SPLIT(resident_explode, ',')) AS t(splitted)
),
planets_url_clean AS (
    SELECT name, SUBSTRING(url,2,length(url)-2) AS url
    FROM planets_url
)

SELECT 
    pe.name AS name,
    pe.hair_color AS hair_color,
    pe.skin_color AS skin_color,
    pe.eye_color AS eye_color,
    pe.url
FROM "silver-darthvader".people AS pe
WHERE pe.url IN (
                SELECT
                    url
                FROM 
                    planets_url_clean
                )

-- 8. Quais são os 5 planetas com maiores diâmetros na galáxia de Star Wars?

SELECT 
    name,
    diameter
FROM "silver-darthvader".planets
ORDER BY diameter DESC
LIMIT 5

-- 9. Quais são as espaçonaves que foram pilotadas pelo personagem Han Solo?

WITH explode AS (
    SELECT name, starship_explode
    FROM "raw-anakin".people
    CROSS JOIN UNNEST(starships) AS t(starship_explode)
    WHERE name = 'Han Solo'
),
starships_url AS (
    SELECT name, TRIM(TRIM(splitted, '[]'), ' ') AS url
    FROM explode
    CROSS JOIN UNNEST(SPLIT(starship_explode, ',')) AS t(splitted)
),
starships_url_clean AS (
    SELECT name, SUBSTRING(url,2,length(url)-2) AS url
    FROM starships_url
)

SELECT 
    s.name AS name,
    s.url
FROM "raw-anakin".starships AS s
WHERE s.url IN (
                SELECT
                    url
                FROM 
                    starships_url_clean
                )

-- 10. Qual a quantidade de personagens com a cor de cabelo específica ?

WITH raw_teste AS(
    SELECT name, hair_color
    FROM "silver-darthvader".people
)

SELECT hair_color, COUNT(hair_color) as num_characters
FROM raw_teste
GROUP BY hair_color;
