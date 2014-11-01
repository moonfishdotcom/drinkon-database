DROP VIEW IF EXISTS dv_sys_opening_hours;

CREATE VIEW dv_sys_opening_hours AS 
SELECT
  id,
  hours_value,
  hours_title,
  is_active
FROM sys_opening_hours;
