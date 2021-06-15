-- 1. Get all customers and their addresses
SELECT "customers".first_name, "customers".last_name, "addresses" FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- 2. Get all orders and their line items (orders, quantity and product)
SELECT "orders".id, "orders".order_date, "line_items".quantity, "products".description FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id
;

-- 3. Which warehouses have cheetos?
SELECT "products".description, "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description = 'cheetos'
;

-- 4. Which warehouses have diet pepsi?
SELECT "products".description, "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".description = 'diet pepsi'
;

-- 5. Get the number of orders for each customer
SELECT "customers".first_name, "customers".last_name, COUNT("orders") FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".first_name, "customers".last_name
;

-- 6. How many customers do we have?
SELECT COUNT("customers") AS "number_of_customers" FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT("products") AS "number_of_products" FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT "products".description, SUM("warehouse_product".on_hand) AS "total_on_hand" FROM "products"
JOIN "warehouse_product" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description
;

