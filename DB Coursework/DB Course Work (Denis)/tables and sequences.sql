-- tables and sequences creation

create sequence Logins_ID_SEQ; -- logins
create table Logins
(Login_ID int default Logins_ID_SEQ.nextval not null,
Login_Name nvarchar2(30),
Password nvarchar2(100),
Access_Rights nvarchar2(10),
constraint Check_Access_Rights check (Access_Rights in ('admin', 'teacher', 'instructor', 'student')),
constraint Login_PK primary key (Login_ID));


create sequence Admins_ID_SEQ; -- admins
create table Admins 
(Admin_ID int default Admins_ID_SEQ.nextval not null,
Login_ID int not null,
Surname nvarchar2(50),
Name nvarchar2(50),
Patronim nvarchar2(50),
Birthday date,
Phone_Number nvarchar2(20),
Position nvarchar2(50),
Salary int,
constraint Check_Salary check (Salary > 0),
Date_Of_Entry date,
constraint Admin_PK primary key (Admin_ID));


create sequence Autodromes_ID_SEQ; -- autodromes
create table Autodromes 
(Autodrome_ID int default Autodromes_ID_SEQ.nextval not null,
Address nvarchar2(60) not null,
Num int unique,
constraint Autodrome_PK primary key (Autodrome_ID));


create table Autoes -- autoes
(Brand nvarchar2(40),
Model nvarchar2(40),
Autodrome int not null,
Num nvarchar2(15) primary key);


create sequence Instructors_ID_SEQ; -- instructors
create table Instructors
(Instructor_ID int default Instructors_ID_SEQ.nextval not null,
Login_ID int not null,
Surname nvarchar2(50) unique,
Name nvarchar2(50),
Patronim nvarchar2(50),
Birthday date,
Phone_Number nvarchar2(20),
Salary int,
constraint Check_Salary2 check (Salary > 0),
Date_Of_Entry date,
Auto_Number nvarchar2(15) not null,
constraint Instructor_PK primary key (Instructor_ID));


create sequence Teachers_ID_SEQ; -- teachers
create table Teachers
(Teacher_ID int default Teachers_ID_SEQ.nextval not null,
Login_ID int not null,
Surname nvarchar2(50) unique,
Name nvarchar2(50),
Patronim nvarchar2(50),
Birthday date,
Phone_Number nvarchar2(20),
Salary int,
constraint Check_Salary3 check (Salary > 0),
Date_Of_Entry date,
Category nvarchar2(5),
constraint Check_Category check (Category in ('A', 'A1', 'B', 'C', 'D', 'E')),
constraint Teacher_PK primary key (Teacher_ID));


create sequence Schools_ID_SEQ; -- schools
create table Schools 
(School_ID int default Schools_ID_SEQ.nextval not null,
Address nvarchar2(100) unique,
Num int,
constraint Check_Num check (Num > 0),
constraint School_PK primary key (School_ID));


create table Cabinets -- cabinets
(Num int primary key,
School nvarchar2(100) not null,
constraint Check_Num2 check (Num > 0));


create sequence Groups_ID_SEQ; -- groups
create table Groups 
(Group_ID int default Groups_ID_SEQ.nextval not null,
Start_Date date,
End_Date date,
Teacher nvarchar2(50) not null,
Instructor nvarchar2(50) not null,
Number_Of_Students int,
constraint Check_Number_Of_Students check (Number_Of_Students > 0),
Category nvarchar2(5),
constraint Check_Category2 check (Category in ('A', 'A1', 'B', 'C', 'D', 'E')),
School nvarchar2(100) not null,
Cabinet int not null,
Lesson_Day nvarchar2(20),
constraint Check_Day check (Lesson_Day in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
constraint Group_PK primary key (Group_ID));


create sequence Students_ID_SEQ; -- students
create table Students
(Student_ID int default Students_ID_SEQ.nextval not null,
Login_ID int not null,
Surname nvarchar2(50),
Name nvarchar2(50),
Patronim nvarchar2(50),
Birthday date,
Phone_Number nvarchar2(20),
Study_Group int not null,
Teacher nvarchar2(50) not null,
Instructor nvarchar2(50) not null,
Payment int,
constraint Check_Payment check (Payment <= 1000 and Payment >= 0),
Exam1 nvarchar2(20),
constraint Check_Exam1 check (Exam1 in ('passed', 'not passed')),
Exam2 nvarchar2(20),
constraint Check_Exam2 check (Exam2 in ('passed', 'not passed')),
Exam3 nvarchar2(20),
constraint Check_Exam3 check (Exam3 in ('passed', 'not passed')),
constraint Student_PK primary key (Student_ID));


alter table Admins add constraint Admin_FK foreign key (Login_ID) references Logins(Login_ID); -- foreign keys
alter table Autoes add constraint Auto_FK foreign key (Autodrome) references Autodromes(Num);
alter table Instructors add constraint Instructor_FK foreign key (Login_ID) references Logins(Login_ID);
alter table Instructors add constraint Instructor_FK2 foreign key (Auto_Number) references Autoes(Num);
alter table Teachers add constraint Teacher_FK foreign key (Login_ID) references Logins(Login_ID);
alter table Cabinets add constraint Cabinet_FK foreign key (School) references Schools(Address);
alter table Groups add constraint Group_FK foreign key (Teacher) references Teachers(Surname);
alter table Groups add constraint Group_FK2 foreign key (Instructor) references Instructors(Surname);
alter table Groups add constraint Group_FK3 foreign key (School) references Schools(Address);
alter table Groups add constraint Group_FK4 foreign key (Cabinet) references Cabinets(Num);
alter table Students add constraint Student_FK foreign key (Study_Group) references Groups(Group_ID);
alter table Students add constraint Student_FK2 foreign key (Login_ID) references Logins(Login_ID);
alter table Students add constraint Student_FK3 foreign key (Teacher) references Teachers(Surname);
alter table Students add constraint Student_FK4 foreign key (Instructor) references Instructors(Surname);

--drop table Groups;
--drop table Cabinets;
--drop table Schools;
--drop table Teachers;
--drop table Instructors;
--drop table Autodromes;
--drop table Autoes;
--drop table Admins;
--drop table Logins;

