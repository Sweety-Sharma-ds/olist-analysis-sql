# E-Commerce SQL Analytics Project
 
Analysis of a real-world Brazilian e-commerce dataset using MySQL.  
Covers revenue, customer behaviour, product categories, and delivery performance.
 
---
 
## Dataset
- **Source:** Olist Brazilian E-Commerce (Kaggle)
- **Tables:** customers, orders, products, payments, order_items
- **Scale:** ~99,000 orders | ~96,000 customers | ~32,000 products
---
 
## What I Did
- Designed and built a relational database schema from scratch
- Wrote SQL queries across 5 analysis files to answer real business questions
- Used JOINs, subqueries, aggregations, CTEs, and window functions
- Identified key business insights from the data
---
 
## Key Findings
 
**Revenue**
- Total revenue: R$ 16,008,872 across 96,460 orders
- Average order value: R$ 153
- Top 10 customers contributed only 0.42% of total revenue — no whale customers
  
**Customer Retention**
- 97% of customers purchased exactly once and never returned
- Near-zero repeat purchase rate — critical retention problem
  
**Product Categories**
- Health & Beauty generated the highest total revenue (R$ 1.25M)
- PCs had the highest average order value at R$ 1,098 — 7x the overall average
- High-value categories like PCs had very low order volume (203 orders) — untapped potential

**Delivery**
- Average delivery time: 12.5 days
- Worst delivery: 210 days — extreme outlier with no SLA enforcement
- 2,965 orders never reached the customer

**Geography**
- São Paulo alone = 36% of total revenue with the fastest delivery (8.7 days)
- RJ and BA ranked top 7 in revenue but had 13–14% late delivery rates
- High-value states are experiencing the worst delivery service — a direct retention risk
---
 
## SQL Techniques Used
- Multi-table JOINs, GROUP BY, aggregations (SUM, AVG, COUNT)
- Subqueries for retention analysis
- CTEs (WITH clause) for readable multi-step logic
- Window functions — RANK() OVER, NTILE()
- Conditional aggregation — CASE inside SUM for late delivery %
- DATEDIFF for delivery time calculations
- HAVING to filter statistically insignificant groups
- NULLIF to prevent divide-by-zero errors
---
 
## Files
| File | Description |
|------|-------------|
| `setup.sql` | Database and table creation |
| `revenue_overview.sql` | Total revenue, orders, retention check |
| `category_wise_analysis.sql` | Revenue by product category |
| `delivery_analysis.sql` | Average and worst delivery times |
| `statewise_delivery_patern.sql` | State-wise revenue + delivery analysis |

 
---
 
## Tools
MySQL Workbench 

## Author
 
**[Sweety Sharma]**  
[sweetyy955@gmail.com]
 
---

⭐ If you found this useful, feel free to star the repo!
