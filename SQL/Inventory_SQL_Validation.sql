
-- ============================================================
-- Bakery Management System
-- Inventory Management - SQL Validation Queries
-- Purpose: Backend validation for Manual QA
-- ============================================================

-- Q1 Verify inventory item creation
SELECT item_id, item_code, item_name
FROM inventory_items
WHERE item_code='ITM001';

-- Q2 Verify duplicate item codes
SELECT item_code, COUNT(*)
FROM inventory_items
GROUP BY item_code
HAVING COUNT(*) > 1;

-- Q3 Verify opening stock
SELECT available_quantity
FROM inventory_stock
WHERE item_id=1001;

-- Q4 Verify stock-in transaction
SELECT *
FROM stock_transactions
WHERE transaction_type='STOCK_IN'
AND item_id=1001;

-- Q5 Verify stock-out transaction
SELECT *
FROM stock_transactions
WHERE transaction_type='STOCK_OUT'
AND item_id=1001;

-- Q6 Verify stock adjustment
SELECT *
FROM stock_adjustments
WHERE item_id=1001;

-- Q7 Verify warehouse transfer
SELECT *
FROM warehouse_transfers
WHERE item_id=1001;

-- Q8 Verify warehouse mapping
SELECT warehouse_id
FROM inventory_stock
WHERE item_id=1001;

-- Q9 Verify batch records
SELECT batch_number, expiry_date
FROM inventory_batches
WHERE item_id=1001;

-- Q10 Verify low stock items
SELECT *
FROM inventory_stock
WHERE available_quantity <= reorder_level;

-- Q11 Verify reorder level
SELECT reorder_level
FROM inventory_stock
WHERE item_id=1001;

-- Q12 Verify inventory valuation
SELECT item_id, valuation_amount
FROM inventory_valuation
WHERE item_id=1001;

-- Q13 Verify FIFO sequence
SELECT *
FROM inventory_batches
WHERE item_id=1001
ORDER BY received_date;

-- Q14 Verify LIFO sequence
SELECT *
FROM inventory_batches
WHERE item_id=1001
ORDER BY received_date DESC;

-- Q15 Verify movement history
SELECT *
FROM stock_transactions
WHERE item_id=1001
ORDER BY transaction_date DESC;

-- Q16 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='INVENTORY';

-- Q17 Verify created timestamp
SELECT created_at
FROM inventory_items
WHERE item_id=1001;

-- Q18 Verify updated timestamp
SELECT updated_at
FROM inventory_items
WHERE item_id=1001;

-- Q19 Verify archived items
SELECT *
FROM inventory_items
WHERE is_archived=1;

-- Q20 Verify inventory count by warehouse
SELECT warehouse_id, COUNT(*)
FROM inventory_stock
GROUP BY warehouse_id;
