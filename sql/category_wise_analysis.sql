use ecommerce;

-- category wise revenue 
select p.product_catyegory_name, sum(oi.price) as total_revenue from order_items oi join products p on oi.product_id = p.product_id group by p.product_catyegory_name order by total_revenue desc limit 10;
