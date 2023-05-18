begin
add_technology('C#', 3, 5);
add_technology('C++', 3, 5);
add_technology('JS', 4, 6);
end;

begin
add_team('team1', 'C++');
add_team('team2', 'C#');
add_team('team3', 'JS');
end;

begin
add_project('app', 'lol', 1);
add_project('app2', 'l444l', 2);
add_project('mobileapp', 'lo44l', 3);
end;

begin
add_language('english', 2);
add_language('german', 4);
add_language('spanish', 3);
end;

begin
add_mentor('finskiy', 'daniil', 'vadimovich', '+375291234567', 'skypeid',
'c# developer', to_date('2022/01/01', 'yyyy/mm/dd'), 1, 'english', 'C1');
add_mentor('fins', 'danii', 'vadimovi', '+375291234577', 'skype',
'c++ developer', to_date('2022/01/01', 'yyyy/mm/dd'), 2, 'english', 'C2');
add_mentor('fin', 'da', 'ovich', '+375291234111', 'lololoid',
'JS developer', to_date('2022/01/01', 'yyyy/mm/dd'), 3, 'spanish', 'B1');
end;

begin
add_sandbox('c# group', to_date('2022/01/01', 'yyyy/mm/dd'),
to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'),
15, 'finskiy');
add_sandbox('c++ group', to_date('2022/01/01', 'yyyy/mm/dd'),
to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'),
18, 'fins');
add_sandbox('node.js group', to_date('2022/01/02', 'yyyy/mm/dd'),
to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'),
9, 'fin');
end;

begin
add_candidate('ibragimov', 'ibragim', 'ibrgimovich', '+375291234567', 'skypeid',
to_date('2022/01/01', 'yyyy/mm/dd'), 'finskiy', 1, 'spanish', 'B1',
'not started', 2);
add_candidate('ibragimo', 'ibrag', 'ibrgimovic', '+375291234007', 'eid',
to_date('2022/01/01', 'yyyy/mm/dd'), 'fins', 2, 'english', 'B2',
'started', 7);
add_candidate('ik', 'ibrag', 'rgimovich', '+375331234567', 'erereertid',
to_date('2022/01/01', 'yyyy/mm/dd'), 'fin', 3, 'german', 'A1',
'completed', 99);
end;

begin
add_feedbacks('finskiy', 'ibragimov', 'good man');
add_feedbacks('fins', 'ibragimo', 'bad man');
add_feedbacks('fin', 'ik', 'very good man');
end;

--select * from mentors;
--begin
--update_mentor(1, 'finskiy', 'daniil', 'vadimovich', '+375291234567', 'skypeid',
--'BSTU developer', to_date('2022/01/01', 'yyyy/mm/dd'), 1, 'english', 'C1');
--end;