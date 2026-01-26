/* =========================================================
   Pattern: NULL vs ZERO
   ---------------------------------------------------------
   NULL  -> unknown / not assigned / not applicable
   ZERO  -> known value equal to zero
   ---------------------------------------------------------
   Never overload ZERO to mean "not set"
   ========================================================= */

-- Correct: NULL means "not paid yet"
balance NUMERIC(10,2) NULL,

-- Incorrect: ZERO hides meaning
-- balance NUMERIC(10,2) NOT NULL DEFAULT 0;

-- Optional protection
CHECK (balance IS NULL OR balance >= 0);
