DROP TABLE IF EXISTS sys_user_patterns;

CREATE TABLE sys_user_patterns
(
  id int not null auto_increment,
  vendor_id INT,
  vendor_pattern_id NVARCHAR(10),
  pattern_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);
