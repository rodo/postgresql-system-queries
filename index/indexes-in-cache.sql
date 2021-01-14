-- how many indexes usage ratio
  SELECT indexrelname,
         sum(idx_blks_read) AS blks_read,
         sum(idx_blks_hit)  AS blks_hit,
         CASE WHEN sum(idx_blks_hit) = 0
         THEN 0 ELSE (sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit)
         END as ratio       
    FROM pg_statio_user_indexes    
GROUP BY indexrelname
ORDER BY indexrelname DESC;
