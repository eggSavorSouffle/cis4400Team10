{{ config(materialized='table') }}

SELECT DISTINCT
    RateCodeID, 
    CASE RateCodeID
        WHEN 1 THEN 'Standard Rate'
        WHEN 2 THEN 'JFK'
        WHEN 3 THEN 'Newark'
        WHEN 4 THEN 'Nassau or Westchester'
        WHEN 5 THEN 'Negotiated Fare'
        WHEN 6 THEN 'Group Ride'
        ELSE NULL
    END AS RateCodeName
FROM (
    SELECT RateCodeID FROM deteamproject.TLC_dataset.green_july
    UNION ALL 
    SELECT RateCodeID FROM deteamproject.TLC_dataset.green_august 
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.green_sept
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.green_october
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.green_november
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.green_december
    UNION ALL 
    SELECT RateCodeID FROM deteamproject.TLC_dataset.yellow_july
    UNION ALL 
    SELECT RateCodeID FROM deteamproject.TLC_dataset.yellow_august 
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.yellow_september
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.yellow_october
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.yellow_november
    UNION ALL
    SELECT RateCodeID FROM deteamproject.TLC_dataset.yellow_december
) AS combined_RateCodes