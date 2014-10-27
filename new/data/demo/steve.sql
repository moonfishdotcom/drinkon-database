INSERT INTO sys_customer_titles (customer_title, is_active)
VALUES
('Mr', TRUE),
('Mrs', TRUE),
('Ms', TRUE),
('Miss', TRUE);

INSERT INTO sys_customers (id, username, password, display_name, is_active)
VALUES
(1, 'q', 'q', 'Qwerty Uiop', TRUE);

INSERT INTO sys_locations (id, location_name)
VALUES
(1, 'Dunnington'),
(2, 'Harrogate'),
(3, 'Leeds'),
(4, 'Wetherby'),
(5, 'York'),
(6, 'Ilkley'),
(7, 'Beverley'),
(8, 'Otley'),
(9, 'Richmond');

-- INSERT INTO sys_order_header (vendor_id, order_number, order_cust_id, order_reqd_for, order_status_id, order_owner_id, is_active)
-- VALUES
-- (1, 'q45gh', 1, '2014-07-28 19:45:00', 2, 2, TRUE),
-- (1, 'x91pp', 2, '2014-07-30 19:30:00', 1, 0, TRUE),
-- (1, 'r84qb', 3, '2014-07-31 20:00:00', 1, 0, TRUE);

-- INSERT INTO sys_order_lines (order_id, product_id, product_measure_id, product_qty, product_unit_price, is_active)
-- VALUES 
-- (1, 1, 1, 2, 3.20, TRUE),
-- (1, 3, 3, 2, 2.15, TRUE),
-- (1, 5, 1, 1, 2.00, TRUE),
-- (2, 7, 5, 2, 3.40, TRUE),
-- (3, 4, 4, 1, 10.00, TRUE);

INSERT INTO sys_order_statuses (id, order_status_name, is_active)
VALUES
(1, 'Accepted', TRUE),
(2, 'Waiting', TRUE),
(3, 'Complete', TRUE),
(4, 'Pending', TRUE);

INSERT INTO sys_product_lines (vendor_id, product_id, product_measure_id, product_unit_price, is_active)
VALUES 
(1, 1, 1, 3.20, TRUE),
(1, 1, 2, 2.10, TRUE),
(1, 2, 1, 3.10, TRUE),
(1, 2, 2, 2.00, TRUE),
(1, 3, 3, 2.15, TRUE),
(1, 4, 4, 15.00, TRUE),
(1, 5, 1, 3.00, TRUE),
(1, 5, 2, 1.70, TRUE),
(1, 6, 1, 3.05, TRUE),
(1, 6, 2, 1.70, TRUE),
(1, 7, 5, 4.10, TRUE),
(1, 8, 1, 10.00, TRUE),
(1, 8, 2, 7.00, TRUE);

INSERT INTO sys_product_measures (vendor_id, product_measure_name, is_active)
VALUES 
(1, 'Pint', TRUE),
(1, 'Half-Pint', TRUE),
(1, '330ml Bottle', TRUE),
(1, '75cl bottle', TRUE),
(1, 'Optic', TRUE);

INSERT INTO sys_product_types (id, product_type_name, is_active, image_name)
VALUES
(1, 'Lager', 1, 'lager'),
(2, 'Bitter', 1, 'bitter'),
(3, 'Cocktail', 1, 'cocktail'),
(4, 'Optic', 1, 'optic'),
(5, 'Wine', 1, 'wine'),
(6, 'Sparkling', 1, 'sparkling'),
(7, 'Soft Drink', 1, 'softdrink');

INSERT INTO sys_products (id, vendor_id, product_name, product_type_id, is_active, product_status_id, product_desc, image_name)
VALUES
(1, 1, 'Black Sheep Riggwelter', 2, 1, 1, 'Riggwelter is a stronger, traditional style beer brewed in the heart of Yorkshire.  It goes very well with cheeses and lamb dishes.', 'bitter-medium'),
(2, 1, 'Timothy Taylor Landlord', 2, 1, 1, 'Landlord is another tradional beer brewed in Tadcaster, it is a lighter style and very refreshing on hotdays.  It goes well with most of our summer dishes.', 'bitter-pale'),
(3, 1, 'St Austell Tribute (Cornish Pale Ale)', 2, 1, 1, null, 'bitter-pale'),
(4, 1, 'Jacobs Creek (Syrah) Red', 5, 1, 0, null, 'winebottle-red'),
(5, 1, 'Diet Coke', 7, 1, 1, null, 'softdrink-cola'),
(6, 1, 'Schweppes Lemonade', 7, 1, 1, null, 'softdrink-lemonade'),
(7, 1, 'Gin and Tonic', 4, 1, 1, null, 'cocktail-short'),
(8, 2, 'Cheeky Vimto', 3, 1, 1, null, 'cocktail-wide'),
(9, 1, 'Fosters', 1, 1, 1, null, 'lager'),
(10, 1, 'Carling', 1, 1, 1, null, 'lager'),
(11, 1, 'Stella Artois', 1, 1, 1, null, 'lager'),
(12, 1, 'Black Russian', 3, 1, 1, null, 'cocktail-classic'),
(13, 1, 'Prosecco', 6, 1, 1, null, 'flute'),
(14, 1, 'Banrock Station Colombard Chardonnay', 5, 1, 1, null, 'winebottle-white'),
(15, 1, 'Bell\'s Whisky', 4, 1, 1, null, 'shot-whisky');

INSERT INTO sys_vendors (id, vendor_name, vendor_addr1, vendor_addr2, vendor_addr3, vendor_addr4, vendor_postcode, vendor_phone, vendor_fax, vendor_email, location_id)
VALUES
(1, 'Navajos Bar and Bistro', '2 Somewhere Street', 'Harrogate', 'North Yorkshire', null, 'HG7 7XX', '01423 567890', '01423 098765', 'navajosbar@something.com', 2),
(2, 'Carringtons', '15 Long Street', 'Harrogate', 'North Yorkshire', null, 'HG2 4XX', '01423 123456', '01423 123457', 'carringtons@nrgy.co.uk', 2),
(3, 'The Cross Keys', '3 Common Road', 'Dunnington', 'York', null, 'YO19 5NG', null, null, null, 1),
(4, 'The Windmill', 'Hull Road', 'Dunnington', 'York', null, 'YO19 5LP', null, null, null, 1),
(5, 'Dunnington Sports Club', 'Common Road', 'Dunnington', 'York', null, 'YO19 5NG', null, null, null, 1);

INSERT INTO sys_vendors_description (id, vendor_id, vendor_image, vendor_line1, vendor_line2, vendor_line3, is_active)
VALUES
(1, 1, '1-navajos.jpg', 'Navajos is a lively bar and bistro tucked into a quiet corner of Harrogate and popular among those looking for a civilised atmosphere.', 'We serve UK and American craft beers, excellent wines, soft drinks and superb food prepared with locally sourced produce. We also have a superb collection of Scottish Whiskey.', 'No music or jukeboxes, just good company and conversation.', 1),
(2, 3, 'crosskeys.jpg', 'The Cross Keys is a newly refurbished pub in the heart of Dunnington', 'We sell drink, food and run a popular quiz night each Thursday at 9pm.', null, 1);
