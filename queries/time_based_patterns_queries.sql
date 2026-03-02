-- Time-Based Patterns
-- Peak hour sales?
SELECT 
    HOUR(o.order_datetime) AS order_hours,
    ROUND(SUM(od.quantity * p.price),2) AS revenue,
    SUM(od.quantity) AS total_quantity
FROM
    orders AS o
        JOIN
    order_details AS od ON o.order_id = od.order_id
        JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id
GROUP BY order_hours
ORDER BY revenue DESC;

-- Peak weekday? 
SELECT 
    DAYOFWEEK(o.order_datetime) AS order_weeks,
    DAYNAME(o.order_datetime) AS order_week_names,
    ROUND(SUM(od.quantity * p.price),2) AS revenue,
    SUM(od.quantity) AS total_quantity
FROM
    orders AS o
        JOIN
    order_details AS od ON o.order_id = od.order_id
        JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id
GROUP BY order_weeks , order_week_names
ORDER BY revenue DESC;

-- Peek Month?  
SELECT 
    order_month_names, revenue
FROM
    (SELECT 
        MONTHNAME(o.order_datetime) AS order_month_names,
            MONTH(o.order_datetime) AS order_months,
            ROUND(SUM(od.quantity * p.price),2) AS revenue
    FROM
        orders AS o
    JOIN order_details AS od ON o.order_id = od.order_id
    JOIN pizzas AS p ON p.pizza_id = od.pizza_id
    GROUP BY order_month_names , order_months
    ORDER BY order_months) AS month_data;


-- Monthly trend? (Growth)
WITH monthly_revenue AS (SELECT DATE_FORMAT(o.order_datetime, '%Y-%m') AS order_date,
       ROUND(SUM(od.quantity * p.price),2) AS revenue
FROM orders AS o
JOIN order_details AS od ON o.order_id = od.order_id
JOIN pizzas AS p ON p.pizza_id = od.pizza_id
GROUP BY order_date)

SELECT order_date,
       revenue,
       ROUND(((revenue - previous_revenue) / previous_revenue) * 100,2) AS growth_rate
FROM (SELECT order_date,
       revenue,
       LAG(revenue) OVER(ORDER BY order_date) AS previous_revenue
FROM monthly_revenue) AS t;
