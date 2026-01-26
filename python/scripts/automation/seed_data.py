# =========================================================
# File: seed_data.py
# ---------------------------------------------------------
# Concept:
# - Inserts initial or test data
# - Used for local/dev environments
# - Data is predictable and intentional
# - ATTENTION: DEV TEST
# Automation-safe script: reusable across projects with configuration only.
# =========================================================

import psycopg2

conn = psycopg2.connect(dsn="postgresql://user:password@localhost/db")
cur = conn.cursor()

cur.execute(
    """
INSERT INTO roles (id, name)
VALUES
    (1, 'ADMIN'),
    (2, 'USER')
ON CONFLICT (id) DO NOTHING;
"""
)

conn.commit()
cur.close()
conn.close()
