DROP VIEW IF EXISTS vw_order_header_totals;

CREATE VIEW vw_order_header_totals AS
SELECT 
  order_id, 
  ROUND(SUM(product_qty * product_unit_price), 2) AS order_total,
  SUM(product_qty) AS item_count
FROM sys_order_lines 
GROUP BY order_id;
