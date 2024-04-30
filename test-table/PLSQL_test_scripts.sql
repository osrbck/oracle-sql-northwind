----------------------------------------------------
--Anonymous Blok
----------------------------------------------------
declare
    v_num1 number;
    v_num2 number;
    v_total number;
begin
    v_total:= v_num1 + v_num2;
end;

----------------------------------------------------
--Output Log
----------------------------------------------------

set serveroutput on;
begin
    dbms_output.put_line('Hello World');
end;

----------------------------------------------------

declare
    v_city varchar2(30);
    v_country varchar2(30) := 'Turkey';
begin
    dbms_output.put_line(v_city);
    v_city := 'İstanbul';
    dbms_output.put_line(v_city);
    dbms_output.put_line('--------------');
    v_country := 'USA';
    dbms_output.put_line(v_country);
end;

----------------------------------------------------

declare
    v_id number;
    v_name varchar2(30);
begin
    select employee_id, first_name
    into v_id, v_name
    from employees e
    where employee_id = 8;
    
    dbms_output.put_line('ID: '|| v_id || 'Adı: '|| v_name);
end;

----------------------------------------------------

declare
    v_name varchar2(50);
    v_title varchar2(150);
    v_title_of_courtesy varchar2(50);
begin
    select e.first_name || ' ' || e.last_name, e.title, e.title_of_courtesy
        into v_name, v_title, v_title_of_courtesy
    from employees e
    where e.employee_id = 7;
    
    dbms_output.put_line(v_title_of_courtesy || ' ' || v_name || ', ' || v_title);
end;

----------------------------------------------------



----------------------------------------------------



----------------------------------------------------



----------------------------------------------------



----------------------------------------------------