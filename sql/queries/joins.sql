/* =========================================================
   File: joins.sql
   ---------------------------------------------------------
   Concept:
   - Inspect table relationships
   - Validate JOIN logic and cardinality
   - Detect missing or orphaned records
   ========================================================= */

-- Basic relationship check
SELECT a.id AS a_id,
       b.id AS b_id
FROM table_a a
JOIN table_b b ON b.a_id = a.id;

-- Find orphan records
SELECT a.*
FROM table_a a
LEFT JOIN table_b b ON b.a_id = a.id
WHERE b.id IS NULL;