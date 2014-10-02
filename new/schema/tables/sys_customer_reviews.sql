DROP TABLE IF EXISTS sys_customer_reviews;

CREATE TABLE sys_customer_reviews
(
  id int not null auto_increment,
  vendor_id INT,
  customer_id INT,
  review_date DATETIME,
  review_text NVARCHAR(200),
  review_score INT,
  PRIMARY KEY (id)
);
