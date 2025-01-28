


/*

Calculate the percentage contribution of each pizza type to total revenue.

*/

SELECT
    category,
    sum(quantity * price) AS total_revenue,
    CAST(((
        sum(quantity * price) /
        ( -- Using subquery start ..
        SELECT 
            sum(quantity * price) AS total_revenue
        FROM
            order_details
            LEFT JOIN pizzas
            ON order_details.pizza_id = pizzas.pizza_id
        ) -- Using subquery end ..
    )*100) AS DECIMAL(10,2)) AS total_revenue_percentage
FROM
    order_details
    LEFT JOIN pizzas
    ON order_details.pizza_id = pizzas.pizza_id
    LEFT JOIN pizza_types
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY category
ORDER BY total_revenue_percentage DESC;



/*

According to sales and order contribution:

    -- Classic pizzas generate the highest revenue at 220,053.10,
       accounting for 26.91% of total revenue.

    -- This aligns with their dominance in total orders (30.03%),
       highlighting their widespread appeal and consistent contribution to sales.

    -- Supreme pizzas follow closely, contributing 25.46% of revenue. 
       This shows that their higher price point or loaded toppings resonate with customers seeking premium options.

    -- Despite ranking second in orders (24.18%), their contribution to
       revenue is proportionally higher, suggesting better margins.

-- Chicken pizzas generate slightly more revenue (23.96%) than Veggie
   pizzas (23.68%), reflecting a balanced demand for both categories.


[
  {
    "category": "Classic",
    "total_revenue": 220053.1000000001,
    "total_revenue_percentage": "26.91"
  },
  {
    "category": "Supreme",
    "total_revenue": 208196.99999999822,
    "total_revenue_percentage": "25.46"
  },
  {
    "category": "Chicken",
    "total_revenue": 195919.5,
    "total_revenue_percentage": "23.96"
  },
  {
    "category": "Veggie",
    "total_revenue": 193690.45000000298,
    "total_revenue_percentage": "23.68"
  }
]

*/




