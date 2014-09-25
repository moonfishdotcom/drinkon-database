DROP TABLE IF EXISTS sys_users;

CREATE TABLE sys_users
(
  id int not null auto_increment,
  vendor_id INT,
  vendor_user_id NVARCHAR(10),
  user_name NVARCHAR(100),
  user_known_as NVARCHAR(20),
  user_pattern_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);
