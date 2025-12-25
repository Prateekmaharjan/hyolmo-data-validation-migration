-- Indexing Strategy for Performance

-- Index for faster email lookup
CREATE INDEX idx_customuser_email
ON accounts_customuser(email);

-- Index for faster username search
CREATE INDEX idx_customuser_username
ON accounts_customuser(username);

-- Index on event date for sorting and filtering
CREATE INDEX idx_upcomingevent_date
ON accounts_upcomingevent(date);

-- Indexes for event registration lookups
CREATE INDEX idx_event_registration_user
ON event_registration(user_id);

CREATE INDEX idx_event_registration_event
ON event_registration(event_id);