DROP TABLE IF EXISTS sys_customers;

CREATE TABLE sys_customers
(
  id int not null auto_increment,
  customer_title_id int,
  customer_forename NVARCHAR(50),
  customer_surname NVARCHAR(50),
  customer_last_order_date DATETIME,
  username nvarchar(50),
  password nvarchar(1000),
  PRIMARY KEY (id)
);
