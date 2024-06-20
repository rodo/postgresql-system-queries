SELECT
  slot_name,
  database,
  active,
  conflicting,
  restart_lsn,
  confirmed_flush_lsn,
  pg_current_wal_lsn()-confirmed_flush_lsn AS lag

FROM pg_replication_slots
WHERE slot_type='logical'
ORDER BY pg_current_wal_lsn()-confirmed_flush_lsn DESC ;
