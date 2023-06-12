use manager_sales;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT o_id,o_date,o_total_price FROM oder;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT C.c_id,C.c_name, P.p_name
FROM Customer C
JOIN Oder O ON C.c_id = O.c_id
JOIN order_detail Od ON O.o_id = Od.o_id
JOIN Product P ON Od.p_id = P.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT C.c_name
FROM Customer C
LEFT JOIN Oder O on C.c_id = O.c_id
WHERE O.c_id is NULL;

-- 	Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong 
-- 	hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice
SELECT O.o_id,O.o_date,SUM(P.p_price*Od.od_QTY) AS Price
FROM Oder O
JOIN order_detail Od on O.o_id = Od.o_id
JOIN Product P on Od.p_id = P.p_id
GROUP BY O.o_id,O.o_date

