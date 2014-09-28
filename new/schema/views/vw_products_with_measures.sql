DROP VIEW IF EXISTS vw_products_with_measures;

CREATE VIEW vw_products_with_measures AS
SELECT
  t1.id AS product_id, t1.product_name, t1.product_type_id, t2.id AS measure_id, t2.product_measure_name
FROM sys_products t1
INNER JOIN sys_product_measures t2 ON t1.product_type_id=t2.product_type_id;
