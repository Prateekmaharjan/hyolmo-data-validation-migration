
-- Improved Schema for Hyolmo Database

-- 1. Fix incorrect data type for event date
-- Original: VARCHAR
-- Improved: TIMESTAMP

ALTER TABLE accounts_upcomingevent
ALTER COLUMN date TYPE TIMESTAMP
USING date::timestamp;


-- 2. Normalize membership type into its own table

CREATE TABLE membership_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);


-- 3. Add membership reference to user table

ALTER TABLE accounts_customuser
ADD COLUMN membership_type_id INT;


-- 4. Event registration table (many-to-many: users ↔ events)

CREATE TABLE event_registration (
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    event_id BIGINT NOT NULL,
    registered_at TIMESTAMP DEFAULT now(),
    UNIQUE (user_id, event_id)
);