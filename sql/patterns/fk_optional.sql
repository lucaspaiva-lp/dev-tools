/* =========================================================
   Pattern: Optional Foreign Key
   ---------------------------------------------------------
   Use when:
   - Child entity can exist without parent
   - Relationship is assigned later
   ---------------------------------------------------------
   Rule:
   - FK column is NULLABLE
   - ON DELETE SET NULL is preferred
   ========================================================= */

CREATE TABLE appointment (
    id SERIAL PRIMARY KEY,

    -- Optional relationship
    doctor_id INTEGER NULL,

    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctor(id)
        ON DELETE SET NULL
);
