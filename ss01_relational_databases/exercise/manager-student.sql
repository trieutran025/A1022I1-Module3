create database student_manager;
use student_manager;
create table class(
	id int auto_increment primary key,
    name varchar(20) not null
);
insert into class(name)
values('A1022I1');
insert into class
values(2,'A1122I1');
select *from class;
update class
set name='A1222I1'
where id =2;
create table teacher(
	id int auto_increment primary key,
    name nvarchar(50) not null,
    age int check(age>0 and age<120),
    country varchar(50) 
);
insert into teacher(name,age,country)
values(n'Triều',18,'VietNam');
insert into teacher
values(2,n'Tom',20,'America');
select *from teacher;
begin;
commit;
rollback;