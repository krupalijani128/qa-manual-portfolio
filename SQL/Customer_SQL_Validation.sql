
-- ============================================================
-- Bakery Management System
-- Customer Management - SQL Validation Queries
-- Purpose: Backend validation queries for Manual QA
-- ============================================================

-- Q1 Verify customer creation
SELECT customer_id, first_name, last_name, email
FROM customers
WHERE email='john@test.com';

-- Q2 Verify duplicate email
SELECT email, COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Q3 Verify duplicate mobile
SELECT mobile_number, COUNT(*)
FROM customers
GROUP BY mobile_number
HAVING COUNT(*) > 1;

-- Q4 Verify customer status
SELECT customer_status
FROM customers
WHERE email='john@test.com';

-- Q5 Verify customer group
SELECT c.email, g.group_name
FROM customers c
JOIN customer_groups g
ON c.group_id=g.group_id
WHERE c.email='john@test.com';

-- Q6 Verify loyalty points
SELECT loyalty_points
FROM customers
WHERE email='john@test.com';

-- Q7 Verify customer order history
SELECT COUNT(*) AS total_orders
FROM orders
WHERE customer_id=(
SELECT customer_id FROM customers WHERE email='john@test.com');

-- Q8 Verify profile image
SELECT image_name, image_path
FROM customer_images
WHERE customer_id=(
SELECT customer_id FROM customers WHERE email='john@test.com');

-- Q9 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='CUSTOMER'
ORDER BY created_at DESC;

-- Q10 Verify created timestamp
SELECT created_at
FROM customers
WHERE email='john@test.com';

-- Q11 Verify updated timestamp
SELECT updated_at
FROM customers
WHERE email='john@test.com';

-- Q12 Verify archived customers
SELECT *
FROM customers
WHERE is_archived=1;

-- Q13 Verify deleted customers
SELECT *
FROM customers
WHERE is_deleted=1;

-- Q14 Verify active customers
SELECT COUNT(*)
FROM customers
WHERE customer_status='Active';

-- Q15 Verify inactive customers
SELECT COUNT(*)
FROM customers
WHERE customer_status='Inactive';

-- Q16 Verify customer search
SELECT *
FROM customers
WHERE first_name LIKE '%John%';

-- Q17 Verify customer-city mapping
SELECT city
FROM customers
WHERE email='john@test.com';

-- Q18 Verify customer notes
SELECT *
FROM customer_notes
WHERE customer_id=(
SELECT customer_id FROM customers WHERE email='john@test.com');

-- Q19 Verify GDPR delete request
SELECT gdpr_deleted
FROM customers
WHERE email='john@test.com';

-- Q20 Verify customer count by city
SELECT city, COUNT(*)
FROM customers
GROUP BY city;

-- Note:
-- Table names are generic and intended for portfolio purposes only.
