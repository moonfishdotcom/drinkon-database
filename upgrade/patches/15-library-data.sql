
ALTER TABLE sys_product_types ADD COLUMN is_fixed BIT;

UPDATE sys_product_types SET is_fixed=FALSE WHERE id>=1;


ALTER TABLE sys_product_measures ADD COLUMN is_fixed BIT;

UPDATE sys_product_measures SET is_fixed=FALSE WHERE id>=1;


ALTER TABLE sys_products ADD COLUMN is_fixed BIT;

UPDATE sys_products SET is_fixed=FALSE WHERE id>=1;
