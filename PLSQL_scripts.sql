----------------------------------------------------

set serveroutput on;
declare
    p_price number;
begin
    select unit_price into p_price from products
    where product_id = 2;
    
    dbms_output.put_line('Unit Price:' || p_price);
end;

----------------------------------------------------

declare
    v_name varchar2(50);
    v_birth_date varchar2(100);
    v_reports_to varchar2(100);   
begin
    select
        first_name || ' ' || last_name, to_char(birth_date, 'dd-mm-yyyy'), reports_to
        into v_name, v_birth_date, v_reports_to
    from employees
    where employee_id = 7;
    
    dbms_output.put_line('Name: '|| v_name || ', Birth Date: '|| v_birth_date || ', Reports to: ' || v_reports_to);
end;

----------------------------------------------------

declare
    v_customer_id   customers.customer_id%type;
    v_company_name  customers.company_name%type;
    v_order_date    orders.order_date%type;
    v_freight       orders.freight%type;
begin

    select c.customer_id, c.company_name, o.order_date, o.freight
        into v_customer_id, v_company_name, v_order_date, v_freight
    from orders o, customers c
    where order_id = 10303
        and o.customer_id = c.customer_id;
    
    dbms_output.put_line('Customer ID: '|| v_customer_id);
    dbms_output.put_line('Company Name: '|| v_company_name); 
    dbms_output.put_line('Order Date: '|| v_order_date); 
    dbms_output.put_line('Order Amount: '|| v_freight); 
  
end;

----------------------------------------------------

declare
    v_target integer := 90;
    v_target_result boolean := false;
    v_count smallint;
begin

    select count(*) into v_count from customers;
    
    if v_count > v_target then 
        v_target_result := true;
    end if;
    
    if target_result then
        dbms_output.put_line('Customer goal achieved, congratulations :)');
    else 
        dbms_output.put_line('Please try a little harder!');
    end if;
  
end;

----------------------------------------------------

VARIABLE b_total number
BEGIN
    select sum(p.unit_price) into :b_total from products p;
END;
print b_total

----------------------------------------------------

VARIABLE b_sum number
VARIABLE b_avg number
set autoprint on
DECLARE
    v_supID number := &supplier_id;
BEGIN
    select sum(p.unit_price), avg(p.unit_price) into :b_sum, :b_avg from products p
    where supplier_id = v_supID;
END;

----------------------------------------------------

variable b_country varchar2(20)
begin
    select country into :b_country from customers
    where contact_title = 'Owner';
end;

select * from customer where country = :b_country;

----------------------------------------------------

variable b_sum_freight number
set autoprint on
begin
    select sum(freight) into :b_sum_freight
    from orders
    where ship_city = 'Köln';
end;

select ship_city, sum(freight) 
from orders
group by ship_city
having sum(freight) > :b_sum_freight;

----------------------------------------------------

select * from v$sql where sql_text like '%city%';

select * from customers where city = :b_city;

----------------------------------------------------

declare
    v_customer_id   orders.customer_id%type;
    v_order_date    orders.order_date%type;
    v_shipped_date  orders.shipped_date%type;
    v_ship_via      varchar2(50);
    v_freight       orders.freight%type;
    v_output_text   varchar2(500);
    c_new_line      char(1) := CHR(10);
    
begin

    select 
        customer_id, order_date, shipped_date, 
        decode(ship_via, 1, 'Airway', 2, 'Seaway', 3, 'Roadway'), freight
        into v_customer_id, v_order_date, v_shipped_date, v_ship_via, v_freight
    from orders 
    where order_id = 10538;
    
    v_output_text := 
        'Customer ID: '  || lower(v_customer_id) || c_new_line ||
        'Order Month: '  || to_char(v_order_date, 'Month') || c_new_line ||
        'Shiiped Date: ' || to_char(v_shipped_date, 'dd.mm.yyyy') || c_new_line ||
        'Ship Via: '     || v_ship_via || c_new_line ||
        'Order Amount: ' || to_char(round(v_freight));
        
    dbms_output.put_line(v_output_text);
end;

----------------------------------------------------

create sequence sq_temp
start with 5
increment by 1;

declare
    v_seq_number number;
begin
    v_seq_number := sq_temp.nextval;
    dbms_output.put_line('Row Number: ' || v_seq_number);
    insert into region values (sq_temp.nextval,'North West');
end;

----------------------------------------------------

----------------------------------------------------