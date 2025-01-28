

--Analyze the cumulative revenue generated over time.

WITH revenue_t AS(  -- Using CTE..
    SELECT
        date AS order_date,
        CAST(sum(quantity*price) AS DECIMAL(10,2)) AS revenue
    FROM
        order_details
        LEFT JOIN pizzas
        ON order_details.pizza_id = pizzas.pizza_id
        LEFT JOIN orders
        ON order_details.order_id = orders.order_id
    GROUP BY order_date
    ORDER BY order_date ASC
)

SELECT
    revenue_t.order_date,
    revenue_t.revenue,
    CAST(sum(revenue_t.revenue) over(ORDER BY revenue_t.order_date) AS DECIMAL(10,2)) AS cum_revenue
FROM
    revenue_t