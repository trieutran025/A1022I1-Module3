use quan_li_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM Subject
WHERE credit = (SELECT MAX(credit) FROM Subject)
LIMIT 1;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT S.sub_id,S.sub_name,S.credit,S.status
FROM Subject S
Left join Mark M on S.sub_id = M.sub_id
WHERE mark = (SELECT MAX(mark) FROM Mark)
LIMIT 1;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT St.student_id,St.student_name,St.address,St.phone,St.status,St.class_id, AVG(M.mark) AS DTB
FROM student St 
JOIN mark M on St.student_id = M.student_id
GROUP BY St.student_id
ORDER BY AVG(M.mark) DESC;