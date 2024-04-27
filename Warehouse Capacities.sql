# This query lists warehouse and capacity based on quantityInStock
# as percent capacity as inventory space. Ordered by Excess Capacity
use mintclassics;
SELECT warehouses.warehouseCode AS "WAREHOUSE CODE",
 warehouses.warehouseName AS "WAREHOUSE NAME", warehouses.warehousePctCap AS "% OF Capacity",
Format(sum(products.quantityInStock),"##") AS "UNITS IN INVENTORY",
 Format(sum(products.quantityInStock/(warehouses.warehousePctCap/100)-products.quantityInStock),"##") AS "EXCESS CAPACITY",
 Format((sum(products.quantityInStock)/(warehouses.warehousePctCap/100)),"##") AS "MAXIMUM CAPACITY"
  FROM warehouses, products where warehouses.warehouseCode = products.warehouseCode
GROUP BY warehouses.warehouseCode
order by sum(products.quantityInStock/(warehouses.warehousePctCap/100)-products.quantityInStock) desc /* EXCESS */