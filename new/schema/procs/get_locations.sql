DELIMITER //
DROP PROCEDURE IF EXISTS get_locations//

CREATE PROCEDURE get_locations ()
BEGIN

  SELECT *
  FROM dv_sys_locations;

END //

DELIMITER ;
