
#--------------------------------------------------
#sys_product_measures

DROP TABLE IF EXISTS sys_product_measures;

CREATE TABLE sys_product_measures
(
  id int not null auto_increment,
  vendor_id INT,
  product_type_id INT,
  product_measure_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_product_measures;

CREATE VIEW dv_sys_product_measures AS 
SELECT vendor_id AS id, product_measure_name, is_active, id AS ruid FROM sys_product_measures ORDER BY id ASC;


DROP VIEW IF EXISTS vw_product_measures_with_types;

CREATE VIEW vw_product_measures_with_types AS 
SELECT t1.vendor_id AS id, t1.product_type_id, t2.product_type_name, t1.product_measure_name, t1.is_active, t1.id AS ruid
FROM sys_product_measures t1
INNER JOIN sys_product_types t2 ON t1.product_type_id=t2.id
ORDER BY t1.vendor_id ASC;


#TODO: Remove this
INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active) VALUES (1, 'Pint', TRUE);
INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active) VALUES (1, 'Half-Pint', TRUE);
INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active) VALUES (1, '330ml Bottle', TRUE);
INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active) VALUES (1, '75cl bottle', TRUE);
INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active) VALUES (1, 'Optic', TRUE);

#--------------------------------------------------
