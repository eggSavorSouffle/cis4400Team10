{{
    config(
         materialized='table'
    )
}}

SELECT *
FROM deteamproject.dbt_jguallpa.dim_hv_testing_2 AS hv
JOIN deteamproject.dbt_jguallpa.dim_weather AS weather
ON hv.Borough_Weather_Date = weather.borough_date

