DROP VIEW IF EXISTS vw_product_lines_with_descs;

CREATE VIEW vw_product_lines_with_descs AS
SELECT
  t1.id, 
  t2.vendor_id, 
  t1.product_id, 
  t2.product_name, 
  t1.product_measure_id, 
  t3.product_measure_name,
  t1.product_unit_price, 
  t1.is_active
FROM sys_product_lines t1
INNER JOIN sys_products t2 ON t1.product_id=t2.id
INNER JOIN sys_product_measures t3 ON t1.product_measure_id=t3.id;
