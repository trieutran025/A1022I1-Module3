CREATE DATABASE IF NOT EXISTS manager_sales;
use manager_sales;
CREATE TABLE customer(
	c_id VARCHAR(10) PRIMARY KEY,
    c_name VARCHAR(30),
    c_age INT
);
CREATE TABLE Oder(
	o_id VARCHAR(10) PRIMARY KEY,
    c_id VARCHAR(10),
    o_date DATETIME,
    o_total_price INT,
    FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
CREATE TABLE Product(
	p_id VARCHAR(10) PRIMARY KEY,
    p_name VARCHAR(30),
    p_price INT
);
CREATE TABLE order_detail(
	o_id VARCHAR(10),
    p_id VARCHAR(10),
    od_QTY VARCHAR(20),
    PRIMARY KEY(o_id,p_id),
    FOREIGN KEY(o_id) REFERENCES Oder(o_id),
    FOREIGN KEY(p_id) REFERENCES Product(p_id)
);