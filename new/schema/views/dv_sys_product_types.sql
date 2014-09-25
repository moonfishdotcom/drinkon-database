DROP VIEW IF EXISTS dv_sys_product_types;

CREATE VIEW dv_sys_product_types AS
SELECT 
  vendor_id AS id, 
  product_type_name, 
  is_active, 
  id AS ruid 
FROM sys_product_types 
ORDER BY id ASC;
