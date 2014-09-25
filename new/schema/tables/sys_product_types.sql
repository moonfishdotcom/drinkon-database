DROP TABLE IF EXISTS sys_product_types;

CREATE TABLE sys_product_types
(
  id int not null auto_increment,
  vendor_id INT,
  product_type_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);
