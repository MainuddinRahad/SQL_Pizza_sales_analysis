

-- Determine the top 5 most ordered pizza types based on revenue.


SELECT
    pizza_types.pizza_type_id AS pizza_type,
    sum(quantity*price) AS revenue
FROM
    order_details
    LEFT JOIN pizzas
    ON order_details.pizza_id = pizzas.pizza_id
    LEFT JOIN pizza_types
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_type
ORDER BY revenue DESC
LIMIT 5;


/*

-- The top 5 pizza types together account for nearly 25% of total revenue,
   indicating they are core contributors to the business’s sales.

-- The Thai Chicken pizza is the best-performing individual pizza, contributing
   $43434.25 of total revenue.

-- The BBQ Chicken pizza is the second best-performing individual pizza , 
   contributing $42768 of total revenue.

-- The Classic Deluxe and Spicy Italian pizzas contribute $38180.5 and $34831.25,
   respectively. While not chicken-based, these pizzas have steady demand.


[
  {
    "pizza_type": "thai_ckn",
    "revenue": 43434.25
  },
  {
    "pizza_type": "bbq_ckn",
    "revenue": 42768
  },
  {
    "pizza_type": "cali_ckn",
    "revenue": 41409.5
  },
  {
    "pizza_type": "classic_dlx",
    "revenue": 38180.5
  },
  {
    "pizza_type": "spicy_ital",
    "revenue": 34831.25
  }
]

*/
