DROP VIEW IF EXISTS dv_sys_user_patterns;

CREATE VIEW dv_sys_user_patterns AS 
SELECT * 
FROM sys_user_patterns 
ORDER BY id ASC;
