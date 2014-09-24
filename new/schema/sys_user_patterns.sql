
#--------------------------------------------------
#sys_user_patterns

DROP TABLE IF EXISTS sys_user_patterns;

CREATE TABLE sys_user_patterns
(
  id int not null auto_increment,
  vendor_id INT,
  pattern_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_user_patterns;

CREATE VIEW dv_sys_user_patterns AS SELECT * FROM sys_user_patterns ORDER BY id ASC;


DROP VIEW IF EXISTS vw_vendor_patterns;

CREATE VIEW vw_vendor_patterns AS SELECT vendor_id AS id, pattern_name, is_active, id AS ruid FROM sys_user_patterns ORDER BY id ASC;

#--------------------------------------------------

