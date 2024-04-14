# This query lists warehouse and capacity based on quantityInStock
# as percent capacity as inventory space.
use mintclassics;
SELECT warehouses.warehouseCode AS "CODE", warehouses.warehouseName AS "NAME", warehouses.warehousePctCap AS "% Capacity",
sum(products.quantityInStock) AS "UNITS",
 Format(sum(products.quantityInStock/(warehouses.warehousePctCap/100)-products.quantityInStock),"##") AS "EXCESS",
 Format((sum(products.quantityInStock)/(warehouses.warehousePctCap/100)),"##") AS "MAX CAP"
  FROM warehouses, products where warehouses.warehouseCode = products.warehouseCode
GROUP BY warehouses.warehouseCode
order by sum(products.quantityInStock/(warehouses.warehousePctCap/100)-products.quantityInStock) desc /* EXCESS */