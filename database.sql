CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE products (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100),
 price DECIMAL(10,2),
 image TEXT
);

INSERT INTO products (name, price, image) VALUES
('iPhone 13', 59999, 'https://m.media-amazon.com/images/I/61l9ppRIiqL._SX679_.jpg'),
('Headphones', 1999, 'https://m.media-amazon.com/images/I/61CGHv6kmWL._SX679_.jpg'),
('Shoes', 2999, 'https://m.media-amazon.com/images/I/71li-ujtlUL._UY695_.jpg');
