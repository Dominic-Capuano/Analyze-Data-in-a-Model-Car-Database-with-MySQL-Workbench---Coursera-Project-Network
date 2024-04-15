# This query list products without orders.
use mintclassics;
SELECT *
FROM products
WHERE products.productCode not in (select orderdetails.productCode from orderdetails);