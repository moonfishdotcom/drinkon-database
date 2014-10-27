DROP TABLE IF EXISTS sys_customer_titles;

CREATE TABLE sys_customer_titles
(
  id int not null auto_increment,
  customer_title NVARCHAR(10),
  is_active BIT,
  PRIMARY KEY (id)
);
