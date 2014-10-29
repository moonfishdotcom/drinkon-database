DROP TABLE IF EXISTS sys_opening_hours;

CREATE TABLE sys_opening_hours
(
  id int not null auto_increment,
  hours_value INT,
  hours_title CHAR(5),
  is_active BIT,
  PRIMARY KEY (id)
);
