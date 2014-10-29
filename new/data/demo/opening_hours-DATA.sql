
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1000, '10:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1015, '10:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1030, '10:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1045, '10:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1100, '11:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1115, '11:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1130, '11:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1145, '11:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1200, '12:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1215, '12:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1230, '12:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1245, '12:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1300, '13:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1315, '13:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1330, '13:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1345, '13:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1400, '14:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1415, '14:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1430, '14:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1445, '14:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1500, '15:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1515, '15:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1530, '15:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1545, '15:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1600, '16:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1615, '16:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1630, '16:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1645, '16:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1700, '17:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1715, '17:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1730, '17:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1745, '17:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1800, '18:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1815, '18:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1830, '18:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1845, '18:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1900, '19:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1915, '19:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1930, '19:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (1945, '19:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2000, '20:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2015, '20:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2030, '20:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2045, '20:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2100, '21:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2115, '21:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2130, '21:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2145, '21:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2200, '22:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2215, '22:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2230, '22:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2245, '22:45', 1);

INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2300, '23:00', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2315, '23:15', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2330, '23:30', 1);
INSERT INTO sys_opening_hours (hours_value, hours_title, is_active) VALUES (2345, '23:45', 1);


INSERT INTO sys_vendor_opening_hours
(
  vendor_id,
  monday_open, monday_close,
  tuesday_open, tuesday_close,
  wednesday_open, wednesday_close,
  thursday_open, thursday_close,
  friday_open, friday_close,
  saturday_open, saturday_close,
  sunday_open, sunday_close,
  is_active
)
VALUES
(
  1,
  1100, 2300,
  1100, 2300,
  1100, 2300,
  1100, 2300,
  1100, 2300,
  1100, 2300,
  1200, 2200,
  1
);

INSERT INTO sys_vendor_opening_hours
(
  vendor_id,
  monday_open, monday_close,
  tuesday_open, tuesday_close,
  wednesday_open, wednesday_close,
  thursday_open, thursday_close,
  friday_open, friday_close,
  saturday_open, saturday_close,
  sunday_open, sunday_close,
  is_active
)
VALUES
(
  2,
  1000, 2330,
  1000, 2330,
  1000, 2330,
  1000, 2330,
  1000, 2330,
  1000, 2330,
  1200, 2200,
  1
);
