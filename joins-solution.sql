--Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip
FROM customers INNER JOIN addresses ON customers.id=addresses.customer_id;

--Get all orders and their line items.
SELECT orders.order_date, orders.total, line_items.unit_price, line_items.quantity
FROM orders INNER JOIN line_items ON orders.id=line_items.order_id;

--Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description
FROM warehouse
INNER JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
INNER JOIN products ON products.id=warehouse_product.product_id
WHERE products.id=5;

--Which warehouses have diet pepsi?
SELECT warehouse.warehouse, products.description
FROM warehouse
INNER JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
INNER JOIN products ON products.id=warehouse_product.product_id
WHERE products.id=6;

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, last_name, COUNT (orders.id)	
FROM customers
INNER JOIN addresses ON customers.id=addresses.customer_id
INNER JOIN orders ON orders.address_id=addresses.id
GROUP BY customers.first_name, last_name;

--How many customers do we have?
SELECT COUNT (*) FROM customers;

--How many products do we carry?
SELECT COUNT (*) FROM products;

--What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand)	
FROM warehouse_product
INNER JOIN products ON warehouse_product.product_id=products.id
WHERE products.id=6;