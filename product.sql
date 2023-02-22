CREATE SCHEMA product;

CREATE TABLE product.product (
    product_id INT PRIMARY KEY,
    producttypename VARCHAR,
    proprietary_id VARCHAR,
    dosageformname VARCHAR,
    routename VARCHAR,
    FOREIGN KEY (proprietary_id) REFERENCES product.product_proprietary (proprietary_id)
);

CREATE TABLE product.order_product (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity VARCHAR,
    FOREIGN KEY (product_id) REFERENCES product.product (product_id)
);

CREATE TABLE product.product_info (
    product_id INT PRIMARY KEY,
    productndc VARCHAR,
    startmarketingdate TIMESTAMP,
    endmarketingdate TIMESTAMP,
    marketingcategoryname VARCHAR,
    applicationnumber VARCHAR(9),
    labelername VARCHAR
);

CREATE TABLE product.product_substance (
    product_id INT PRIMARY KEY,
    substancename VARCHAR,
    activenumeratorstrength VARCHAR,
    activeingredunit VARCHAR,
    pharmclasses VARCHAR,
    deaschedule VARCHAR
);

CREATE TABLE product.order (
    order_id INT PRIMARY KEY,
    product_cost FLOAT,
    product_price FLOAT,
    orders_tatus VARCHAR(50) NOT NULL,
    order_date TIMESTAMP,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES product.location (location_id)
);

CREATE TABLE product.product_proprietary (
    proprietary_id INT PRIMARY KEY,
    proprietaryname VARCHAR,
    proprietarynamesufix VARCHAR,
    nonproprietaryname VARCHAR
);

CREATE TABLE product.location (
    location_id INT PRIMARY KEY,
    city VARCHAR,
    country VARCHAR
);
