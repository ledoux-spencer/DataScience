# NewWheels_SQL

Date: August 2026  
Project type: SQL analysis (SQL Playground submission)  
Skill level: Intermediate SQL

## Summary
This folder contains my NewWheels SQL Playground submission. The analysis answers business questions about vehicle listings and transactions using SQL — producing customer distributions, maker preferences, feedback trends, order/revenue trends, and summary metrics. The original submission (queries + screenshots + interpretation) is provided as a PDF; sample SQL statements are included for reviewer convenience.

## Files
- `LeDoux_NewWheels_submission.pdf` — full submission (queries, outputs/screenshots, interpretation)  
- `sample_queries.sql` — extracted, copy/paste-ready SQL statements used in the submission  
- `README.md` — this file

## Key findings
- The average customer rating is slightly higher than “Okay” at 3.14 (scale 1–5: Very Bad → Very Good).  
- Last quarter orders account for 20% of all orders (vs. an expected 25% if sales were uniform across quarters).  
- Last quarter net revenue accounted for about 16% of annual revenue (vs. an expected 25% under uniform sales).  
- Only 6 repeat customers are present across ~1,000 orders in the dataset.  
- Less than half of all feedback across the year is positive (Good or Very Good).

## What I did (high level)
- Explored schema and table-level data quality (counts, nulls, distributions).  
- Wrote queries to answer practical business questions: customer counts by state, top vehicle makers (overall and by state), feedback/rating analysis by quarter, orders and net-revenue trends (and quarter-over-quarter change), discounts by card type, and shipping-time analysis.  
- Produced summary metrics for quick executive review (total revenue, total orders, customers, avg feedback rating, Q4 metrics, avg delivery time, share of positive feedback).

## SQL techniques & features demonstrated
- Core relational operations: SELECT, JOIN, GROUP BY, conditional aggregation (CASE).  
- Window functions: RANK(), LAG() for ranking and quarter-over-quarter comparisons.  
- Subqueries and derived tables for percentages and modular logic.  
- Date arithmetic using SQLite `julianday()` for delivery-time calculations.  
- Formatting and presentation: `ROUND()` and percent calculations for readable outputs.

## Notes on data & reproducibility
- The analysis was performed in a hosted SQL Playground — I do not have permission to redistribute the raw tables or underlying CSVs. The PDF includes executed query outputs (screenshots); `sample_queries.sql` contains the extracted SQL for reviewers to inspect or run against compatible data.  
- If you want runnable examples, I can help reproduce the logic on a sanitized sample dataset on request.

## How to view
- Click `LeDoux_NewWheels_submission.pdf` to open the full submission in your browser.  
- Open `sample_queries.sql` to review or copy queries into your SQL editor.

## Contact
Spencer LeDoux — ledouxs@gmail.com
