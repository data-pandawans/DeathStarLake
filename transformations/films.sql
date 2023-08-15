SELECT 
    TRY_CAST(title AS VARCHAR(35)) AS title,
    TRY_CAST(episode_id AS INT) AS episode_id,
    TRY_CAST(opening_crawl AS VARCHAR(1000)) AS opening_crawl,
    TRY_CAST(director AS VARCHAR(20)) AS director,
    TRY_CAST(producer AS VARCHAR(50)) AS producer,
    TRY_CAST(release_date AS DATE) AS release_date,
    CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited,
    url
FROM films