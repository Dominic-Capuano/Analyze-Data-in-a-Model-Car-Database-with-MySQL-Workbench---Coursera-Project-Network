# This query lists customers without orders.
use mintclassics;
SELECT customers.salesRepEmployeeNumber as "EMPLOYEE NUMBER",
       employees.lastName as "EMPLOYEE LAST",
       employees.firstName as "EMPLOYEE FIRST",       
       customers.customerNumber as "CUSTOMER NUMBER",
       customers.customerName as "CUSTOMER NAME",
       customers.country as "COUNTRY",
       customers.contactFirstName as "CONTACT FIRST",
       customers.contactLastName as "CONTACT LAST",
       customers.phone as "CUSTOMER PHONE"
FROM customers
left outer JOIN employees
  ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE customers.customerNumber not in (select orders.customerNumber from orders)
order by customers.country,customers.customerName;