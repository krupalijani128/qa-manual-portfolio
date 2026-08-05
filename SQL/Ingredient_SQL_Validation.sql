
-- ============================================================
-- Bakery Management System
-- Ingredient Management - SQL Validation Queries
-- Purpose: Backend validation for Manual QA
-- ============================================================

-- Q1 Verify ingredient creation
SELECT ingredient_id, ingredient_name, ingredient_code
FROM ingredients
WHERE ingredient_code='ING001';

-- Q2 Verify duplicate ingredient code
SELECT ingredient_code, COUNT(*)
FROM ingredients
GROUP BY ingredient_code
HAVING COUNT(*) > 1;

-- Q3 Verify ingredient category
SELECT i.ingredient_name, c.category_name
FROM ingredients i
JOIN ingredient_categories c
ON i.category_id=c.category_id
WHERE i.ingredient_code='ING001';

-- Q4 Verify unit of measure
SELECT unit_of_measure
FROM ingredients
WHERE ingredient_code='ING001';

-- Q5 Verify opening stock
SELECT available_quantity
FROM ingredient_inventory
WHERE ingredient_id=1001;

-- Q6 Verify stock movement
SELECT *
FROM stock_transactions
WHERE ingredient_id=1001;

-- Q7 Verify batch details
SELECT batch_number, manufacture_date, expiry_date
FROM ingredient_batches
WHERE ingredient_id=1001;

-- Q8 Verify expiry records
SELECT *
FROM ingredient_batches
WHERE expiry_date < CURRENT_DATE;

-- Q9 Verify supplier mapping
SELECT supplier_id
FROM ingredient_supplier
WHERE ingredient_id=1001;

-- Q10 Verify warehouse mapping
SELECT warehouse_id
FROM ingredient_inventory
WHERE ingredient_id=1001;

-- Q11 Verify reorder level
SELECT reorder_level
FROM ingredient_inventory
WHERE ingredient_id=1001;

-- Q12 Verify low stock ingredients
SELECT *
FROM ingredient_inventory
WHERE available_quantity <= reorder_level;

-- Q13 Verify wastage records
SELECT *
FROM ingredient_wastage
WHERE ingredient_id=1001;

-- Q14 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='INGREDIENT'
AND entity_id=1001;

-- Q15 Verify created timestamp
SELECT created_at
FROM ingredients
WHERE ingredient_id=1001;

-- Q16 Verify updated timestamp
SELECT updated_at
FROM ingredients
WHERE ingredient_id=1001;

-- Q17 Verify archived ingredients
SELECT *
FROM ingredients
WHERE is_archived=1;

-- Q18 Verify active ingredients
SELECT COUNT(*)
FROM ingredients
WHERE ingredient_status='Active';

-- Q19 Verify ingredient search
SELECT *
FROM ingredients
WHERE ingredient_name LIKE '%Flour%';

-- Q20 Verify inventory by warehouse
SELECT warehouse_id, COUNT(*)
FROM ingredient_inventory
GROUP BY warehouse_id;

-- Note:
-- Table and column names are generic for portfolio purposes.
