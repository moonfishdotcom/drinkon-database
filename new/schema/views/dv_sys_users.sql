DROP VIEW IF EXISTS dv_sys_users;

CREATE VIEW dv_sys_users AS 
SELECT * 
FROM sys_users 
ORDER BY id ASC;
