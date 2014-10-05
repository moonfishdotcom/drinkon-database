DELIMITER //
DROP PROCEDURE IF EXISTS get_vendor_products //

CREATE PROCEDURE get_vendor_products(
  param_vendor_id INT
)
BEGIN

  SELECT *
  FROM vw_product_lines_with_descs
  WHERE vendor_id = param_vendor_id;

END //
DELIMITER ;
