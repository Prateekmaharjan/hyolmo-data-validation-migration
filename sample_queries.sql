-- Sample analytical queries

-- 1. Upcoming events ordered by date
SELECT title, date
FROM accounts_upcomingevent
ORDER BY date ASC;

-- 2. Count total registrations per event
SELECT e.title, COUNT(r.id) AS total_registrations
FROM accounts_upcomingevent e
LEFT JOIN event_registration r ON e.id = r.event_id
GROUP BY e.title;

-- 3. List users with their membership type
SELECT u.username, m.name AS membership
FROM accounts_customuser u
JOIN membership_type m ON u.membership_type_id = m.id;

-- 4. Find users registered for more than one event
SELECT user_id, COUNT(event_id)
FROM event_registration
GROUP BY user_id
HAVING COUNT(event_id) > 1;
