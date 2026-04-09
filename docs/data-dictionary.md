## KPI definitions

| KPI | Definition |
|---|---|
| Output | Sum of `actual_cases` |
| Plan attainment | `actual_cases / planned_cases` |
| Waste rate | `waste_cases / actual_cases` |
| Yield | `(actual_cases - waste_cases) / actual_cases` |
| Downtime % | `downtime_minutes / (runtime_minutes + downtime_minutes)` |
| Orders on time % | Number of orders with `on_time_flag = 1` divided by total orders |
| Orders in full % | Number of orders with `in_full_flag = 1` divided by total orders |
| Stock risk days | Count of days where `below_safety_stock_flag = 1` |

---

## Assumptions
- All packaged output is recorded in cases.
- The project covers one canning line only.
- The analysis period is 12 weeks.
- The pack format is standardised to 330ml cans.
- The dataset focuses on packaging and fulfilment only, not brewing or fermentation.
