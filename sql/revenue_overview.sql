USE ecommerce;
SELECT COUNT(DISTINCT o.order_id) as total_orders, COUNT(distinct o.customer_id) AS total_customer, sum(p.payment_value) AS total_revenue, avg(p.payment_value) as average_order_value from orders o join payments p ON o.order_id = p.order_id;

-- verifying retention problem 
SELECT order_count, count(*) as num_of_customers from( select customer_id, count(order_id) as order_count from orders group by customer_id) t group by order_count order by order_count;

-- customer generating revenue
select c.customer_id, sum(p.payment_value) as total_spend from customers c join orders o ON c.customer_id = o.customer_id join payments p on o.order_id = p.order_id group by c.customer_id order by total_spend desc limit 15;

-- revenue from top customers
select sum(total_spend) as top_10_customers from ( select c.customer_id, sum(p.payment_value) as total_spend from customers c join orders o on c.customer_id = o.customer_id join payments p on o.order_id = p.order_id group by customer_id order by total_spend desc limit 10) t;
select sum(payment_value ) as total_revenue from payments;
