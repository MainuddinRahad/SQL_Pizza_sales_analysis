
/*

-- Identify the ( TOP - 10 ) highest-priced pizza.

*/




SELECT
    name AS pizza_name,
    price,
    count(order_details.pizza_id) AS pizza_order
FROM
    pizza_types
    LEFT JOIN pizzas
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    LEFT JOIN order_details
    ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_name , price
ORDER BY price  DESC
LIMIT 10;


/*

-- The Greek Pizza" priced at $35.95 has the lowest number of
   orders (28), suggesting it might be too expensive.

-- The lower-priced variant of "The Greek Pizza" at $25.50 has 
   significantly more orders (544 orders), showing that demand improves when the price is reduced.

--  Most pizzas priced at $20.75 dominate in order volume: 

        1. "The Spicy Italian Pizza": 1,088 orders (highest overall).
        2. "The California Chicken Pizza": 895 orders.
        3. "The Italian Supreme Pizza": 735 orders.

-- These results indicate that $20.75 is a sweet spot for pricing, balancing 
   affordability with customer demand.


[
  {
    "pizza_name": "The Greek Pizza",
    "price": 35.95,
    "pizza_order": "28"
  },
  {
    "pizza_name": "The Greek Pizza",
    "price": 25.5,
    "pizza_order": "544"
  },
  {
    "pizza_name": "The Brie Carre Pizza",
    "price": 23.65,
    "pizza_order": "480"
  },
  {
    "pizza_name": "The Italian Vegetables Pizza",
    "price": 21,
    "pizza_order": "190"
  },
  {
    "pizza_name": "The Pepper Salami Pizza",
    "price": 20.75,
    "pizza_order": "680"
  },
  {
    "pizza_name": "The Italian Supreme Pizza",
    "price": 20.75,
    "pizza_order": "735"
  },
  {
    "pizza_name": "The Soppressata Pizza",
    "price": 20.75,
    "pizza_order": "401"
  },
  {
    "pizza_name": "The California Chicken Pizza",
    "price": 20.75,
    "pizza_order": "895"
  },
  {
    "pizza_name": "The Spicy Italian Pizza",
    "price": 20.75,
    "pizza_order": "1088"
  },
  {
    "pizza_name": "The Spinach Pesto Pizza",
    "price": 20.75,
    "pizza_order": "279"
  }
]

*/


