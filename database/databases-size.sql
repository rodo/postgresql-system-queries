-- all tables and their size, with/without indexes
SELECT datname as database, pg_size_pretty(pg_database_size(datname)) as size
FROM pg_database
ORDER BY pg_database_size(datname) DESC;
