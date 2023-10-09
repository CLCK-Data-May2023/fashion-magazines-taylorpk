SELECT Customer, printf('$%.2f',SUM(amount_due)) AS 'Amount Due'
FROM
(SELECT customer_name AS 'Customer', (subscription_length*price_per_month) AS amount_due
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
LEFT JOIN subscriptions
ON subscriptions.subscription_id = orders.subscription_id
WHERE subscriptions.description = 'Fashion Magazine' AND order_status = 'unpaid')
GROUP BY Customer;