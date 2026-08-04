
-- ============================================================
-- Bakery Management System
-- Product Management - SQL Validation Queries
-- Purpose: Backend validation for Manual QA
-- ============================================================

-- Q1 Verify product creation
SELECT product_id, product_name, sku
FROM products
WHERE sku='CK001';

-- Q2 Verify duplicate SKU
SELECT sku, COUNT(*)
FROM products
GROUP BY sku
HAVING COUNT(*) > 1;

-- Q3 Verify duplicate barcode
SELECT barcode, COUNT(*)
FROM products
GROUP BY barcode
HAVING COUNT(*) > 1;

-- Q4 Verify category mapping
SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id=c.category_id
WHERE p.sku='CK001';

-- Q5 Verify inventory record
SELECT *
FROM inventory
WHERE product_id=(
SELECT product_id FROM products WHERE sku='CK001');

-- Q6 Verify product status
SELECT product_status
FROM products
WHERE sku='CK001';

-- Q7 Verify product price
SELECT selling_price
FROM products
WHERE sku='CK001';

-- Q8 Verify tax configuration
SELECT tax_code, tax_percentage
FROM product_tax
WHERE product_id=(
SELECT product_id FROM products WHERE sku='CK001');

-- Q9 Verify discount mapping
SELECT *
FROM product_discounts
WHERE product_id=(
SELECT product_id FROM products WHERE sku='CK001');

-- Q10 Verify product image
SELECT image_name,image_path
FROM product_images
WHERE product_id=(
SELECT product_id FROM products WHERE sku='CK001');

-- Q11 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='PRODUCT'
ORDER BY created_at DESC;

-- Q12 Verify created timestamp
SELECT created_at
FROM products
WHERE sku='CK001';

-- Q13 Verify updated timestamp
SELECT updated_at
FROM products
WHERE sku='CK001';

-- Q14 Verify active products
SELECT COUNT(*)
FROM products
WHERE product_status='Active';

-- Q15 Verify inactive products
SELECT COUNT(*)
FROM products
WHERE product_status='Inactive';

-- Q16 Verify product search
SELECT *
FROM products
WHERE product_name LIKE '%Cake%';

-- Q17 Verify inventory quantity
SELECT available_quantity
FROM inventory
WHERE product_id=(
SELECT product_id FROM products WHERE sku='CK001');

-- Q18 Verify deleted products
SELECT *
FROM products
WHERE is_deleted=1;

-- Q19 Verify product history
SELECT *
FROM product_history
WHERE product_id=(
SELECT product_id FROM products WHERE sku='CK001');

-- Q20 Verify category count
SELECT category_id, COUNT(*)
FROM products
GROUP BY category_id;

-- Note:
-- Table names are generic and intended for portfolio purposes only.
