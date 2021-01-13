-- how many indexes are in cache
SELECT sum(idx_blks_read) AS idx_read,
       sum(idx_blks_hit)  AS idx_hit,
       CASE WHEN sum(idx_blks_hit) = 0
       THEN 0 ELSE (sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit)
       END as ratio
       
FROM pg_statio_user_indexes;
