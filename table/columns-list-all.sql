-- All columns
SELECT n.nspname, c.relname AS table_name
     , attname            AS colname
     , atttypid::regtype  AS datatype

FROM   pg_attribute AS a
JOIN pg_class AS c ON a.attrelid = c.oid
JOIN pg_namespace AS n ON c.relnamespace = n.oid
WHERE
    attnum > 0
AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
AND c.relkind = 'r'
AND    NOT attisdropped
ORDER  BY n.nspname, c.relname,attnum;
