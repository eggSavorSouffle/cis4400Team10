{{
    config(
         materialized='table'
    )
}} 

WITH 
hv_july AS (
    SELECT
        h.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(pickup_datetime, INTERVAL EXTRACT(HOUR FROM pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.hv_july` AS h
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        h.PULocationID = l.LocationID
),
hv_august AS (
    SELECT
        h.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(pickup_datetime, INTERVAL EXTRACT(HOUR FROM pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.hv_august` AS h
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        h.PULocationID = l.LocationID
),
hv_september AS (
    SELECT
        h.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(pickup_datetime, INTERVAL EXTRACT(HOUR FROM pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.hv_september` AS h
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        h.PULocationID = l.LocationID
),
hv_october AS (
    SELECT
        h.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(pickup_datetime, INTERVAL EXTRACT(HOUR FROM pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.hv_october` AS h
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        h.PULocationID = l.LocationID
),
hv_november AS (
    SELECT
        h.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(pickup_datetime, INTERVAL EXTRACT(HOUR FROM pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.hv_november` AS h
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        h.PULocationID = l.LocationID
),
hv_december AS (
    SELECT
        h.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(pickup_datetime, INTERVAL EXTRACT(HOUR FROM pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.hv_december` AS h
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        h.PULocationID = l.LocationID
)
SELECT * FROM hv_july
UNION ALL
SELECT * FROM hv_august
UNION ALL
SELECT * FROM hv_september
UNION ALL
SELECT * FROM hv_october
UNION ALL
SELECT * FROM hv_november
UNION ALL
SELECT * FROM hv_december

