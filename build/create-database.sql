DROP DATABASE IF EXISTS drinkonstd;

CREATE DATABASE drinkonstd;

USE drinkonstd;

DROP TABLE IF EXISTS sys_locations;

CREATE TABLE sys_locations
(
  id int not null auto_increment,
  location_name NVARCHAR(100),
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS sys_order_header;

CREATE TABLE sys_order_header
(
  id int not null auto_increment,
  vendor_id INT,
  order_number NVARCHAR(10),
  order_cust_name NVARCHAR(100),
  order_reqd_for DATETIME,
  order_status_id INT,
  order_owner_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);

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

DROP TABLE IF EXISTS sys_order_statuses;

CREATE TABLE sys_order_statuses
(
  id int not null auto_increment,
  order_status_name NVARCHAR(50),
  is_active BIT,
  PRIMARY KEY (id)
);

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

DROP TABLE IF EXISTS sys_product_types;

CREATE TABLE sys_product_types
(
  id int not null auto_increment,
  vendor_id INT,
  product_type_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);

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
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS sys_user_patterns;

CREATE TABLE sys_user_patterns
(
  id int not null auto_increment,
  vendor_id INT,
  pattern_name NVARCHAR(100),
  is_active BIT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS sys_users;

CREATE TABLE sys_users
(
  id int not null auto_increment,
  vendor_id INT,
  vendor_user_id NVARCHAR(10),
  user_name NVARCHAR(100),
  user_known_as NVARCHAR(20),
  user_pattern_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS sys_vendors;

CREATE TABLE sys_vendors
(
  id int not null auto_increment,
  vendor_name NVARCHAR(100),
  vendor_addr1 NVARCHAR(100),
  vendor_addr2 NVARCHAR(100),
  vendor_addr3 NVARCHAR(100),
  vendor_addr4 NVARCHAR(100),
  vendor_postcode NVARCHAR(10),
  vendor_phone NVARCHAR(20),
  vendor_fax NVARCHAR(20),
  vendor_email NVARCHAR(100),
  location_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS sys_vendors_description;

CREATE TABLE sys_vendors_description
(
  id int not null auto_increment,
  vendor_id INT,
  vendor_image NVARCHAR(100),
  vendor_line1 NVARCHAR(200),
  vendor_line2 NVARCHAR(200),
  vendor_line3 NVARCHAR(200),
  is_active BIT,
  PRIMARY KEY (id)
);

DROP VIEW IF EXISTS dv_sys_locations;

CREATE VIEW dv_sys_locations AS 
SELECT * 
FROM sys_locations 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_order_header;

CREATE VIEW dv_sys_order_header AS 
SELECT * 
FROM sys_order_header 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_order_lines;

CREATE VIEW dv_sys_order_lines AS 
SELECT * 
FROM sys_order_lines 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_order_statuses;

CREATE VIEW dv_sys_order_statuses AS 
SELECT * 
FROM sys_order_statuses 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_product_lines;

CREATE VIEW dv_sys_product_lines AS 
SELECT * 
FROM sys_product_lines 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_product_measures;

CREATE VIEW dv_sys_product_measures AS 
SELECT 
  vendor_id AS id, 
  product_measure_name, 
  is_active, 
  id AS ruid 
FROM sys_product_measures 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_product_types;

CREATE VIEW dv_sys_product_types AS
SELECT 
  vendor_id AS id, 
  product_type_name, 
  is_active, 
  id AS ruid 
FROM sys_product_types 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_products;

CREATE VIEW dv_sys_products AS 
SELECT * 
FROM sys_products 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_user_patterns;

CREATE VIEW dv_sys_user_patterns AS 
SELECT * 
FROM sys_user_patterns 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_users;

CREATE VIEW dv_sys_users AS 
SELECT * 
FROM sys_users 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_vendors;

CREATE VIEW dv_sys_vendors AS 
SELECT * 
FROM sys_vendors 
ORDER BY id ASC;

DROP VIEW IF EXISTS dv_sys_vendors_description;

CREATE VIEW dv_sys_vendors_description AS 
SELECT * 
FROM sys_vendors_description 
ORDER BY id ASC;

DROP VIEW IF EXISTS vw_order_header;

CREATE VIEW vw_order_header AS
SELECT
  t1.id, 
  t1.vendor_id, 
  t1.order_number, 
  t1.order_cust_name, 
  t1.order_reqd_for,
  t1.order_status_id, 
  t2.order_status_name,
  t1.order_owner_id, 
  IFNULL(t3.user_known_as, '') AS user_known_as
FROM sys_order_header t1 
INNER JOIN sys_order_statuses t2 ON t1.order_status_id = t2.id
LEFT OUTER JOIN sys_users t3 ON t1.order_owner_id = t3.id;

DROP VIEW IF EXISTS vw_order_header_totals;

CREATE VIEW vw_order_header_totals AS
SELECT 
  order_id, 
  ROUND(SUM(product_qty * product_unit_price), 2) AS order_total 
FROM sys_order_lines 
GROUP BY order_id;

DROP VIEW IF EXISTS vw_order_header_with_totals;

CREATE VIEW vw_order_header_with_totals AS
SELECT 
  t1.*, 
  IFNULL(t2.order_total, 0) AS order_total 
FROM vw_order_header t1
LEFT OUTER JOIN vw_order_header_totals t2 ON t1.id=t2.order_id;

DROP VIEW IF EXISTS vw_order_lines;

CREATE VIEW vw_order_lines AS
SELECT
  l.order_id AS id,
  l.id AS ruid,
  h.vendor_id,
  l.product_id,
  p.product_name,
  p.product_type_id,
  t.product_type_name,
  l.product_measure_id,
  m.product_measure_name,
  l.product_qty,
  l.product_unit_price,
  l.is_active
FROM sys_order_lines l
INNER JOIN sys_order_header h ON l.order_id = h.id
INNER JOIN sys_products p ON l.product_id = p.id
INNER JOIN sys_product_types t ON p.product_type_id = t.id
INNER JOIN sys_product_measures m ON l.product_measure_id = m.id;

DROP VIEW IF EXISTS vw_product_lines_with_descs;

CREATE VIEW vw_product_lines_with_descs AS
SELECT
  pl.id, 
  p.vendor_id, 
  pl.product_id, 
  p.product_name, 
  pl.product_measure_id, 
  pm.product_measure_name,
  pl.product_unit_price,
  p.product_type_id,
  pt.product_type_name
FROM sys_product_lines pl
INNER JOIN sys_products p ON pl.product_id = p.id
INNER JOIN sys_product_measures pm ON pl.product_measure_id = pm.id
INNER JOIN sys_product_types pt ON p.product_type_id = pt.id
WHERE p.is_active = 1;

DROP VIEW IF EXISTS vw_product_measures_with_types;

CREATE VIEW vw_product_measures_with_types AS 
SELECT 
  t1.vendor_id AS id, 
  t1.product_type_id, 
  t2.product_type_name, 
  t1.product_measure_name, 
  t1.is_active, 
  t1.id AS ruid
FROM sys_product_measures t1
INNER JOIN sys_product_types t2 ON t1.product_type_id=t2.id
ORDER BY t1.vendor_id ASC;

DROP VIEW IF EXISTS vw_products_with_types;

CREATE VIEW vw_products_with_types AS
SELECT
  t1.vendor_id AS id, 
  t1.vendor_product_id, 
  t1.product_name, 
  t1.product_desc, 
  t1.product_type_id,
  t2.product_type_name, 
  t1.product_status_id, 
  t1.is_active, 
  t1.id AS ruid
FROM sys_products t1 
INNER JOIN sys_product_types t2 ON t1.product_type_id=t2.id;

DROP VIEW IF EXISTS vw_users_with_patterns;

CREATE VIEW vw_users_with_patterns AS
SELECT
  t1.vendor_id AS id, 
  t1.vendor_user_id, 
  t1.user_name, 
  t1.user_known_as, 
  t1.user_pattern_id,
  t2.pattern_name, 
  t1.is_active, 
  t1.id AS ruid
FROM sys_users t1 
INNER JOIN sys_user_patterns t2 ON t1.user_pattern_id=t2.id;

DROP VIEW IF EXISTS vw_vendor_patterns;

CREATE VIEW vw_vendor_patterns AS 
SELECT 
  vendor_id AS id, 
  pattern_name, 
  is_active, 
  id AS ruid 
FROM sys_user_patterns 
ORDER BY id ASC;

DROP VIEW IF EXISTS vw_vendors_with_location;

CREATE VIEW vw_vendors_with_location AS
SELECT
  v.id vendor_id, 
  v.vendor_name, 
  v.vendor_addr1, 
  v.vendor_addr2, 
  v.vendor_addr3, 
  v.vendor_addr4,
  v.vendor_postcode, 
  v.vendor_phone, 
  v.vendor_fax, 
  v.vendor_email,
  v.location_id, 
  l.location_name,
  d.id description_id,
  d.vendor_image, 
  d.vendor_line1, 
  d.vendor_line2, 
  d.vendor_line3
FROM sys_vendors v
INNER JOIN sys_locations l on v.location_id = l.id
LEFT OUTER JOIN sys_vendors_description d ON v.id = d.vendor_id;

DELIMITER //
DROP PROCEDURE IF EXISTS add_line_to_order //

CREATE PROCEDURE add_line_to_order (
  param_order_id integer, 
  param_product_id integer, 
  param_product_measure_id integer,
  param_product_qty integer
)
BEGIN

  INSERT INTO sys_order_lines (order_id, product_id, product_qty, product_unit_price, is_active, product_measure_id)
  SELECT param_order_id, param_product_id, param_product_qty, product_unit_price, 1, param_product_measure_id
  FROM sys_product_lines
  WHERE product_id = param_product_id
    AND product_measure_id = param_product_measure_id;

  SELECT last_insert_id() as id;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS create_order //

CREATE PROCEDURE create_order (
  param_vendor_id integer,
  param_cust_name varchar(100)
)
BEGIN

    DECLARE new_order_number varchar(6);
    SET new_order_number = new_order_number();
    
    INSERT INTO sys_order_header (vendor_id, order_number, order_cust_name, is_active, order_status_id)
    VALUES (param_vendor_id, new_order_number, param_cust_name, 1, 4);

    SELECT id, vendor_id, order_number, order_cust_name, order_reqd_for, is_active, order_status_id
    FROM sys_order_header
    WHERE order_number = new_order_number;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_location_and_vendors//

CREATE PROCEDURE get_location_and_vendors (
  param_location_id integer
)
BEGIN

    SELECT *, 500 vendor_distance, 1 vendor_sellsfood, 1 vendor_sellsdrink
    FROM vw_vendors_with_location
    WHERE location_id = param_location_id;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_locations//

CREATE PROCEDURE get_locations ()
BEGIN

  SELECT *
  FROM dv_sys_locations;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_order_header //

CREATE PROCEDURE get_order_header (
  param_order_id integer
)
BEGIN

  SELECT *
  FROM vw_order_header
  WHERE id = param_order_id;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_order_lines //

CREATE PROCEDURE get_order_lines (
  param_order_id integer
)
BEGIN

  SELECT *
  FROM vw_order_lines
  WHERE id = param_order_id;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_orders_for_user//

CREATE PROCEDURE get_orders_for_user (
  param_user_id varchar(30)
)
BEGIN

  SELECT *
  FROM vw_order_header
  WHERE order_cust_name = param_user_id;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_vendor//

CREATE PROCEDURE get_vendor (
  param_vendor_id integer
)
BEGIN

  SELECT *, 500 vendor_distance, 1 vendor_sellsfood, 1 vendor_sellsdrink
  FROM vw_vendors_with_location
  WHERE vendor_id = param_vendor_id;

END //

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS get_vendor_products //

CREATE PROCEDURE get_vendor_products(
  param_vendor_id INT
)
BEGIN

  SELECT *
  FROM vw_product_lines_with_descs
  WHERE vendor_id = param_vendor_id;

END //
DELIMITER ;

DELIMITER //
DROP FUNCTION IF EXISTS new_order_number //

CREATE FUNCTION new_order_number()
RETURNS varchar(6)
BEGIN

  RETURN lcase(substring(cast(uuid() AS char), 1, 6));

END //

DELIMITER ;

INSERT INTO sys_locations (id, location_name)
VALUES
(1, 'Dunnington'),
(2, 'Harrogate'),
(3, 'Leeds'),
(4, 'Wetherby'),
(5, 'York'),
(6, 'Ilkley'),
(7, 'Beverley'),
(8, 'Otley'),
(9, 'Richmond');

INSERT INTO sys_order_header (vendor_id, order_number, order_cust_name, order_reqd_for, order_status_id, order_owner_id, is_active)
VALUES
(1, 'q45gh', 'Mr Bill Johnson', '2014-07-28 19:45:00', 2, 2, TRUE),
(1, 'x91pp', 'Mrs Audrey Adams', '2014-07-30 19:30:00', 1, 0, TRUE),
(1, 'r84qb', 'Ms Jenny Holland', '2014-07-31 20:00:00', 1, 0, TRUE);

INSERT INTO sys_order_lines (order_id, product_id, product_type_id, product_measure_id, product_qty, product_unit_price, is_active)
VALUES 
(1, 1, 1, 1, 2, 3.20, TRUE),
(1, 3, 2, 3, 2, 2.15, TRUE),
(1, 5, 1, 1, 1, 2.00, TRUE),
(2, 7, 3, 5, 2, 3.40, TRUE),
(3, 4, 2, 4, 1, 10.00, TRUE);

INSERT INTO sys_order_statuses (id, order_status_name, is_active)
VALUES
(1, 'Accepted', TRUE),
(2, 'Waiting', TRUE),
(3, 'Complete', TRUE),
(4, 'Pending', TRUE);


INSERT INTO sys_product_lines (product_id, product_measure_id, product_unit_price, is_active)
VALUES 
(1, 1, 3.20, TRUE),
(1, 2, 2.10, TRUE),
(2, 1, 3.10, TRUE),
(2, 2, 2.00, TRUE),
(3, 3, 2.15, TRUE),
(4, 4, 15.00, TRUE),
(5, 1, 3.00, TRUE),
(5, 2, 1.70, TRUE),
(6, 1, 3.05, TRUE),
(6, 2, 1.70, TRUE),
(7, 5, 4.10, TRUE),
(8, 1, 10.00, TRUE),
(8, 2, 7.00, TRUE);

INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active)
VALUES 
(1, 'Pint', TRUE),
(1, 'Half-Pint', TRUE),
(1, '330ml Bottle', TRUE),
(1, '75cl bottle', TRUE),
(1, 'Optic', TRUE);

INSERT INTO sys_product_types (id, product_type_name, is_active)
VALUES
(1, 'Lager', 1),
(2, 'Bitter', 1),
(3, 'Cocktail', 1),
(4, 'Optic', 1),
(5, 'Wine', 1),
(6, 'Sparkling', 1),
(7, 'Soft Drink', 1);

INSERT INTO sys_products (id, vendor_id, product_name, product_type_id, is_active, product_status_id, product_desc)
VALUES
(1, 1, 'Black Sheep Riggwelter', 2, 1, 1, 'Riggwelter is a stronger, traditional style beer brewed in the heart of Yorkshire.  It goes very well with cheeses and lamb dishes.'),
(2, 1, 'Timothy Taylor Landlord', 2, 1, 1, 'Landlord is another tradional beer brewed in Tadcaster, it is a lighter style and very refreshing on hotdays.  It goes well with most of our summer dishes.'),
(3, 1, 'St Austell Tribute (Cornish Pale Ale)', 2, 1, 1, null),
(4, 1, 'Jacobs Creek (Syrah) Red', 5, 1, 0, null),
(5, 1, 'Diet Coke', 7, 1, 1, null),
(6, 1, 'Schweppes Lemonade', 7, 1, 1, null),
(7, 1, 'Gin and Tonic', 4, 1, 1, null),
(8, 2, 'Cheeky Vimto', 3, 1, 1, null),
(9, 1, 'Fosters', 1, 1, 1, null),
(10, 1, 'Carling', 1, 1, 1, null),
(11, 1, 'Stella Artois', 1, 1, 1, null),
(12, 1, 'Black Russian', 3, 1, 1, null),
(13, 1, 'Prosecco', 6, 1, 1, null),
(14, 1, 'Banrock Station Colombard Chardonnay', 5, 1, 1, null),
(15, 1, 'Bell\'s Whisky', 4, 1, 1, null);

INSERT INTO sys_vendors (id, vendor_name, vendor_addr1, vendor_addr2, vendor_addr3, vendor_addr4, vendor_postcode, vendor_phone, vendor_fax, vendor_email, location_id)
VALUES
(1, 'Navajos Bar and Bistro', '2 Somewhere Street', 'Harrogate', 'North Yorkshire', null, 'HG7 7XX', '01423 567890', '01423 098765', 'navajosbar@something.com', 2),
(2, 'Carringtons', '15 Long Street', 'Harrogate', 'North Yorkshire', null, 'HG2 4XX', '01423 123456', '01423 123457', 'carringtons@nrgy.co.uk', 2),
(3, 'The Cross Keys', '3 Common Road', 'Dunnington', 'York', null, 'YO19 5NG', null, null, null, 1),
(4, 'The Windmill', 'Hull Road', 'Dunnington', 'York', null, 'YO19 5LP', null, null, null, 1),
(5, 'Dunnington Sports Club', 'Common Road', 'Dunnington', 'York', null, 'YO19 5NG', null, null, null, 1);

INSERT INTO sys_vendors_description (id, vendor_id, vendor_image, vendor_line1, vendor_line2, vendor_line3, is_active)
VALUES
(1, 1, '1-navajos.jpg', 'Navajos is a lively bar and bistro tucked into a quiet corner of Harrogate and popular among those looking for a civilised atmosphere.', 'We serve UK and American craft beers, excellent wines, soft drinks and superb food prepared with locally sourced produce. We also have a superb collection of Scottish Whiskey.', 'No music or jukeboxes, just good company and conversation.', 1),
(2, 3, 'crosskeys.jpg', 'The Cross Keys is a newly refurbished pub in the heart of Dunnington', 'We sell drink, food and run a popular quiz night each Thursday at 9pm.', null, 1);
