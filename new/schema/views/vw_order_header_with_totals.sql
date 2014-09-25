DROP VIEW IF EXISTS vw_order_header_with_totals;

CREATE VIEW vw_order_header_with_totals AS
SELECT 
  t1.*, 
  IFNULL(t2.order_total, 0) AS order_total 
FROM vw_order_header t1
LEFT OUTER JOIN vw_order_header_totals t2 ON t1.id=t2.order_id;
