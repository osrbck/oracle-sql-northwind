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
