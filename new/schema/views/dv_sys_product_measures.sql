DROP VIEW IF EXISTS dv_sys_product_measures;

CREATE VIEW dv_sys_product_measures AS 
SELECT 
  vendor_id AS id, 
  product_measure_name, 
  is_active,
  is_fixed
FROM sys_product_measures 
ORDER BY id ASC;
