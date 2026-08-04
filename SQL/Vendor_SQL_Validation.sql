
-- Bakery Management System
-- Vendor Management SQL Validation Queries

-- Q1 Verify vendor creation
SELECT vendor_id, vendor_name, gst_number
FROM vendors
WHERE gst_number='24ABCDE1234F1Z5';

-- Q2 Verify duplicate GST
SELECT gst_number, COUNT(*)
FROM vendors
GROUP BY gst_number
HAVING COUNT(*)>1;

-- Q3 Verify duplicate email
SELECT email, COUNT(*)
FROM vendors
GROUP BY email
HAVING COUNT(*)>1;

-- Q4 Verify PAN
SELECT pan_number
FROM vendors
WHERE vendor_id=1001;

-- Q5 Verify IFSC
SELECT ifsc_code
FROM vendor_bank_details
WHERE vendor_id=1001;

-- Q6 Verify bank details
SELECT bank_name, account_number
FROM vendor_bank_details
WHERE vendor_id=1001;

-- Q7 Verify vendor status
SELECT vendor_status
FROM vendors
WHERE vendor_id=1001;

-- Q8 Verify purchase order mapping
SELECT purchase_order_id
FROM purchase_orders
WHERE vendor_id=1001;

-- Q9 Verify outstanding balance
SELECT outstanding_amount
FROM vendor_payments
WHERE vendor_id=1001;

-- Q10 Verify payment history
SELECT payment_date, paid_amount
FROM vendor_payments
WHERE vendor_id=1001;

-- Q11 Verify documents
SELECT document_name
FROM vendor_documents
WHERE vendor_id=1001;

-- Q12 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='VENDOR'
AND entity_id=1001;

-- Q13 Verify created timestamp
SELECT created_at FROM vendors WHERE vendor_id=1001;

-- Q14 Verify updated timestamp
SELECT updated_at FROM vendors WHERE vendor_id=1001;

-- Q15 Verify active vendors
SELECT COUNT(*) FROM vendors WHERE vendor_status='Active';

-- Q16 Verify inactive vendors
SELECT COUNT(*) FROM vendors WHERE vendor_status='Inactive';

-- Q17 Verify archived vendors
SELECT * FROM vendors WHERE is_archived=1;

-- Q18 Verify search
SELECT * FROM vendors WHERE vendor_name LIKE '%Foods%';

-- Q19 Verify vendor count by city
SELECT city, COUNT(*) FROM vendors GROUP BY city;

-- Q20 Verify duplicate account numbers
SELECT account_number, COUNT(*)
FROM vendor_bank_details
GROUP BY account_number
HAVING COUNT(*)>1;
