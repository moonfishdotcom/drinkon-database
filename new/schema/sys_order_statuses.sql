
#--------------------------------------------------
#sys_order_statuses

DROP TABLE IF EXISTS sys_order_statuses;

CREATE TABLE sys_order_statuses
(
  id int not null auto_increment,
  order_status_name NVARCHAR(50),
  is_active BIT,
  PRIMARY KEY (id)
);


DROP VIEW IF EXISTS dv_sys_order_statuses;

CREATE VIEW dv_sys_order_statuses AS SELECT * FROM sys_order_statuses ORDER BY id ASC;


#TODO: Remove this
INSERT INTO sys_order_statuses (order_status_name, is_active) VALUES ('Accepted', TRUE);
INSERT INTO sys_order_statuses (order_status_name, is_active) VALUES ('Waiting', TRUE);
INSERT INTO sys_order_statuses (order_status_name, is_active) VALUES ('Complete', TRUE);


#--------------------------------------------------
