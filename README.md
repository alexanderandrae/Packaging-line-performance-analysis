
## SQL Analysis

### Data Import and Validation

Imported four synthetic brewery operations
datasets into MySQL:

| Table | Records |
|---|---:|
| packaging_runs | 72 |
| downtime_events | 179 |
| inventory_daily | 240 |
| wholesale_orders | 150 |

Validation confirmed the expected row counts.

An inconsistency was identified between the
original Excel on-time flags and actual shipment
dates. After correcting the CSV source data,
the wholesale order results were:

- On-time delivery: 55.3%
- In-full delivery: 68.7%
- Late orders: 67 out of 150

The next stage will calculate packaging KPIs
and investigate the operational factors
associated with these service outcomes.
