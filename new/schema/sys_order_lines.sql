
#--------------------------------------------------
#sys_order_lines

DROP TABLE IF EXISTS sys_order_lines;

CREATE TABLE sys_order_lines
(
  id int not null auto_increment,
  vendor_id INT,
  order_id INT,
  product_id INT,
  product_type_id INT,
  product_measure_id INT,
  product_qty INT,
  product_unit_price DECIMAL(5,2),
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_order_lines;

CREATE VIEW dv_sys_order_lines AS SELECT * FROM sys_order_lines ORDER BY id ASC;


DROP VIEW IF EXISTS vw_order_lines;

CREATE VIEW vw_order_lines AS
SELECT
  t1.order_id AS id, t1.id AS ruid, t1.vendor_id,
  t1.product_id, t2.product_name,
  t1.product_type_id, t3.product_type_name,
  t1.product_measure_id, t4.product_measure_name,
  t1.product_qty, t1.product_unit_price, t1.is_active
FROM sys_order_lines t1
INNER JOIN sys_products t2 ON t1.product_id = t2.id
INNER JOIN sys_product_types t3 ON t1.product_type_id = t3.id
INNER JOIN sys_product_measures t4 ON t1.product_measure_id = t4.id;


#TODO: Remove this
INSERT INTO sys_order_lines (vendor_id,order_id,product_id,product_type_id,product_measure_id,product_qty,product_unit_price,is_active) VALUES (1,1,1,1,1,2,3.20,TRUE);
INSERT INTO sys_order_lines (vendor_id,order_id,product_id,product_type_id,product_measure_id,product_qty,product_unit_price,is_active) VALUES (1,1,3,2,3,2,2.15,TRUE);
INSERT INTO sys_order_lines (vendor_id,order_id,product_id,product_type_id,product_measure_id,product_qty,product_unit_price,is_active) VALUES (1,1,5,1,1,1,2.00,TRUE);

INSERT INTO sys_order_lines (vendor_id,order_id,product_id,product_type_id,product_measure_id,product_qty,product_unit_price,is_active) VALUES (1,2,7,3,5,2,3.40,TRUE);

INSERT INTO sys_order_lines (vendor_id,order_id,product_id,product_type_id,product_measure_id,product_qty,product_unit_price,is_active) VALUES (1,3,4,2,4,1,10.00,TRUE);

#--------------------------------------------------
