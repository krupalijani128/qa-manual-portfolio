
-- ============================================================
-- Bakery Management System
-- Fleet Management - SQL Validation Queries
-- Purpose: Backend validation queries for Manual QA
-- ============================================================

-- Q1 Verify vehicle creation
SELECT vehicle_id, vehicle_number, vehicle_status
FROM vehicles
WHERE vehicle_number='GJ01AB1234';

-- Q2 Verify duplicate vehicle numbers
SELECT vehicle_number, COUNT(*)
FROM vehicles
GROUP BY vehicle_number
HAVING COUNT(*) > 1;

-- Q3 Verify driver creation
SELECT driver_id, driver_name, license_number
FROM drivers
WHERE driver_id=1001;

-- Q4 Verify duplicate license numbers
SELECT license_number, COUNT(*)
FROM drivers
GROUP BY license_number
HAVING COUNT(*) > 1;

-- Q5 Verify driver assignment
SELECT vehicle_id, driver_id
FROM vehicle_driver_mapping
WHERE vehicle_id=101;

-- Q6 Verify active route mapping
SELECT route_id, vehicle_id
FROM routes
WHERE vehicle_id=101;

-- Q7 Verify delivery assignment
SELECT order_id, vehicle_id
FROM delivery_assignments
WHERE vehicle_id=101;

-- Q8 Verify delivery status
SELECT delivery_status
FROM deliveries
WHERE order_id=1001;

-- Q9 Verify GPS coordinates
SELECT latitude, longitude
FROM gps_tracking
WHERE vehicle_id=101
ORDER BY updated_at DESC;

-- Q10 Verify fuel entries
SELECT fuel_date, liters
FROM fuel_logs
WHERE vehicle_id=101;

-- Q11 Verify maintenance records
SELECT maintenance_type, service_date
FROM maintenance_logs
WHERE vehicle_id=101;

-- Q12 Verify insurance expiry
SELECT insurance_expiry_date
FROM vehicles
WHERE vehicle_id=101;

-- Q13 Verify vehicle availability
SELECT vehicle_status
FROM vehicles
WHERE vehicle_id=101;

-- Q14 Verify driver availability
SELECT availability_status
FROM drivers
WHERE driver_id=1001;

-- Q15 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='FLEET';

-- Q16 Verify created timestamp
SELECT created_at
FROM vehicles
WHERE vehicle_id=101;

-- Q17 Verify updated timestamp
SELECT updated_at
FROM vehicles
WHERE vehicle_id=101;

-- Q18 Verify archived vehicles
SELECT *
FROM vehicles
WHERE is_archived=1;

-- Q19 Verify fleet search
SELECT *
FROM vehicles
WHERE vehicle_number LIKE 'GJ01%';

-- Q20 Verify vehicle count by status
SELECT vehicle_status, COUNT(*)
FROM vehicles
GROUP BY vehicle_status;
