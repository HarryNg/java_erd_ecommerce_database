-- CREATE TABLE
CREATE TABLE users(
id UUID NOT NULL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
address VARCHAR(255),
birth_date DATE,
email VARCHAR(50),
phone VARCHAR(50),
password VARCHAR(50)
);

CREATE TABLE orders(
id UUID NOT NULL PRIMARY KEY,
user_id UUID NOT NULL REFERENCES users(id),
date_created TIMESTAMP,
comment TEXT,
status VARCHAR(30),
address VARCHAR(255)
);

CREATE TABLE payments(
id UUID NOT NULL PRIMARY KEY,
order_id UUID NOT NULL REFERENCES orders(id),
method VARCHAR(30),
amount DECIMAL
);

CREATE TABLE products(
id UUID NOT NULL PRIMARY KEY,
name VARCHAR(100),
price DECIMAL,
description TEXT,
image VARCHAR(255),
color VARCHAR(50),
meta JSON,
rating NUMERIC(2,2)
);

CREATE TABLE carts(
id UUID NOT NULL PRIMARY KEY,
user_id UUID NOT NULL REFERENCES users(id),
product_id UUID NOT NULL REFERENCES products(id),
quantity INTEGER
);

CREATE TABLE order_details(
id UUID NOT NULL PRIMARY KEY,
order_id UUID NOT NULL REFERENCES orders(id),
product_id UUID NOT NULL REFERENCES products(id)
);

CREATE TABLE wishlists(
id UUID NOT NULL PRIMARY KEY,
user_id UUID NOT NULL REFERENCES users(id),
product_id UUID NOT NULL REFERENCES products(id),
name VARCHAR(50)
);

CREATE TABLE wishlist_products(
id UUID NOT NULL PRIMARY KEY,
wishlist_id UUID NOT NULL REFERENCES wishlists(id),
product_id UUID NOT NULL REFERENCES products(id)
);

CREATE TABLE reviews(
id UUID NOT NULL PRIMARY KEY,
product_id UUID NOT NULL REFERENCES products(id),
review TEXT,
rating NUMERIC(2,2),
image VARCHAR(255)
);

-- INSERT DATA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO users (id,first_name,last_name,address,birth_date,email,phone,password)
VALUES
(uuid_generate_v4(), 'John', 'Doe', '123 Elm St, Springfield, IL', '1990-01-01', 'john.doe@example.com', '123-456-7890', 'password123'),
(uuid_generate_v4(), 'Jane', 'Smith', '456 Oak St, Springfield, IL', '1985-02-02', 'jane.smith@example.com', '987-654-3210', 'password456');

INSERT INTO orders (id, user_id, date_created, comment, status, address)
VALUES
(uuid_generate_v4(), (SELECT id FROM users WHERE email = 'john.doe@example.com'), '2024-08-01 10:00:00', 'Please deliver in the morning.', 'Pending', '123 Elm St, Springfield, IL'),
(uuid_generate_v4(), (SELECT id FROM users WHERE email = 'jane.smith@example.com'), '2024-08-01 11:00:00', 'Leave at the back door.', 'Shipped', '456 Oak St, Springfield, IL');

INSERT INTO payments (id, order_id, method, amount)
VALUES
(uuid_generate_v4(), (SELECT id FROM orders WHERE comment = 'Please deliver in the morning.'), 'Credit Card', 19.99),
(uuid_generate_v4(), (SELECT id FROM orders WHERE comment = 'Leave at the back door.'), 'PayPal', 29.99);

-- Test Join
SELECT
    o.id AS order_id,
    o.date_created,
    o.comment,
    o.status,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    orders o
JOIN
    users u ON o.user_id = u.id;

SELECT
    o.id AS order_id,
    o.date_created,
    o.status,
    p.id AS payment_id,
    p.method AS payment_method,
    p.amount
FROM
    orders o
LEFT JOIN
    payments p ON o.id = p.order_id;
