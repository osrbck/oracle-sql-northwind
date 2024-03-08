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

ALTER TABLE CARS ADD (CAR_MODEL VARCHAR2(100 BYTE));

ALTER TABLE CARS MODIFY (DISCOUNT DEFAULT 0);

ALTER TABLE CARS DROP COLUMN CAR_MODEL;

ALTER TABLE CARS RENAME COLUMN CAR_ID TO ID;

ALTER TABLE CARS READ ONLY;

COMMENT ON TABLE CARS IS 'Information about the cars is kept in this table';

COMMENT ON COLUMN CARS.BRAND IS 'Describes the car model';

--------------------------------------------

CREATE TABLE STUDENT_TEMP AS SELECT * FROM STUDENT;

ALTER TABLE STUDENT_TEMP DROP COLUMN NAME;

ALTER TABLE STUDENT_TEMP DROP COLUMN EMAIL;

-----------------------------------------------------

create table movieactor
(
    movieid int,
    actorname varchar (70),
    actorsurname  varchar (70)
);

alter table movieactor rename to movie_actor;

alter table movie_actor rename column movieid to movie_id;
alter table movie_actor rename column actorname to actor_name;
alter table movie_actor rename column actorsurname to actor_surname;

alter table movie_actor add (bday date);

alter table movie_actor add (address varchar2(250));

alter table movie_actor add (city varchar2(50) not null);

alter table movie_actor add (company varchar2(150) default 'Warner Bros');

alter table movie_actor modify (address varchar2(500));

-----------------------------------------------------

create table books
(
book_id integer not null,
book_name varchar2(120) not null,
author varchar2(100),
isbn varchar2(40),
pub_year integer,
page_num integer
);

--or
insert into books(book_id, book_name, author, isbn, pub_year, page_num)
values(1, 'Learning Oracle', null, null, 2023, 345);

alter table books modify author varchar2(100) not null;

insert into books(book_id, book_name, author, isbn, pub_year, page_num)
values(2, 'Learning PostgreSQL', 'Osman', null, 2023, 345);

alter table books add constraint pk_books primary key (book_id);

-----------------------------------------------------

CREATE TABLE PERSONEL_EDU
(
  PERSONEL_ID      NUMBER        NOT NULL,   
  EDUCATION        VARCHAR2(100) NOT NULL,   
  JOB_STARTED      DATE,
  JOB_FINISHED     DATE,
  PERSONEL_TYPE    INTEGER,
  constraint pe_uc1 unique(personel_id, education)
);

--or
create unique index pe_uc1 on personel_edu (personel_id, education)


--------------------------------------------

create table permission_types
(
  permission_id  integer primary key,
  info   varchar2(50 byte)
);

--or
alter table permission_types
   add constraint pk_permission primary key (permission_id);


--------------------------------------------


select * from customer;
select * from keeper;

create table customer
(
    customer_id number,
    customer_name varchar(255) not null
);

alter table customer 
add constraint pk_customer primary key (customer_id);

create table keeper
(
    keeper_id number primary key,
    customer_id number,
    keeper_name varchar2(150) not null,
    constraint fk_customer
        foreign key(customer_id) 
        references customer(customer_id)
);

insert into customer (customer_id, customer_name) values(1, 'Apple'); 
insert into customer (customer_id, customer_name) values(2, 'Google'); 
insert into customer (customer_id, customer_name) values(3, 'Amazon'); 

insert into keeper (keeper_id, customer_id, keeper_name) values(1, 1, 'Alex'); 
insert into keeper (keeper_id, customer_id, keeper_name) values(2, 2, 'Michael'); 
insert into keeper (keeper_id, customer_id, keeper_name) values(3, 3, 'Jane'); 
insert into keeper (keeper_id, customer_id, keeper_name) values(4, 3, 'Judi');
