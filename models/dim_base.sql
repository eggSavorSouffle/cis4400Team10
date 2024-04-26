{{
    config(
         materialized='table'
    )
}}


SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_july

UNION ALL

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_august

UNION ALL

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_september

UNION ALL

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_october

UNION ALL

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_november

UNION ALL

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_december
