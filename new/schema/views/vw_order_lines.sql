DROP VIEW IF EXISTS vw_order_lines;

CREATE VIEW vw_order_lines AS
SELECT
  ol.id,
  ol.order_id,
  ol.product_id,
  p.vendor_product_id,
  p.product_name,
  ol.product_type_id,
  t.product_type_name,
  ol.product_measure_id,
  m.product_measure_name,
  ol.product_qty,
  ol.product_unit_price,
  ol.is_active,
  pl.is_active AS stock_active
FROM sys_order_lines ol
INNER JOIN sys_order_header oh ON oh.id = ol.order_id
INNER JOIN sys_products p ON ol.product_id = p.id
INNER JOIN sys_product_types t ON ol.product_type_id = t.id
INNER JOIN sys_product_measures m ON ol.product_measure_id = m.id
INNER JOIN sys_product_lines pl ON ol.product_id = pl.product_id AND ol.product_measure_id = pl.product_measure_id AND pl.vendor_id = oh.vendor_id;
