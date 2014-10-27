DELIMITER //
DROP PROCEDURE IF EXISTS get_location_and_vendors//

CREATE PROCEDURE get_location_and_vendors (
  param_location_id integer
)
BEGIN

    SELECT *, 500 vendor_distance, 1 vendor_sellsfood, 1 vendor_sellsdrink
    FROM vw_vendors_with_location
    WHERE location_id = param_location_id;

END //

DELIMITER ;
