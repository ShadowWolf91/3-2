begin
AddLogin('bozhko', '12345678', 'admin');
AddLogin('bovkun', '12345678', 'admin');
AddLogin('kasperovich', '12345678', 'admin');
AddLogin('lityagin', '12345678', 'admin');
AddLogin('velichko', '12345678', 'admin');
AddLogin('dezhemesov', '12345678', 'admin');
AddLogin('patsei', '123456', 'teacher');
AddLogin('beloded', '123456', 'teacher');
AddLogin('blinova', '123456', 'teacher');
AddLogin('asmykovich', '123456', 'teacher');
AddLogin('gurin', '123456', 'teacher');
AddLogin('grinyuk', '123456', 'teacher');
AddLogin('barkovskiy', '12345', 'instructor');
AddLogin('sukhorukova', '12345', 'instructor');
AddLogin('korenkova', '12345', 'instructor');
AddLogin('sulim', '12345', 'instructor');
AddLogin('brusentsova', '12345', 'instructor');
AddLogin('motolyanets', '1234', 'student');
AddLogin('lappo', '1234', 'student');
AddLogin('orlov', '1234', 'student');
AddLogin('narkevich', '1234', 'student');
AddLogin('yushkevich', '1234', 'student');
AddLogin('solodukha', '1234', 'student');
AddLogin('dunaeva', '1234', 'student');
AddLogin('potapeiko', '1234', 'student');
AddLogin('murugin', '1234', 'student');
AddLogin('konoplyanik', '1234', 'student');
AddLogin('savelev', '1234', 'student');
end;


begin
AddAdmin(1, '�����', '�����', '������������', '2001-11-09', '(123) 123-1234', '����������� ��������', 9999, to_date('2022/01/01', 'yyyy/mm/dd'));
AddAdmin(2, '������', '�������', '����������', '2002-01-01', '(123) 123-1200', '��������', 99999, to_date('2022/01/01', 'yyyy/mm/dd'));
AddAdmin(3, '����������', '�������', '��������������', '1999-11-09', '(123) 123-0234', '���������', to_date('2022/01/01', 'yyyy/mm/dd')); 
AddAdmin(4, '�������', '�����', '�����������', '2001-09-09', '(123) 199-1234', '�������-�����������', 1001, to_date('2022/01/01', 'yyyy/mm/dd')); 
AddAdmin(5, '�������', '�������', '�����������', '2002-05-05', '(123) 101-1234', 'Senior C# Developer', 9090, to_date('2022/01/01', 'yyyy/mm/dd')); 
AddAdmin(6, '���������', '�����', '���������', '2001-10-10', '(523) 123-1234', '�������', 12, to_date('2022/01/01', 'yyyy/mm/dd'));
end;


begin
AddAutodrome('�. �����, ��. �����������, 41', 12);
AddAutodrome('�. �����, ��. �������������, 41�', 1);
AddAutodrome('�. ������, ��. ����������, 1', 15);
AddAutodrome('�. ������, ��. �����������, 15', 13);
AddAutodrome('�. ������, ��. ���������, 3', 8);
AddAutodrome('�. ��������, ��. ������������, 10', 10);
end;


begin
AddAuto('Toyota', 'Corolla', 'MK1278', 12);
AddAuto('Toyota', 'Yaris', 'MS1278', 12);
AddAuto('Renault', 'Logan', 'LL0178', 1);
AddAuto('���', '�������', 'PF4578', 1);
AddAuto('���', '�����', 'AB1234', 15);
AddAuto('Toyota', 'Yaris', 'MW9999', 15);
AddAuto('Chevrolet', '�������', 'GH1278', 13);
AddAuto('Lada', 'X-Ray', 'BY4098', 13);
AddAuto('Volvo', '������', 'MS0078', 8);
AddAuto('BMW', 'M3 GTR', 'EE7777', 8);
AddAuto('Toyota', 'Supra', 'QW1248', 10);
AddAuto('Dodge', 'Challenger', 'BX3998', 10);
AddAuto('Lamborghini', 'Gallardo', 'SZ141', 12);
end;


begin
AddInstructor(13, '����������', '�������', '����������', '1990-10-09', '(133) 123-1234', 1700, to_date('2022/01/01', 'yyyy/mm/dd'), 'EE7777');
AddInstructor(14, '����������', '�����', '�����������', '1985-04-01', '(123) 153-1234', 1800, to_date('2022/01/01', 'yyyy/mm/dd'), 'MK1278'); 
AddInstructor(15, '����������', '���������', '�������������', '1995-01-15', '(123) 123-1884', 1400, to_date('2022/01/01', 'yyyy/mm/dd'), 'SZ141');
AddInstructor(16, '�����', '�����', '����������', '1982-07-22', '(123) 123-7834', 1700, to_date('2022/01/01', 'yyyy/mm/dd'), 'GH1278');
AddInstructor(17, '����������', '�������', '�����������', '1965-01-15', '(103) 123-1234', 1900, to_date('2022/01/01', 'yyyy/mm/dd'), 'BY4098');
end;


begin
AddTeacher(7, '�����', '�������', '������������', '1980-01-05', '(123) 003-1234', 2000, to_date('2022/01/01', 'yyyy/mm/dd'), 'A');
AddTeacher(8, '�������', '�������', '����������', '1978-09-09', '(173) 123-1234', 1900, to_date('2022/01/01', 'yyyy/mm/dd'), 'A1'); 
AddTeacher(9, '�������', '�������', '�������������', '1990-10-09', '(123) 123-1239', 1950, to_date('2022/01/01', 'yyyy/mm/dd'), 'B'); 
AddTeacher(10, '���������', '����', '�������', '1960-04-21', '(773) 123-1234', 1400, to_date('2022/01/01', 'yyyy/mm/dd'), 'C');
AddTeacher(11, '�����', '�������', '����������', '1970-12-12', '(124) 123-1234', 1800, to_date('2022/01/01', 'yyyy/mm/dd'), 'D'); 
AddTeacher(12, '������', '�������', '�����������', '1980-10-09', '(123) 123-1434', 1800, to_date('2022/01/01', 'yyyy/mm/dd'), 'E');
end;


begin
AddSchool('�. �����, ��. ����������, 157', 4);
AddSchool('�. �����, ��. ��������� �����������, 2', 2);
AddSchool('�. ������, ��. �����, 77', 77);
AddSchool('�. ������, ��. ���������, 14', 7);
AddSchool('�. ������, ��. ���� �������, 1', 10);
AddSchool('�. ��������, ��. ����������, 47', 22);
end;


begin
AddCabinet(101, '�. �����, ��. ����������, 157');
AddCabinet(102, '�. �����, ��. ����������, 157');
AddCabinet(15, '�. �����, ��. ����������, 157');
AddCabinet(14, '�. �����, ��. ����������, 157');
AddCabinet(100, '�. �����, ��. ��������� �����������, 2');
AddCabinet(17, '�. �����, ��. ��������� �����������, 2');
AddCabinet(1, '�. ������, ��. �����, 77');
AddCabinet(2, '�. ������, ��. �����, 77');
AddCabinet(103, '�. ������, ��. ���������, 14');
AddCabinet(3, '�. ������, ��. ���� �������, 1');
AddCabinet(134, '�. ��������, ��. ����������, 47');
end;


begin
AddGroup(to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'), '�������', '����������', 20, 'A1', '�. ������, ��. ���������, 14', 103, 'Monday');
AddGroup(to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'), '�����', '����������', 15, 'A', '�. �����, ��. ����������, 157', 101, 'Saturday');
AddGroup(to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'), '�����', '�����', 16, 'A', '�. �����, ��. ��������� �����������, 2', 100, 'Sunday');
AddGroup(to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'), '�������', '����������', 15, 'B', '�. ��������, ��. ����������, 47', 134, 'Friday');
AddGroup(to_date('2022/01/01', 'yyyy/mm/dd'), to_date('2022/01/01', 'yyyy/mm/dd'), '�����', '����������', 14, 'D', '�. ������, ��. �����, 77', 1, 'Friday');
end;


begin
(18, '���������', '���������', '���������', to_date('2022/01/01', 'yyyy/mm/dd'), '(166) 123-1234', 2, '�����', '����������', 1000, 'passed', 'passed', 'passed');
(19, '�����', '����������', '��������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 663-1234', 1, '�������', '����������', 1000, 'passed', 'passed', 'not passed');
(20, '�����', '�����', '�������������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 166-1234', 3, '�����', '�����', 999, 'passed', 'passed', 'passed');
(21, '��������', '�����', '�������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 123-6634', 4, '�������', '����������', 750, 'not passed', 'passed', 'passed');
(22, '��������', '���', '�����������', to_date('2022/01/01', 'yyyy/mm/dd'), '(663) 123-1234', 2, '�����', '����������', 1000, 'passed', 'passed', 'passed');
(23, '�������', '����', '�����������', to_date('2022/01/01', 'yyyy/mm/dd'), '(124) 123-1234', 1, '�������', '����������', 1000, 'passed', 'passed', 'passed');
(24, '�������', '������', '�����������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 993-1234', 2, '�����', '����������', 1000, 'passed', 'not passed', 'passed');
(25, '���������', '������', '�������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 123-1266', 3, '�����', '�����', 900, 'not passed', 'passed', 'not passed');
(26, '�������', '��������', '��������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 103-1234', 4, '�������', '����������', 1000, 'passed', 'passed', 'passed');
(27, '����������', '����', '�������������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 123-1284', 5, '�����', '����������', 1000, 'passed', 'passed', 'not passed');
(28, '��������', '�������', '��������������', to_date('2022/01/01', 'yyyy/mm/dd'), '(123) 123-1299', 1, '�������', '����������', 1000, 'passed', 'passed', 'passed');
end;