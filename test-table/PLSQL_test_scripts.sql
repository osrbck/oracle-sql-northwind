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

declare
    v_string1 varchar2(50);
    v_string2 varchar2(50);
    v_string3 varchar2(50);
begin
    v_string1 := 'SARIBACAK';
    v_string2 := 'Osman';
    v_string3 := v_string1 || ' ' || v_string2;

    dbms_output.put_line('Name: ' || v_string3);
end;

----------------------------------------------------

declare
  v_inter1 interval year to month := '03-02';
  v_inter2 interval year to month := interval '6' month;
  v_inter3 interval day to second := '40 10:20:10';
  v_inter4 interval day to second := interval '5 5:5:5' day to second;

begin

  dbms_output.put_line(to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss'));
  dbms_output.put_line(sysdate + v_inter1);
  dbms_output.put_line(sysdate + v_inter2);
  dbms_output.put_line(to_char(sysdate + v_inter3, 'dd.mm.yyyy hh24:mi:ss'));
  dbms_output.put_line(to_char(sysdate + v_inter4, 'dd.mm.yyyy hh24:mi:ss'));
  
end;


----------------------------------------------------

declare
    v_date1 date;
    v_inter1 interval day to second := '40 01:00:00';

begin

    v_date1 := to_date('01.09.’ || to_char(sysdate,'yyyy’) || ' 19:00', 'dd.mm.yyyy hh24:mi');
    
    dbms_output.put_line('1. Presentation Date: ' || to_char(v_date1, 'dd.mm.yyyy hh24:mi:ss'));
    dbms_output.put_line('2. Presentation Date: ' || to_char(v_date1 + v_inter1, 'dd.mm.yyyy hh24:mi:ss'));
    dbms_output.put_line('3. Presentation Date: ' || to_char(v_date1 + v_inter1 + v_inter1, 'dd.mm.yyyy hh24:mi:ss'));
  
end;

----------------------------------------------------

declare
  v_var number;
  v_str  varchar2(50) := 'You are in the right place for PL/SQL learning';

begin
  v_var := length(v_str); 
  v_var := months_between(baslangic_tarihi, bitis_tarihi);
end;

----------------------------------------------------

declare
  v_var number := 1234.567;
  v_str  varchar2(50) := 'You are in the right place for PL/SQL learning';
  
begin
  dbms_output.put_line(instr(v_str,'SQL')); 
  dbms_output.put_line(concat('Osman ', 'SARIBACAK')); 
  dbms_output.put_line(to_char(v_var));
  dbms_output.put_line(lower(v_str));  
  dbms_output.put_line(substr(v_str, 8, 7)); 
  dbms_output.put_line(replace(v_str, 'right', 'wrong'));
  dbms_output.put_line(round(v_var,2));
  dbms_output.put_line(last_day(sysdate));  
end;

----------------------------------------------------

create sequence sq_temp
start with 1
increment by 1;

declare
    v_seq_number number;
begin
    v_seq_number := sq_temp.nextval;
    dbms_output.put_line('Row Number: ' || v_seq_number);
end;

----------------------------------------------------

----------------------------------------------------

----------------------------------------------------

----------------------------------------------------