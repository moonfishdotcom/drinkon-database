DROP TABLE IF EXISTS sys_vendor_location;

CREATE TABLE sys_vendor_location
(
  id int not null auto_increment,
  vendor_id INT,
  location_long DECIMAL(20,10),
  location_lat DECIMAL(20,10),
  PRIMARY KEY (id)
);
