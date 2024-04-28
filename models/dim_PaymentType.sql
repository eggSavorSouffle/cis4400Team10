{{ config(materialized='table') }}

SELECT 
    ROW_NUMBER() OVER () AS PaymentTypeID,
    Payment_type,
    CASE Payment_type
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Cash'
        WHEN 3 THEN 'No Charge'
        WHEN 4 THEN 'Dispute'
        WHEN 5 THEN 'Unknown'
        WHEN 6 THEN 'Voided Trip'
        ELSE NULL
    END AS PaymentDescription
FROM (
    SELECT Payment_type FROM deteamproject.TLC_dataset.green_july
    UNION ALL 
    SELECT Payment_type FROM deteamproject.TLC_dataset.green_august 
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.green_sept
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.green_october
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.green_november
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.green_december
    UNION ALL 
    SELECT Payment_type FROM deteamproject.TLC_dataset.yellow_july
    UNION ALL 
    SELECT Payment_type FROM deteamproject.TLC_dataset.yellow_august 
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.yellow_september
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.yellow_october
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.yellow_november
    UNION ALL
    SELECT Payment_type FROM deteamproject.TLC_dataset.yellow_december
) AS combined_paymenttypes
