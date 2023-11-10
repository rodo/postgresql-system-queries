-- table index usage rates
SELECT relname,
       CASE WHEN (seq_scan + idx_scan) = 0
            THEN 0
            ELSE 100 * idx_scan / (seq_scan + idx_scan)
       END AS percent_of_times_index_used,
       n_live_tup rows_in_table
  FROM pg_stat_user_tables
  WHERE idx_scan = 0
 ORDER BY n_live_tup DESC;
