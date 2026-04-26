USE ecommerce;

WITH state_metrics AS (SELECT c.customer_state, COUNT(DISTINCT o.order_id) AS total_orders,ROUND(SUM(p.payment_value), 2) AS total_revenue, ROUND(AVG(p.payment_value), 2) AS avg_order_value,ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1)                                               AS avg_delivery_days,
        ROUND(AVG(DATEDIFF(o.order_estimated_delivery_date,o.order_delivered_customer_date)), 1) AS avg_days_early_late,
        -- negative = delivered late, positive = delivered early
        ROUND(SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS late_delivery_pct
    FROM customers c JOIN orders o   ON c.customer_id = o.customer_id JOIN payments p ON o.order_id    = p.order_id WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL GROUP BY c.customer_state HAVING COUNT(DISTINCT o.order_id) >= 50 )

SELECT customer_state, total_orders, total_revenue, avg_order_value, avg_delivery_days, late_delivery_pct, RANK() OVER (ORDER BY total_revenue    DESC) AS revenue_rank, RANK() OVER (ORDER BY avg_delivery_days ASC)  AS delivery_rank,
    CASE WHEN avg_delivery_days <= 7  AND avg_order_value >= 150 THEN 'Fast + high value' WHEN avg_delivery_days <= 7  AND avg_order_value  < 150 THEN 'Fast + low value' WHEN avg_delivery_days  > 14 AND avg_order_value >= 150 THEN 'Slow + high value' WHEN avg_delivery_days  > 14 AND avg_order_value  < 150 THEN 'Slow + low value' ELSE 'Mid delivery' END AS state_profile
FROM state_metrics ORDER BY total_revenue DESC;