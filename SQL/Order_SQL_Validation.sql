-- Bakery Management System
-- Order Management SQL Validation Queries

-- Q1 Verify order created
SELECT order_id, customer_id, order_status
FROM orders
WHERE order_id=1001;

-- Q2 Verify order items
SELECT order_id, product_id, quantity
FROM order_items
WHERE order_id=1001;

-- Q3 Verify order total
SELECT order_total, tax_amount, discount_amount
FROM orders
WHERE order_id=1001;

-- Q4 Verify inventory deduction
SELECT product_id, available_quantity
FROM inventory
WHERE product_id=101;

-- Q5 Verify stock transaction
SELECT *
FROM inventory_transactions
WHERE reference_order_id=1001;

-- Q6 Verify coupon
SELECT coupon_code, discount_amount
FROM orders
WHERE order_id=1001;

-- Q7 Verify invoice
SELECT invoice_id, invoice_status
FROM invoices
WHERE order_id=1001;

-- Q8 Verify payment
SELECT payment_status
FROM payments
WHERE order_id=1001;

-- Q9 Verify order status
SELECT order_status
FROM orders
WHERE order_id=1001;

-- Q10 Verify refund
SELECT refund_amount
FROM refunds
WHERE order_id=1001;

-- Q11 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='ORDER'
AND entity_id=1001;

-- Q12 Verify timestamps
SELECT created_at,updated_at
FROM orders
WHERE order_id=1001;

-- Q13 Verify duplicate order number
SELECT order_number,COUNT(*)
FROM orders
GROUP BY order_number
HAVING COUNT(*)>1;

-- Q14 Verify pending payments
SELECT *
FROM payments
WHERE payment_status='Pending';

-- Q15 Verify cancelled orders
SELECT *
FROM orders
WHERE order_status='Cancelled';

-- Q16 Verify customer order history
SELECT COUNT(*)
FROM orders
WHERE customer_id=501;

-- Q17 Verify inventory consistency
SELECT available_quantity
FROM inventory
WHERE product_id=101;

-- Q18 Verify invoice total
SELECT invoice_total
FROM invoices
WHERE order_id=1001;

-- Q19 Verify today's orders
SELECT COUNT(*)
FROM orders
WHERE DATE(created_at)=CURRENT_DATE;

-- Q20 Verify payment method
SELECT payment_method
FROM payments
WHERE order_id=1001;
