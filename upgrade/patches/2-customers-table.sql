
ALTER TABLE sys_order_header DROP COLUMN order_cust_name;

ALTER TABLE sys_order_header ADD COLUMN order_cust_id INT;


UPDATE sys_order_header SET order_cust_id=1 WHERE id=1;
UPDATE sys_order_header SET order_cust_id=2 WHERE id=2;
UPDATE sys_order_header SET order_cust_id=3 WHERE id=3;
