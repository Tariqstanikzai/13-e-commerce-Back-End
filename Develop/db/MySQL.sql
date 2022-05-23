DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

DROP TABLE IF EXISTS productTag;
DROP TABLE IF EXISTS tag;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;

CREATE TABLE category (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  category_name VARCHAR(30) NOT NULL
);

CREATE TABLE product (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  product_name VARCHAR(30) NOT NULL,
  price DECIMAL(20,10) NOT NULL,
  stock INT UNSIGNED DEFAULT 10 NOT NULL,
  category_id INT,
  INDEX cat_ind (category_id),
  CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE SET NULL
);

CREATE TABLE tag (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  tag_name VARCHAR(30)
);

CREATE TABLE productTag (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  product_id INT,
  INDEX pro_ind (product_id),
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE SET NULL,
	tag_id INT,
  INDEX tag_ind (tag_id),
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE SET NULL
);