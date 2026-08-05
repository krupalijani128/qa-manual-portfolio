
-- ============================================================
-- Bakery Management System
-- Reports Module - SQL Validation Queries
-- Purpose: Backend validation for Manual QA
-- ============================================================

-- Q1 Verify Sales Report data
SELECT COUNT(*) AS total_orders
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-01-31';

-- Q2 Verify Revenue Report
SELECT SUM(grand_total) AS total_revenue
FROM invoices
WHERE invoice_status='Paid';

-- Q3 Verify Customer Report
SELECT COUNT(*) AS total_customers
FROM customers
WHERE customer_status='Active';

-- Q4 Verify Product Report
SELECT product_name, SUM(quantity)
FROM order_items
GROUP BY product_name;

-- Q5 Verify Inventory Report
SELECT ingredient_name, available_quantity
FROM ingredient_inventory;

-- Q6 Verify Vendor Report
SELECT COUNT(*) FROM vendors
WHERE vendor_status='Active';

-- Q7 Verify Delivery Report
SELECT COUNT(*) FROM deliveries
WHERE delivery_status='Delivered';

-- Q8 Verify Tax Total
SELECT SUM(gst_amount)
FROM invoices;

-- Q9 Verify Discount Total
SELECT SUM(discount_amount)
FROM invoices;

-- Q10 Verify Date Filter
SELECT *
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-01-31';

-- Q11 Verify Branch Filter
SELECT *
FROM orders
WHERE branch_id=1;

-- Q12 Verify Customer Filter
SELECT *
FROM orders
WHERE customer_id=1001;

-- Q13 Verify Product Filter
SELECT *
FROM order_items
WHERE product_id=101;

-- Q14 Verify Report Export Log
SELECT *
FROM report_exports
ORDER BY exported_at DESC;

-- Q15 Verify Audit Log
SELECT *
FROM audit_log
WHERE entity_type='REPORT';

-- Q16 Verify Report Cache
SELECT *
FROM report_cache;

-- Q17 Verify Created Timestamp
SELECT created_at
FROM reports
WHERE report_id=1;

-- Q18 Verify Updated Timestamp
SELECT updated_at
FROM reports
WHERE report_id=1;

-- Q19 Verify Report Schedule
SELECT *
FROM report_schedule
WHERE is_active=1;

-- Q20 Verify Report Count by Type
SELECT report_type, COUNT(*)
FROM reports
GROUP BY report_type;
