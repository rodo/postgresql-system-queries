-- Information about vacuum
  SELECT
         relname AS tablename,
         last_autovacuum,
         last_vacuum,
         vacuum_count,
         autovacuum_count
    FROM
         pg_stat_user_tables
ORDER BY last_autovacuum DESC NULLS LAST, relname;
