DROP TABLE IF EXISTS sys_order_lines;

CREATE TABLE sys_order_lines
(
  id int not null auto_increment,
  order_id INT,
  product_id INT,
  product_type_id INT,
  product_measure_id INT,
  product_qty INT,
  product_unit_price DECIMAL(5,2),
  is_active BIT,
  PRIMARY KEY (id)
);
