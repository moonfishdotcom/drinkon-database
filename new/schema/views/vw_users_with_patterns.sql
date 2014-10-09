DROP VIEW IF EXISTS vw_users_with_patterns;

CREATE VIEW vw_users_with_patterns AS
SELECT
  t1.id,
  t1.vendor_id, 
  t1.vendor_user_id, 
  t1.user_name, 
  t1.user_known_as, 
  t1.user_pattern_id,
  t2.pattern_name, 
  t1.is_active
FROM sys_users t1 
INNER JOIN sys_user_patterns t2 ON t1.user_pattern_id=t2.id;
