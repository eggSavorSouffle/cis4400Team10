{{
    config(
         materialized='table'
    )
}}

WITH 
yellow_july AS (
    SELECT
        y.*,
        l.*
    FROM
        `deteamproject.TLC_dataset.yellow_july` AS y
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        y.PULocationID = l.LocationID
),
yellow_august AS (
    SELECT
        y.*,
        l.*
    FROM
        `deteamproject.TLC_dataset.yellow_august` AS y
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        y.PULocationID = l.LocationID
),
yellow_september AS (
    SELECT
        y.*,
        l.*
    FROM
        `deteamproject.TLC_dataset.yellow_september` AS y
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        y.PULocationID = l.LocationID
),
yellow_october AS (
    SELECT
        y.*,
        l.*
    FROM
        `deteamproject.TLC_dataset.yellow_october` AS y
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        y.PULocationID = l.LocationID
),
yellow_november AS (
    SELECT
        y.*,
        l.*
    FROM
        `deteamproject.TLC_dataset.yellow_november` AS y
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        y.PULocationID = l.LocationID
),
yellow_december AS (
    SELECT
        y.*,
        l.*
    FROM
        `deteamproject.TLC_dataset.yellow_december` AS y
    JOIN
        `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
    ON
        y.PULocationID = l.LocationID
)
SELECT * FROM yellow_july
UNION ALL
SELECT * FROM yellow_august
UNION ALL
SELECT * FROM yellow_september
UNION ALL
SELECT * FROM yellow_october
UNION ALL
SELECT * FROM yellow_november
UNION ALL
SELECT * FROM yellow_december