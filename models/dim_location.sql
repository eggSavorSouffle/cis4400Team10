{{
    config(
         materialized='table'
    )
}}

WITH source_data AS (
    SELECT 
        LocationID, 
        Borough, 
        service_zone, 
        Zone,
        (service_zone = 'Yellow Zone') AS IsBelow60thLine
    FROM 
        deteamproject.TLC_dataset.taxi_zone_lookup
)

SELECT * FROM source_data
