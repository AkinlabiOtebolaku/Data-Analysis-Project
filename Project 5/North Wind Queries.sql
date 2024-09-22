--1. Return the product name and quantity per unit
Select product_name, quantity_per_unit
From Products

--2. Return the current product id and product name 
Select product_id, product_name
From products
Where discontinued <> 1

--3. Return the products by category
Select product_name, categories.category_name
From products
Inner Join categories
On products.category_id = categories.category_id 

--4. Return the discontinued product id and product name
Select discontinued, product_id,product_name
From products
Where discontinued <> 0 

--5. Return the most and least expensive product name and unit price
Select product_name, unit_price
From products
Where unit_price In((Select Max(unit_price) From Products), 
					(Select Min(unit_price) From Products))

--6. Return the current product id's, product names and unit price that
--   cost less than $20
Select product_id, product_name,unit_price
From Products
Where discontinued <> 1 And unit_price <= 20
 
--7. Return the product name, prouct id and unit price where the
--   products cost between $15 and $25  
Select product_id, product_name,unit_price
From Products
Where unit_price Between 15 And 25 

--8. Return the product names and unit prices of above average price
Select product_name, unit_price
From products
Where unit_price > (Select Avg(unit_price) From products)

--9. Return the product names and unit prices of the 10 most
--   expensive products
Select product_name, unit_price
From Products
Order By unit_price desc
lIMIT 10

--10. Return the Counts of the current and discontinued products
Select discontinued As current_and_discontinued, Count(Discontinued) As Number_of_them
From Products
Group By discontinued

--11. Return the product name, units on order and units in stock 
--    where stock is less than quantity on order.  
SELECT product_name, units_on_order, units_in_stock
FROM Products
Inner Join order_details
On products.product_id = order_details.product_id

--12. Return the total sales for each of the employees
SELECT employees.employee_id, employees.first_name, employees.last_name, 
Sum(order_details.unit_price * order_details.Quantity) 
AS total_sales_amount
FROM employees
INNER JOIN Orders 
ON employees.employee_id = orders.employee_id
INNER JOIN order_details 
ON orders.order_id = order_details.order_id
GROUP BY employees.employee_id
 
--13. Return the order and sales price for each order 
--after discount is applied. 
Select order_details.order_id, Sum((unit_price * quantity) - discount) As sales_price
From order_details
Group By order_details.order_id

--14. Return the list of products sold and the total sales amount per 
--    product 
Select category_name, product_name, Sum(unit_price * units_on_order) As Total_sales_amount
From categories
Inner Join products
On categories.category_id = products.category_id
Where (unit_price * units_on_order) <> 0
Group By category_name, product_name
Order By category_name

--15. Return the total sales figures for each category in the year 1997
Select categories.category_name, Sum(products.unit_price * products.units_on_order) As total_sales_figures, shipped_date
From Categories
Inner Join Products 
On categories.category_id = products.category_id
Inner Join Order_details
On products.product_id = order_details.product_id
Inner Join Orders
On order_details.order_id = orders.order_id
Where (orders.shipped_date Between '1997-01-01' And '1997-12-31') And ((products.unit_price * products.units_on_order) <> 0)
Group By categories.category_name, shipped_date
Order By shipped_date