DROP VIEW IF EXISTS dv_sys_locations;

CREATE VIEW dv_sys_locations AS 
SELECT * 
FROM sys_locations 
ORDER BY id ASC;
