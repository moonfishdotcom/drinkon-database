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
  is_fixed BIT,
  image_name varchar(50),
  PRIMARY KEY (id)
);
