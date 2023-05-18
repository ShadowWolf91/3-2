-- delete teams;

set timing on serveroutput on

begin
for Lcntr IN 1..100000
loop
   add_team('test', NULL);
end loop;
end;


select * from teams;

declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from teams where team_id > 40000 and team_id < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

create index test_teams_index on teams(team_id, name);



declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from teams where team_id > 40000 and team_id < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

drop index test_teams_index;


select * from teams;