{{ config(materialized='table') }}
SELECT ROW_NUMBER() OVER () AS LocationID, borough, latitude, longitude
FROM deteamproject.TLC_dataset.weather_july
UNION ALL
SELECT ROW_NUMBER() OVER () AS LocationID, borough, latitude, longitude
FROM deteamproject.TLC_dataset.weather_august
UNION ALL 
SELECT ROW_NUMBER() OVER () AS LocationID, borough, latitude, longitude
FROM deteamproject.TLC_dataset.weather_september
UNION ALL 
SELECT ROW_NUMBER() OVER () AS LocationID, borough, latitude, longitude
FROM deteamproject.TLC_dataset.weather_october
UNION ALL 
SELECT ROW_NUMBER() OVER () AS LocationID, borough, latitude, longitude
FROM deteamproject.TLC_dataset.weather_november
UNION ALL 
SELECT ROW_NUMBER() OVER () AS LocationID, borough, latitude, longitude
FROM deteamproject.TLC_dataset.weather_december