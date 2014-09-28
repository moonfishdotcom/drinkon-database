DROP VIEW IF EXISTS dv_sys_customers;

CREATE VIEW dv_sys_customers AS 
SELECT * 
FROM sys_customers 
ORDER BY customer_surname ASC;
