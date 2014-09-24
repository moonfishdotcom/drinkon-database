
#--------------------------------------------------
#sys_product_lines

DROP TABLE IF EXISTS sys_product_lines;

CREATE TABLE sys_product_lines
(
  id int not null auto_increment,
  product_id INT,
  product_measure_id INT,
  product_unit_price DECIMAL(5,2),
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_product_lines;

CREATE VIEW dv_sys_product_lines AS SELECT * FROM sys_product_lines ORDER BY id ASC;


DROP VIEW IF EXISTS vw_product_lines_with_descs;

CREATE VIEW vw_product_lines_with_descs AS
SELECT
  t1.id, t2.vendor_id, t1.product_id, t2.product_name, t1.product_measure_id, t3.product_measure_name,
  t1.product_unit_price,  t1.is_active
FROM sys_product_lines t1
INNER JOIN sys_products t2 ON t1.product_id=t2.id
INNER JOIN sys_product_measures t3 ON t1.product_measure_id=t3.id


#TODO: Remove this
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (1, 1, 3.20, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (1, 2, 2.10, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (2, 1, 3.10, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (2, 2, 2.00, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (3, 3, 2.15, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (4, 4, 15.00, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (5, 1, 3.00, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (5, 2, 1.70, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (6, 1, 3.05, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (6, 2, 1.70, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (7, 5, 4.10, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (8, 1, 10.00, TRUE);
INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active) VALUES (8, 2, 7.00, TRUE);

#--------------------------------------------------

