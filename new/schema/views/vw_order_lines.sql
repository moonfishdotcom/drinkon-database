DROP VIEW IF EXISTS vw_order_lines;

CREATE VIEW vw_order_lines AS
SELECT
  l.id,
  l.order_id,
  l.product_id,
  p.vendor_product_id,
  p.product_name,
  p.product_type_id,
  t.product_type_name,
  l.product_measure_id,
  m.product_measure_name,
  l.product_qty,
  l.product_unit_price,
  l.is_active
FROM sys_order_lines l
INNER JOIN sys_products p ON l.product_id = p.id
INNER JOIN sys_product_types t ON p.product_type_id = t.id
INNER JOIN sys_product_measures m ON l.product_measure_id = m.id;
