# SQL Quick Reference — PostgreSQL

Purpose -> fast consultation of DDL, DML, queries, and reporting logic
Scope -> SQL only (no backend, no architecture)

---

## 1. Database Management (DDL)

```sql
CREATE DATABASE db_name; -> create database
```

```sql
SELECT datname FROM pg_database; -> list databases
```

```sql
DROP DATABASE db_name; -> delete database
```

---

## 2. Table Definition (DDL)

```sql
CREATE TABLE example (
    id SERIAL PRIMARY KEY, -> auto-increment primary key
    name VARCHAR(100) NOT NULL, -> required text
    value NUMERIC(10,2), -> precise numeric
    active BOOLEAN DEFAULT TRUE, -> boolean flag
    created_at TIMESTAMP DEFAULT now() -> creation time
);
```

---

## 3. Structural Changes (DDL)

```sql
ALTER TABLE example ADD COLUMN description TEXT; -> add column
```

```sql
ALTER TABLE example ALTER COLUMN value TYPE NUMERIC(12,2); -> change type
```

```sql
ALTER TABLE example DROP COLUMN description; -> remove column
```

```sql
DROP TABLE example; -> delete table
```

---

## 4. Constraints & Integrity

```sql
PRIMARY KEY (id) -> unique row identifier
```

```sql
FOREIGN KEY (other_id) REFERENCES other_table(id) -> relational integrity
```

```sql
UNIQUE (email) -> enforce uniqueness
```

```sql
CHECK (value > 0) -> simple validation rule
```

Rule -> structural rules in DB, business rules in backend

---

## 5. Indexes (Performance)

```sql
CREATE INDEX idx_example_name ON example (name); -> speed up lookups
```

```sql
DROP INDEX idx_example_name; -> remove index
```

---

## 6. Data Manipulation (DML)

```sql
INSERT INTO example (name, value)
VALUES ('Test', 100.00); -> insert row
```

```sql
UPDATE example
SET value = 120.00
WHERE id = 1; -> update row
```

```sql
DELETE FROM example
WHERE id = 1; -> delete row
```

```sql
TRUNCATE TABLE example; -> fast full delete (no WHERE, no rollback)
```

---

## 7. Transactions

```sql
BEGIN; -> start transaction
```

```sql
UPDATE account SET balance = balance - 100 WHERE id = 1;
```

```sql
UPDATE account SET balance = balance + 100 WHERE id = 2;
```

```sql
COMMIT; -> persist changes
```

```sql
ROLLBACK; -> undo on error
```

---

## 8. Operational Queries (SELECT)

```sql
SELECT * FROM example; -> basic select
```

```sql
SELECT * FROM example
WHERE active = true; -> filter
```

```sql
SELECT * FROM example
ORDER BY value DESC; -> sort
```

```sql
SELECT * FROM example
LIMIT 10; -> limit result
```

---

## 9. Filters

```sql
SELECT * FROM users
WHERE email LIKE '%@gmail.com'; -> pattern match
```

```sql
SELECT * FROM orders
WHERE status IN ('CREATED', 'PAID'); -> multiple values
```

```sql
SELECT * FROM sales
WHERE date BETWEEN '2024-01-01' AND '2024-12-31'; -> range
```

---

## 10. Joins

```sql
SELECT a.name, b.description
FROM table_a a
JOIN table_b b ON b.id = a.b_id; -> INNER JOIN
```

```sql
SELECT a.name, b.description
FROM table_a a
LEFT JOIN table_b b ON b.id = a.b_id; -> LEFT JOIN
```

---

## 11. Aggregation & Reports

```sql
SELECT COUNT(*) FROM example; -> total rows
```

```sql
SELECT SUM(value) FROM example; -> sum
```

```sql
SELECT AVG(value) FROM example; -> average
```

```sql
SELECT category_id, COUNT(*) AS total
FROM example
GROUP BY category_id; -> grouping
```

```sql
SELECT category_id, COUNT(*) AS total
FROM example
GROUP BY category_id
HAVING COUNT(*) > 5; -> filter groups
```

---

## 12. EXISTS

```sql
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
); -> correlated existence check
```

---

## 13. CASE (Reporting Logic)

```sql
SELECT name,
       CASE
           WHEN value < 100 THEN 'LOW'
           WHEN value BETWEEN 100 AND 500 THEN 'MEDIUM'
           ELSE 'HIGH'
       END AS classification
FROM example; -> derived reporting column
```

---

Key Concepts ->

- DDL -> schema structure
- DML -> data manipulation
- SELECT -> system usage
- Reporting SQL -> read-only analysis
- Schema -> database contract
- ER Diagram -> schema visualization
