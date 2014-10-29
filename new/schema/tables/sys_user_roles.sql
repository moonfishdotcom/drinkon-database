DROP TABLE IF EXISTS sys_user_roles;

CREATE TABLE sys_user_roles
(
  id int not null auto_increment,
  vendor_id INT,
  role_name NVARCHAR(50),
  is_can_see_orders BIT,
  is_can_accept_orders BIT,
  is_can_complete_orders BIT,
  is_can_handle_stock BIT,
  is_administrator BIT,
  is_active BIT,
  PRIMARY KEY (id)
);
