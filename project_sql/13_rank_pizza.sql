

/*

Determine the top 3 most ordered pizza types based on revenue
for each pizza category.

*/

WITH rv AS( -- Using CTE 1
    SELECT
        pizza_types.category AS pizza_category,
        pizza_types.name AS pizza_name,
        CAST(sum(price*quantity) AS DECIMAL(10,2)) AS revenue
    FROM
        order_details
        LEFT JOIN pizzas
        ON order_details.pizza_id = pizzas.pizza_id
        LEFT JOIN pizza_types
        ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY pizza_category, pizza_name
),
rv_1 AS( -- Using CTE 2
SELECT
    rv.pizza_category,
    rank() over(PARTITION BY rv.pizza_category ORDER BY rv.revenue DESC) AS rank,
    rv.pizza_name,
    rv.revenue
   
FROM
    rv
)

SELECT 
    * 
FROM 
    rv_1
WHERE
    rv_1.rank <= 3


/*


1.Chicken

    Top Revenue-Generating Pizza: "The Thai Chicken Pizza" leads with a revenue of $43,434.25.

    Second and Third Positions: "The Barbecue Chicken Pizza" ($42,768) and "The California Chicken Pizza" ($41,409.50).

2.Classic

    Top Performer: "The Classic Deluxe Pizza" generates the most revenue in this category with $38,180.50.

    Next in Line:
    "The Hawaiian Pizza" follows with $32,273.25.
    "The Pepperoni Pizza" secures third with $30,161.75.

3.Supreme

    Top Pizza: "The Spicy Italian Pizza" leads with a revenue of $34,831.25.

    Close Competitors:
    "The Italian Supreme Pizza" ($33,476.75) and "The Sicilian Pizza" ($30,940.50).

4.Veggie

    Top Earner: "The Four Cheese Pizza" generates $32,265.70, making it the most successful Veggie option.

    Other Performers:
    "The Mexicana Pizza" ($26,780.75) and "The Five Cheese Pizza" ($26,066.50).


[
  {
    "pizza_category": "Chicken",
    "rank": "1",
    "pizza_name": "The Thai Chicken Pizza",
    "revenue": "43434.25"
  },
  {
    "pizza_category": "Chicken",
    "rank": "2",
    "pizza_name": "The Barbecue Chicken Pizza",
    "revenue": "42768.00"
  },
  {
    "pizza_category": "Chicken",
    "rank": "3",
    "pizza_name": "The California Chicken Pizza",
    "revenue": "41409.50"
  },
  {
    "pizza_category": "Classic",
    "rank": "1",
    "pizza_name": "The Classic Deluxe Pizza",
    "revenue": "38180.50"
  },
  {
    "pizza_category": "Classic",
    "rank": "2",
    "pizza_name": "The Hawaiian Pizza",
    "revenue": "32273.25"
  },
  {
    "pizza_category": "Classic",
    "rank": "3",
    "pizza_name": "The Pepperoni Pizza",
    "revenue": "30161.75"
  },
  {
    "pizza_category": "Supreme",
    "rank": "1",
    "pizza_name": "The Spicy Italian Pizza",
    "revenue": "34831.25"
  },
  {
    "pizza_category": "Supreme",
    "rank": "2",
    "pizza_name": "The Italian Supreme Pizza",
    "revenue": "33476.75"
  },
  {
    "pizza_category": "Supreme",
    "rank": "3",
    "pizza_name": "The Sicilian Pizza",
    "revenue": "30940.50"
  },
  {
    "pizza_category": "Veggie",
    "rank": "1",
    "pizza_name": "The Four Cheese Pizza",
    "revenue": "32265.70"
  },
  {
    "pizza_category": "Veggie",
    "rank": "2",
    "pizza_name": "The Mexicana Pizza",
    "revenue": "26780.75"
  },
  {
    "pizza_category": "Veggie",
    "rank": "3",
    "pizza_name": "The Five Cheese Pizza",
    "revenue": "26066.50"
  }
]


*/


