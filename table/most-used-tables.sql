select schemaname, relname, seq_scan, idx_scan, seq_tup_read

from pg_stat_user_tables

ORDER BY seq_scan + idx_scan DESC NULLS LAST,
relname;
