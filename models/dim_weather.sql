{{ config(materialized='table') }}

{{ config(materialized='table') }}

SELECT 
    CONCAT(borough, '_', date) AS borough_date,
    date,
    (temperature_2m * 9 / 5) + 32 AS temperature_2m_F,
    relative_humidity_2m AS relative_humidity_2m,
    precipitation AS precipitation_mm,
    rain AS rain_mm,
    wind_speed_10m * 0.621371 AS wind_speed_10m_mph,
    wind_speed_100m * 0.621371 AS wind_speed_100m_mph,
    wind_direction_10m AS wind_direction_10m,
    wind_direction_100m AS wind_direction_100m,
    wind_gusts_10m * 0.621371 AS wind_gusts_10m_mph,
    is_day,
    borough, 
    latitude, 
    longitude,
    day_of_week,
    month_number,
    'July' AS month_name
FROM 
    deteamproject.TLC_dataset.weather_july

UNION ALL

SELECT 
    CONCAT(borough, '_', date) AS borough_date,
    date,
    (temperature_2m * 9 / 5) + 32 AS temperature_2m_F,
    relative_humidity_2m AS relative_humidity_2m,
    precipitation AS precipitation_mm,
    rain AS rain_mm,
    wind_speed_10m * 0.621371 AS wind_speed_10m_mph,
    wind_speed_100m * 0.621371 AS wind_speed_100m_mph,
    wind_direction_10m AS wind_direction_10m,
    wind_direction_100m AS wind_direction_100m,
    wind_gusts_10m * 0.621371 AS wind_gusts_10m_mph,
    is_day,
    borough, 
    latitude, 
    longitude,
    day_of_week,
    month_number,
    'August' AS month_name
FROM 
    deteamproject.TLC_dataset.weather_august

UNION ALL

SELECT 
    CONCAT(borough, '_', date) AS borough_date,
    date,
    (temperature_2m * 9 / 5) + 32 AS temperature_2m_F,
    relative_humidity_2m AS relative_humidity_2m,
    precipitation AS precipitation_mm,
    rain AS rain_mm,
    wind_speed_10m * 0.621371 AS wind_speed_10m_mph,
    wind_speed_100m * 0.621371 AS wind_speed_100m_mph,
    wind_direction_10m AS wind_direction_10m,
    wind_direction_100m AS wind_direction_100m,
    wind_gusts_10m * 0.621371 AS wind_gusts_10m_mph,
    is_day,
    borough, 
    latitude, 
    longitude,
    day_of_week,
    month_number,
    'September' AS month_name
FROM 
    deteamproject.TLC_dataset.weather_september

UNION ALL

SELECT 
    CONCAT(borough, '_', date) AS borough_date,
    date,
    (temperature_2m * 9 / 5) + 32 AS temperature_2m_F,
    relative_humidity_2m AS relative_humidity_2m,
    precipitation AS precipitation_mm,
    rain AS rain_mm,
    wind_speed_10m * 0.621371 AS wind_speed_10m_mph,
    wind_speed_100m * 0.621371 AS wind_speed_100m_mph,
    wind_direction_10m AS wind_direction_10m,
    wind_direction_100m AS wind_direction_100m,
    wind_gusts_10m * 0.621371 AS wind_gusts_10m_mph,
    is_day,
    borough, 
    latitude, 
    longitude,
    day_of_week,
    month_number,
    'October' AS month_name
FROM 
    deteamproject.TLC_dataset.weather_october

UNION ALL

SELECT 
    CONCAT(borough, '_', date) AS borough_date,
    date,
    (temperature_2m * 9 / 5) + 32 AS temperature_2m_F,
    relative_humidity_2m AS relative_humidity_2m,
    precipitation AS precipitation_mm,
    rain AS rain_mm,
    wind_speed_10m * 0.621371 AS wind_speed_10m_mph,
    wind_speed_100m * 0.621371 AS wind_speed_100m_mph,
    wind_direction_10m AS wind_direction_10m,
    wind_direction_100m AS wind_direction_100m,
    wind_gusts_10m * 0.621371 AS wind_gusts_10m_mph,
    is_day,
    borough, 
    latitude, 
    longitude,
    day_of_week,
    month_number,
    'November' AS month_name
FROM 
    deteamproject.TLC_dataset.weather_november

UNION ALL

SELECT 
    CONCAT(borough, '_', date) AS borough_date,
    date,
    (temperature_2m * 9 / 5) + 32 AS temperature_2m_F,
    relative_humidity_2m AS relative_humidity_2m,
    precipitation AS precipitation_mm,
    rain AS rain_mm,
    wind_speed_10m * 0.621371 AS wind_speed_10m_mph,
    wind_speed_100m * 0.621371 AS wind_speed_100m_mph,
    wind_direction_10m AS wind_direction_10m,
    wind_direction_100m AS wind_direction_100m,
    wind_gusts_10m * 0.621371 AS wind_gusts_10m_mph,
    is_day,
    borough, 
    latitude, 
    longitude,
    day_of_week,
    month_number,
    'December' AS month_name
FROM 
    deteamproject.TLC_dataset.weather_december
ORDER BY date
