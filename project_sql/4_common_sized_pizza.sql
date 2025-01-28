

-- Identify the most common pizza size ordered.

SELECT
    size AS pizza_size,
    count(order_id) AS order_pizza
FROM
    order_details
    LEFT JOIN pizzas
    ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_size
ORDER BY order_pizza DESC;


/*


[
  {
    "pizza_size": "L",
    "order_pizza": "18526"
  },
  {
    "pizza_size": "M",
    "order_pizza": "15385"
  },
  {
    "pizza_size": "S",
    "order_pizza": "14137"
  },
  {
    "pizza_size": "XL",
    "order_pizza": "544"
  },
  {
    "pizza_size": "XXL",
    "order_pizza": "28"
  }
]


*/

