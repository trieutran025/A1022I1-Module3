CREATE DATABASE IF NOT EXISTS demo;
USE demo;
CREATE TABLE if not EXISTS product(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	productCode VARCHAR(20) ,
	productName VARCHAR(45),
	productPrice INT,
	productAmount INT,
	productDescription TEXT,
	productStatus BIT
);
INSERT INTO product (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Product 1', 10, 50, 'Description 1', 1),
    ('P002', 'Product 2', 20, 100, 'Description 2', 1),
    ('P003', 'Product 3', 15, 75, 'Description 3', 0),
    ('P004', 'Product 4', 25, 30, 'Description 4', 1),
    ('P005', 'Product 5', 30, 80, 'Description 5', 1);
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)  
CREATE UNIQUE INDEX index_code ON product (productCode);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX index_name_price on product(productName,productPrice);
ALTER TABLE product DROP INDEX index_code;
ALTER TABLE product DROP INDEX index_name_price;
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT productCode FROM product;
EXPLAIN SELECT productName,productPrice FROM product;

-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW view_product AS
SELECT productCode,productName,productPrice,productStatus
FROM product;

SELECT *FROM view_product;
-- Tiến hành sửa đổi view
CREATE OR REPLACE VIEW view_product AS
SELECT productCode,productName,productPrice,productStatus
FROM product
WHERE productPrice = 30;

SELECT *FROM view_product;
-- Tiến hành xoá view
DROP VIEW view_product;

-- Bước 5:   
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE getAllProduct ()
BEGIN
	SELECT *FROM product;
END //
DELIMITER ;
CALL getAllProduct();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddProduct (productCode VARCHAR(20),productName VARCHAR(45),productPrice INT ,productAmount INT,productDescription TEXT,productStatus BIT)
BEGIN
	INSERT INTO product(productCode,productName,productPrice,productAmount,productDescription,productStatus)
    VALUES(productCode,productName,productPrice,productAmount,productDescription,productStatus);
END //
DELIMITER ;
CALL AddProduct('P006', 'Product 6', 90, 86, 'Description 6', 1);
SELECT *FROM product
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE setProduct (number INT,productCode VARCHAR(20),productName VARCHAR(45),productPrice INT ,productAmount INT,productDescription TEXT,productStatus BIT)
BEGIN
	update product
	set	productCode=productCode,productName=productName,
		productPrice=productPrice,productAmount=productAmount,
        productDescription=productDescription,productStatus=productStatus
	WHERE id =number;
END //
DELIMITER ;
CALL setProduct(2,'P007','Product 7',100,20,'Description 1',0);
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE removeProduct (number INT)
BEGIN
	DELETE FROM product WHERE id = number;
END //
DELIMITER ;
CALL removeProduct(1);
