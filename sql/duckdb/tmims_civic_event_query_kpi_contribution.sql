-- sql/duckdb/tmims_civic_event_query_kpi_contribution.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- KPI: Total contribution by civic event.
--
-- ACTIONABLE OUTCOME (EXAMPLE):
-- Identify events with the highest contributions to guide
-- future sponsorship, staffing, or promotion decisions.

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
ORDER BY total_contribution DESC;
