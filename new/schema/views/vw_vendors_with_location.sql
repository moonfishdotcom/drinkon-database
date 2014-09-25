DROP VIEW IF EXISTS vw_vendors_with_location;

CREATE VIEW vw_vendors_with_location AS
SELECT
  t1.id, 
  t1.vendor_name, 
  t1.vendor_addr1, 
  t1.vendor_addr2, 
  t1.vendor_addr3, 
  t1.vendor_addr4,
  t1.vendor_postcode, 
  t1.vendor_phone, 
  t1.vendor_fax, 
  t1.vendor_email,
  t1.location_id, 
  t2.location_name
FROM sys_vendors t1
LEFT OUTER JOIN sys_locations t2 on t1.location_id=t2.id;
