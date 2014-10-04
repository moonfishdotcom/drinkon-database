DROP VIEW IF EXISTS vw_order_lines;

CREATE VIEW vw_order_lines AS
SELECT
  t1.order_id AS id,
  t1.id AS ruid,
  t1.vendor_id,
  t1.product_id,
  t2.vendor_product_id,
  t2.product_name,
  t1.product_type_id,
  t3.product_type_name,
  t1.product_measure_id,
  t4.product_measure_name,
  t1.product_qty,
  t1.product_unit_price,
  t1.is_active
FROM sys_order_lines t1
INNER JOIN sys_products t2 ON t1.product_id = t2.id
INNER JOIN sys_product_types t3 ON t1.product_type_id = t3.id
INNER JOIN sys_product_measures t4 ON t1.product_measure_id = t4.id;
