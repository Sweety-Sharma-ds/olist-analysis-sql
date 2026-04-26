use ecommerce;

-- delivery impactt analysis
select avg( datediff(order_delivered_customer_date,order_purchase_timestamp )) avg_deliveery_days, max(datediff(order_delivered_customer_date,order_purchase_timestamp )) as worst_delivery_days from orders;