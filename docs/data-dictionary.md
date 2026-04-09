# Data Dictionary

## production_runs

| Column | Description |
|---|---|
| run_date | Date of production run |
| plant | Manufacturing site |
| line | Production line |
| sku | Product code |
| shift | Shift worked |
| planned_units | Planned production volume |
| actual_units | Actual production volume |
| scrap_units | Units lost to waste |
| runtime_minutes | Productive runtime |
| downtime_minutes | Lost operating time |
| operator_count | Number of operators on the line |

## downtime_log

| Column | Description |
|---|---|
| event_date | Date of downtime event |
| plant | Manufacturing site |
| line | Production line |
| sku | Product being run |
| downtime_reason | Reason for stoppage |
| downtime_minutes | Minutes lost |
| planned_or_unplanned | Whether stop was planned or unplanned |

## inventory_daily

| Column | Description |
|---|---|
| inventory_date | Date of stock snapshot |
| sku | Product code |
| opening_stock | Stock at start of day |
| produced_units | Units added from production |
| shipped_units | Units shipped that day |
| closing_stock | Stock at end of day |
| safety_stock | Minimum target stock level |
| stockout_flag | Whether stock fell below target |

## orders

| Column | Description |
|---|---|
| order_id | Unique order identifier |
| order_date | Date order was placed |
| ship_date | Date order was shipped |
| customer_region | Customer location or region |
| sku | Product code |
| ordered_units | Units requested |
| shipped_units | Units sent |
| on_time_flag | Whether the order shipped on time |
