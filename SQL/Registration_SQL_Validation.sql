
-- ============================================================
-- Bakery Management System
-- Registration Module - SQL Validation Queries
-- Purpose: Backend validation queries for Manual QA
-- ============================================================

-- Q1. Verify newly registered user
SELECT user_id, first_name, last_name, email, status
FROM users
WHERE email='john@example.com';

-- Q2. Verify duplicate email
SELECT email, COUNT(*)
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- Q3. Verify duplicate mobile number
SELECT mobile_number, COUNT(*)
FROM users
GROUP BY mobile_number
HAVING COUNT(*) > 1;

-- Q4. Verify user status after registration
SELECT email, status
FROM users
WHERE email='john@example.com';

-- Q5. Verify email verification flag
SELECT email, email_verified
FROM users
WHERE email='john@example.com';

-- Q6. Verify created timestamp
SELECT email, created_at
FROM users
WHERE email='john@example.com';

-- Q7. Verify updated timestamp
SELECT email, updated_at
FROM users
WHERE email='john@example.com';

-- Q8. Verify password is stored securely
SELECT email, password_hash
FROM users
WHERE email='john@example.com';

-- Q9. Verify password is not stored in plain text
SELECT email
FROM users
WHERE password_hash='Password@123';

-- Q10. Verify OTP generated
SELECT user_id, otp_code, expires_at
FROM otp_verification
WHERE user_id=(
  SELECT user_id FROM users
  WHERE email='john@example.com'
);

-- Q11. Verify OTP expiry
SELECT otp_code, expires_at
FROM otp_verification
WHERE user_id=(
  SELECT user_id FROM users
  WHERE email='john@example.com'
);

-- Q12. Verify latest OTP only
SELECT *
FROM otp_verification
WHERE user_id=(
  SELECT user_id FROM users
  WHERE email='john@example.com'
)
ORDER BY created_at DESC
LIMIT 1;

-- Q13. Verify registration audit log
SELECT *
FROM audit_log
WHERE action='USER_REGISTRATION'
ORDER BY created_at DESC;

-- Q14. Verify default user role
SELECT u.email, r.role_name
FROM users u
JOIN roles r
ON u.role_id=r.role_id
WHERE u.email='john@example.com';

-- Q15. Verify inactive users awaiting verification
SELECT email
FROM users
WHERE status='Pending Verification';

-- Q16. Verify email verification date
SELECT email, email_verified_at
FROM users
WHERE email='john@example.com';

-- Q17. Verify no duplicate user ID
SELECT user_id, COUNT(*)
FROM users
GROUP BY user_id
HAVING COUNT(*)>1;

-- Q18. Verify registration session (if applicable)
SELECT *
FROM user_sessions
WHERE user_id=(
  SELECT user_id FROM users
  WHERE email='john@example.com'
);

-- Q19. Verify failed registration logs
SELECT *
FROM audit_log
WHERE action='REGISTRATION_FAILED'
ORDER BY created_at DESC;

-- Q20. Verify total registered users
SELECT COUNT(*) AS total_registered_users
FROM users;

-- Note:
-- Table and column names are generic for portfolio purposes.
