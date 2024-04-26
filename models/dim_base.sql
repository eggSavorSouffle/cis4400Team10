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

UNION DISTINCT

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_september

UNION DISTINCT

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_october

UNION DISTINCT

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_november

UNION DISTINCT

SELECT DISTINCT dispatching_base_num, hvfhs_license_num
FROM deteamproject.TLC_dataset.hv_december

