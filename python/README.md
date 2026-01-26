# Python — scripts/

This directory contains **executable helper scripts** used to **support development and operations**, not application runtime code.

Scripts here are **task-oriented**, explicit, and safe to run manually.

---

## Purpose

`scripts/` exists to automate **one-off or repeatable actions** that are outside the core application flow, such as:

- database setup and migration helpers
- data import/export
- seeding and fixtures
- operational utilities

These scripts **may change state** (database, files, environment).

---

## Directory Structure

```bash
python/
├── scripts/
│   ├── automation/   # safe, non-interactive, schedulable
│   │   ├── db_health_check.py
│   │   ├── db_migration_helper.py
│   │   ├── csv_to_db.py
│   │   └── seed_data.py
│   │
│   ├── manual/       # requires human judgment
│   │   └── data_fix.py
│   │
│   └── ci/           # pipeline / orchestration
│       ├── run_migrations.py
│       └── check_db_health.py

```

## Characteristics

- Executed manually (CLI)
- Not imported as libraries
- Side-effect oriented
- Clear input → clear outcome
- Idempotent when possible

---

## Typical Examples

- `db_migration_helper.py` → assists schema/data migrations
- `csv_to_db.py` → loads CSV data into the database
- `seed_data.py` → inserts initial or test data

---

## How to Run

From the repository root (example):

```bash
python python/scripts/seed_data.py
```

Or with arguments:

```bash
python python/scripts/csv_to_db.py data.csv
```

---

## What Does NOT Belong Here

- reusable utilities → `snippets/`
- application logic
- business rules
- framework-specific code

---

## Guiding Rule

> If the script **helps you operate or prepare the system**, it belongs here.
> If it’s reused by code, it does not.

This folder is about **execution**, not abstraction.
