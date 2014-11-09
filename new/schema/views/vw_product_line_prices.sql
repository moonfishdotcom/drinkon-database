DROP VIEW IF EXISTS vw_product_line_prices;

--CREATE VIEW vw_product_line_prices AS 
--SELECT
--  *
--FROM sys_product_line_prices
--WHERE product_price_start<NOW()
--  AND product_price_end>=NOW()
--ORDER BY product_price_end;

CREATE VIEW vw_product_line_prices AS 
SELECT
  *
FROM sys_product_line_prices
WHERE is_active=1;
