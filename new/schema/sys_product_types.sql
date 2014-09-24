
#--------------------------------------------------
#sys_product_types

DROP TABLE IF EXISTS sys_product_types;

CREATE TABLE sys_product_types
(
  id int not null auto_increment,
  vendor_id INT,
  product_type_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_product_types;

CREATE VIEW dv_sys_product_types AS
SELECT vendor_id AS id, product_type_name, is_active, id AS ruid FROM sys_product_types ORDER BY id ASC;

#--------------------------------------------------
