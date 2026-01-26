/* =========================================================
   File: aggregates.sql
   ---------------------------------------------------------
   Concept:
   - Summaries and counts
   - Business rule validation
   - Volume and distribution checks
   ========================================================= */

-- Total count
SELECT COUNT(*) FROM example;

-- Count by status
SELECT status, COUNT(*) AS total
FROM orders
GROUP BY status;

-- Sum by category
SELECT category_id, SUM(value) AS total
FROM sales
GROUP BY category_id;