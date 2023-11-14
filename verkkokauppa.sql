DROP TABLE IF EXISTS order_line;
DROP TABLE IF EXISTS customer_order;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;

CREATE TABLE product_category(
    category_name VARCHAR(255) NOT NULL PRIMARY KEY,
    category_description VARCHAR(500)
);

CREATE TABLE product(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2),
    image_url VARCHAR(255),
    category VARCHAR(255),
    FOREIGN KEY (category) REFERENCES product_category(category_name)
);

CREATE TABLE customer(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    post_code SMALLINT,
    city VARCHAR(255),
    state VARCHAR(255),
    mobile INT,
    email VARCHAR(255),
    username VARCHAR(255) UNIQUE,
    pw VARCHAR(255)
);

CREATE TABLE customer_order(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE order_line(
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES customer_order(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);


INSERT INTO product_category VALUES 
('Kategoria_1', 'Kategoria 1 kuvaus'),
('Kategoria_2', 'Kategoria 2 kuvaus'),
('Kategoria_3', 'Kategoria 3 kuvaus'),
('Kategoria_4', 'Kategoria 4 kuvaus'),
('Kategoria_5', 'Kategoria 5 kuvaus');


INSERT INTO product (product_name, price, image_url, category) VALUES 
('Tuote 1', '19,90', NULL, 'Kategoria_1'),('Tuote 2', '29,90', NULL, 'Kategoria_1'), ('Tuote 3', '24,90', NULL, 'Kategoria_1'), ('Tuote 4', '11,90', NULL, 'Kategoria_1'), ('Tuote 5', '17,90', NULL, 'Kategoria_1'),
('Tuote 1', '19,90', NULL, 'Kategoria_2'),('Tuote 2', '29,90', NULL, 'Kategoria_2'), ('Tuote 3', '24,90', NULL, 'Kategoria_2'), ('Tuote 4', '11,90', NULL, 'Kategoria_2'), ('Tuote 5', '17,90', NULL, 'Kategoria_2'),
('Tuote 1', '19,90', NULL, 'Kategoria_3'),('Tuote 2', '29,90', NULL, 'Kategoria_3'), ('Tuote 3', '24,90', NULL, 'Kategoria_3'), ('Tuote 4', '11,90', NULL, 'Kategoria_3'), ('Tuote 5', '17,90', NULL, 'Kategoria_3'),
('Tuote 1', '19,90', NULL, 'Kategoria_4'),('Tuote 2', '29,90', NULL, 'Kategoria_4'), ('Tuote 3', '24,90', NULL, 'Kategoria_4'), ('Tuote 4', '11,90', NULL, 'Kategoria_4'), ('Tuote 5', '17,90', NULL, 'Kategoria_4'),
('Tuote 1', '19,90', NULL, 'Kategoria_5'),('Tuote 2', '29,90', NULL, 'Kategoria_5'), ('Tuote 3', '24,90', NULL, 'Kategoria_5'), ('Tuote 4', '11,90', NULL, 'Kategoria_5'), ('Tuote 5', '17,90', NULL, 'Kategoria_5');
