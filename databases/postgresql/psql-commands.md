# PostgreSQL — psql Commands (Quick Reference)

This file is a **memory jogger**, not a tutorial.
Commands here are for **daily inspection, navigation, and operational work** using the `psql` CLI.

---

## Connect to PostgreSQL

```bash
psql -U user -d database
```

With host and port:

```bash
psql -h localhost -p 5432 -U user -d database
```

---

## Exit

```sql
\q
```

---

## Help

```sql
\?
```

SQL help:

```sql
\h SELECT
```

---

## Connection Info

```sql
\conninfo
```

---

## List Databases

```sql
\l
```

---

## Switch Database

```sql
\c database_name
```

---

## List Schemas

```sql
\dn
```

---

## List Tables

```sql
\dt
```

All schemas:

```sql
\dt *.*
```

---

## Describe Table (Most Used)

```sql
\d table_name
```

With indexes, constraints, storage:

```sql
\d+ table_name
```

---

## List Views

```sql
\dv
```

---

## List Indexes

```sql
\di
```

---

## List Functions

```sql
\df
```

---

## List Roles / Users

```sql
\du
```

---

## Show Current User / Database

```sql
SELECT current_user;
SELECT current_database();
```

---

## Show Search Path

```sql
SHOW search_path;
```

---

## Run SQL File

```sql
\i path/to/file.sql
```

---

## Timing Queries

```sql
\timing on
```

---

## Pretty Output

```sql
\x on
```

Toggle expanded display (very useful for wide rows).

---

## Transaction Control

```sql
BEGIN;
-- SQL statements
COMMIT;
```

Rollback:

```sql
ROLLBACK;
```

---

## Explain / Analyze

```sql
EXPLAIN SELECT * FROM table_name;
```

```sql
EXPLAIN ANALYZE SELECT * FROM table_name;
```

---

## Check Locks

```sql
SELECT * FROM pg_locks;
```

---

## Active Sessions

```sql
SELECT pid, usename, state, query
FROM pg_stat_activity;
```

---

## Notes

- `psql` commands start with `\`
- SQL runs normally inside the session
- `\d` family is your primary inspection tool
- Always know **which database** and **which role** you are connected as

Use `psql` as your **truth inspection interface** for PostgreSQL.
