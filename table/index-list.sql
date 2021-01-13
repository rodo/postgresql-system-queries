-- Get indexes of tables
select
    t.relname as table_name,
    i.relname as index_name,
    string_agg(a.attname, ',') as column_name,
    CASE WHEN ix.indpred IS NULL THEN 'no' ELSE 'yes' END as partial_index
from
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
where
    t.oid = ix.indrelid
    and i.oid = ix.indexrelid
    and a.attrelid = t.oid
    and a.attnum = ANY(ix.indkey)
    and t.relkind = 'r'
    and t.relname not like 'pg_%'
group by  
    t.relname,
    i.relname,
    ix.indpred
order by
    t.relname,
    i.relname;
