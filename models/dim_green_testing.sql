{{
    config(
         materialized='table'
    )
}}

WITH 
green_july AS (
    SELECT
        g.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(lpep_pickup_datetime, INTERVAL EXTRACT(HOUR FROM lpep_pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM lpep_pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.green_july` AS g
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        g.PULocationID = l.LocationID
),
green_august AS (
    SELECT
        g.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(lpep_pickup_datetime, INTERVAL EXTRACT(HOUR FROM lpep_pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM lpep_pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.green_august` AS g
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        g.PULocationID = l.LocationID
),
green_september AS (
    SELECT
        g.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(lpep_pickup_datetime, INTERVAL EXTRACT(HOUR FROM lpep_pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM lpep_pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.green_sept` AS g
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        g.PULocationID = l.LocationID
),
green_october AS (
    SELECT
        g.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(lpep_pickup_datetime, INTERVAL EXTRACT(HOUR FROM lpep_pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM lpep_pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.green_october` AS g
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        g.PULocationID = l.LocationID
),
green_november AS (
    SELECT
        g.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(lpep_pickup_datetime, INTERVAL EXTRACT(HOUR FROM lpep_pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM lpep_pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.green_november` AS g
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        g.PULocationID = l.LocationID
),
green_december AS (
    SELECT
        g.*,
        l.*,
        TIMESTAMP_TRUNC(TIMESTAMP(FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', TIMESTAMP_SUB(TIMESTAMP_SUB(lpep_pickup_datetime, INTERVAL EXTRACT(HOUR FROM lpep_pickup_datetime) HOUR), INTERVAL EXTRACT(MINUTE FROM lpep_pickup_datetime) MINUTE))), HOUR) AS weather_date
    FROM
        `deteamproject.TLC_dataset.green_december` AS g
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        g.PULocationID = l.LocationID
)
SELECT * FROM green_july
UNION ALL
SELECT * FROM green_august
UNION ALL
SELECT * FROM green_september
UNION ALL
SELECT * FROM green_october
UNION ALL
SELECT * FROM green_november
UNION ALL
SELECT * FROM green_december


