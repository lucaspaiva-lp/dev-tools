# =========================================================
# File: csv_to_db.py
# ---------------------------------------------------------
# Concept:
# - Imports structured CSV data into database
# - Used for bulk loading or legacy imports
# - Assumes schema already exists
# Automation-safe script: reusable across projects with configuration only.
# =========================================================

import csv
import psycopg2

conn = psycopg2.connect(dsn="postgresql://user:password@localhost/db")
cur = conn.cursor()

with open("data.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        cur.execute(
            "INSERT INTO products (name, price) VALUES (%s, %s)",
            (row["name"], row["price"]),
        )

conn.commit()
cur.close()
conn.close()
