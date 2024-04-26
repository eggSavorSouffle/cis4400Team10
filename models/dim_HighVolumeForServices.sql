{{
    config(
         materialized='table'
    )
}}

SELECT hvfhs_license_num,
       CASE hvfhs_license_num
           WHEN 'HV0002' THEN 'Juno'
           WHEN 'HV0003' THEN 'Uber'
           WHEN 'HV0004' THEN 'Via'
           WHEN 'HV0005' THEN 'Lyft'
           ELSE NULL
       END AS hvfhs_name
FROM deteamproject.TLC_dataset.hv_july

UNION ALL

SELECT hvfhs_license_num,
       CASE hvfhs_license_num
           WHEN 'HV0002' THEN 'Juno'
           WHEN 'HV0003' THEN 'Uber'
           WHEN 'HV0004' THEN 'Via'
           WHEN 'HV0005' THEN 'Lyft'
           ELSE NULL
       END AS hvfhs_name
FROM deteamproject.TLC_dataset.hv_august

UNION ALL

SELECT hvfhs_license_num,
       CASE hvfhs_license_num
           WHEN 'HV0002' THEN 'Juno'
           WHEN 'HV0003' THEN 'Uber'
           WHEN 'HV0004' THEN 'Via'
           WHEN 'HV0005' THEN 'Lyft'
           ELSE NULL
       END AS hvfhs_name
FROM deteamproject.TLC_dataset.hv_september

UNION ALL

SELECT hvfhs_license_num,
       CASE hvfhs_license_num
           WHEN 'HV0002' THEN 'Juno'
           WHEN 'HV0003' THEN 'Uber'
           WHEN 'HV0004' THEN 'Via'
           WHEN 'HV0005' THEN 'Lyft'
           ELSE NULL
       END AS hvfhs_name
FROM deteamproject.TLC_dataset.hv_october

UNION ALL

SELECT hvfhs_license_num,
       CASE hvfhs_license_num
           WHEN 'HV0002' THEN 'Juno'
           WHEN 'HV0003' THEN 'Uber'
           WHEN 'HV0004' THEN 'Via'
           WHEN 'HV0005' THEN 'Lyft'
           ELSE NULL
       END AS hvfhs_name
FROM deteamproject.TLC_dataset.hv_november

UNION ALL

SELECT hvfhs_license_num,
       CASE hvfhs_license_num
           WHEN 'HV0002' THEN 'Juno'
           WHEN 'HV0003' THEN 'Uber'
           WHEN 'HV0004' THEN 'Via'
           WHEN 'HV0005' THEN 'Lyft'
           ELSE NULL
       END AS hvfhs_name
FROM deteamproject.TLC_dataset.hv_december
