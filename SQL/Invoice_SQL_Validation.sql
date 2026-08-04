
-- ============================================================
-- Bakery Management System
-- Invoice Management - SQL Validation Queries
-- Purpose: Backend validation queries for Manual QA
-- ============================================================

-- Q1 Verify invoice creation
SELECT invoice_id, invoice_number, order_id
FROM invoices
WHERE invoice_number='INV-1001';

-- Q2 Verify unique invoice number
SELECT invoice_number, COUNT(*)
FROM invoices
GROUP BY invoice_number
HAVING COUNT(*) > 1;

-- Q3 Verify invoice line items
SELECT product_id, quantity, unit_price
FROM invoice_items
WHERE invoice_id=1001;

-- Q4 Verify GST amount
SELECT gst_amount
FROM invoices
WHERE invoice_id=1001;

-- Q5 Verify CGST/SGST values
SELECT cgst_amount, sgst_amount
FROM invoices
WHERE invoice_id=1001;

-- Q6 Verify discount amount
SELECT discount_amount
FROM invoices
WHERE invoice_id=1001;

-- Q7 Verify grand total
SELECT grand_total
FROM invoices
WHERE invoice_id=1001;

-- Q8 Verify payment status
SELECT payment_status
FROM invoices
WHERE invoice_id=1001;

-- Q9 Verify payment record
SELECT payment_method, paid_amount
FROM payments
WHERE invoice_id=1001;

-- Q10 Verify credit note
SELECT *
FROM credit_notes
WHERE invoice_id=1001;

-- Q11 Verify refund record
SELECT *
FROM refunds
WHERE invoice_id=1001;

-- Q12 Verify invoice audit log
SELECT *
FROM audit_log
WHERE entity_type='INVOICE'
AND entity_id=1001;

-- Q13 Verify customer mapping
SELECT customer_id
FROM invoices
WHERE invoice_id=1001;

-- Q14 Verify order mapping
SELECT order_id
FROM invoices
WHERE invoice_id=1001;

-- Q15 Verify created timestamp
SELECT created_at
FROM invoices
WHERE invoice_id=1001;

-- Q16 Verify updated timestamp
SELECT updated_at
FROM invoices
WHERE invoice_id=1001;

-- Q17 Verify cancelled invoices
SELECT *
FROM invoices
WHERE invoice_status='Cancelled';

-- Q18 Verify invoice search
SELECT *
FROM invoices
WHERE invoice_number LIKE 'INV%';

-- Q19 Verify today's invoice count
SELECT COUNT(*)
FROM invoices
WHERE DATE(created_at)=CURRENT_DATE;

-- Q20 Verify PDF generation flag
SELECT pdf_generated
FROM invoices
WHERE invoice_id=1001;

-- Note:
-- Table names and columns are generic for portfolio purposes only.
