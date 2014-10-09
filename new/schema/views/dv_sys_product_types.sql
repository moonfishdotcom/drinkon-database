DROP VIEW IF EXISTS dv_sys_product_types;

CREATE VIEW dv_sys_product_types AS
SELECT 
  id,
  vendor_id, 
  product_type_name, 
  is_active, 
  is_fixed,
  id AS ruid 
FROM sys_product_types 
ORDER BY id ASC;
