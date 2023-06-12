use manager_sales;

INSERT INTO Customer(c_name,c_age)
VALUES('Minh Quan',10);
INSERT INTO Customer(c_name,c_age)
VALUES('Ngoc Oanh',20);
INSERT INTO Customer(c_name,c_age)
VALUES('Hong Ha',50);

INSERT INTO Oder(c_id,o_date,o_total_price)
VALUES(1,'2006/03/21',NULL);
INSERT INTO Oder(c_id,o_date,o_total_price)
VALUES(2,'2006/03/23',NULL);
INSERT INTO Oder(c_id,o_date,o_total_price)
VALUES(1,'2006/03/16',NULL);

INSERT INTO Product(p_name,p_price)
VALUE('May Giat',3);
INSERT INTO Product(p_name,p_price)
VALUE('Tu Lanh',5);
INSERT INTO Product(p_name,p_price)
VALUE('Dieu Hoa',7);
INSERT INTO Product(p_name,p_price)
VALUE('Quat',1);
INSERT INTO Product(p_name,p_price)
VALUE('Bep Dien',2);

INSERT INTO order_detail(o_id,p_id,od_QTY)
VALUES(1,1,3),
	  (1,3,7),
	  (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);