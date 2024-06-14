SELECT u.rolname AS rolename,g.rolname AS groupname  from pg_user
join pg_auth_members on (pg_user.usesysid=pg_auth_members.member)
join pg_roles g on (g.oid=pg_auth_members.roleid)
join pg_roles u on (u.oid=pg_auth_members.member)
ORDER BY u.rolname
;
