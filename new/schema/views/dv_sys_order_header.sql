DROP VIEW IF EXISTS dv_sys_order_header;

CREATE VIEW dv_sys_order_header AS 
SELECT * 
FROM sys_order_header 
ORDER BY id ASC;
