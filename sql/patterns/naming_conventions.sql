/* =========================================================
   Pattern: Naming Conventions
   ========================================================= */

-- Tables: singular, snake_case
CREATE TABLE user_account (
    id SERIAL PRIMARY KEY
);

-- Foreign keys: <referenced_table>_id
user_id INTEGER NOT NULL;

-- Indexes
CREATE INDEX idx_user_account_email
ON user_account (email);

-- Constraints
CONSTRAINT fk_order_customer
CONSTRAINT uq_user_account_email
