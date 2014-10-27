DROP TABLE IF EXISTS sys_order_statuses;

CREATE TABLE sys_order_statuses
(
  id int not null auto_increment,
  order_status_name NVARCHAR(50),
  is_active BIT,
  PRIMARY KEY (id)
);
