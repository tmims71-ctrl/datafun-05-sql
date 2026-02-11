-- sql/duckdb/tmims_civic_event_query_contribution_per_checkin.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Compute contribution per check-in by event.

SELECT
  e.civic_event_id,
  e.event_name,
  e.location,
  e.organizer,
  SUM(a.checked_in) AS total_checked_in,
  ROUND(SUM(a.contribution), 2) AS total_contribution,
  ROUND(
    SUM(a.contribution) / NULLIF(SUM(a.checked_in), 0),
    2
  ) AS contribution_per_checkin
FROM civic_event AS e
JOIN attendance AS a
  ON a.civic_event_id = e.civic_event_id
GROUP BY
  e.civic_event_id,
  e.event_name,
  e.location,
  e.organizer
ORDER BY contribution_per_checkin DESC;
