DELIMITER //
DROP PROCEDURE IF EXISTS update_order_line //

CREATE PROCEDURE update_order_line (
  param_order_line_id integer, 
  param_product_qty integer
)
BEGIN

  UPDATE sys_order_lines 
  SET product_qty = param_product_qty 
  WHERE id = param_order_line_id;

END //

DELIMITER ;
