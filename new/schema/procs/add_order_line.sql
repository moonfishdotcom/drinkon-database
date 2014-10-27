DELIMITER //
DROP PROCEDURE IF EXISTS add_order_line //

CREATE PROCEDURE add_order_line (
  param_order_id integer, 
  param_product_id integer, 
  param_product_measure_id integer,
  param_product_qty integer
)
BEGIN

  INSERT INTO sys_order_lines (order_id, product_id, product_qty, product_unit_price, is_active, product_measure_id)
  SELECT param_order_id, param_product_id, param_product_qty, product_unit_price, 1, param_product_measure_id
  FROM sys_product_lines
  WHERE product_id = param_product_id
    AND product_measure_id = param_product_measure_id;

  SELECT last_insert_id() as id;

END //

DELIMITER ;
