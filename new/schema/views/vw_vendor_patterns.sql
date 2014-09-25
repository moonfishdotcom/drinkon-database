DROP VIEW IF EXISTS vw_vendor_patterns;

CREATE VIEW vw_vendor_patterns AS 
SELECT 
  vendor_id AS id, 
  pattern_name, 
  is_active, 
  id AS ruid 
FROM sys_user_patterns 
ORDER BY id ASC;
