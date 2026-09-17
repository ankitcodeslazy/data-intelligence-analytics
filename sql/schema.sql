DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT NOT NULL,
    customer_id TEXT NOT NULL,
    customer_name TEXT NOT NULL,
    region TEXT NOT NULL,
    product TEXT NOT NULL,
    category TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    revenue REAL NOT NULL
);
