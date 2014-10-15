DROP TABLE IF EXISTS sys_product_types;

CREATE TABLE sys_product_types
(
  id int not null auto_increment,
  vendor_id INT,
  product_type_name NVARCHAR(100),
  is_active BIT,
  is_fixed BIT,
  image_name varchar(50),
  PRIMARY KEY (id)
);
