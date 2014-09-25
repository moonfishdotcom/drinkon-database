DROP VIEW IF EXISTS dv_sys_products;

CREATE VIEW dv_sys_products AS 
SELECT * 
FROM sys_products 
ORDER BY id ASC;
