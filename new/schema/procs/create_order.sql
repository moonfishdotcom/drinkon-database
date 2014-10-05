DELIMITER //
DROP PROCEDURE IF EXISTS create_order //

CREATE PROCEDURE create_order (
  param_vendor_id integer,
  param_cust_name varchar(100)
)
BEGIN

    DECLARE new_order_number varchar(6);
    SET new_order_number = new_order_number();
    
    INSERT INTO sys_order_header (vendor_id, order_number, order_cust_name, is_active, order_status_id)
    VALUES (param_vendor_id, new_order_number, param_cust_name, 1, 4);

    SELECT id, vendor_id, order_number, order_cust_name, order_reqd_for, is_active, order_status_id
    FROM sys_order_header
    WHERE order_number = new_order_number;

END //

DELIMITER ;
