

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

-- Large (L) pizzas are the most ordered (18,526 orders), indicating a strong preference for group or family-sized meals.

-- Medium (15,385) and Small (14,137) pizzas also have high demand, showing that individual and personal-sized options are popular.

-- Extra Large (XL) and XXL pizzas have very low demand (544 and 28 orders, respectively), suggesting they may not be cost-effective to stock.


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

