DROP VIEW IF EXISTS dv_sys_vendor_opening_hours;

CREATE VIEW dv_sys_vendor_opening_hours AS 
SELECT
  id,
  vendor_id,
  monday_open,
  monday_close,
  tuesday_open,
  tuesday_close,
  wednesday_open,
  wednesday_close,
  thursday_open,
  thursday_close,
  friday_open,
  friday_close,
  saturday_open,
  saturday_close,
  sunday_open,
  sunday_close,
  is_active
FROM sys_vendor_opening_hours;
