DROP VIEW IF EXISTS vw_customer_reviews;

CREATE VIEW vw_customer_reviews AS
SELECT
  t1.customer_id,
  CONCAT_WS(' ', t2.customer_title, t2.customer_surname) AS customer_name,
  t1.review_text,
  t1.review_score
FROM sys_customer_reviews t1 INNER JOIN vw_customers_with_titles t2 ON t1.customer_id=t2.id;
