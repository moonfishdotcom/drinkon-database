DROP VIEW IF EXISTS vw_vendor_patterns;

CREATE VIEW vw_vendor_patterns AS 
SELECT 
  id,
  vendor_id,
  vendor_pattern_id,
  pattern_name,
  is_active
FROM sys_user_patterns 
ORDER BY id ASC;
