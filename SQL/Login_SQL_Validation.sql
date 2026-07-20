
-- ==========================================================
-- Bakery Management System
-- Login Module - SQL Validation Queries
-- Purpose: Backend validation queries used during Manual QA
-- ==========================================================

-- Q1. Verify active user exists
SELECT user_id, email, status
FROM users
WHERE email = 'user@example.com';

-- Q2. Verify last login timestamp
SELECT user_id, email, last_login
FROM users
WHERE email = 'user@example.com';

-- Q3. Verify failed login attempts
SELECT user_id, failed_login_attempts
FROM users
WHERE email = 'user@example.com';

-- Q4. Verify account lock status
SELECT user_id, is_locked, locked_at
FROM users
WHERE email = 'user@example.com';

-- Q5. Verify password reset token
SELECT user_id, reset_token, reset_token_expiry
FROM password_reset
WHERE user_id = (
    SELECT user_id FROM users
    WHERE email='user@example.com'
);

-- Q6. Verify audit log after successful login
SELECT *
FROM login_audit
WHERE email='user@example.com'
ORDER BY login_time DESC;

-- Q7. Verify audit log after failed login
SELECT *
FROM login_audit
WHERE email='user@example.com'
AND login_status='FAILED'
ORDER BY login_time DESC;

-- Q8. Verify active session
SELECT *
FROM user_sessions
WHERE user_id=(
    SELECT user_id FROM users
    WHERE email='user@example.com'
);

-- Q9. Verify session invalidated after logout
SELECT *
FROM user_sessions
WHERE user_id=(
    SELECT user_id FROM users
    WHERE email='user@example.com'
)
AND is_active=1;

-- Q10. Verify user role
SELECT u.email,r.role_name
FROM users u
JOIN roles r
ON u.role_id=r.role_id
WHERE u.email='user@example.com';

-- Q11. Verify email uniqueness
SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*)>1;

-- Q12. Verify inactive users
SELECT user_id,email
FROM users
WHERE status='Inactive';

-- Q13. Verify locked users
SELECT user_id,email
FROM users
WHERE is_locked=1;

-- Q14. Verify login count
SELECT user_id,total_login_count
FROM users
WHERE email='user@example.com';

-- Q15. Verify latest successful login
SELECT *
FROM login_audit
WHERE email='user@example.com'
AND login_status='SUCCESS'
ORDER BY login_time DESC
LIMIT 1;

-- Note:
-- Table and column names are illustrative for portfolio purposes.
