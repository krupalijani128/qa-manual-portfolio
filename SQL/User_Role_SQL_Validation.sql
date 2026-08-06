
-- ============================================================
-- Bakery Management System
-- User & Role Management - SQL Validation Queries
-- Purpose: Backend validation queries for Manual QA
-- ============================================================

-- Q1 Verify user creation
SELECT user_id, username, email
FROM users
WHERE username='qauser';

-- Q2 Verify duplicate usernames
SELECT username, COUNT(*)
FROM users
GROUP BY username
HAVING COUNT(*) > 1;

-- Q3 Verify duplicate emails
SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- Q4 Verify password encryption
SELECT password_hash
FROM users
WHERE username='qauser';

-- Q5 Verify account status
SELECT account_status
FROM users
WHERE username='qauser';

-- Q6 Verify role assignment
SELECT user_id, role_id
FROM user_roles
WHERE user_id=1001;

-- Q7 Verify permission mapping
SELECT role_id, permission_id
FROM role_permissions
WHERE role_id=101;

-- Q8 Verify active roles
SELECT *
FROM roles
WHERE status='Active';

-- Q9 Verify MFA status
SELECT mfa_enabled
FROM users
WHERE username='qauser';

-- Q10 Verify password reset request
SELECT *
FROM password_reset_requests
WHERE user_id=1001;

-- Q11 Verify login history
SELECT login_time, ip_address
FROM login_history
WHERE user_id=1001
ORDER BY login_time DESC;

-- Q12 Verify failed login attempts
SELECT failed_attempts
FROM users
WHERE username='qauser';

-- Q13 Verify account lock
SELECT is_locked
FROM users
WHERE username='qauser';

-- Q14 Verify audit log
SELECT *
FROM audit_log
WHERE entity_type='USER';

-- Q15 Verify created timestamp
SELECT created_at
FROM users
WHERE user_id=1001;

-- Q16 Verify updated timestamp
SELECT updated_at
FROM users
WHERE user_id=1001;

-- Q17 Verify inactive users
SELECT *
FROM users
WHERE account_status='Inactive';

-- Q18 Verify user search
SELECT *
FROM users
WHERE username LIKE '%qa%';

-- Q19 Verify role count
SELECT role_name, COUNT(*)
FROM user_roles ur
JOIN roles r ON ur.role_id=r.role_id
GROUP BY role_name;

-- Q20 Verify permission count by role
SELECT role_id, COUNT(permission_id)
FROM role_permissions
GROUP BY role_id;
