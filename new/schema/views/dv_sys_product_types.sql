DROP VIEW IF EXISTS dv_sys_product_types;

CREATE VIEW dv_sys_product_types AS
SELECT 
  id,
  vendor_id, 
  product_type_name,
  image_name,
  is_active, 
  is_fixed
FROM sys_product_types 
ORDER BY id ASC;
