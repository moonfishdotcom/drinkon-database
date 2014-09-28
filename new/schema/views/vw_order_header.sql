DROP VIEW IF EXISTS vw_order_header;

CREATE VIEW vw_order_header AS
SELECT
  t1.id, 
  t1.vendor_id, 
  t1.order_number, 
  t1.order_cust_id,
  CONCAT_WS(' ',t4.customer_title, t4.customer_forename, t4.customer_surname) AS order_cust_name,
  t1.order_reqd_for,
  t1.order_status_id, 
  t2.order_status_name,
  t1.order_owner_id, 
  IFNULL(t3.user_known_as, '') AS user_known_as
FROM sys_order_header t1 
INNER JOIN sys_order_statuses t2 ON t1.order_status_id = t2.id
LEFT OUTER JOIN sys_users t3 ON t1.order_owner_id = t3.id
LEFT OUTER JOIN vw_customers_with_titles t4 ON t1.order_cust_id=t4.id;
