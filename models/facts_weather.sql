{{ config(materialized='table') }}

SELECT 
    date,
    temperature_2m,
    relative_humidity_2m,
    precipitation,
    rain,
    wind_speed_10m,
    wind_speed_100m,
    wind_direction_10m,
    wind_direction_100m,
    wind_gusts_10m,
    is_day
FROM 
    deteamproject.TLC_dataset.weather_july

UNION ALL

SELECT 
    date,
    temperature_2m,
    relative_humidity_2m,
    precipitation,
    rain,
    wind_speed_10m,
    wind_speed_100m,
    wind_direction_10m,
    wind_direction_100m,
    wind_gusts_10m,
    is_day
FROM 
    deteamproject.TLC_dataset.weather_august

UNION ALL

SELECT 
    date,
    temperature_2m,
    relative_humidity_2m,
    precipitation,
    rain,
    wind_speed_10m,
    wind_speed_100m,
    wind_direction_10m,
    wind_direction_100m,
    wind_gusts_10m,
    is_day
FROM 
    deteamproject.TLC_dataset.weather_september

UNION ALL

SELECT 
    date,
    temperature_2m,
    relative_humidity_2m,
    precipitation,
    rain,
    wind_speed_10m,
    wind_speed_100m,
    wind_direction_10m,
    wind_direction_100m,
    wind_gusts_10m,
    is_day
FROM 
    deteamproject.TLC_dataset.weather_october

UNION ALL

SELECT 
    date,
    temperature_2m,
    relative_humidity_2m,
    precipitation,
    rain,
    wind_speed_10m,
    wind_speed_100m,
    wind_direction_10m,
    wind_direction_100m,
    wind_gusts_10m,
    is_day
FROM 
    deteamproject.TLC_dataset.weather_november

UNION ALL

SELECT 
    date,
    temperature_2m,
    relative_humidity_2m,
    precipitation,
    rain,
    wind_speed_10m,
    wind_speed_100m,
    wind_direction_10m,
    wind_direction_100m,
    wind_gusts_10m,
    is_day
FROM 
    deteamproject.TLC_dataset.weather_december
