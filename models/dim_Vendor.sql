{{
    config(
         materialized='table'
    )
}}

SELECT 
    ROW_NUMBER() OVER (ORDER BY VendorID) AS 
    base_id,
    VendorID
FROM (
    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.yellow_july

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.yellow_august

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.yellow_september

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.yellow_october

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.yellow_november

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.yellow_december
) AS combined_vendors;
