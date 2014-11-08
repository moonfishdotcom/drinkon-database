DROP VIEW IF EXISTS dv_sys_product_line_prices;

CREATE VIEW dv_sys_product_line_prices AS 
SELECT
  id,
  product_line_id,
  DATE_FORMAT(product_price_start,'%d/%m/%Y') AS product_price_start,
  DATE_FORMAT(product_price_end,'%d/%m/%Y') AS product_price_end,
  product_unit_price,
  product_price_desc,
  is_active
FROM sys_product_line_prices;
