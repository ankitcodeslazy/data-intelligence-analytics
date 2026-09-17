# Data Intelligence Analytics

A practical learning project for building Data Intelligence fundamentals with **SQL, Python, analytics, BI concepts, and frontend data consumption**.

> **Status:** In Progress — this repository is being developed as a hands-on learning project for Data Intelligence engineering.

## Project Goal

The project analyzes retail sales data and turns raw records into business insights such as:

- revenue by region and category
- top-performing products
- monthly sales trends
- customer spending rankings
- running totals and comparative metrics

## Tech Stack

- **SQL** — querying, aggregations, CTEs, subqueries, window functions
- **Python / Pandas** — ETL and data preparation
- **SQLite** — local relational database for the current version
- **Apache Superset** — BI/dashboard layer planned for the next iteration
- **React** — frontend analytics interface planned for the next iteration

## Current Architecture

```text
CSV Dataset
    ↓
Python / Pandas ETL
    ↓
SQLite Database
    ↓
Advanced SQL Analysis
    ↓
Business Insights
```

Planned extension:

```text
SQL Database → Python API → React Frontend
       ↓
Apache Superset Dashboards
```

## Repository Structure

```text
data-intelligence-analytics/
├── data/
│   └── sales.csv
├── sql/
│   ├── schema.sql
│   └── analysis.sql
├── etl/
│   └── load_data.py
├── docs/
│   └── superset_setup.md
├── requirements.txt
└── README.md
```

## SQL Concepts Demonstrated

- `SELECT`, `WHERE`, `GROUP BY`, `HAVING`
- aggregate functions: `SUM`, `AVG`, `COUNT`
- Common Table Expressions (CTEs)
- window functions
- `RANK()`
- running totals
- business-oriented analytical queries

## Example Business Questions

1. Which region generates the highest revenue?
2. Which products contribute the most sales?
3. Who are the highest-value customers?
4. How does revenue change month by month?
5. How can products be ranked within each region?

## Run Locally

```bash
pip install -r requirements.txt
python etl/load_data.py
```

This creates a local `sales.db` database. You can then execute the queries in `sql/analysis.sql` using SQLite.

## Why I Built This

I am using this project to strengthen practical **Advanced SQL, Python, Data Analytics, Business Intelligence, and Problem Solving** skills through a realistic end-to-end data workflow rather than isolated coding exercises.
