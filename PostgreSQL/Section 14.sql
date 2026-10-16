ALTER TABLE products
ADD CONSTRAINT positive_price
CHECK (price >= 0);


INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Clothes', 20, 1);

INSERT INTO products (name, department, weight)
VALUES ('Pants', 'Clothes', 3);

SELECT *
FROM products
WHERE price IS NULL;


ALTER TABLE products
ALTER COLUMN price SET NOT NULL;


SELECT *
FROM products
WHERE price IS NULL;


UPDATE products
SET price = 9999
WHERE price IS NULL;


ALTER TABLE products
ALTER COLUMN price SET NOT NULL;


INSERT INTO products (name, department, weight)
VALUES ('Shoes', 'Clothes', 5);


ALTER TABLE products
ALTER COLUMN price SET DEFAULT 999;

INSERT INTO products (name, department, weight)
VALUES ('Gloves', 'Tools', 1);


UPDATE products
SET name = 'Red Shirt'
WHERE id = 3;

ALTER TABLE products
ADD UNIQUE (name);

select * from products;

ALTER TABLE products
ADD UNIQUE (name, department);

INSERT INTO products (name, department, price, weight)
VALUES ('Shirt', 'Housewares', 24, 1);

select * from public.products order by id asc;

INSERT INTO products (name, department, price, weight)
VALUES ('Belt', 'Clothes', -99, 1);

ALTER TABLE products
ADD CHECK (price > 0);



CREATE TABLE orders2 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    estimated_delivery TIMESTAMP NOT NULL,
    CHECK (created_at < estimated_delivery)
);


INSERT INTO orders2 (name, created_at, estimated_delivery)
VALUES (
    'Shirt',
    '2000-11-20 01:00:00',
    '2000-11-25 01:00:00'
);


INSERT INTO orders2 (name, created_at, estimated_delivery)
VALUES (
    'Shirt',
    '2000-11-20 01:00:00',
    '2000-11-10 01:00:00'
);


