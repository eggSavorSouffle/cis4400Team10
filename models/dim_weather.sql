{{ config(materialized='table') }}

SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    'July' AS month_name
FROM deteamproject.TLC_dataset.weather_july
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    'August' AS month_name
FROM deteamproject.TLC_dataset.weather_august
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    'September' AS month_name
FROM deteamproject.TLC_dataset.weather_september
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    'October' AS month_name
FROM deteamproject.TLC_dataset.weather_october
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    'November' AS month_name
FROM deteamproject.TLC_dataset.weather_november
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    'December' AS month_name
FROM deteamproject.TLC_dataset.weather_december
