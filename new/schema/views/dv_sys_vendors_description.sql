DROP VIEW IF EXISTS dv_sys_vendors_description;

CREATE VIEW dv_sys_vendors_description AS 
SELECT * 
FROM sys_vendors_description 
ORDER BY id ASC;
