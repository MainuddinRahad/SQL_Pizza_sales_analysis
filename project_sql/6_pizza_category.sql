

/*

Join the necessary tables to find the total quantity of each pizza category ordered.
-- Calculate the percentage each pizza category contributed..

*/


SELECT
    category AS pizza_category,
    sum(quantity) AS total_ordered_pizza,

    Cast((
        (sum(quantity) / 
            ( -- Grand total is a subquery..
            SELECT
                CAST(sum(quantity) AS Decimal) AS total_ordered_pizza
            FROM
                order_details
                LEFT JOIN pizzas
                ON order_details.pizza_id = pizzas.pizza_id
            )
       )*100
    ) AS Decimal(10,2)) AS total_ordered_pizza_percentage
FROM
    order_details
    LEFT JOIN pizzas
    ON order_details.pizza_id = pizzas.pizza_id
    LEFT JOIN pizza_types
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_category
ORDER BY total_ordered_pizza_percentage DESC;


/*


-- The Classic category accounts for the largest share of sales,
   contributing 30.03% of the total orders.

-- Veggie and Supreme categories are performing well,
   contributing 23.50% and 24.18%, respectively.

-- These categories together represent nearly half (47.68%) of all
   orders, showing their significant role in overall sales.

-- Chicken pizzas contribute 22.29%, indicating they have a dedicated customer base, but lag slightly behind the other categories.

[
  {
    "pizza_category": "Classic",
    "total_ordered_pizza": "14888",
    "total_ordered_pizza_percentage": "30.03"
  },
  {
    "pizza_category": "Supreme",
    "total_ordered_pizza": "11987",
    "total_ordered_pizza_percentage": "24.18"
  },
  {
    "pizza_category": "Veggie",
    "total_ordered_pizza": "11649",
    "total_ordered_pizza_percentage": "23.50"
  },
  {
    "pizza_category": "Chicken",
    "total_ordered_pizza": "11050",
    "total_ordered_pizza_percentage": "22.29"
  }
]

*/






