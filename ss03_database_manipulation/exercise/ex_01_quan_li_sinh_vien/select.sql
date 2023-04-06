select *from student
where student_name like 'h%';

select *from class
where month(start_date) =12;

select *from subject
where credit between 3 and 5;

update student set class_id =1 where student_name = 'Hung';


select S.student_name,Sub.sub_name,M.mark
from Student S join Mark M on S.student_id = M.Student_id join Subject Sub on Sub.sub_id=M.Sub_id
order by  M.mark desc;