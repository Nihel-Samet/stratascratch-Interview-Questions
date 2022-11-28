-- Highest Cost Orders From Amazon
-- What I got the hang of: join
/*
Question: 
	Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
	If customer had more than one order on a certain day, sum the order costs on daily basis. 
	Output customer's first name, total cost of their items, and the date.
	For simplicity, you can assume that every first name in the dataset is unique.

Tables: customers, orders

1st table: customers

id: int
first_name: varchar
last_name: varchar
city: varchar
address: varchar
phone_number: varchar

2nd table: orders

id: int
cust_id: int
order_date: datetime
order_details: varchar
total_order_cost: int
*/

-- Solution
WITH daily_sum AS(
SELECT 
	cust_id, 
	order_date, 
	SUM (total_order_cost) 
FROM orders
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY 1, 2
ORDER BY sum DESC
LIMIT 1)


SELECT 
    c.first_name,
    o.sum, 
    o.order_date
FROM daily_sum AS o
JOIN customers AS c
ON o.cust_id = c.id;