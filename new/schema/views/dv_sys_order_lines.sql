DROP VIEW IF EXISTS dv_sys_order_lines;

CREATE VIEW dv_sys_order_lines AS 
SELECT * 
FROM sys_order_lines 
ORDER BY id ASC;
