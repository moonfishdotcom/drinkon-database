DROP TABLE IF EXISTS sys_customers;

CREATE TABLE sys_customers
(
  id int not null auto_increment,
  customer_title_id int,
  customer_forename NVARCHAR(50),
  customer_surname NVARCHAR(50),
  customer_last_order_date DATETIME,
  username varchar(50),
  password varchar(255),
  display_name varchar(50),
  is_active boolean,
  PRIMARY KEY (id)
);
