DELIMITER //
DROP FUNCTION IF EXISTS new_order_number //

CREATE FUNCTION new_order_number()
RETURNS varchar(6)
BEGIN

  RETURN lcase(substring(cast(uuid() AS char), 1, 6));

END //

DELIMITER ;
