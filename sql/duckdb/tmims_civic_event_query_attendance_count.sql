-- sql/duckdb/tmims_civic_event_query_attendance_count.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Answer a basic activity question:
-- "How many attendance records exist?"

SELECT
  COUNT(*) AS attendance_count
FROM attendance;
