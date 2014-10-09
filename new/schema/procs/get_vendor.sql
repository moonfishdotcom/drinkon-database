DELIMITER //
DROP PROCEDURE IF EXISTS get_vendor//

CREATE PROCEDURE get_vendor (
  param_vendor_id integer
)
BEGIN

  SELECT *, 500 vendor_distance, 1 vendor_sellsfood, 1 vendor_sellsdrink
  FROM vw_vendors_with_location
  WHERE vendor_id = param_vendor_id;

END //

DELIMITER ;
