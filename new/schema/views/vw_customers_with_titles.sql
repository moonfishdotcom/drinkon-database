DROP VIEW IF EXISTS vw_customers_with_titles;

CREATE VIEW vw_customers_with_titles AS 
SELECT
  t1.id,
  t1.customer_title_id,
  t2.customer_title,
  t1.customer_forename,
  t1.customer_surname,
  t1.customer_last_order_date
FROM sys_customers t1
INNER JOIN sys_customer_titles t2 ON t1.customer_title_id=t2.id
ORDER BY t1.customer_surname ASC;
