{{
    config(
         materialized='table'
    )
}}


SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_july

UNION DISTINCT

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_august

