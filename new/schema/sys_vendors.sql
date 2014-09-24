
#--------------------------------------------------
#sys_vendors

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


DROP VIEW IF EXISTS dv_sys_vendors;

CREATE VIEW dv_sys_vendors AS SELECT * FROM sys_vendors ORDER BY id ASC;


DROP VIEW IF EXISTS vw_vendors_with_location;

CREATE VIEW vw_vendors_with_location AS
SELECT
  t1.id, t1.vendor_name, t1.vendor_addr1, t1.vendor_addr2, t1.vendor_addr3, t1.vendor_addr4,
  t1.vendor_postcode, t1.vendor_phone, t1.vendor_fax, t1.vendor_email,
  t1.location_id, t2.location_name
FROM sys_vendors t1
LEFT OUTER JOIN sys_locations t2 on t1.location_id=t2.id;

#--------------------------------------------------
