
CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_id)
    );

   
CREATE TABLE orders (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY orders(customer_id) REFERENCES customers(customer_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );

  
CREATE TABLE categories (
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (category_id)
    );

CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_description TEXT NOT NULL,
    product_price DECIMAL(10,2) NOT NULL,
    product_category_id INT NOT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY products(product_category_id) REFERENCES categories(category_id) ON DELETE RESTRICT ON UPDATE CASCADE
    );

CREATE TABLE order_Items (
    order_Item_ID INT NOT NULL AUTO_INCREMENT,
    order_ID INT NOT NULL,
    product_ID INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_Item_ID),
    FOREIGN KEY (order_ID) REFERENCES orders(order_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (product_ID) REFERENCES products(product_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);



