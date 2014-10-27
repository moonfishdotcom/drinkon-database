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
