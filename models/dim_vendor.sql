{{
    config(
         materialized='table'
    )
}}

SELECT 
    ROW_NUMBER() OVER (ORDER BY VendorID) AS 
    base_id,
    VendorID,
    CASE 
        WHEN VendorID = 1 THEN 'Creative Mobile Technologies, LLC'
        WHEN VendorID = 2 THEN 'VeriFone Inc.'
        ELSE NULL  -- or any other default value for other VendorIDs
    END AS VendorName
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

    UNION ALL

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.green_july

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.green_august

    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.green_sept

    UNION ALL 
    
    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.green_october

    UNION ALL
   
    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.green_november
    
    UNION ALL 

    SELECT DISTINCT VendorID
    FROM deteamproject.TLC_dataset.green_december
) AS combined_vendors