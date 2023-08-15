SELECT 
    title,
    TRY_CAST(episode_id AS INT) AS episode_id,
    director,
    producer,
    TRY_CAST(release_date AS TIMESTAMP) AS dt_release,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(created) AS TIMESTAMP) AS ts_created,
    TRY_CAST(FROM_ISO8601_TIMESTAMP_NANOS(edited) AS TIMESTAMP) AS ts_edited
FROM films