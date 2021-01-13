SELECT datname, xact_commit, xact_rollback,
CASE WHEN xact_commit = 0 THEN 0 ELSE round((( xact_rollback::decimal / (xact_commit +  xact_rollback)::decimal) * 100.0 )::decimal, 3) END as ratio
FROM pg_stat_database
ORDER BY xact_rollback DESC;
