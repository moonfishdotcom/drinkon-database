DELIMITER //
DROP PROCEDURE IF EXISTS get_order_header //

CREATE PROCEDURE get_order_header (
  param_order_id integer
)
BEGIN

  SELECT *
  FROM vw_order_header_with_totals
  WHERE id = param_order_id;

END //

DELIMITER ;
