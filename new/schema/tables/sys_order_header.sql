DROP TABLE IF EXISTS sys_order_header;

CREATE TABLE sys_order_header
(
  id int not null auto_increment,
  vendor_id INT,
  order_number NVARCHAR(10),
  order_cust_id INT,
  order_reqd_for DATETIME,
  order_status_id INT,
  order_owner_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);
