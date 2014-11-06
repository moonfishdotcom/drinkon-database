DELIMITER //
DROP PROCEDURE IF EXISTS place_order //

CREATE PROCEDURE place_order (
  param_order_id integer,
  param_collection_time datetime
)
BEGIN

  UPDATE sys_order_header
  SET order_reqd_for = param_collection_time, order_status_id = 2, order_owner_id = 0
  WHERE id = param_order_id;

END //

DELIMITER ;
