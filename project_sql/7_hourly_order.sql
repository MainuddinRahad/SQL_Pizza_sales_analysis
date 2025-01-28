

/*

-- Determine the distribution of orders by hour of the day.
-- Which time are the most ordered time in a day.

*/


SELECT
    CASE
        WHEN EXTRACT(HOUR FROM time) BETWEEN 9 AND 12 THEN 'Morning (09:00 – 12:59)'
        WHEN EXTRACT(HOUR FROM time) BETWEEN 13 AND 16 THEN 'Afternoon (13:00 – 16:59)'
        WHEN EXTRACT(HOUR FROM time) BETWEEN 17 AND 20 THEN 'Evening (17:00 – 20:59)'
        WHEN EXTRACT(HOUR FROM time) BETWEEN 21 AND 23 THEN 'Late Evening (21:00 – 23:00)'
    END AS order_time,
    count(order_details.order_id) AS total_order
    
FROM
    order_details
    LEFT JOIN orders
    ON order_details.order_id = orders.order_id
GROUP BY order_time
ORDER BY total_order DESC;


/*

-- The evening section accounts for the highest orders(18339) of total orders,
   indicating peak demand during dinner hours.

-- Afternoon orders contribute (17079) orders  of the total orders, suggesting a strong
   lunch crowd or mid-afternoon snack demand.

-- The demand is concentrated during afternoon and evening hours, with 74.4% of total
   orders occurring between 13:00 and 20:59.


[
  {
    "order_time": "Evening (17:00 – 20:59)",
    "total_order": "18339"
  },
  {
    "order_time": "Afternoon (13:00 – 16:59)",
    "total_order": "17079"
  },
  {
    "order_time": "Morning (09:00 – 12:59)",
    "total_order": "9236"
  },
  {
    "order_time": "Late Evening (21:00 – 23:00)",
    "total_order": "3966"
  }
]


*/