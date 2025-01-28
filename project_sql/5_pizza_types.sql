
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

-- The order volumes of these top pizzas are very close, with less
   than a 100-order difference between the highest ("classic_dlx") and the fifth-ranked ("thai_ckn").

-- Despite being polarizing for some, "hawaiian" ranks 3rd, proving 
   its strong appeal to a specific customer segment.

-- Despite being polarizing for some, "hawaiian" ranks 3rd, proving
   its strong appeal to a specific customer segment.

*/


