begin
AddFan(1, 'Danik', 'petras@gmail.com', '1661', '1234123412341234');
AddFan(2, 'Dima', 'dimon@gmail.com', '111', '4321432143214321');
AddFan(3, 'Eugene', 'gene@gmail.com', '1', '5678567856785678');
end;

begin
AddAdmin(4, 'ShadowWolf', 'petrmail@gmail.com', '3110', '1234567812345678', 'Yes');
AddAdmin(5, 'SadnessITs', 'sad@gmail.com', '123', '1234567890123456', 'Yes');
AddAdmin(6, 'Eueueu', 'eu@gmail.com', '69', '0987654309876543', 'Yes');
end;

begin
AddPlay('Vitebsk', 'Grodno', to_date('2023/05/11', 'yyyy/mm/dd'));
AddPlay('Gomel', 'Zhlobin', to_date('2023/05/13', 'yyyy/mm/dd'));
AddPlay('Brest', 'Minsk', to_date('2023/05/16', 'yyyy/mm/dd'));
AddPlay('Soligorsk', 'Bobruisk', to_date('2023/05/18', 'yyyy/mm/dd'));
end;

begin
UpdatePlays(5, 3, to_date('2023/05/11', 'yyyy/mm/dd'));
end;

begin
AddTeam(1, 'Bobruisk', 'B');
AddTeam(2, 'Brest', 'B');
AddTeam(3, 'Gomel', 'B');
AddTeam(4, 'Grodno', 'A');
AddTeam(5, 'Minsk', 'A');
AddTeam(6, 'Soligorsk', 'A');
AddTeam(7, 'Vitebsk', 'B');
AddTeam(8, 'Zhlobin', 'A');
AddTeam(9, 'reywr', 'B');
end;

begin
UpdateTeams(7, 6, 1, 1);
UpdateTeams(4, 0, 2, 1);
end;

begin
DeleteTeam(9);
end;

begin
AddTicket(1, 3, 3, 12, 9, to_date('2023/05/13', 'yyyy/mm/dd'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 2);
AddTicket(2, 3, 3, 12, 11, to_date('2023/05/13', 'yyyy/mm/dd'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 1);
AddTicket(3, 3, 3, 12, 12, to_date('2023/05/13', 'yyyy/mm/dd'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 1);
AddTicket(4, 3, 5, 15, 6, to_date('2023/05/13', 'yyyy/mm/dd'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 3);
end;

begin
DeleteTicket (4);
end;

begin
hash_password();
end;
