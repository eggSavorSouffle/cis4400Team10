{{
    config(
        materialized='table'
    )
}}

SELECT *,
    CONCAT(Borough, '_', weather_date) AS Borough_Weather_Date
FROM deteamproject.dbt_jguallpa.dim_yellow_testing
