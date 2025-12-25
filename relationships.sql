-- Relationships & Constraints

-- Link users to membership types
ALTER TABLE accounts_customuser
ADD CONSTRAINT fk_membership_type
FOREIGN KEY (membership_type_id)
REFERENCES membership_type(id);


-- Link event registrations to users
ALTER TABLE event_registration
ADD CONSTRAINT fk_event_registration_user
FOREIGN KEY (user_id)
REFERENCES accounts_customuser(id)
ON DELETE CASCADE;


-- Link event registrations to events
ALTER TABLE event_registration
ADD CONSTRAINT fk_event_registration_event
FOREIGN KEY (event_id)
REFERENCES accounts_upcomingevent(id)
ON DELETE CASCADE;