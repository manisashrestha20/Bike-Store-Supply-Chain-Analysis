# Bike Store Supply Chain Analysis

## Overview
This project identifies the root causes of shipping delays and inventory stockouts for a global bike retailer. By connecting SQL-cleansed data to Power BI, I discovered that **28.36% of orders are late** due to **25 critical product stockouts**.

## Files Structure
```text
csv/
└── bike_store_data.csv        # Raw dataset
image/
└── dashboard_overview.png     # Dashboard screenshot
powerbi/report/
└── bike_store_report.pbix     # Final Power BI file
sql/
└── bike_store_queries.sql     # SQL scripts for data preparation


📊 Key Insights & Findings
1. The Problem: Shipping & Delivery Crisis
High Late Rate: My analysis identified that 28.36% of all customer orders are shipped late.

Peak Delay Days: Shipping delays are most frequent on Sundays and Mondays, suggesting a weekend processing bottleneck.

Regional Impact: The Baldwin Bikes store location accounts for the highest volume of late orders, significantly impacting overall customer satisfaction.

2. The Root Cause: Inventory Health
Stockout Crisis: SQL analysis revealed 25 critical products with a stock quantity of 0.

Correlation: There is a direct link between these 25 stockouts and the high late-shipping percentage; orders cannot be fulfilled because the physical inventory does not exist.

3. Financial Performance
Revenue Milestone: The business has generated a total of $7.67M in revenue.

Sales Trends: Revenue peaked in 2017 ($3.45M) but saw a decline toward 2018, likely due to the compounding effect of the inventory stockouts.

Top Categories: Mountain Bikes and Road Bikes are the primary revenue drivers.

4. Technical Stack
SQL: Used CTEs and Joins to merge 7+ relational tables into a clean dataset.

Power BI: Built a Star Schema model and authored DAX measures for "Late Shipping %" and "Average Discount."

💡 Recommendations
Prioritize Restocking: Focus on the 25 zero-stock products to reduce the late shipping rate.

Staffing Adjustments: Increase logistics staff on Sundays to handle peak shipping volumes.
