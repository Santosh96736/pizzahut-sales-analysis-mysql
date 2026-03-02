-- Basic KPIs (Health Metrics)
-- Total Revenue
SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS revenue
FROM
    order_details AS od
        JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id;

-- Total Quantity Sold
SELECT 
    SUM(quantity) AS total_quantity
FROM
    order_details;

-- Avg Quantity Per Order
SELECT 
    ROUND((SUM(quantity) / COUNT(DISTINCT order_id)),
            2) AS avg_order
FROM
    order_details;

-- Avg Order Value
SELECT 
    ROUND((SUM(od.quantity * p.price) / COUNT(DISTINCT od.order_id)),
            2) AS avg_order_value
FROM
    order_details AS od
        JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id;
