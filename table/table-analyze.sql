-- Information about analyze
  SELECT
         relname AS tablename,
         last_autoanalyze,
         last_analyze,
         autoanalyze_count,
         analyze_count
    FROM
         pg_stat_user_tables
ORDER BY last_autoanalyze DESC NULLS LAST, relname;
