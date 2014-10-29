DROP TABLE IF EXISTS sys_vendor_location;

CREATE TABLE sys_vendor_location
(
  id int not null auto_increment,
  vendor_id INT,
  location_long DECIMAL(20,10),
  location_lat DECIMAL(20,10),
  PRIMARY KEY (id)
);


INSERT INTO sys_vendor_location (vendor_id, location_long, location_lat) VALUES (1, 10.0011, 20.0022);
INSERT INTO sys_vendor_location (vendor_id, location_long, location_lat) VALUES (2, 50.0011, 60.0022);
