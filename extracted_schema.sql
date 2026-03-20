-- MySQL converted schema

CREATE TABLE accounts_customuser (
    id BIGINT NOT NULL AUTO_INCREMENT,
    password VARCHAR(128) NOT NULL,
    last_login DATETIME,
    is_superuser TINYINT(1) NOT NULL,
    username VARCHAR(150) NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    is_staff TINYINT(1) NOT NULL,
    is_active TINYINT(1) NOT NULL,
    date_joined DATETIME NOT NULL,
    email VARCHAR(254) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    date_of_birth DATE,
    membership_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE accounts_customuser_groups (
    id BIGINT NOT NULL AUTO_INCREMENT,
    customuser_id BIGINT NOT NULL,
    group_id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE accounts_customuser_user_permissions (
    id BIGINT NOT NULL AUTO_INCREMENT,
    customuser_id BIGINT NOT NULL,
    permission_id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE accounts_upcomingevent (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    date VARCHAR(100) NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE auth_group (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE auth_group_permissions (
    id BIGINT NOT NULL AUTO_INCREMENT,
    group_id INT NOT NULL,
    permission_id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE auth_permission (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    content_type_id INT NOT NULL,
    codename VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Indexes
CREATE INDEX accounts_customuser_email_idx ON accounts_customuser (email);
CREATE INDEX accounts_customuser_groups_customuser_id_idx ON accounts_customuser_groups (customuser_id);
CREATE INDEX accounts_customuser_groups_group_id_idx ON accounts_customuser_groups (group_id);
CREATE INDEX accounts_customuser_phone_number_idx ON accounts_customuser (phone_number);
CREATE INDEX accounts_customuser_user_permissions_customuser_id_idx ON accounts_customuser_user_permissions (customuser_id);
CREATE INDEX accounts_customuser_user_permissions_permission_id_idx ON accounts_customuser_user_permissions (permission_id);
CREATE INDEX accounts_customuser_username_idx ON accounts_customuser (username);
CREATE INDEX auth_group_name_idx ON auth_group (name);
CREATE INDEX auth_group_permissions_group_id_idx ON auth_group_permissions (group_id);
CREATE INDEX auth_group_permissions_permission_id_idx ON auth_group_permissions (permission_id);
CREATE INDEX auth_permission_content_type_id_idx ON auth_permission (content_type_id);

-- Foreign Keys
ALTER TABLE accounts_customuser_user_permissions
    ADD CONSTRAINT fk_acup_customuser FOREIGN KEY (customuser_id) REFERENCES accounts_customuser(id);

ALTER TABLE accounts_customuser_groups
    ADD CONSTRAINT fk_acg_customuser FOREIGN KEY (customuser_id) REFERENCES accounts_customuser(id);

ALTER TABLE accounts_customuser_user_permissions
    ADD CONSTRAINT fk_acup_permission FOREIGN KEY (permission_id) REFERENCES auth_permission(id);

ALTER TABLE accounts_customuser_groups
    ADD CONSTRAINT fk_acg_group FOREIGN KEY (group_id) REFERENCES auth_group(id);

ALTER TABLE auth_group_permissions
    ADD CONSTRAINT fk_agp_permission FOREIGN KEY (permission_id) REFERENCES auth_permission(id);

ALTER TABLE auth_group_permissions
    ADD CONSTRAINT fk_agp_group FOREIGN KEY (group_id) REFERENCES auth_group(id);