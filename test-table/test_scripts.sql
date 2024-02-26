--test table scripts

--------------------------------------------

create table default_ornek
(
    ad varchar2(20), 
    soyad varchar2(30) default '--', 
    tarih date
);

insert into default_ornek(ad, soyad, tarih) 
values('Ali', default, sysdate);

select * from default_ornek;

insert into default_ornek (ad,soyad,tarih) 
values(default, default, sysdate);

-------------------------------------------

delete from student
where id = 36;

delete from basket_c
where id_c in (8, 9);

delete from student
where name = 'arnold';

delete from basket_c
where id_c = 5;

-----------------------------------------------------

INSERT INTO student(id, name, class_no, mark, gender, course_name)
VALUES(36, 'Adele', DEFAULT, DEFAULT, DEFAULT, 'Finance');

INSERT INTO student(id, name, class_no, mark, gender, course_name)
VALUES(37, 'Tarkan', DEFAULT, 78, 'male', 'Zoology');

INSERT INTO student(id, name, mark, course_name)
VALUES(38, 'Ava Max', 85, 'History');

--------------------------------------------

INSERT INTO student(id, name, class, mark, gender, course_name, email)
VALUES(40, 'Zeki Müren', 2, 85, 'male', 'Conservatory', null);

INSERT INTO student
VALUES(41, 'Emel Sayin', 4, 96, DEFAULT, 'Finance', default);

--------------------------------------------

insert into colors
values ('Red');

insert into colors
values ('Pink');

insert into colors
values ('Navy');

update colors set color = 'Midnight Blue' where color = 'Blue';

select * from colors;

Rollback;

----------------------------------------------------

update cars set discount = 1000
where id = 4;

update cars set brand = 'Mercedes Benz'
where brand = 'Mercedes'

select * from cars;

COMMIT;

--------------------------------------------

--Session-1
select * from cars;

update cars set price = 7500 
where id = 4;

--Session-2
select * from cars;

update cars set price = 8500 
where id = 4;

--------------------------------------------
--SAVEPOINT
--------------------------------------------

update product_segment set discount = discount + 0.08;

update product p set net_price = price - price * (select s.discount from product_segment s where s.id = p.segment_id);

savepoint all_segment; --1.savepoint

update product_segment set discount = discount + 0.15 where segment like '%Luxury%';

update product p set net_price = price - price * (select s.discount from product_segment s where s.id = p.segment_id)
where p.segment_id in 
    (select ps.id from product_segment ps where ps.segment like '%Luxury%');

savepoint luxury_segment; --2.savepoint

select sum(net_price) from product;

update product_segment set discount = discount + 0.05 where segment = 'Mass';

update product p set net_price = price - price * (select s.discount from product_segment s where s.id = p.segment_id)
where p.segment_id in 
    (select ps.id from product_segment ps where ps.segment = 'Mass');

select sum(net_price) from product;

rollback;

--------------------------------------------

create table customers
( 
  customer_id number(8) not null,
  customer_name varchar2(100) not null,
  address varchar2(200),
  city varchar2(50),
  state varchar2(25),
  zip_code varchar2(10)
);

--------------------------------------------

CREATE TABLE COURSES
(
    COURSE_ID NUMBER,
    COURSE_NAME VARCHAR2(50),
    COURSE_INFO VARCHAR2(250),
    COURSE_DATE DATE,
    COURSE_CAPACITY INTEGER DEFAULT 20,
    COURSE_TEACHER VARCHAR2(70) DEFAULT 'not appointed yet'
)

--------------------------------------------

create table cars_limited as 
select id, brand, 
       price, discount,
	     (price*0.85) limited_price
from cars
where brand = 'BMW';

--------------------------------------------

create table product_with_segment as 
select pr.id, ps.segment, ps.discount, pr.name, pr.price
from product pr, product_segment ps
where pr.segment_id = ps.id;

