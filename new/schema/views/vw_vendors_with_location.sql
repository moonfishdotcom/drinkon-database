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
  v.vendor_web,
  v.vendor_twitter,
  v.vendor_facebook,
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
