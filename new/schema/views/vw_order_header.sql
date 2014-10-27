DROP VIEW IF EXISTS vw_order_header;

CREATE VIEW vw_order_header AS
SELECT
  h.id, 
  h.vendor_id, 
  v.vendor_name,
  h.order_number, 
  h.order_cust_id,
  CONCAT_WS(' ',c.customer_title, c.customer_forename, c.customer_surname) AS order_cust_name,
  h.order_reqd_for,
  h.order_status_id, 
  s.order_status_name,
  h.order_owner_id, 
  IFNULL(u.user_known_as, '') AS user_known_as
FROM sys_order_header h 
INNER JOIN sys_vendors v ON h.vendor_id = v.id
INNER JOIN sys_order_statuses s ON h.order_status_id = s.id
LEFT OUTER JOIN sys_users u ON h.order_owner_id = u.id
LEFT OUTER JOIN vw_customers_with_titles c ON h.order_cust_id=c.id;
