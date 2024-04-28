{{ config(materialized='table') }}

SELECT 
    ROW_NUMBER() OVER () AS TripTypeID,
    trip_type,
    CASE trip_type
        WHEN 1 THEN 'Street Hail'
        WHEN 2 THEN 'Dispatch'
        ELSE NULL
    END AS TripType
FROM (
    SELECT trip_type FROM deteamproject.TLC_dataset.green_july
    UNION ALL 
    SELECT trip_type FROM deteamproject.TLC_dataset.green_august 
    UNION ALL
    SELECT trip_type FROM deteamproject.TLC_dataset.green_sept
    UNION ALL
    SELECT trip_type FROM deteamproject.TLC_dataset.green_october
    UNION ALL
    SELECT trip_type FROM deteamproject.TLC_dataset.green_november
    UNION ALL
    SELECT trip_type FROM deteamproject.TLC_dataset.green_december
) AS combined_triptypes
