

-- Group the orders by date 
-- and calculate the average number of pizzas ordered per day


WITH order_per_day AS( -- Using CTE ..
SELECT
    date AS per_day,
    sum(order_details.quantity) AS pizza_sold
FROM
    order_details
    LEFT JOIN orders
    ON order_details.order_id = orders.order_id
GROUP BY date
ORDER BY date
)

SELECT
    CAST(avg(order_per_day.pizza_sold) AS DECIMAL(10,0)) AS avg_order_per_day
FROM
    order_per_day;

/*

[
  {
    "avg_order_per_day": "138"
  }
]

*/

