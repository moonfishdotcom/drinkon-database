DELIMITER //
DROP PROCEDURE IF EXISTS get_orders_for_user//

CREATE PROCEDURE get_orders_for_user (
  param_user_id varchar(30)
)
BEGIN

  SELECT *
  FROM vw_order_header
  WHERE order_cust_name = param_user_id;

END //

DELIMITER ;
