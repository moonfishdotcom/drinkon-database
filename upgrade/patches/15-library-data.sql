
ALTER TABLE sys_product_types ADD COLUMN is_fixed BIT;

UPDATE sys_product_types SET is_fixed=FALSE WHERE id>=1;

