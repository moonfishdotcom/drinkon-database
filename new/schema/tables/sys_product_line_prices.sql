DROP TABLE IF EXISTS sys_product_line_prices;

CREATE TABLE sys_product_line_prices
(
  id int not null auto_increment,
  product_line_id INT,
  product_price_start DATETIME,
  product_price_end DATETIME,
  product_unit_price DECIMAL(5,2),
  product_price_desc NVARCHAR(50),
  is_active BIT,
  PRIMARY KEY (id)
);
