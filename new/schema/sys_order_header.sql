
#--------------------------------------------------
#sys_order_header

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


DROP VIEW IF EXISTS dv_sys_order_header;

CREATE VIEW dv_sys_order_header AS SELECT * FROM sys_order_header ORDER BY id ASC;


DROP VIEW IF EXISTS vw_order_header;

CREATE VIEW vw_order_header AS
SELECT
  t1.id, t1.vendor_id, t1.order_number, t1.order_cust_name, t1.order_reqd_for,
  t1.order_status_id, t2.order_status_name,
  t1.order_owner_id, IFNULL(t3.user_known_as, '') AS user_known_as

FROM sys_order_header t1 
INNER JOIN sys_order_statuses t2 ON t1.order_status_id = t2.id
LEFT OUTER JOIN sys_users t3 ON t1.order_owner_id = t3.id;


#TODO: Remove this
INSERT INTO sys_order_header (vendor_id, order_number, order_cust_name, order_reqd_for, order_status_id, order_owner_id, is_active)
VALUES
(1, 'q45gh', 'Mr Bill Johnson', '2014-07-28 19:45:00', 2, 2, TRUE);

INSERT INTO sys_order_header (vendor_id, order_number, order_cust_name, order_reqd_for, order_status_id, order_owner_id, is_active)
VALUES
(1, 'x91pp', 'Mrs Audrey Adams', '2014-07-30 19:30:00', 1, 0, TRUE);

INSERT INTO sys_order_header (vendor_id, order_number, order_cust_name, order_reqd_for, order_status_id, order_owner_id, is_active)
VALUES
(1, 'r84qb', 'Ms Jenny Holland', '2014-07-31 20:00:00', 1, 0, TRUE);


DROP VIEW IF EXISTS vw_order_header_totals;

CREATE VIEW vw_order_header_totals AS
SELECT order_id, ROUND(SUM(product_qty * product_unit_price), 2) AS order_total FROM sys_order_lines GROUP BY order_id;


DROP VIEW IF EXISTS vw_order_header_with_totals;

CREATE VIEW vw_order_header_with_totals AS
SELECT t1.*, IFNULL(t2.order_total, 0) AS order_total FROM vw_order_header t1
LEFT OUTER JOIN vw_order_header_totals t2 ON t1.id=t2.order_id

#--------------------------------------------------
