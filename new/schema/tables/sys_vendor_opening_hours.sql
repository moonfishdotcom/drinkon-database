DROP TABLE IF EXISTS sys_vendor_opening_hours;

CREATE TABLE sys_vendor_opening_hours
(
  id int not null auto_increment,
  vendor_id INT,
  monday_open INT,
  monday_close INT,
  tuesday_open INT,
  tuesday_close INT,
  wednesday_open INT,
  wednesday_close INT,
  thursday_open INT,
  thursday_close INT,
  friday_open INT,
  friday_close INT,
  saturday_open INT,
  saturday_close INT,
  sunday_open INT,
  sunday_close INT,
  is_active BIT,
  PRIMARY KEY (id)
);
