DROP VIEW IF EXISTS vw_customers_with_titles;

CREATE VIEW vw_customers_with_titles AS 
SELECT
  t1.id,
  t1.customer_title_id,
  t2.customer_title,
  t1.customer_forename,
  t1.customer_surname,
  t1.customer_last_order_date
FROM sys_customers t1
INNER JOIN sys_customer_titles t2 ON t1.customer_title_id=t2.id
ORDER BY t1.customer_surname ASC;

DROP VIEW IF EXISTS vw_customer_reviews;

CREATE VIEW vw_customer_reviews AS
SELECT
  t1.vendor_id,
  t1.customer_id,
  CONCAT_WS(' ', t2.customer_title, t2.customer_surname, 'on', DATE_FORMAT(t1.review_date,'%W, %e, %M %Y'))  AS review_head,
  t1.review_text AS review_body,
  t1.review_score
FROM sys_customer_reviews t1 INNER JOIN vw_customers_with_titles t2 ON t1.customer_id=t2.id;
