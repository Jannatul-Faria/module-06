--task 01--
--Write a SQL query to retrieve all the customer information along with the total number of orders placed by each customer. Display 
--the result in descending order of the number of orders.--
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS 'Total Orders'
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY 'Total Orders' DESC;


--task 02--
--Write a SQL query to retrieve the product name, quantity, and total amount for each order item. Display the result in ascending 
--order of the order ID.--
SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price, oi.quantity * oi.unit_price AS 'Total Amount'
FROM order_items AS oi
LEFT JOIN products AS p 
ON oi.product_id = p.product_id
ORDER BY oi.order_id ASC;





--TASK 03--
--Write a SQL query to retrieve the total revenue generated by each product category. Display the category name along with the total 
--revenue in descending order of the revenue.--
SELECT pc.category_name, SUM(oi.quantity * oi.unit_price) AS 'Total Revenue'
FROM products AS p
LEFT JOIN order_items AS oi
ON p.product_id = oi.product_id
LEFT JOIN categories AS pc
ON p.category_id = pc.category_id
GROUP BY pc.category_name
ORDER BY 'Total Revenue' DESC;



--TASK 04--
--Write a SQL query to retrieve the top 5 customers who have made the highest total purchase amount. Display the customer name along 
--with the total purchase amount in descending order of the purchase amount.--
SELECT c.customer_name, SUM(oi.quantity * oi.unit_price) AS 'Total Purchase Amount'
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
LEFT JOIN order_items AS oi
ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY 'Total Purchase Amount' DESC
LIMIT 5;

