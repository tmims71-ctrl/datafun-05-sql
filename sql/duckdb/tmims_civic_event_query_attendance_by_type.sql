-- sql/duckdb/tmims_civic_event_query_attendance_by_type.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break attendance performance down by attendee type.

SELECT
  attendee_type,
  COUNT(*) AS attendance_count,
  SUM(checked_in) AS total_checked_in,
  ROUND(SUM(contribution), 2) AS total_contribution,
  ROUND(AVG(contribution), 2) AS avg_contribution
FROM attendance
GROUP BY attendee_type
ORDER BY total_contribution DESC;
