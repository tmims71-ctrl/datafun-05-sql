-- sql/duckdb/tmims_civic_event_query_lowest_contribution.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Identify the lowest-performing event by total contribution.

SELECT
  e.civic_event_id,
  e.event_name,
  e.location,
  e.organizer,
  COUNT(a.attendance_id) AS attendance_count,
  SUM(a.checked_in) AS total_checked_in,
  ROUND(SUM(a.contribution), 2) AS total_contribution,
  ROUND(AVG(a.contribution), 2) AS avg_contribution
FROM civic_event AS e
JOIN attendance AS a
  ON a.civic_event_id = e.civic_event_id
GROUP BY
  e.civic_event_id,
  e.event_name,
  e.location,
  e.organizer
ORDER BY total_contribution ASC
LIMIT 1;
