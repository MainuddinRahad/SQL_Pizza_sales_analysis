
-- Group the orders by date 
-- calculate the number of pizzas ordered per day.

SELECT
    date AS per_day,
    sum(order_details.quantity) AS pizza_sold
FROM
    order_details
    LEFT JOIN orders
    ON order_details.order_id = orders.order_id
GROUP BY date
ORDER BY date;

