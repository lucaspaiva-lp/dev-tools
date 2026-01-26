/* =========================================================
   File: schema/tables.sql
   ---------------------------------------------------------
   Concept:
   - Defines core entities
   - No business logic
   - Columns reflect domain facts
   ========================================================= */

CREATE TABLE patients (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE appointments (
    id BIGSERIAL PRIMARY KEY,
    patient_id BIGINT NOT NULL,
    scheduled_at TIMESTAMP NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);