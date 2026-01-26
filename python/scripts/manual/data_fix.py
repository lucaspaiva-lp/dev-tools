# =========================================================
# File: data_fix.py
# ---------------------------------------------------------
# Concept:
# - Applies explicit, one-off data corrections
# - Used for controlled fixes (never automatic)
# - Must be reviewed before execution
# =========================================================

import psycopg2

conn = psycopg2.connect(dsn="postgresql://user:password@localhost/db")
cur = conn.cursor()

cur.execute(
    """
UPDATE users
SET active = false
WHERE last_login IS NULL;
"""
)

conn.commit()
cur.close()
conn.close()
