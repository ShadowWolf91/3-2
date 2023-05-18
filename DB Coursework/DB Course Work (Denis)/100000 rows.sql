-- testing 100000 rows

-- delete Logins;

set timing on serveroutput on

begin
for Lcntr IN 1..100000
loop
   AddLogin('testing','100000','admin');
end loop;
end;


select * from Logins;

declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from Logins where login_id > 50000 and login_id < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

create index logins_id on Logins(Login_ID, Password);



declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from Logins where login_id > 50000 and login_id < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;
drop index logins_id;


select * from Logins;