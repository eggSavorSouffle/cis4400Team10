{{ config(materialized='table') }}

SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    borough, 
    latitude, 
    longitude,
    'July' AS month_name
FROM deteamproject.TLC_dataset.weather_july
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    borough, 
    latitude, 
    longitude,
    'August' AS month_name
FROM deteamproject.TLC_dataset.weather_august
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    borough, 
    latitude, 
    longitude,
    'September' AS month_name
FROM deteamproject.TLC_dataset.weather_september
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    borough, 
    latitude, 
    longitude,
    'October' AS month_name
FROM deteamproject.TLC_dataset.weather_october
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    borough, 
    latitude, 
    longitude,
    'November' AS month_name
FROM deteamproject.TLC_dataset.weather_november
UNION ALL 
SELECT 
    ROW_NUMBER() OVER () AS WeatherTimeID,
    day_of_week,
    month_number,
    borough, 
    latitude, 
    longitude,
    'December' AS month_name
FROM deteamproject.TLC_dataset.weather_december
