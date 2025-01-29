
/*

-- List the top 5 most ordered pizza types 
-- along with their quantities.

*/


SELECT
    pizza_types.pizza_type_id AS pizza_type,
    sum(quantity) AS total_ordered_pizza
FROM
    order_details
    LEFT JOIN pizzas
    ON order_details.pizza_id = pizzas.pizza_id
    LEFT JOIN pizza_types
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_type
ORDER BY total_ordered_pizza DESC
LIMIT 5;



/*

-- Classic Deluxe (2,453 orders) leads the ranking, indicating strong customer preference for traditional flavors.

-- BBQ Chicken (2,432) and Hawaiian (2,422) pizzas follow closely, showing a demand for sweet-savory and smoky flavors.

-- Pepperoni (2,418) remains a favorite classic choice, with consistent orders.

-- Thai Chicken (2,371) rounds out the top 5, suggesting an interest in unique, spicy flavors.


[
  {
    "pizza_type": "classic_dlx",
    "total_ordered_pizza": "2453"
  },
  {
    "pizza_type": "bbq_ckn",
    "total_ordered_pizza": "2432"
  },
  {
    "pizza_type": "hawaiian",
    "total_ordered_pizza": "2422"
  },
  {
    "pizza_type": "pepperoni",
    "total_ordered_pizza": "2418"
  },
  {
    "pizza_type": "thai_ckn",
    "total_ordered_pizza": "2371"
  }
]

*/


