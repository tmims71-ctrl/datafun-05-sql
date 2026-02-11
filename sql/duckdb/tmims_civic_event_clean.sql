-- sql/duckdb/tmims_civic_event_clean.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Completely removes civic_event tables from the DuckDB database.
-- This clean step resets the database so we can rebuild it.
--
-- ASSUMPTION:
-- We always run all commands from the project root directory.
--
-- EXPECTED PROJECT PATHS (relative to repo root):
--   SQL:  sql/duckdb/case_civic_event_clean.sql
--   CSV:  data/civic_event/civic_event.csv
--   CSV:  data/civic_event/attendance.csv
--   DB:   artifacts/duckdb/civic_event.duckdb
--
-- ============================================================
-- TOPIC DOMAINS + 1:M RELATIONSHIPS
-- ============================================================
-- OUR DOMAIN: CIVIC EVENT
-- Two tables in a 1-to-many relationship (1:M):
-- - civic_event (1): independent/parent table
-- - attendance  (M): dependent/child table
--
-- REQ: Tables must be removed in reverse order (CHILD FIRST, THEN PARENT)
--      to avoid foreign key constraint issues.
--
-- ============================================================
-- EXECUTION: ATOMIC CLEAN (ALL OR NOTHING)
-- ============================================================
BEGIN TRANSACTION;

-- Drop the dependent/child table (M) first.
DROP TABLE IF EXISTS attendance;

-- Drop the independent/parent table (1) second.
DROP TABLE IF EXISTS civic_event;

COMMIT;
