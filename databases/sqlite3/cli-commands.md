# sqlite3 — CLI Commands (Quick Reference)

This file is a **memory jogger**, not a tutorial.
Commands here are for **daily inspection and quick operations** when using the `sqlite3` CLI.

---

## Open a Database

```bash
sqlite3 database.db
```

Create or open a database file.

---

## Exit

```sql
.quit
```

---

## Help

```sql
.help
```

---

## List Tables

```sql
.tables
```

---

## Describe Table Schema

```sql
.schema table_name
```

Show the `CREATE TABLE` statement.

---

## Show All Schemas

```sql
.schema
```

---

## Enable Column Mode (Readable Output)

```sql
.mode column
.headers on
```

---

## List Columns (Alternative)

```sql
PRAGMA table_info(table_name);
```

---

## Import CSV

```sql
.mode csv
.import data.csv table_name
```

---

## Export to CSV

```sql
.headers on
.mode csv
.output export.csv
SELECT * FROM table_name;
.output stdout
```

---

## Check Database Integrity

```sql
PRAGMA integrity_check;
```

---

## Foreign Keys (Important)

Enable enforcement (OFF by default):

```sql
PRAGMA foreign_keys = ON;
```

Check status:

```sql
PRAGMA foreign_keys;
```

---

## Transactions

```sql
BEGIN;
-- SQL statements
COMMIT;
```

Rollback on error:

```sql
ROLLBACK;
```

---

## List Indexes

```sql
.indexes table_name
```

---

## Explain Query Plan

```sql
EXPLAIN QUERY PLAN
SELECT * FROM table_name WHERE id = 1;
```

---

## Notes

- SQLite is **file-based**
- No users or roles
- Limited concurrency
- Foreign keys must be explicitly enabled

Use SQLite for **local development and prototyping**, not as a production su
