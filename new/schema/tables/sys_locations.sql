DROP TABLE IF EXISTS sys_locations;

CREATE TABLE sys_locations
(
  id int not null auto_increment,
  location_name NVARCHAR(100),
  PRIMARY KEY (id)
);
