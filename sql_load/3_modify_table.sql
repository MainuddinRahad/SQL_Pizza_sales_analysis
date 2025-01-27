
-- Data load process..

-- Here's the following step to follow..

COPY order_details 
FROM 'F:/SQL_Pizza_sales_analysis/csv_file/order_details.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';

COPY orders 
FROM 'F:/SQL_Pizza_sales_analysis/csv_file/orders.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';


COPY pizza_types 
FROM 'F:/SQL_Pizza_sales_analysis/csv_file/pizza_types.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';


COPY pizzas 
FROM 'F:/SQL_Pizza_sales_analysis/csv_file/pizzas.csv'
DELIMITER ','
CSV HEADER
ENCODING 'WIN1252';