DROP VIEW IF EXISTS vw_products_with_types;

CREATE VIEW vw_products_with_types AS
SELECT
  t1.id,
  t1.vendor_id,
  t1.vendor_product_id, 
  t1.product_name, 
  t1.product_desc, 
  t1.product_type_id,
  t2.product_type_name, 
  t1.product_status_id, 
  t1.is_active,
  t1.is_fixed
FROM sys_products t1 
INNER JOIN sys_product_types t2 ON t1.product_type_id=t2.id;
