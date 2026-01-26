# Engineering Utilities & Operational Reference

This repository contains **engineering support artifacts** used during development, debugging, data analysis, and database operations.

It is **not** application code.
It exists to support **reasoning, inspection, maintenance, and controlled intervention** across the stack.

The structure is organized by **intent and responsibility**, not by language popularity.

---

## What this repository is

- A **toolbox** for developers and engineers
- A place for **repeatable operational knowledge**
- A **safe boundary** between application logic and low-level actions
- A reference for **how to inspect reality**, not just assume correctness

---

## What this repository is NOT

- Not production application code
- Not business logic
- Not an ORM replacement
- Not a tutorial repository

---

## High-Level Structure

```text
dev-tools/
├── sql/        # database design, inspection, and operations
├── python/     # helper scripts and automation
├── sqlite3/    # SQLite-specific notes and CLI usage
├── postgres/   # PostgreSQL-specific tooling and ops
└── README.md   # this document
```

Each top-level folder is **self-contained** and scoped to a specific concern.

---

## SQL — Database Design & Operations

The `sql/` directory contains **all database-related artifacts**, organized by intent.

### Mental Model

- **schema/** → what **must exist**
- **commands/** → what **changes state**
- **maintenance/** → what **keeps the database healthy**
- **queries/** → what **helps you understand reality**
- **patterns/** → how recurring modeling decisions are applied

This avoids mixing **design**, **mutation**, **inspection**, and **operations**.

---

### SQL Structure

```text
sql/
├── schema/          # authoritative DB structure
│   ├── schema.sql        # namespaces
│   ├── tables.sql        # entities
│   ├── constraints.sql   # invariants
│   ├── indexes.sql       # performance
│   └── README.md         # scope & guarantees
│
├── queries/         # read-only inspection
│   ├── joins.sql
│   ├── aggregates.sql
│   └── debugging.sql
│
├── commands/        # DDL / DML mutations
│   ├── seed_data.sql
│   ├── data_fixes.sql
│   └── migrations.sql
│
├── patterns/        # reusable design patterns
│   ├── fk_optional.sql
│   ├── nullable_vs_zero.sql
│   └── naming_conventions.sql
│
└── maintenance/     # ops-level commands
    ├── vacuum.sql
    ├── analyze.sql
    └── reindex.sql
```

---

### Design Flow

```text
Domain Analysis
      ↓
Conceptual Model
      ↓
Patterns
(how recurring situations are modeled)
      ↓
Schema Design
      ↓
schema.sql / constraints.sql / indexes.sql
      ↓
Database enforces invariants
```

- Patterns are applied during **modeling and design**
- Schema is written **after design**
- Once applied, the schema becomes the **enforced contract**

> **The database enforces invariants.**
> **The application enforces policies.**

---

## Python — Automation & Helpers

```text
python/
├── scripts/    # executable helpers
├── snippets/   # reusable code fragments
└── README.md
```

Purpose:

- One-off automation
- Data loading or transformation
- Support scripts for migrations or analysis

Python here exists to **assist**, not to replace application logic.

---

## SQLite3 — Lightweight DB Reference

```text
sqlite3/
├── cli-commands.md
└── pitfalls.md
```

Purpose:

- Quick reminders for SQLite CLI usage
- Differences and limitations vs PostgreSQL
- Common traps when prototyping locally

---

## PostgreSQL — Engine-Specific Knowledge

```text
postgres/
├── psql-commands.md
├── role-permissions.sql
└── maintenance.sql
```

Purpose:

- PostgreSQL operational commands
- Role and permission management
- Engine-specific maintenance tasks

This folder exists because **real databases are not abstract**.

---

## Guiding Principles

- Separation by **intent**
- Explicit over implicit
- Inspection before assumption
- Database as a **contract**, not a side effect

This repository exists to support **professional-grade reasoning**, not convenience shortcuts.

---

## Contributing & Reuse

This repository is provided for **academic, educational, and research purposes only**, as defined by the license.

You are welcome to:

- fork the repository for learning or study,
- adapt its structure or scripts for personal, non-commercial experimentation,
- suggest improvements or clarifications via pull requests.

Any use of this repository or its contents for **commercial purposes, paid work, proprietary systems, or revenue-generating activities is explicitly prohibited**.

The intent of this project is knowledge sharing and technical growth, not the distribution of production-ready commercial tooling.
