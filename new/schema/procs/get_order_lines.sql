DELIMITER //
DROP PROCEDURE IF EXISTS get_order_lines //

CREATE PROCEDURE get_order_lines (
  param_order_id integer
)
BEGIN

  SELECT *
  FROM vw_order_lines
  WHERE order_id = param_order_id;

END //

DELIMITER ;
