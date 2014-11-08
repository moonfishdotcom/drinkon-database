DROP TABLE IF EXISTS sys_vendor_settings;

CREATE TABLE sys_vendor_settings
(
  id int not null auto_increment,
  vendor_id INT,
  timeslot_length INT,
  timeslot_maxorders INT,
  order_alert INT,
  review_maxscore INT,
  review_showcount INT,
  is_active BIT,
  PRIMARY KEY (id)
);
