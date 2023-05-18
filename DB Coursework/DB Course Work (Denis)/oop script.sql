use master --создание бд
create database Autoschool
use Autoschool



create table Logins --создание таблицы Logins
(Login_ID int primary key identity(1,1),
Login_Name nvarchar(50),
Password nvarchar(50),
Access_Rights nvarchar(50) check (Access_Rights in ('admin', 'teacher', 'instructor', 'student')))

insert into Logins (Login_Name, Password, Access_Rights) values --заполнение таблицы Logins
('bozhko', '12345678', 'admin'),
('bovkun', '12345678', 'admin'),
('kasperovich', '12345678', 'admin'),
('lityagin', '12345678', 'admin'),
('velichko', '12345678', 'admin'),
('dezhemesov', '12345678', 'admin'),
('patsei', '123456', 'teacher'),
('beloded', '123456', 'teacher'),
('blinova', '123456', 'teacher'),
('asmykovich', '123456', 'teacher'),
('gurin', '123456', 'teacher'),
('grinyuk', '123456', 'teacher'),
('barkovskiy', '12345', 'instructor'),
('sukhorukova', '12345', 'instructor'),
('korenkova', '12345', 'instructor'),
('sulim', '12345', 'instructor'),
('brusentsova', '12345', 'instructor'),
('motolyanets', '1234', 'student'),
('lappo', '1234', 'student'),
('orlov', '1234', 'student'),
('narkevich', '1234', 'student'),
('yushkevich', '1234', 'student'),
('solodukha', '1234', 'student'),
('dunaeva', '1234', 'student'),
('potapeiko', '1234', 'student'),
('murugin', '1234', 'student'),
('konoplyanik', '1234', 'student'),
('savelev', '1234', 'student')



create table Admins --создание таблицы Admins
(Admin_ID int primary key identity(1,1),
Login_ID int foreign key (Login_ID) references Logins(Login_ID),
Surname nvarchar(50),
Name nvarchar(50),
Patronim nvarchar(50),
Birthday date,
Phone_Number nvarchar(50),
Position nvarchar(50),
Salary int check (Salary >= 0),
Date_Of_Entry date)

insert into Admins (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Position, Salary, Date_Of_Entry) values --заполняем таблицу Admins
(1, 'Божко', 'Денис', 'Владимирович', '2001-11-09', '(123) 123-1234', 'Генеральный директор', 9999, '2017-09-01'), 
(2, 'Бовкун', 'Николай', 'Николаевич', '2002-01-01', '(123) 123-1200', 'Директор', 99999, '2018-09-02'), 
(3, 'Касперович', 'Евгения', 'Журналистикина', '1999-11-09', '(123) 123-0234', 'Секретарь', 500, '2017-11-08'), 
(4, 'Литягин', 'Антон', 'Анимешкович', '2001-09-09', '(123) 199-1234', 'Инженер-программист', 1001, '2015-09-07'), 
(5, 'Величко', 'Валерий', 'Альбертович', '2002-05-05', '(123) 101-1234', 'Senior C# Developer', 9090, '2011-04-09'), 
(6, 'Дежемесов', 'Макар', 'Татаринов', '2001-10-10', '(523) 123-1234', 'Уборщик', 12, '2002-09-20')



create table Autodromes --создание таблицы Autodromes
(Autodrome_ID int primary key identity(1,1),
Address nvarchar(100),
Number int unique check (Number > 0))

insert into Autodromes (Address, Number) values --заполняем таблицу Autodromes
('г. Брест, ул. Ульяновская, 41', 12),
('г. Брест, ул. Ленинградская, 41А', 1),
('г. Кобрин, ул. Кобринская, 1', 15),
('г. Столин, ул. Деревенская, 15', 13),
('г. Береза, ул. Советская, 3', 8),
('г. Дрогичин, ул. Дрогичинская, 10', 10)



create table Autoes --создание таблицы Autoes
(Brand nvarchar(50),
Model nvarchar(50),
Number nvarchar(50) primary key,
Autodrome int foreign key (Autodrome) references Autodromes(Number))

insert into Autoes (Brand, Model, Number, Autodrome) values --заполняем таблицу Autos
('Toyota', 'Corolla', 'MK1278', 12),
('Toyota', 'Yaris', 'MS1278', 12),
('Renault', 'Logan', 'LL0178', 1),
('МАЗ', 'Большой', 'PF4578', 1),
('ДЭУ', 'Матиз', 'AB1234', 15),
('Toyota', 'Yaris', 'MW9999', 15),
('Chevrolet', 'Красная', 'GH1278', 13),
('Lada', 'X-Ray', 'BY4098', 13),
('Volvo', 'Крутая', 'MS0078', 8),
('BMW', 'M3 GTR', 'EE7777', 8),
('Toyota', 'Supra', 'QW1248', 10),
('Dodge', 'Challenger', 'BX3998', 10),
('Lamborghini', 'Gallardo', 'SZ141', 12)



create table Instructors --создание таблицы Instructors
(Instructor_ID int primary key identity(1,1),
Login_ID int foreign key (Login_ID) references Logins(Login_ID),
Surname nvarchar(50) unique,
Name nvarchar(50),
Patronim nvarchar(50),
Birthday date,
Phone_Number nvarchar(50),
Salary int check (Salary >= 0),
Date_Of_Entry date,
Auto_Number nvarchar(50) foreign key (Auto_Number) references Autoes(Number))

insert into Instructors (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Salary, Date_Of_Entry, Auto_Number) values --заполняем таблицу Instructors
(13, 'Барковский', 'Евгений', 'Валерьевич', '1990-10-09', '(133) 123-1234', 1700, '2017-09-01', 'EE7777'), 
(14, 'Сухорукова', 'Ирина', 'Геннадьевна', '1985-04-01', '(123) 153-1234', 1800, '2016-09-09', 'MK1278'), 
(15, 'Коренькова', 'Анастасия', 'Александровна', '1995-01-15', '(123) 123-1884', 1400, '2020-08-31', 'SZ141'), 
(16, 'Сулим', 'Павел', 'Евгеньевич', '1982-07-22', '(123) 123-7834', 1700, '2016-02-04', 'GH1278'), 
(17, 'Брусенцова', 'Татьяна', 'Палладьевна', '1965-01-15', '(103) 123-1234', 1900, '2012-09-01', 'BY4098')



create table Teachers --создание таблицы Teachers
(Teacher_ID int primary key identity(1,1),
Login_ID int foreign key (Login_ID) references Logins(Login_ID),
Surname nvarchar(50) unique,
Name nvarchar(50),
Patronim nvarchar(50),
Birthday date,
Phone_Number nvarchar(50),
Salary int check (Salary >= 0),
Date_Of_Entry date,
Category nvarchar(50) check (Category in ('A', 'A1', 'B', 'C', 'D', 'E')))

insert into Teachers (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Salary, Date_Of_Entry, Category) values
(7, 'Пацей', 'Наталья', 'Владимировна', '1980-01-05', '(123) 003-1234', 2000, '2017-07-01', 'A'), 
(8, 'Белодед', 'Николай', 'Николаевич', '1978-09-09', '(173) 123-1234', 1900, '2014-09-15', 'A1'), 
(9, 'Блинова', 'Евгения', 'Александровна', '1990-10-09', '(123) 123-1239', 1950, '2015-07-30', 'B'), 
(10, 'Асмыкович', 'Иван', 'Кузьмич', '1960-04-21', '(773) 123-1234', 1400, '2007-02-02', 'C'), 
(11, 'Гурин', 'Николай', 'Николаевич', '1970-12-12', '(124) 123-1234', 1800, '2017-01-03', 'D'), 
(12, 'Гринюк', 'Дмитрий', 'Анатольевич', '1980-10-09', '(123) 123-1434', 1800, '2017-09-01', 'E')



create table Schools --создание таблицы Schools
(School_ID int primary key identity(1,1),
Address nvarchar(100) unique,
Number int unique check (Number > 0))

insert into Schools (Address, Number) values --заполнение таблицы Schools
('г. Брест, ул. Московская, 157', 4),
('г. Брест, ул. Советской Конституции, 2', 2),
('г. Кобрин, ул. Божко, 77', 77),
('г. Столин, ул. Столичная, 14', 7),
('г. Береза, ул. Коли Бовкуна, 1', 10),
('г. Дрогичин, ул. Магическая, 47', 22)



create table Cabinets --создание таблицы Cabinets
(Number int primary key check (Number > 0),
School nvarchar(100) foreign key (School) references Schools(Address))

insert into Cabinets (Number, School) values --заполнение таблицы Cabinets
(101, 'г. Брест, ул. Московская, 157'),
(102, 'г. Брест, ул. Московская, 157'),
(15, 'г. Брест, ул. Московская, 157'),
(14, 'г. Брест, ул. Московская, 157'),
(100, 'г. Брест, ул. Советской Конституции, 2'),
(17, 'г. Брест, ул. Советской Конституции, 2'),
(1, 'г. Кобрин, ул. Божко, 77'),
(2, 'г. Кобрин, ул. Божко, 77'),
(103, 'г. Столин, ул. Столичная, 14'),
(3, 'г. Береза, ул. Коли Бовкуна, 1'),
(134, 'г. Дрогичин, ул. Магическая, 47')



create table Groups --создание таблицы Groups
(Group_ID int primary key identity(1,1),
Start_Date date,
End_Date date,
Teacher nvarchar(50) foreign key (Teacher) references Teachers(Surname),
Instructor nvarchar(50) foreign key (Instructor) references Instructors(Surname),
Number_Of_Students int check (Number_Of_Students > 0),
Category nvarchar(50) check (Category in ('A', 'A1', 'B', 'C', 'D', 'E')),
School nvarchar(100) foreign key (School) references Schools(Address),
Cabinet int foreign key (Cabinet) references Cabinets(Number),
Lesson_Day nvarchar(50) check (Lesson_Day in ('Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье')),
Lesson_Time time(0))

insert into Groups (Start_Date, End_Date, Teacher, Instructor, Number_Of_Students, Category, School, Cabinet, Lesson_Day, Lesson_Time) values --заполнение таблицы Groups
('2012-07-07', '2012-10-07', 'Белодед', 'Барковский', 20, 'A1', 'г. Столин, ул. Столичная, 14', 103, 'Понедельник', '09:00'),
('2012-10-07', '2013-01-07', 'Пацей', 'Брусенцова', 15, 'A', 'г. Брест, ул. Московская, 157', 101, 'Суббота', '20:00'),
('2018-10-07', '2019-01-07', 'Пацей', 'Сулим', 16, 'A', 'г. Брест, ул. Советской Конституции, 2', 100, 'Воскресенье', '09:00'),
('2020-01-01', '2020-04-01', 'Блинова', 'Сухорукова', 15, 'B', 'г. Дрогичин, ул. Магическая, 47', 134, 'Пятница', '18:00'),
('2021-01-01', '2021-04-01', 'Гурин', 'Коренькова', 14, 'D', 'г. Кобрин, ул. Божко, 77', 1, 'Пятница', '18:00')




create table Students --создание таблицы Students
(Student_ID int primary key identity(1,1),
Login_ID int foreign key (Login_ID) references Logins(Login_ID),
Surname nvarchar(50),
Name nvarchar(50),
Patronim nvarchar(50),
Birthday date,
Phone_Number nvarchar(50),
Study_Group int foreign key (Study_Group) references Groups(Group_ID),
Teacher nvarchar(50) foreign key (Teacher) references Teachers(Surname),
Instructor nvarchar(50) foreign key (Instructor) references Instructors(Surname),
Payment int check (Payment <= 1000 and Payment >= 0),
Exam1 nvarchar(50) check (Exam1 in ('passed', 'not passed')),
Exam2 nvarchar(50) check (Exam2 in ('passed', 'not passed')),
Exam3 nvarchar(50) check (Exam3 in ('passed', 'not passed')))

insert into Students (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Study_Group, Teacher, Instructor, Payment, Exam1, Exam2, Exam3) values --заполняем таблицу Students
(18, 'Мотолянец', 'Екатерина', 'Сергеевна', '2001-01-01', '(166) 123-1234', 2, 'Пацей', 'Брусенцова', 1000, 'passed', 'passed', 'passed'),
(19, 'Лаппо', 'Александра', 'Отчество', '2002-03-05', '(123) 663-1234', 1, 'Белодед', 'Барковский', 1000, 'passed', 'passed', 'not passed'),
(20, 'Орлов', 'Артем', 'Александрович', '2001-12-20', '(123) 166-1234', 3, 'Пацей', 'Сулим', 999, 'passed', 'passed', 'passed'),
(21, 'Наркевич', 'Вадим', 'Кмсович', '2002-01-01', '(123) 123-6634', 4, 'Блинова', 'Сухорукова', 750, 'not passed', 'passed', 'passed'),
(22, 'Солодуха', 'Яна', 'Отчествовна', '2001-11-01', '(663) 123-1234', 2, 'Пацей', 'Брусенцова', 1000, 'passed', 'passed', 'passed'),
(23, 'Юшкевич', 'Илья', 'Белодедович', '2002-01-31', '(124) 123-1234', 1, 'Белодед', 'Барковский', 1000, 'passed', 'passed', 'passed'),
(24, 'Дунаева', 'Ульяна', 'Логойсковна', '2001-11-01', '(123) 993-1234', 2, 'Пацей', 'Брусенцова', 1000, 'passed', 'not passed', 'passed'),
(25, 'Потапейко', 'Полина', 'Пшековна', '2000-01-01', '(123) 123-1266', 3, 'Пацей', 'Сулим', 900, 'not passed', 'passed', 'not passed'),
(26, 'Муругин', 'Вячеслав', 'Муругмна', '2001-11-01', '(123) 103-1234', 4, 'Блинова', 'Сухорукова', 1000, 'passed', 'passed', 'passed'),
(27, 'Конопляник', 'Егор', 'Скейтбордович', '2000-05-21', '(123) 123-1284', 5, 'Гурин', 'Коренькова', 1000, 'passed', 'passed', 'not passed'),
(28, 'Савельев', 'Дмитрий', 'Линкинпаркович', '2002-01-01', '(123) 123-1299', 1, 'Белодед', 'Барковский', 1000, 'passed', 'passed', 'passed')