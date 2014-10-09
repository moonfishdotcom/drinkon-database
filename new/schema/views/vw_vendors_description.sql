DROP VIEW IF EXISTS vw_vendors_description;

CREATE VIEW vw_vendors_description AS 
SELECT 
  vendor_id AS id, 
  vendor_image, 
  vendor_line1, 
  vendor_line2, 
  vendor_line3
FROM sys_vendors_description 
ORDER BY id ASC;
