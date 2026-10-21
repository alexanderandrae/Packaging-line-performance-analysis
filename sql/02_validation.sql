
USE andrae_brewing_ops;

-- 1. Validate source table row counts

SELECT 'packaging_runs' AS table_name,
       COUNT(*) AS row_count
FROM packaging_runs

UNION ALL

SELECT 'downtime_events', COUNT(*)
FROM downtime_events

UNION ALL

SELECT 'inventory_daily', COUNT(*)
FROM inventory_daily

UNION ALL

SELECT 'wholesale_orders', COUNT(*)
FROM wholesale_orders;


-- 2. Validate wholesale order performance

SELECT
    COUNT(*) AS total_orders,
    SUM(on_time_flag) AS on_time_orders,
    SUM(in_full_flag) AS in_full_orders,

    SUM(CASE
        WHEN actual_ship_date > requested_ship_date
        THEN 1 ELSE 0
    END) AS late_orders,

    ROUND(
        100.0 * SUM(on_time_flag) / COUNT(*), 1
    ) AS on_time_pct,

    ROUND(
        100.0 * SUM(in_full_flag) / COUNT(*), 1
    ) AS in_full_pct

FROM wholesale_orders;


-- 3. Check whether stored flags match source data

SELECT
    SUM(CASE
        WHEN on_time_flag <>
             (actual_ship_date <= requested_ship_date)
        THEN 1 ELSE 0
    END) AS on_time_flag_mismatches,

    SUM(CASE
        WHEN in_full_flag <>
             (shipped_cases >= ordered_cases)
        THEN 1 ELSE 0
    END) AS in_full_flag_mismatches

FROM wholesale_orders;
