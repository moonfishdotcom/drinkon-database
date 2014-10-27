DROP TABLE IF EXISTS sys_product_measures;

CREATE TABLE sys_product_measures
(
  id int not null auto_increment,
  vendor_id INT,
  product_type_id INT,
  product_measure_name NVARCHAR(100),
  is_active BIT,
  is_fixed BIT,
  PRIMARY KEY (id)
);
