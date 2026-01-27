-- DEV ONLY
-- This script truncates all domain tables and resets identities.
-- Do NOT run in production.

BEGIN;

TRUNCATE TABLE
    funcionario,
    cargo,
    setor
RESTART IDENTITY
CASCADE;

COMMIT;
