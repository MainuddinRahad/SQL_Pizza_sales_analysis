
-- Data load process..

-- Here's the following step to follow..

COPY order_details
FROM 'F:\SQL_Pizza_sales_analysis\csv_file\order_details.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY orders
FROM 'F:\SQL_Pizza_sales_analysis\csv_file\orders.csv'
WITH (FORMAT csv , HEADER TRUE , DELIMITER ',' , ENCODING 'UTF8');

COPY pizza_types
FROM 'F:\SQL_Pizza_sales_analysis\csv_file\pizza_types.csv'
WITH (FORMAT csv , HEADER TRUE , DELIMITER ',' , ENCODING 'UTF8');

COPY pizzas
FROM 'F:\SQL_Pizza_sales_analysis\csv_file\pizzas.csv'
WITH (FORMAT csv , HEADER true , DELIMITER ',' , ENCODING 'UTF8');