-- Last Vacuum and Analyze time
select relname,
       date_trunc('second', last_vacuum) AS vacuum,
       date_trunc('second', last_autovacuum) AS autovacuum,
       date_trunc('second', last_analyze) AS analyze,
       date_trunc('second', last_autoanalyze) AS autoanalyze
       FROM pg_stat_user_tables
ORDER BY last_autovacuum DESC NULLS LAST, relname ASC;


