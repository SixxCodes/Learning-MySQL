/*
CREATE DATABASE yarn_it_CROCHET;


CREATE TABLE tblSupplier (
	supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
	name_supplier VARCHAR(50) NOT NULL UNIQUE,
    website VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(11) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    contact_person VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);


CREATE TABLE tblMaterial (
	material_ID INT PRIMARY KEY AUTO_INCREMENT,
    name_material VARCHAR(50) NOT NULL UNIQUE,
    stock_quantity INT NOT NULL,
    supplier_ID INT,
    FOREIGN KEY(supplier_ID) REFERENCES tblSupplier(supplier_ID),
    created_at DATETIME NOT NULL,
    restock_date DATETIME NOT NULL
);


CREATE TABLE tblCustomer (
	customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    middleName VARCHAR(50),
    lastName VARCHAR(50) NOT NULL,
    phoneNum VARCHAR(11) NOT NULL,
    address VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    registration_date DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    last_order_date DATETIME NOT NULL
);

CREATE TABLE tblProduct (
	product_ID INT PRIMARY KEY AUTO_INCREMENT,
    name_product VARCHAR(50) NOT NULL UNIQUE,
    descriptions VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50) NOT NULL,
    size VARCHAR(50) NOT NULL,
    color_main VARCHAR(50) NOT NULL,
    weight DECIMAL(5,2) NOT NULL,
    stock_quantity INT NOT NULL,
    material_ID INT,
	FOREIGN KEY(material_ID) REFERENCES tblMaterial(material_ID),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE tblOrder (
	order_ID INT PRIMARY KEY AUTO_INCREMENT,
    customer_ID INT,
	FOREIGN KEY(customer_ID) REFERENCES tblCustomer(customer_ID),
    order_date DATETIME NOT NULL,
    status_order VARCHAR(50) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE tblPayment (
	payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    order_ID INT,
	FOREIGN KEY(order_ID) REFERENCES tblOrder(order_ID),
    payment_method VARCHAR(50) NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL
);

CREATE TABLE order_items_Table (
	order_ID INT,
	FOREIGN KEY(order_ID) REFERENCES tblOrder(order_ID),
    product_ID INT,
    FOREIGN KEY(product_ID) REFERENCES tblProduct(product_ID),
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL
);

CREATE TABLE tblProduct (
	product_ID INT PRIMARY KEY AUTO_INCREMENT,
    name_product VARCHAR(50) NOT NULL UNIQUE,
    decsriptions VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(25) NOT NULL,
    size VARCHAR(25) NOT NULL,
    color_main VARCHAR(25) NOT NULL,
    weight DECIMAL(5,2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

CREATE TABLE tblOrder_Items (
	order_ID INT,
	FOREIGN KEY(order_ID) REFERENCES tblOrder(order_ID),
    product_ID INT,
    FOREIGN KEY(product_ID) REFERENCES tblProduct(product_ID),
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL
);

CREATE TABLE tblProduct_Material (
	product_ID INT,
	FOREIGN KEY(product_ID) REFERENCES tblproduct(product_ID),
    material_ID INT,
	FOREIGN KEY(material_ID) REFERENCES tblmaterial(material_ID),
    quantity INT NOT NULL,
    cost_per_unit DECIMAL(10,2) NOT NULL,
    total_material_cost INT NOT NULL,
    measurement_unit DECIMAL(5,2) NOT NULL,
    wastage_percentage DECIMAL(5,2) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);
*/

CREATE TABLE tblShip (
	shipping_ID INT PRIMARY KEY AUTO_INCREMENT,
    order_ID INT,
	FOREIGN KEY(order_ID) REFERENCES tblOrder(order_ID),
    tracking_number VARCHAR(50) NOT NULL UNIQUE,
    shipping_fee DECIMAL(10,2) NOT NULL,
    shipping_method VARCHAR(50) NOT NULL,
    shipping_address VARCHAR(100) NOT NULL,
    estimated_delivery DATETIME NOT NULL, 
    status_shipping VARCHAR(50) NOT NULL,
    shipped_at DATETIME NOT NULL,
    delivered_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);