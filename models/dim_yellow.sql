{{
    config(
         materialized='table'
    )
}}

WITH yellow_july AS (
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
        Airport_fee,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(tpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(tpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.yellow_july`
),
yellow_august AS (
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
        Airport_fee,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(tpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(tpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.yellow_august`
),
yellow_september AS (
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
        Airport_fee,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(tpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(tpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.yellow_september`
),
yellow_october AS (
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
        Airport_fee,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(tpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(tpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.yellow_october`
),
yellow_november AS (
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
        Airport_fee,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(tpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(tpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.yellow_november`
),
yellow_december AS (
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
        Airport_fee,
        fare_amount * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(tpep_pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(tpep_dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.yellow_december`
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
