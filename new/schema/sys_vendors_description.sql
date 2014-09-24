
#--------------------------------------------------
#sys_vendors_description

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


DROP VIEW IF EXISTS dv_sys_vendors_description;

CREATE VIEW dv_sys_vendors_description AS SELECT * FROM sys_vendors_description ORDER BY id ASC;


DROP VIEW IF EXISTS vw_vendors_description;

CREATE VIEW vw_vendors_description AS SELECT vendor_id AS id, vendor_image, vendor_line1, vendor_line2, vendor_line3, id AS RUID FROM sys_vendors_description ORDER BY id ASC;

#--------------------------------------------------
