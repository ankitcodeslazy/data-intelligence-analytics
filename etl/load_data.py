from pathlib import Path
import sqlite3
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent.parent
CSV_PATH = BASE_DIR / "data" / "sales.csv"
DB_PATH = BASE_DIR / "sales.db"


def load_sales_data() -> None:
    """Read the CSV, perform basic validation, and load it into SQLite."""
    df = pd.read_csv(CSV_PATH)

    required_columns = {
        "order_id", "order_date", "customer_id", "customer_name",
        "region", "product", "category", "quantity", "unit_price", "revenue"
    }

    missing_columns = required_columns.difference(df.columns)
    if missing_columns:
        raise ValueError(f"Missing required columns: {sorted(missing_columns)}")

    df["order_date"] = pd.to_datetime(df["order_date"], errors="raise").dt.strftime("%Y-%m-%d")
    df = df.drop_duplicates(subset=["order_id"])

    with sqlite3.connect(DB_PATH) as connection:
        df.to_sql("sales", connection, if_exists="replace", index=False)

    print(f"Loaded {len(df)} rows into {DB_PATH}")


if __name__ == "__main__":
    load_sales_data()
