-- 1. Total revenue
SELECT ROUND(SUM(revenue), 2) AS total_revenue
FROM sales;

-- 2. Revenue by region
SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- 3. Top 5 products by revenue
SELECT
    product,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 5;

-- 4. Average order value
SELECT ROUND(AVG(revenue), 2) AS average_order_value
FROM sales;

-- 5. Regions with revenue above 10,000
SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(revenue) > 10000
ORDER BY total_revenue DESC;

-- 6. Monthly revenue trend using a Common Table Expression (CTE)
WITH monthly_sales AS (
    SELECT
        substr(order_date, 1, 7) AS month,
        SUM(revenue) AS monthly_revenue
    FROM sales
    GROUP BY substr(order_date, 1, 7)
)
SELECT
    month,
    ROUND(monthly_revenue, 2) AS monthly_revenue
FROM monthly_sales
ORDER BY month;

-- 7. Rank customers by total spend using a window function
WITH customer_spend AS (
    SELECT
        customer_id,
        customer_name,
        SUM(revenue) AS total_spend
    FROM sales
    GROUP BY customer_id, customer_name
)
SELECT
    customer_id,
    customer_name,
    ROUND(total_spend, 2) AS total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS spend_rank
FROM customer_spend;

-- 8. Rank products within each region
WITH product_region_sales AS (
    SELECT
        region,
        product,
        SUM(revenue) AS product_revenue
    FROM sales
    GROUP BY region, product
)
SELECT
    region,
    product,
    ROUND(product_revenue, 2) AS product_revenue,
    RANK() OVER (
        PARTITION BY region
        ORDER BY product_revenue DESC
    ) AS region_rank
FROM product_region_sales
ORDER BY region, region_rank;

-- 9. Running total of revenue by date
WITH daily_sales AS (
    SELECT
        order_date,
        SUM(revenue) AS daily_revenue
    FROM sales
    GROUP BY order_date
)
SELECT
    order_date,
    ROUND(daily_revenue, 2) AS daily_revenue,
    ROUND(
        SUM(daily_revenue) OVER (
            ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS running_revenue
FROM daily_sales
ORDER BY order_date;
