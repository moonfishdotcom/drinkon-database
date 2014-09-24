
#--------------------------------------------------
#sys_users

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


DROP VIEW IF EXISTS dv_sys_users;

CREATE VIEW dv_sys_users AS SELECT * FROM sys_users ORDER BY id ASC;


DROP VIEW IF EXISTS vw_users_with_patterns;

CREATE VIEW vw_users_with_patterns AS
SELECT
  t1.vendor_id AS id, t1.vendor_user_id, t1.user_name, t1.user_known_as, t1.user_pattern_id,
  t2.pattern_name, t1.is_active, t1.id AS ruid
FROM sys_users t1 INNER JOIN sys_user_patterns t2 ON t1.user_pattern_id=t2.id;

#--------------------------------------------------
