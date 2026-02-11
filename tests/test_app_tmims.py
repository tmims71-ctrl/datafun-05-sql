# tests/test_app_tmims.py
#
# Simple pytest example for the tmims civic event pipeline.
#
# Run:
#   uv run pytest

from datafun_05_sql import tmims_duckdb_civic_event, tmims_duckdb_retail


def test_tmims_duckdb_civic_event_main_runs() -> None:
    """Test that the civic event DuckDB pipeline runs."""
    tmims_duckdb_civic_event.main()


def test_tmims_duckdb_retail_main_runs() -> None:
    """Test that the retail DuckDB pipeline runs."""
    tmims_duckdb_retail.main()
