# This query list customers by country
# Grouped by Country Number of Customers Decending and Alpha by Customer within ties 
use mintclassics;
SELECT Country, COUNT(customerNumber) AS "Number of Customers"
FROM customers
GROUP BY Country
ORDER BY COUNT(CustomerNumber) DESC, Country ASC;