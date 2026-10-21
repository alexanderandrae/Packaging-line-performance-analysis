
USE andrae_brewing_ops;

SELECT
    sku,

    COUNT(*) AS total_runs,

    SUM(planned_cases) AS planned_cases,

    SUM(actual_cases) AS actual_cases,

    ROUND(
        SUM(actual_cases) * 100.0 /
        NULLIF(SUM(planned_cases), 0), 1
    ) AS plan_attainment_pct,

    ROUND(
        SUM(waste_cases) * 100.0 /
        NULLIF(SUM(actual_cases), 0), 1
    ) AS waste_rate_pct,

    ROUND(
        AVG(downtime_minutes), 1
    ) AS avg_downtime_per_run

FROM packaging_runs

GROUP BY sku

ORDER BY actual_cases DESC;
