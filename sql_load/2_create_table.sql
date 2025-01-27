

-- Create data table about this data set..


-- Create pizza_types table with primary key..

CREATE TABLE public.pizza_types
(

    pizza_type_id TEXT primary key,
    name TEXT,
    category TEXT,
    ingredients TEXT

)

-- Create pizzas table with primary key..

CREATE TABLE public.pizzas
(
    pizza_id TEXT primary key,
    pizza_type_id TEXT,
    size varchar(255),
    price FLOAT,
    FOREIGN KEY(pizza_type_id) REFERENCES public.pizza_types(pizza_type_id)
)

-- Create orders table with primary key..

CREATE TABLE public.orders
(
    order_id INT primary key,
    date date,
    time time
)

-- Create order_details table with primary key..

CREATE TABLE public.order_details
(
    order_details_id INT primary key,
    order_id INT,
    pizza_id TEXT,
    quantity INT,
    FOREIGN KEY(order_id) REFERENCES public.orders(order_id),
    FOREIGN KEY(pizza_id) REFERENCES public.pizzas(pizza_id)
)


-- Set ownership of the tables to the postgres user
ALTER TABLE public.pizza_types OWNER to postgres;
ALTER TABLE public.pizzas OWNER to postgres;
ALTER TABLE public.orders OWNER to postgres;
ALTER TABLE public.order_details OWNER to postgres;