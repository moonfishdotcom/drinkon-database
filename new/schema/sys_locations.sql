
#--------------------------------------------------
#sys_locations

DROP TABLE IF EXISTS sys_locations;

CREATE TABLE sys_locations
(
  id int not null auto_increment,
  location_name NVARCHAR(100),
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_locations;

CREATE VIEW dv_sys_locations AS SELECT * FROM sys_locations ORDER BY id ASC;

#--------------------------------------------------
