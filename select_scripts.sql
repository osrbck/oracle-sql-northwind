
select 
    'Customer: ' || customer_id ||
    ', Order Date:' || to_char(order_date, 'mm-dd-yyyy') || 
    ', Shipped Date: ' || to_char(shipped_date, 'mm-dd-yyyy') ||
    ', Shipped Date(day): ' || to_char(shipped_date - order_date) ||
    ', Freight: ' || to_char(freight, '9990D00') as order_info
from orders ;

--------------------------------------------

SELECT customer_id, order_date,
       TO_CHAR(order_date, 'HH24:MI:SS')             as TC1,
       TO_CHAR(order_date, 'MON-DD-YYYY HH12:MI PM') as TC2,
       TO_CHAR(order_date, 'DD.MM.YYYY HH24:MI')     as TC3,
       TO_CHAR(order_date, 'MON-DAY-YYYY HH12:MI')   as TC4,
       TO_CHAR(order_date, 'Month DD, YYYY')         as TC5,
       TO_CHAR(order_date, 'YYYYMMDD')               as TC6
FROM orders;

--------------------------------------------

select * from orders 
where ship_address like '%Ave%';

select * from orders
where initcap(ship_address) like '%Ave%';

select * from orders 
where instr(ship_address,'Ave') > 0;

--------------------------------------------

select p.unit_price, 
    round(unit_price,1) as unit_price_d1, 
    round(units_in_stock/20) as package_count, 
    mod(units_in_stock,20) as remaining_amount
from products p;

select order_id, customer_id, 
    decode(ship_via, 1, 'Airway', 2, 'Seaway', 3, 'Default') as ship_type 
from orders;

--------------------------------------------

select company_name, contact_name, contact_title,
    case 
        when lower(contact_title) like '%manager%' then 'Manageral Position'
        when lower(contact_title) like '%admin%' then 'Administrative Position'
        when lower(contact_title) like '%asistant%' then 'Assistant Position'
        when lower(contact_title) like '%representative%' then 'Representative Position'
        else 'Other Position'
    end as position_name
from customers;

--------------------------------------------

select 
    sum(freight), sum(distinct freight),
    avg(freight), avg(distinct freight)
from orders

--------------------------------------------

SELECT 
    SUM(shipped_date - order_date) as toplam_gun,
    AVG(shipped_date - order_date) as ortalama_gun
FROM orders
where ship_city = 'Stuttgart'

--------------------------------------------

select 
    count(*) as kayit_sayisi,
    count(distinct discount) as farkli_indirim_orani_sayisi
from order_details od


--------------------------------------------

select customer_id,
    count(*) as order_count,
    count(distinct ship_city) as city_difference,
    min(order_date) as first_order_date,
    max(order_date) as las_order_date
from orders
group by customer_id; 

--------------------------------------------

select 
  sum(case ship_via when 1 then 1 else 0 end) as air_way_count,
  sum(case ship_via when 2 then 1 else 0 end) as sea_way_count,
  sum(case ship_via when 3 then 1 else 0 end) as default_way_count
from orders

--------------------------------------------

select supplier_id, count(*) 
from products
group by supplier_id 
having count(*) > 3;

--------------------------------------------

