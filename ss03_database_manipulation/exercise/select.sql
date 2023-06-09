USE quan_li_sinh_vien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT *FROM student  WHERE student_name like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *From class WHERE month(start_date) = '12';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *FROM Subject WHERE credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student set class_id =2
where student_name like 'Hung%';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT S.Student_name,Sub.Sub_name,M.Mark
FROM Student S join Mark M on S.Student_id = M.Student_id join subject Sub on M.Sub_id = Sub.Sub_id
GROUP BY S.Student_name,Sub.Sub_name,M.Mark
ORDER BY M.mark DESC; 