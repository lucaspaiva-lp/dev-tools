/* =========================================================
   File: reindex_schema.sql
   ---------------------------------------------------------
   Concept:
   - Rebuilds all indexes in a schema
   - Fixes index bloat without touching tables
   ========================================================= */

REINDEX SCHEMA public;