# Orders by Country
# This query lists total orders by country. 
# quantityOrdered and the dollar amount are totaled 
# ordered by total dollar amount of the country
 use mintclassics;
SELECT customers.country,
 COUNT(orderdetails.orderNumber) as "Total Number of Orders",
sum(orderdetails.priceEach*orderdetails.quantityOrdered) as " Total Amount of Orders"
FROM customers 
  INNER JOIN orders
  ON customers.customerNumber = orders.customerNumber
  INNER JOIN orderdetails
  ON orders.orderNumber = orderdetails.orderNumber
  group by customers.country
  order by sum(orderdetails.priceEach*orderdetails.quantityOrdered) desc
  
  