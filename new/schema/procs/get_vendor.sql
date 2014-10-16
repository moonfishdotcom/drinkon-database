DELIMITER //
DROP PROCEDURE IF EXISTS get_vendor//

CREATE PROCEDURE get_vendor (
  param_vendor_id integer
)
BEGIN

  SELECT *, 
    FLOOR(0 + RAND() * 1000) vendor_distance, 
    FLOOR(0 + RAND() * 2) vendor_sells_food, 
    FLOOR(0 + RAND() * 2) vendor_sells_drink, 
    FLOOR(0 + RAND() * 2) vendor_sells_alcohol
  FROM vw_vendors_with_location
  WHERE vendor_id = IFNULL(param_vendor_id, vendor_id);

END //

DELIMITER ;
