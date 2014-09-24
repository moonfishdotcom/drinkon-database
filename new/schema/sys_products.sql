
#--------------------------------------------------
#sys_products

DROP TABLE IF EXISTS sys_products;

CREATE TABLE sys_products
(
  id int not null auto_increment,
  vendor_id INT,
  vendor_product_id NVARCHAR(10),
  product_name NVARCHAR(100),
  product_desc NVARCHAR(500),
  product_type_id INT,
  product_status_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_products;

CREATE VIEW dv_sys_products AS SELECT * FROM sys_products ORDER BY id ASC;


DROP VIEW IF EXISTS vw_products_with_types;

CREATE VIEW vw_products_with_types AS
SELECT
  t1.vendor_id AS id, t1.vendor_product_id, t1.product_name, t1.product_desc, t1.product_type_id,
  t2.product_type_name, t1.product_status_id, t1.is_active, t1.id AS ruid
FROM sys_products t1 INNER JOIN sys_product_types t2 ON t1.product_type_id=t2.id;

#--------------------------------------------------
