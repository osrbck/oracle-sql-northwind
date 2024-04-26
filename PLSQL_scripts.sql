----------------------------------------------------

set serveroutput on;
declare
    p_price number;
begin
    select unit_price into p_price from products
    where product_id = 2;
    
    dbms_output.put_line('Unit Price:' || p_price);
end;

