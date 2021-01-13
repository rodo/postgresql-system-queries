-- Total number of dead tuples need to be vacuumed per table
SELECT schemaname, relname, n_dead_tup, n_live_tup, n_tup_del
FROM pg_stat_user_tables
WHERE schemaname NOT IN  ('pg_catalog', 'information_schema', 'pg_toast')
ORDER BY n_dead_tup DESC, schemaname, relname;

