{{
    config(
         materialized='table'
    )
}}

WITH 
green_july AS (
    SELECT
        PULocationID,
        DOLocationID,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        improvement_surcharge,
        tip_amount,
        tolls_amount,
        total_amount,
        congestion_surcharge,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(lpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(lpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.green_july`
),
green_august AS (
    SELECT
        PULocationID,
        DOLocationID,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        improvement_surcharge,
        tip_amount,
        tolls_amount,
        total_amount,
        congestion_surcharge,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(lpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(lpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.green_august`
),
green_sept AS (
    SELECT
        PULocationID,
        DOLocationID,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        improvement_surcharge,
        tip_amount,
        tolls_amount,
        total_amount,
        congestion_surcharge,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(lpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(lpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.green_sept`
),
green_october AS (
    SELECT
        PULocationID,
        DOLocationID,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        improvement_surcharge,
        tip_amount,
        tolls_amount,
        total_amount,
        congestion_surcharge,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(lpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(lpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.green_october`
),
green_november AS (
    SELECT
        PULocationID,
        DOLocationID,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        improvement_surcharge,
        tip_amount,
        tolls_amount,
        total_amount,
        congestion_surcharge,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(lpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(lpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.green_november`
),
green_december AS (
    SELECT
        PULocationID,
        DOLocationID,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        improvement_surcharge,
        tip_amount,
        tolls_amount,
        total_amount,
        congestion_surcharge,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(lpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(lpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.green_december`
)
SELECT 
    g.*,
    l.*
FROM 
    (SELECT * FROM green_july
    UNION ALL
    SELECT * FROM green_august
    UNION ALL
    SELECT * FROM green_sept
    UNION ALL
    SELECT * FROM green_october
    UNION ALL
    SELECT * FROM green_november
    UNION ALL
    SELECT * FROM green_december) AS g
JOIN 
    `deteamproject.TLC_dataset.taxi_zone_lookup` AS l
ON 
    g.PULocationID = l.LocationID