DROP VIEW IF EXISTS dv_sys_product_lines;

CREATE VIEW dv_sys_product_lines AS 
SELECT * 
FROM sys_product_lines 
ORDER BY id ASC;
