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

----------------------------------------------------

----------------------------------------------------

----------------------------------------------------

----------------------------------------------------