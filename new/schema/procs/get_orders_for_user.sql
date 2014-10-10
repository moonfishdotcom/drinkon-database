DELIMITER //
DROP PROCEDURE IF EXISTS get_orders_for_user//

CREATE PROCEDURE get_orders_for_user (
  param_user_id integer
)
BEGIN

  SELECT *
  FROM vw_order_header_with_totals
  WHERE order_cust_id = param_user_id;

END //

DELIMITER ;
