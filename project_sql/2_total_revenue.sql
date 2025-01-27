

/*

-- Calculate the total revenue generated from pizza sales.

- Break down the total revenue by quarters (Q1, Q2, Q3, Q4) and provide the overall yearly revenue as well.

*/


SELECT
   CASE
        WHEN EXTRACT(quarter FROM date) = 1 THEN 'Q1'
        WHEN EXTRACT(quarter FROM date) = 2 THEN 'Q2'
        WHEN EXTRACT(quarter FROM date) = 3 THEN 'Q3'
        WHEN EXTRACT(quarter FROM date) = 4 THEN 'Q4'
   END AS quarterly_revenue,
   Cast(sum(quantity*price) as decimal(10,2)) AS Total_revenue
FROM
    order_details
    LEFT JOIN pizzas
    ON order_details.pizza_id = pizzas.pizza_id
    LEFT JOIN orders
    ON order_details.order_id = orders.order_id
GROUP BY quarterly_revenue
ORDER BY quarterly_revenue ASC


/*


Here's the breakdown Total Revenue Querterly..

-- Total Annual Revenue: $817,860.05

-- Revenues in Q1, Q2, and Q3 are relatively stable, ranging
   from $205,016.20 to $208,369.75.

-- Q4 has the lowest revenue at $199,124.10, about 3-4% lower than the other quarters.


[

  {
    "quarterly_revenue": "Q1",
    "total_revenue": "205350.00"
  },
  {
    "quarterly_revenue": "Q2",
    "total_revenue": "208369.75"
  },
  {
    "quarterly_revenue": "Q3",
    "total_revenue": "205016.20"
  },
  {
    "quarterly_revenue": "Q4",
    "total_revenue": "199124.10"
  }
  
]


*/



