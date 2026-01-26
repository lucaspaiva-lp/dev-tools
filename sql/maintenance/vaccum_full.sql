/* =========================================================
   File: vacuum_full.sql
   ---------------------------------------------------------
   Concept:
   - Aggressively rewrites tables
   - Fully reclaims disk space
   - Requires exclusive lock (blocking)
   Use sparingly
   ========================================================= */

VACUUM FULL;