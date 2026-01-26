
/* =========================================================
   File: debugging.sql
   ---------------------------------------------------------
   Concept:
   - Investigate inconsistent data
   - Detect invalid states
   - Support application bug analysis
   ========================================================= */

-- Unexpected values
SELECT *
FROM example
WHERE value < 0;

-- Missing mandatory fields
SELECT *
FROM users
WHERE email IS NULL;

-- Invalid states
SELECT *
FROM orders
WHERE status NOT IN ('CREATED', 'PAID', 'CANCELLED');