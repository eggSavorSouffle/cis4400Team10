{{
    config(
         materialized='table'
    )
}}

SELECT 
    hvfhs_license_num,
    dispatching_base_num,
    originating_base_num,
    request_datetime,
    on_scene_datetime,
    pickup_datetime,
    dropoff_datetime,
    PULocationID,
    DOLocationID,
    trip_miles,
    trip_time,
    base_passenger_fare,
    tolls,
    bcf,
    sales_tax,
    congestion_surcharge,
    airport_fee,
    tips,
    driver_pay,
    shared_request_flag,
    shared_match_flag,
    access_a_ride_flag,
    wav_request_flag,
    wav_match_flag,
    LocationID,
    Borough,
    Zone,
    service_zone,
    weather_date,
    CONCAT(Borough,'_', weather_date) AS Borough_Weather_Date
FROM deteamproject.dbt_jguallpa.dim_hv_testing