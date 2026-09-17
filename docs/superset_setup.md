# Apache Superset Setup Plan

This project currently uses SQLite for local analysis. The BI layer is planned around Apache Superset so the same business metrics can be visualized through interactive dashboards.

## Planned Dashboard Pages

1. Executive Sales Overview
   - total revenue
   - average order value
   - monthly revenue trend
   - revenue by region

2. Product Performance
   - top products by revenue
   - category contribution
   - regional product ranking

3. Customer Analytics
   - top customers by spend
   - customer revenue contribution
   - order value distribution

## Connection Flow

```text
sales.csv
   ↓
Python / Pandas ETL
   ↓
SQL Database
   ↓
Apache Superset
   ↓
Charts and dashboards
```

## Why Superset

Apache Superset is a Business Intelligence and Data Visualization platform that connects directly to SQL databases. It lets analysts build charts and dashboards without moving the underlying data into a separate visualization application.

## Next Iteration

The next version of this repository will move the database from SQLite to PostgreSQL and connect Superset to the PostgreSQL database for interactive dashboarding.
