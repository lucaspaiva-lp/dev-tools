
/* =========================================================
   File: schema/constraints.sql
   ---------------------------------------------------------
   Concept:
   - Enforces invariants
   - Prevents invalid states
   - Moves rules close to data
   ========================================================= */

ALTER TABLE appointments
ADD CONSTRAINT fk_appointments_patient
FOREIGN KEY (patient_id)
REFERENCES patients(id);

ALTER TABLE appointments
ADD CONSTRAINT chk_appointments_status
CHECK (status IN ('SCHEDULED', 'CANCELLED', 'DONE'));

