
/*

-- Retrieve the total number of orders placed.

*/

SELECT
    count(order_id) AS Total_order_placed
FROM
    orders


/*

[
  {
    "total_order_placed": "21350"
  }
]

*/