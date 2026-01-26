# =========================================================
# File: db_health_check.py
# ---------------------------------------------------------
# Concept:
# - Read-only inspection of database health
# - Helps detect bloat, dead tuples, and planner issues
# - Does NOT modify data
# Automation-safe script: reusable across projects with configuration only.
# =========================================================

import psycopg2

conn = psycopg2.connect(dsn="postgresql://user:password@localhost/db")
cur = conn.cursor()

cur.execute(
    """
SELECT relname, n_dead_tup
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC;
"""
)

for row in cur.fetchall():
    print(row)

cur.close()
conn.close()
