-- row-level locks
SELECT pg_database.datname,
       pg_class.relname,
       pg_locks.locktype,
       pg_locks.mode,
       pg_locks.granted,
       count(*)
FROM pg_locks

JOIN pg_class ON pg_locks.relation = pg_class.oid
JOIN pg_database ON pg_locks.database = pg_database.oid

GROUP BY pg_database.datname,pg_class.relname,       pg_locks.locktype,
       pg_locks.mode,
       pg_locks.granted
