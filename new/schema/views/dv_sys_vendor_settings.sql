DROP VIEW IF EXISTS dv_sys_vendor_settings;

CREATE VIEW dv_sys_vendor_settings AS 
SELECT * 
FROM sys_vendor_settings
ORDER BY id ASC;
