DROP VIEW IF EXISTS dv_sys_order_statuses;

CREATE VIEW dv_sys_order_statuses AS 
SELECT * 
FROM sys_order_statuses 
ORDER BY id ASC;
