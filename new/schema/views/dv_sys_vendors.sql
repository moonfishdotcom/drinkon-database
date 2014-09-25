DROP VIEW IF EXISTS dv_sys_vendors;

CREATE VIEW dv_sys_vendors AS 
SELECT * 
FROM sys_vendors 
ORDER BY id ASC;
