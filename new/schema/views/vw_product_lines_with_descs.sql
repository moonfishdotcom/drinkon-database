DROP VIEW IF EXISTS vw_product_lines_with_descs;

CREATE VIEW vw_product_lines_with_descs AS
SELECT
  pl.id, 
  pl.vendor_id, 
  pl.product_id, 
  p.vendor_product_id,
  p.product_name, 
  p.image_name product_image_name,
  pl.product_measure_id, 
  pm.product_measure_name,
  pl.product_unit_price,
  p.product_type_id,
  pt.product_type_name,
  pt.image_name product_type_image_name,
  pl.is_active
FROM sys_product_lines pl
INNER JOIN sys_products p ON pl.product_id = p.id
INNER JOIN sys_product_measures pm ON pl.product_measure_id = pm.id
INNER JOIN sys_product_types pt ON p.product_type_id = pt.id;
