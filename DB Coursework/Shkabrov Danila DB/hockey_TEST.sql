-- testing 100000 rows
-- delete Logins;
set timing on serveroutput on

begin
for Lcntr IN 1..100000
loop
   AddFans('TEST', 'test@gmail.com', '112233', 1111111111111111);
end loop;
end;

select * from USERS;

declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from USERS where ID > 50000 and ID < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

create index fan_id on USERS(ID, Password);

declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from USERS where ID > 50000 and ID < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

drop index fan_id;

select * from USERS;