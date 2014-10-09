DROP VIEW IF EXISTS vw_product_measures_with_types;

CREATE VIEW vw_product_measures_with_types AS 
SELECT 
  t1.id, 
  t1.vendor_id, 
  t1.product_type_id, 
  t2.product_type_name, 
  t1.product_measure_name, 
  t1.is_active, 
  t1.is_fixed
FROM sys_product_measures t1
INNER JOIN sys_product_types t2 ON t1.product_type_id=t2.id
ORDER BY t1.vendor_id ASC;
