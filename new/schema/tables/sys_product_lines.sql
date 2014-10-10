DROP TABLE IF EXISTS sys_product_lines;

CREATE TABLE sys_product_lines
(
  id int not null auto_increment,
  vendor_id INT,
  product_id INT,
  product_measure_id INT,
  product_unit_price DECIMAL(5,2),
  is_active BIT,
  PRIMARY KEY (id)
);
