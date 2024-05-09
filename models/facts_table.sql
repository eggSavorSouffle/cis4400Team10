{{ config(
    materialized='table'
) }}

WITH fact_table AS (
    SELECT
        GENERATE_UUID() AS FactID,
        v.VendorID AS VendorID,
        p.PaymentTypeID AS PaymentTypeID,
        COALESCE(g.PULocationID, y.PULocationID, hv.PULocationID) AS PULocationID,
        COALESCE(g.DOLocationID, y.DOLocationID, hv.DOLocationID) AS DOLocationID,
        t.TripTypeId AS TripTypeID,
        h.hvfs_id AS hvfs_ID,
        r.RateCodeId AS RateCodeID,
        b.base_id AS base_id,
        COALESCE(g.passenger_count, y.passenger_count) AS passenger_count,
        COALESCE(g.trip_distance, y.trip_distance, hv.trip_miles) AS trip_distance,
        COALESCE(g.fare_amount, y.fare_amount) AS fare_amount,
        COALESCE(g.mta_tax, y.mta_tax) AS mta_tax,
        COALESCE(g.improvement_surcharge, y.improvement_surcharge) AS improvement_surcharge,
        COALESCE(g.tip_amount, y.tip_amount, hv.tips) AS tip_amount,
        COALESCE(g.tolls_amount, y.tolls_amount, hv.tolls) AS tolls_amount,
        COALESCE(g.total_amount, y.total_amount) AS total_amount,
        COALESCE(g.extra, y.extra) AS extra,
        COALESCE(g.congestion_surcharge, hv.congestion_surcharge) AS congestion_surcharge,
        y.airport_fee AS Airport_fee,
        hv.SalesTax AS SalesTax,
        hv.driver_pay AS DriverPay,
        hv.bcf AS bcf
    FROM
        deteamproject.dbt_jguallpa.dim_vendor v
        JOIN deteamproject.dbt_jguallpa.Dim_PaymentType p ON v.VendorId = p.PaymentTypeId
        JOIN deteamproject.dbt_jguallpa.dim_TripType t ON p.PaymentTypeId = t.TripTypeId
        JOIN deteamproject.dbt_jguallpa.dim_RateCode r ON t.TripTypeId = r.RateCodeId
        JOIN deteamproject.dbt_xsouffront.dim_green g ON r.RateCodeId = g.green_id
        JOIN deteamproject.dbt_xsouffront.dim_HighVolumeForServices h ON g.green_id = h.hvfs_id
        JOIN deteamproject.dbt_xsouffront.dim_base b ON h.hvfs_id = b.base_id
        LEFT JOIN deteamproject.dbt_xsouffront.dim_yellow y ON g.green_id = y.yellow_id
        LEFT JOIN deteamproject.dbt_xsouffront.dim_hv hv ON y.yellow_id = hv.hv_id
)
SELECT * FROM fact_table
