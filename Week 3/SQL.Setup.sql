CREATE DATABASE company;
USE company;

SELECT * FROM branches;
SELECT region,COUNT(branch_id) AS Number_Of_Branches FROM branches GROUP BY region;
SELECT branch_name,avg_monthly_revenue FROM branches ORDER BY avg_monthly_revenue DESC LIMIT 1;
SELECT branch_name, `Monthly Profit`FROM branches ORDER BY `Monthly Profit` DESC LIMIT 1;
SELECT branch_name, warehouse_capacity FROM branches ORDER BY warehouse_capacity DESC LIMIT 1;
SELECT region,market_demand_index FROM branches ORDER BY market_demand_index DESC LIMIT 1;

SELECT * FROM customers;
SELECT customer_type,COUNT(customer_id) FROM customers GROUP BY customer_type;
SELECT state,COUNT(customer_id) FROM customers GROUP BY state ORDER BY COUNT(customer_id) DESC LIMIT 1;
SELECT industry_segment,COUNT(customer_id) FROM customers GROUP BY industry_segment ORDER BY COUNT(customer_id) DESC LIMIT 1;
SELECT customer_id,total_purchase_value FROM customers ORDER BY total_purchase_value DESC LIMIT 10;
SELECT customer_id,credit_limit FROM customers ORDER BY credit_limit DESC LIMIT 10;
SELECT customer_id,customer_rating FROM customers ORDER BY customer_rating DESC LIMIT 10;

SELECT * FROM products;
SELECT category,COUNT(product_id) FROM products GROUP BY category;
SELECT brand,COUNT(product_name) FROM products GROUP BY brand ORDER BY COUNT(product_name) DESC LIMIT 1;
SELECT product_name,last_purchase_price FROM products ORDER BY last_purchase_price DESC LIMIT 10;
SELECT product_name,margin_percentage FROM products ORDER BY margin_percentage DESC LIMIT 10;
SELECT product_name,reorder_level FROM products ORDER BY reorder_level DESC LIMIT 10;

SELECT * FROM suppliers;
SELECT region,COUNT(supplier_id) FROM suppliers GROUP BY region;
SELECT supplier_type,COUNT(supplier_id) FROM suppliers GROUP BY supplier_type ORDER BY COUNT(supplier_id) DESC LIMIT 1;
SELECT supplier_id,reliability_score FROM suppliers ORDER BY reliability_score DESC LIMIT 1;
SELECT supplier_id,lead_time_days FROM suppliers ORDER BY lead_time_days LIMIT 1;
SELECT product_category,COUNT(supplier_id) FROM suppliers GROUP BY product_category ORDER BY COUNT(supplier_id) DESC LIMIT 1;

SELECT * FROM inventory_master;
SELECT product_id,current_stock FROM inventory_master ORDER BY current_stock DESC LIMIT 10;
SELECT product_id,reorder_level FROM inventory_master WHERE current_stock < reorder_level;
SELECT branch_id,current_stock FROM inventory_master ORDER BY current_stock DESC LIMIT 1;
SELECT product_id,opening_stock FROM inventory_master ORDER BY opening_stock DESC LIMIT 10;
SELECT product_id,safety_stock FROM inventory_master ORDER BY safety_stock DESC LIMIT 10;
SELECT product_id,max_stock FROM inventory_master ORDER BY max_stock DESC LIMIT 10;

SELECT * FROM purchase_orders_header;
SELECT COUNT(po_id) FROM purchase_orders_header;
SELECT supplier_id,COUNT(po_id) FROM purchase_orders_header GROUP BY supplier_id ORDER BY COUNT(po_id) DESC LIMIT 1;
SELECT branch_id,COUNT(po_id) FROM purchase_orders_header GROUP BY branch_id ORDER BY COUNT(po_id) DESC LIMIT 1;
SELECT po_id,total_cost FROM purchase_orders_header ORDER BY total_cost DESC LIMIT 1;
SELECT po_id,po_status FROM purchase_orders_header WHERE po_status = "cancelled";
SELECT po_id,total_gst_amount FROM purchase_orders_header ORDER BY total_gst_amount DESC LIMIT 10;

SELECT * FROM purchase_orders_lines;
SELECT product_id,SUM(quantity) FROM purchase_orders_lines GROUP BY product_id ORDER BY SUM(quantity) DESC LIMIT 10;
SELECT product_id,SUM(line_total) FROM purchase_orders_lines GROUP BY product_id ORDER BY SUM(line_total) DESC LIMIT 10;
SELECT po_id,COUNT(product_id) FROM purchase_orders_lines GROUP BY po_id ORDER BY COUNT(product_id) DESC LIMIT 10;
SELECT product_id,SUM(gst_amount) FROM purchase_orders_lines GROUP BY product_id ORDER BY SUM(gst_amount) DESC LIMIT 10;
SELECT product_id,SUM(line_grand_total) FROM purchase_orders_lines GROUP BY product_id ORDER BY SUM(line_grand_total) DESC LIMIT 10;
SELECT product_id,AVG(unit_cost) FROM purchase_orders_lines GROUP BY product_id ORDER BY AVG(unit_cost) DESC LIMIT 10;

SELECT * FROM sales_orders_header;
SELECT COUNT(so_id) FROM sales_orders_header;
SELECT branch_id,COUNT(so_id) FROM sales_orders_header GROUP BY branch_id ORDER BY COUNT(so_id) DESC LIMIT 1;
SELECT customer_id,COUNT(so_id) FROM sales_orders_header GROUP BY customer_id ORDER BY COUNT(so_id) DESC LIMIT 10;
SELECT so_id,total_order_value FROM sales_orders_header ORDER BY total_order_value DESC LIMIT 10;
SELECT COUNT(order_status) FROM sales_orders_header WHERE order_status = "cancelled";
SELECT sales_channel,SUM(grand_total) FROM sales_orders_header GROUP BY sales_channel ORDER BY SUM(grand_total) DESC;

SELECT * FROM sales_orders_lines;
SELECT product_id,SUM(quantity) FROM sales_orders_lines GROUP BY product_id ORDER BY SUM(quantity) DESC LIMIT 10;
SELECT product_id,SUM(line_total) FROM sales_orders_lines GROUP BY product_id ORDER BY SUM(line_total) DESC LIMIT 10;
SELECT so_id, COUNT(product_id) FROM sales_orders_lines GROUP BY so_id ORDER BY COUNT(product_id) DESC LIMIT 10;
SELECT product_id,SUM(gst_amount) FROM sales_orders_lines GROUP BY product_id ORDER BY SUM(gst_amount) DESC LIMIT 10;
SELECT so_id,SUM(line_grand_total) FROM sales_orders_lines GROUP BY so_id ORDER BY SUM(line_grand_total) DESC LIMIT 10;
SELECT product_id, AVG(unit_price) FROM sales_orders_lines GROUP BY product_id ORDER BY AVG(unit_price) DESC LIMIT 10;

SELECT * FROM stock_ledger;
SELECT product_id,SUM(quantity) FROM stock_ledger GROUP BY product_id ORDER BY SUM(quantity) DESC LIMIT 10;
SELECT branch_id,SUM(quantity) FROM stock_ledger GROUP BY branch_id ORDER BY SUM(quantity) DESC;
SELECT movement_type,COUNT(movement_id) FROM stock_ledger GROUP BY movement_type ORDER BY COUNT(movement_id) DESC LIMIT 10;
SELECT product_id,SUM(running_balance) FROM stock_ledger GROUP BY product_id ORDER BY SUM(running_balance) DESC LIMIT 10;
SELECT reference_type,COUNT(reference_id) FROM stock_ledger GROUP BY reference_type ORDER BY COUNT(reference_id) DESC;
SELECT product_id,quantity FROM stock_ledger ORDER BY quantity DESC LIMIT 10;

SELECT * FROM invoices;
SELECT COUNT(invoice_id) FROM invoices;
SELECT branch_id,COUNT(invoice_id) FROM invoices GROUP BY branch_id ORDER BY COUNT(invoice_id) DESC LIMIT 1;
SELECT invoice_id,grand_total FROM invoices ORDER BY grand_total DESC LIMIT 10;
SELECT payment_status,COUNT(invoice_id) FROM invoices GROUP BY payment_status ORDER BY COUNT(invoice_id) DESC;
SELECT customer_id,grand_total FROM invoices ORDER BY grand_total DESC LIMIT 10;

SELECT * FROM payments;
SELECT COUNT(payment_id) FROM payments;
SELECT payment_method,COUNT(payment_id) FROM payments GROUP BY payment_method ORDER BY COUNT(payment_id) DESC LIMIT 1;
SELECT payment_id,payment_amount FROM payments ORDER BY payment_amount DESC LIMIT 10;
SELECT payment_method,SUM(payment_amount) FROM payments GROUP BY payment_method ORDER BY SUM(payment_amount);
SELECT invoice_id,payment_amount FROM payments ORDER BY payment_amount DESC LIMIT 10;
