create database quan_li_ban_hang;
use quan_li_ban_hang;
create table customer(
	c_id int auto_increment primary key not null,
    c_name varchar(50) not null,
    c_age int check(c_age>0 and c_age<120)
);
create table orders(
	o_id int auto_increment key not null,
    c_id int,
    o_date date,
    o_toltal_price int,
    foreign key(c_id) references customer(c_id)
);
create table order_detail(
	o_id int,
    p_id int,
    od_qty varchar(20),
    foreign key(o_id) references orders(o_id),
    foreign key(p_id) references product(p_id) 
);
create table product(
	p_id int auto_increment primary key not null,
    p_name varchar(50) not null,
    p_price int 
);