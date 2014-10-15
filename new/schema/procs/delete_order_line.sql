DELIMITER //
DROP PROCEDURE IF EXISTS delete_order_line //

CREATE PROCEDURE delete_order_line (
  param_order_line_id integer
)
BEGIN

  DELETE
  FROM sys_order_lines
  WHERE id = param_order_line_id;

END //

DELIMITER ;
