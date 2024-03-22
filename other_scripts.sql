update product p
set net_price = price - price * 
    (
        select s.discount from product_segment s 
        where p.segment_id = s.id 
    )

--------------------------------------------

delete from product p
where p.segment_id in 
    (
        select ps.id from product_segment ps
        where ps.segment = 'luxury'
    )

--------------------------------------------

delete from product p
where exists  
    (
        select 1 from product_segment ps
        where ps.segment = 'Luxury'
            and p.segment_id = ps.id
    )

--------------------------------------------

create table customer_orders as
select 
    c.customer_id, c.company_name, c.contact_name, c.city,  
    o.order_date, o.freight, o.ship_city
from customers c, orders o 
where c.customer_id = o.customer_id;

--------------------------------------------

create table product_with_segment as 
select pr.id, ps.segment, ps.discount, pr.name, pr.price
from product pr, product_segment ps
where pr.segment_id = ps.id;

--------------------------------------------

comment on column product.net_price is 'The net prices of the products are kept in this column'; 



--------------------------------------------

create view cust_order_info as
select 
    c.customer_id, c.company_name, c.contact_name,
    o.order_id, o.order_date, o.freight, o.ship_city 
from customers c, orders o 
where c.customer_id = o.customer_id 

--DROP VIEW CUST_ORDER_INFO;

--------------------------------------------

create or replace view cust_order_prod_info as
select 
    co.customer_id, co.company_name,
    co.order_date, co.freight, co.ship_city,
    p.product_name, p.unit_price 
from 
    cust_order_info co,
    order_details od, products p  
where 1=1 
    and co.order_id = od.order_id 
    and p.product_id = od.product_id

    with read only;


--------------------------------------------

create view vw_product_grand_lux as
select id, name, price from product
where segment_id = 1;

update vw_product_grand_lux 
set price = price * 1.3;

delete from vw_product_grand_lux
where id = 11;

insert into vw_product_grand_lux(id, name, price)
values(21, 'Air Cleaner', 1200);

--------------------------------------------


alter table customers add (email varchar2(150));

select 
    customer_id||'@osrbck.net' as email 
from customers;

update customers set email = 
       customer_id||'@osrbck.net';

select * from customers;

create unique index customer_email on customers(email);


--------------------------------------------

explain plan for
select 
    c.customer_id, c.company_name, c.contact_name,
    o.order_id,  o.order_date, o.freight, o.ship_city 
from customers c, orders o 
where c.customer_id = o.customer_id;

select plan_table_output 
from table(dbms_xplan.display());

select * from customers where customer_id = 'PARIS';

--------------------------------------------

create index uq_emp_city_postal on employees (city, postal_code);
