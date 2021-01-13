-- long transactions
SELECT client_addr, usename, datname, clock_timestamp() - xact_start as xact_age, clock_timestamp() - query_start as query_age, query from pg_stat_activity
WHERE clock_timestamp() - query_start > INTERVAL '1min'
order by xact_start, query_start;
