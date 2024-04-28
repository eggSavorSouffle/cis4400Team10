{{
    config(
         materialized='table'
    )
}}

WITH hv_july AS (
    SELECT
        PULocationID,
        DOLocationID,
        trip_miles,
        tips,
        tolls,
        congestion_surcharge,
        airport_fee,
        driver_pay,
        base_passenger_fare AS fare_amount,
        bcf,
        base_passenger_fare * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.hv_july`
),
hv_august AS (
    SELECT
        PULocationID,
        DOLocationID,
        trip_miles,
        tips,
        tolls,
        congestion_surcharge,
        airport_fee,
        driver_pay,
        base_passenger_fare AS fare_amount,
        bcf,
        base_passenger_fare * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.hv_august`
),
hv_september AS (
    SELECT
        PULocationID,
        DOLocationID,
        trip_miles,
        tips,
        tolls,
        congestion_surcharge,
        airport_fee,
        driver_pay,
        base_passenger_fare AS fare_amount,
        bcf,
        base_passenger_fare * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.hv_september`
),
hv_october AS (
    SELECT
        PULocationID,
        DOLocationID,
        trip_miles,
        tips,
        tolls,
        congestion_surcharge,
        airport_fee,
        driver_pay,
        base_passenger_fare AS fare_amount,
        bcf,
        base_passenger_fare * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.hv_october`
),
hv_november AS (
    SELECT
        PULocationID,
        DOLocationID,
        trip_miles,
        tips,
        tolls,
        congestion_surcharge,
        airport_fee,
        driver_pay,
        base_passenger_fare AS fare_amount,
        bcf,
        base_passenger_fare * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.hv_november`
),
hv_december AS (
    SELECT
        PULocationID,
        DOLocationID,
        trip_miles,
        tips,
        tolls,
        congestion_surcharge,
        airport_fee,
        driver_pay,
        base_passenger_fare AS fare_amount,
        bcf,
        base_passenger_fare * 0.08875 AS SalesTax,
        TO_HEX(MD5(TO_JSON_STRING(pickup_datetime))) AS PickupDateID,
        TO_HEX(MD5(TO_JSON_STRING(dropoff_datetime))) AS DropoffDateID
    FROM `deteamproject.TLC_dataset.hv_december`
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
