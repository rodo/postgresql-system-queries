-- cache hit rates (should not be less than 0.99)
SELECT sum(heap_blks_read) as heap_read,
       sum(heap_blks_hit) as heap_hit,
       CASE WHEN sum(heap_blks_hit) = 0
       THEN 0 ELSE (sum(heap_blks_hit) - sum(heap_blks_read)) / sum(heap_blks_hit)
       END as ratio
FROM pg_statio_user_tables;
