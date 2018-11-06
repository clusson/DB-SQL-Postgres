CREATE EXTENSION
IF NOT EXISTS "uuid-ossp";

CREATE TABLE roles
(
    roleId int NOT NULL,
    role varchar(25) NOT NULL,
    PRIMARY KEY (roleId)
);

CREATE TABLE users
(
    userId uuid DEFAULT uuid_generate_v4 (),
    firstname varchar(25) NOT NULL,
    lastname varchar(25) NOT NULL,
    created_at date NOT NULL DEFAULT now(),
    email varchar(50) NOT NULL,
    roleId int NOT NULL,
    PRIMARY KEY (userId),
    FOREIGN KEY (roleId) REFERENCES roles(roleId)
);

CREATE INDEX "idx_users_email"
ON users ("email");