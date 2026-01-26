# SQL Directory — Structure & Mental Model

This directory contains all SQL artifacts used to **design**, **enforce**, **inspect**, and **operate** the database.

It is organized by **intent**, not by technology.

---

## Mental Model

Each folder has a single, clear responsibility:

- **schema/** → what **must exist**
- **commands/** → what **changes state**
- **maintenance/** → what **keeps the database healthy**
- **queries/** → what **helps you understand reality**
- **patterns/** → how recurring modeling decisions are applied

This separation avoids mixing concerns and clarifies **where a decision belongs**.

---

## Directory Structure

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

## Design Flow

```text
Domain Analysis
      ↓
Conceptual Model
      ↓
Patterns
(how to model recurring situations)
      ↓
Schema Design
      ↓
schema.sql / constraints.sql / indexes.sql
      ↓
Database enforces invariants
```

### Interpretation

- **Patterns** are applied during modeling and design.
- **Schema** is written _after_ design.
- Once written, the schema becomes the **enforced contract** .

---

## Folder Responsibilities Explained

### `patterns/`

Patterns are **design-time decisions**.

They capture _how_ recurring situations should be modeled:

- optional relationships
- nullability rules
- naming standards

Patterns are **not executed directly**.
They are **applied during modeling and schema design**.

---

### `schema/`

The schema is the **result** of:

- domain analysis
- conceptual modeling
- pattern decisions

It represents the **authoritative contract** enforced by the database.

Once defined:

- the database guarantees invariants
- the application must comply

---

### `commands/`

Commands **change data or structure intentionally**.

Used for:

- seeding
- controlled fixes
- migrations

These scripts are **explicit state changes**, not inspections.

---

### `queries/`

Queries are **read-only**.

They exist to:

- validate assumptions
- inspect consistency
- understand real data behavior

They never modify state.

---

### `maintenance/`

Maintenance scripts are **operational**.

They:

- clean up internal structures
- improve performance
- keep the database healthy over time

They do **not** change business data or rules.

---

## Key Principle

> **The database enforces invariants.
> The application enforces policies.**

This structure exists to keep that boundary clear, explicit, and auditable.
