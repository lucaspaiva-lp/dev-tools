# Employee / Role / Department Modeling

## Context

Different company maturities require different relational constraints.

## Option A — Rigid corporate system (ERP, mature HR)

Rules:

- Department → Role → Employee
- Role cannot exist without Department

Rationale:

- Governance
- Reporting
- Organizational clarity

Status:

- Market standard for large enterprises

## Option B — Growing system (incremental reality)

Rules:

- Role may exist without Department
- Employee always requires a Role
- Department assigned later

Rationale:

- Small companies
- Avoids operational blockage
- Common in MVPs, clinics, startups

## Decision

Context-dependent.
