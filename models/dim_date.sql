{{ config(materialized="table") }}

WITH date_values AS (
    SELECT pickup_datetime AS datetime_value FROM deteamproject.TLC_dataset.fhv_july
    UNION ALL
    SELECT dropOff_datetime FROM deteamproject.TLC_dataset.fhv_july
    UNION ALL
    SELECT pickup_datetime FROM deteamproject.TLC_dataset.fhv_august
    UNION ALL
    SELECT dropOff_datetime FROM deteamproject.TLC_dataset.fhv_august
    UNION ALL
    SELECT pickup_datetime FROM deteamproject.TLC_dataset.fhv_september
    UNION ALL
    SELECT dropOff_datetime FROM deteamproject.TLC_dataset.fhv_september
    UNION ALL
    SELECT pickup_datetime FROM deteamproject.TLC_dataset.fhv_october
    UNION ALL
    SELECT dropOff_datetime FROM deteamproject.TLC_dataset.fhv_october
    UNION ALL
    SELECT pickup_datetime FROM deteamproject.TLC_dataset.fhv_november
    UNION ALL
    SELECT dropOff_datetime FROM deteamproject.TLC_dataset.fhv_november
    UNION ALL
    SELECT pickup_datetime FROM deteamproject.TLC_dataset.fhv_december
    UNION ALL
    SELECT dropOff_datetime FROM deteamproject.TLC_dataset.fhv_december
), parsed_dates AS (
    SELECT
        datetime_value,
        SAFE_CAST(datetime_value AS DATETIME) AS DateISO_Format,
        EXTRACT(YEAR FROM datetime_value) AS Year,
        EXTRACT(QUARTER FROM datetime_value) AS Quarter,
        EXTRACT(MONTH FROM datetime_value) AS Month,
        EXTRACT(DAY FROM datetime_value) AS DayNumber,
        EXTRACT(HOUR FROM datetime_value) AS HourNumber,
        FORMAT_TIMESTAMP('%B', datetime_value) AS MonthName,
        FORMAT_TIMESTAMP('%A', datetime_value) AS DayName,
        EXTRACT(WEEK FROM datetime_value) AS WeekofYear,
        -- Calculate week of month by dividing the day number by 7 and rounding up
        CEIL(EXTRACT(DAY FROM datetime_value) / 7.0) AS WeekofName
    FROM date_values
)

SELECT
    ROW_NUMBER() OVER (ORDER BY datetime_value) AS DateID,
    datetime_value AS DateOriginalFormat,
    DateISO_Format,
    Year,
    Quarter,
    Month,
    DayNumber,
    HourNumber,
    MonthName,
    DayName,
    WeekofName,
    WeekofYear
FROM parsed_dates
