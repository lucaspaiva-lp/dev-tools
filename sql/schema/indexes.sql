/* =========================================================
   File: schema/indexes.sql
   ---------------------------------------------------------
   Concept:
   - Improves query performance
   - No impact on correctness
   - Reflects access patterns
   ========================================================= */

CREATE INDEX idx_patients_email
ON patients (email);

CREATE INDEX idx_appointments_patient_id
ON appointments (patient_id);

CREATE INDEX idx_appointments_scheduled_at
ON appointments (scheduled_at);