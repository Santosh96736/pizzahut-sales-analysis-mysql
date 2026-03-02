CREATE DATABASE IF NOT EXISTS pizzahut;

USE pizzahut;

CREATE TABLE IF NOT EXISTS pizza_types (
    pizza_type_id VARCHAR(15) NOT NULL,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(10) NOT NULL,
    ingredients VARCHAR(100) NOT NULL,
    CONSTRAINT pk_pizza_types PRIMARY KEY (pizza_type_id)
);

SHOW CREATE TABLE pizza_types;
SELECT 
    COUNT(*)
FROM
    pizza_types;


CREATE TABLE IF NOT EXISTS pizzas (
    pizza_id VARCHAR(20) NOT NULL,
    pizza_type_id VARCHAR(15) NOT NULL,
    size ENUM('S', 'M', 'L', 'XL', 'XXL') NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL,
    CONSTRAINT pk_pizzas PRIMARY KEY (pizza_id),
    CONSTRAINT fk_pizzas_pizza_types FOREIGN KEY (pizza_type_id)
        REFERENCES pizza_types (pizza_type_id),
    CONSTRAINT chk_price_positive CHECK (price > 0)
);

SHOW CREATE TABLE pizzas;
SELECT 
    COUNT(*)
FROM
    pizzas;

CREATE TABLE IF NOT EXISTS orders( 
order_id INT NOT NULL, 
date DATE NOT NULL DEFAULT(CURRENT_DATE()), 
time TIME NOT NULL DEFAULT(CURRENT_TIME()), 
CONSTRAINT pk_orders PRIMARY KEY (order_id)
);

SHOW CREATE TABLE orders;
SELECT 
    COUNT(*)
FROM
    orders;

CREATE TABLE IF NOT EXISTS order_details (
    order_details_id INT NOT NULL,
    order_id INT NOT NULL,
    pizza_id VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT pk_order_details PRIMARY KEY (order_details_id),
    CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT fk_order_details_pizzas FOREIGN KEY (pizza_id)
        REFERENCES pizzas (pizza_id),
    CONSTRAINT chk_quantity_positive CHECK (quantity > 0)
);

SHOW CREATE TABLE order_details;
SELECT 
    COUNT(*)
FROM
    order_details;


ALTER TABLE orders
ADD COLUMN order_datetime DATETIME;


UPDATE orders 
SET 
    order_datetime = TIMESTAMP(date, time)
WHERE
    order_id > 0;

ALTER TABLE orders
MODIFY order_datetime DATETIME NOT NULL;

ALTER TABLE orders
DROP COLUMN date,
DROP COLUMN time;


-- CREATING INDEX 
CREATE INDEX idx_pizza_types_category 
ON pizza_types(category);

CREATE INDEX idx_orders_order_datetime 
ON Orders(order_datetime);
