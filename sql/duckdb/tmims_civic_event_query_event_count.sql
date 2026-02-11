-- sql/duckdb/tmims_civic_event_query_event_count.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Answer a simple structural question:
-- "How many civic events are in the system?"

SELECT
  COUNT(*) AS civic_event_count
FROM civic_event;
