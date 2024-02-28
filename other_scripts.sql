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