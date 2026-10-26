
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


### Downtime Analysis

Analysed 179 downtime events totalling
5,195 minutes across four packaging SKUs.

**Initial findings:**

- Changeovers were the largest downtime
  contributor (34.3%, 1,782 minutes).
- Mechanical faults accounted for 20.5%
  of downtime, averaging 34.3 minutes
  per event.
- Cleaning/CIP contributed a further
  18.5% of lost time.
- These three categories accounted for
  73.3% of recorded downtime.


### SKU-Level Downtime Findings

**Session IPA — Largest total downtime burden**

Session IPA contributed 2,133 minutes of downtime,
representing 41.1% of the brewery's recorded total.

Changeovers accounted for 57.9% of its downtime,
suggesting production scheduling and batch
sequencing are priorities for investigation.

**Alcohol-Free IPA — Most disrupted per run**

Alcohol-Free IPA averaged 117.9 minutes of downtime
per run, the highest of the four products.

Quality holds and label issues together accounted
for 57.2% of its recorded downtime.

**Planned vs unplanned downtime**

Across all SKUs:
- Planned downtime: 52.8%
- Unplanned downtime: 47.2%

Not all planned downtime is avoidable. Further
analysis will distinguish necessary operational
activities from opportunities to reduce lost time.

*All findings are based on synthetic operational
data for a fictional craft brewery.*


### Packaging Performance Analysis (SQL)

Analysed 72 packaging runs across four SKUs
using MySQL aggregations and calculated KPIs.

**Key results:**
- Total planned output: 12,011 cases
- Total actual output: 10,023 cases
- Overall plan attainment: 83.4%
- Planned-output shortfall: 1,988 cases

**Initial finding:**

Session IPA and Alcohol-Free IPA accounted for
65.6% of the total planned-output shortfall.

Alcohol-Free IPA had the weakest plan attainment
(67.1%) and highest average downtime per run
(117.9 minutes).

**SQL techniques demonstrated:**
- GROUP BY
- SUM() and COUNT()
- AVG()
- ROUND()
- NULLIF()
- Calculated KPI percentages

These findings are based on a synthetic brewery
operations dataset.

