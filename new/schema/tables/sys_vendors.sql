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
  vendor_web NVARCHAR(100),
  vendor_twitter NVARCHAR(100),
  vendor_facebook NVARCHAR(100),
  location_id INT,
  is_active BIT,
  PRIMARY KEY (id)
);
