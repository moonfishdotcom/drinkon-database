DROP VIEW IF EXISTS vw_users_with_patterns_and_roles;

CREATE VIEW vw_users_with_patterns_and_roles AS
SELECT
  t1.id,
  t1.vendor_id, 
  t1.vendor_user_id, 
  t1.user_name, 
  t1.user_known_as, 
  t1.user_pattern_id,
  t2.pattern_name, 
  t3.role_name, 
  t1.is_active
FROM sys_users t1 
INNER JOIN sys_user_patterns t2 ON t1.user_pattern_id=t2.id
INNER JOIN sys_user_roles t3 ON t1.user_role_id=t3.id;
