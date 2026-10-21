
USE andrae_brewing_ops;

-- ============================================
-- 1. DOWNTIME RECONCILIATION
-- ============================================

SELECT
    (SELECT SUM(downtime_minutes)
     FROM packaging_runs) AS run_downtime,

    (SELECT SUM(downtime_minutes)
     FROM downtime_events) AS event_downtime;


-- ============================================
-- 2. TOTAL DOWNTIME BY REASON
-- ============================================

SELECT
    downtime_reason,
    COUNT(*) AS event_count,
    SUM(downtime_minutes) AS total_minutes,
    ROUND(AVG(downtime_minutes), 1)
        AS avg_minutes_per_event,
    ROUND(
        100.0 * SUM(downtime_minutes) /
        (SELECT SUM(downtime_minutes)
         FROM downtime_events), 1
    ) AS pct_total_downtime
FROM downtime_events
GROUP BY downtime_reason
ORDER BY total_minutes DESC;


-- ============================================
-- 3. DOWNTIME PERFORMANCE BY SKU
-- ============================================

SELECT
    sku,
    COUNT(*) AS total_runs,
    SUM(downtime_minutes) AS total_minutes,
    ROUND(AVG(downtime_minutes), 1)
        AS avg_downtime_per_run
FROM packaging_runs
GROUP BY sku
ORDER BY total_minutes DESC;


-- ============================================
-- 4. DOWNTIME REASONS WITHIN EACH SKU
-- ============================================

SELECT
    e.sku,
    e.downtime_reason,
    COUNT(*) AS event_count,
    SUM(e.downtime_minutes) AS total_minutes,
    ROUND(
        100.0 * SUM(e.downtime_minutes) /
        NULLIF(t.sku_total_minutes, 0), 1
    ) AS pct_of_sku_downtime

FROM downtime_events e

JOIN (
    SELECT
        sku,
        SUM(downtime_minutes) AS sku_total_minutes
    FROM downtime_events
    GROUP BY sku
) t
    ON e.sku = t.sku

GROUP BY
    e.sku,
    e.downtime_reason,
    t.sku_total_minutes

ORDER BY e.sku, total_minutes DESC;


-- ============================================
-- 5. PLANNED VS UNPLANNED DOWNTIME
-- ============================================

SELECT
    planned_unplanned,
    COUNT(*) AS event_count,
    SUM(downtime_minutes) AS total_minutes,
    ROUND(
        100.0 * SUM(downtime_minutes) /
        (SELECT SUM(downtime_minutes)
         FROM downtime_events), 1
    ) AS pct_total_downtime

FROM downtime_events
GROUP BY planned_unplanned
ORDER BY total_minutes DESC;
