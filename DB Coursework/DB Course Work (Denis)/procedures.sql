-- procedures

-- logins

create or replace procedure AddLogin(ILogin_Name Logins.Login_Name%type, IPassword Logins.Password%type, IAccess_Rights
Logins.Access_Rights%type)
is
begin
    insert into Logins (Login_Name, Password, Access_Rights)
    values (ILogin_Name, IPassword, IAccess_Rights);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteLoginID(ILogin_ID Logins.Login_ID%type) ----
is
begin
    delete from Logins where Login_ID = ILogin_ID;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteLoginName(ILogin_Name Logins.Login_Name%type) ----
is
begin
    delete from Logins where Login_Name = ILogin_Name;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteLoginAccessRights(IAccess_Rights Logins.Access_Rights%type) ----
is
begin
    delete from Logins where Access_Rights = IAccess_Rights;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- admins

create or replace procedure AddAdmin(ILogin_ID Admins.Login_ID%type,
ISurname Admins.Surname%type,
IName Admins.Name%type,
IPatronim Admins.Patronim%type,
IBirthday Admins.Birthday%type,
IPhone_Number Admins.Phone_Number%type,
IPosition Admins.Position%type,
ISalary Admins.Salary%type,
IDate_Of_Entry Admins.Date_Of_Entry%type)
is
begin
    insert into Admins (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Position, Salary, Date_Of_Entry)
    values (ILogin_ID, ISurname, IName, IPatronim, IBirthday, IPhone_Number, IPosition, ISalary, IDate_Of_Entry);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateAdmin(ILogin_ID Admins.Login_ID%type,
ISurname Admins.Surname%type,
IName Admins.Name%type,
IPatronim Admins.Patronim%type,
IBirthday Admins.Birthday%type,
IPhone_Number Admins.Phone_Number%type,
IPosition Admins.Position%type,
ISalary Admins.Salary%type,
IDate_Of_Entry Admins.Date_Of_Entry%type)
is
begin
    update Admins set
    Login_ID = ILogin_ID,
    Surname = ISurname,
    Name = IName,
    Patronim = IPatronim,
    Birthday = IBirthday,
    Phone_Number = IPhone_Number,
    Position = IPosition,
    Salary = ISalary,
    Date_Of_Entry = IDate_Of_Entry;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- autodromes

create or replace procedure AddAutodrome(IAddress Autodromes.Address%type,
INum Autodromes.Num%type)
is
begin
    insert into Autodromes (Address, Num)
    values (IAddress, INum);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteAutodrome(IAutodrome_ID Autodromes.Autodrome_ID%type)
is
begin
    delete from Autodromes where Autodrome_ID = IAutodrome_ID;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- autoes

create or replace procedure AddAuto(IBrand Autoes.Brand%type,
IModel Autoes.Model%type,
IAutodrome Autoes.Autodrome%type,
INum Autoes.Num%type)
is
begin
    insert into Autoes (Brand, Model, Autodrome, Num)
    values (IBrand, IModel, IAutodrome, INum);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteAuto(INum Autoes.Num%type)
is
begin
    delete from Autoes where Num = INum;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteAutoBrand(IBrand Autoes.Brand%type) ----
is
begin
    delete from Autoes where Brand = IBrand;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteAutoModel(IModel Autoes.Model%type) ----
is
begin
    delete from Autoes where Model = IModel;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- instructors

create or replace procedure AddInstructor(ILogin_ID Instructors.Login_ID%type,
ISurname Instructors.Surname%type,
IName Instructors.Name%type,
IPatronim Instructors.Patronim%type,
IBirthday Instructors.Birthday%type,
IPhone_Number Instructors.Phone_Number%type,
ISalary Instructors.Salary%type,
IDate_Of_Entry Instructors.Date_Of_Entry%type,
IAuto_Number Instructors.Auto_Number%type)
is
begin
    insert into Instructors (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Salary, Date_Of_Entry, Auto_Number)
    values (ILogin_ID, ISurname, IName, IPatronim, IBirthday, IPhone_Number, ISalary, IDate_Of_Entry, IAuto_Number);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateInstructor(ILogin_ID Instructors.Login_ID%type,
ISurname Instructors.Surname%type,
IName Instructors.Name%type,
IPatronim Instructors.Patronim%type,
IBirthday Instructors.Birthday%type,
IPhone_Number Instructors.Phone_Number%type,
ISalary Instructors.Salary%type,
IDate_Of_Entry Instructors.Date_Of_Entry%type,
IAuto_Number Instructors.Auto_Number%type)
is
begin
    update Instructors set
    Login_ID = ILogin_ID,
    Surname = ISurname,
    Name = IName,
    Patronim = IPatronim,
    Birthday = IBirthday,
    Phone_Number = IPhone_Number,
    Salary = ISalary,
    Date_Of_Entry = IDate_Of_Entry,
    Auto_Number = IAuto_Number;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- teachers

create or replace procedure AddTeacher(ILogin_ID Teachers.Login_ID%type,
ISurname Teachers.Surname%type,
IName Teachers.Name%type,
IPatronim Teachers.Patronim%type,
IBirthday Teachers.Birthday%type,
IPhone_Number Teachers.Phone_Number%type,
ISalary Teachers.Salary%type,
IDate_Of_Entry Teachers.Date_Of_Entry%type,
ICategory Teachers.Category%type)
is
begin
    insert into Teachers (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Salary, Date_Of_Entry, Category)
    values (ILogin_ID, ISurname, IName, IPatronim, IBirthday, IPhone_Number, ISalary, IDate_Of_Entry, ICategory);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateTeacher(ILogin_ID Teachers.Login_ID%type,
ISurname Teachers.Surname%type,
IName Teachers.Name%type,
IPatronim Teachers.Patronim%type,
IBirthday Teachers.Birthday%type,
IPhone_Number Teachers.Phone_Number%type,
ISalary Teachers.Salary%type,
IDate_Of_Entry Teachers.Date_Of_Entry%type,
ICategory Teachers.Category%type)
is
begin
    update Teachers set
    Login_ID = ILogin_ID,
    Surname = ISurname,
    Name = IName,
    Patronim = IPatronim,
    Birthday = IBirthday,
    Phone_Number = IPhone_Number,
    Salary = ISalary,
    Date_Of_Entry = IDate_Of_Entry,
    Category = ICategory;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- schools

create or replace procedure AddSchool(IAddress Schools.Address%type,
INum Schools.Num%type)
is
begin
    insert into Schools (Address, Num)
    values (IAddress, INum);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteSchool(ISchool_ID Schools.School_ID%type)
is
begin
    delete from Schools where School_ID = ISchool_ID;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- cabinets

create or replace procedure AddCabinet(INum Cabinets.Num%type,
ISchool Cabinets.School%type)
is
begin
    insert into Cabinets (Num, School)
    values (INum, ISchool);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteCabinet(INum Cabinets.Num%type)
is
begin
    delete from Cabinets where Num = INum;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- groups

create or replace procedure AddGroup(IStart_Date Groups.Start_Date%type,
IEnd_Date Groups.End_Date%type,
ITeacher Groups.Teacher%type,
IInstructor Groups.Instructor%type,
INumber_Of_Students Groups.Number_Of_Students%type,
ICategory Groups.Category%type,
ISchool Groups.School%type,
ICabinet Groups.Cabinet%type,
ILesson_Day Groups.Lesson_Day%type)
is
begin
    insert into Groups (Start_Date, End_Date, Teacher, Instructor, Number_Of_Students, Category, School, Cabinet, Lesson_Day)
    values (IStart_Date, IEnd_Date, ITeacher, IInstructor, INumber_Of_Students, ICategory, ISchool, ICabinet, ILesson_Day);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateGroup(IStart_Date Groups.Start_Date%type,
IEnd_Date Groups.End_Date%type,
ITeacher Groups.Teacher%type,
IInstructor Groups.Instructor%type,
INumber_Of_Students Groups.Number_Of_Students%type,
ICategory Groups.Category%type,
ISchool Groups.School%type,
ICabinet Groups.Cabinet%type,
ILesson_Day Groups.Lesson_Day%type)
is
begin
    update Groups set
    Start_Date = IStart_Date,
    End_Date = IEnd_Date,
    Teacher = ITeacher,
    Instructor = IInstructor,
    Number_Of_Students = INumber_Of_Students,
    Category = ICategory,
    School = ISchool,
    Cabinet = ICabinet,
    Lesson_Day = ILesson_Day;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- students

create or replace procedure AddStudent(ILogin_ID Students.Login_ID%type,
ISurname Students.Surname%type,
IName Students.Name%type,
IPatronim Students.Patronim%type,
IBirthday Students.Birthday%type,
IPhone_Number Students.Phone_Number%type,
IStudy_Group Students.Study_Group%type,
ITeacher Students.Teacher%type,
IInstructor Students.Instructor%type,
IPayment Students.Payment%type,
IExam1 Students.Exam1%type,
IExam2 Students.Exam2%type,
IExam3 Students.Exam3%type)
is
begin
    insert into Students (Login_ID, Surname, Name, Patronim, Birthday, Phone_Number, Study_Group, Teacher, Instructor, Payment, Exam1, Exam2, Exam3)
    values (ILogin_ID, ISurname, IName, IPatronim, IBirthday, IPhone_Number, IStudy_Group, ITeacher, IInstructor, IPayment, IExam1, IExam2, IExam3);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateStudent(ILogin_ID Teachers.Login_ID%type,
ISurname Students.Surname%type,
IName Students.Name%type,
IPatronim Students.Patronim%type,
IBirthday Students.Birthday%type,
IPhone_Number Students.Phone_Number%type,
IStudy_Group Students.Study_Group%type,
ITeacher Students.Teacher%type,
IInstructor Students.Instructor%type,
IPayment Students.Payment%type,
IExam1 Students.Exam1%type,
IExam2 Students.Exam2%type,
IExam3 Students.Exam3%type)
is
begin
    update Students set
    Login_ID = ILogin_ID,
    Surname = ISurname,
    Name = IName,
    Patronim = IPatronim,
    Birthday = IBirthday,
    Phone_Number = IPhone_Number,
    Study_Group = IStudy_Group,
    Teacher = ITeacher,
    Instructor = IInstructor,
    Payment = IPayment,
    Exam1 = IExam1,
    Exam2 = IExam2,
    Exam3 = IExam3;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- others

declare procedure ViewGroupInfo(IGroup_ID Groups.Group_ID%type)
is
cursor group_cursor is select Group_ID,
Start_Date,
End_Date,
Teacher,
Instructor,
Number_Of_Students,
Category
from Groups where Group_ID = IGroup_ID;
begin
    for any_group in group_cursor
    loop
        dbms_output.put_line(any_group.Group_ID || ' ' ||
        any_group.Start_Date || ' ' ||
        any_group.End_Date || ' ' ||
        any_group.Teacher || ' ' ||
        any_group.Instructor || ' ' ||
        any_group.Number_Of_Students || ' ' ||
        any_group.Category || ' ');
    end loop;
end;
begin
    ViewGroupInfo(1);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure ViewStudentsExams(IStudent_ID Students.Student_ID%type)
is
cursor student_cursor is select Student_ID,
Exam1,
Exam2,
Exam3
from Students where Student_ID = IStudent_ID;
begin
    for any_student in student_cursor
    loop
        dbms_output.put_line(any_student.Student_ID || ' ' ||
        any_student.Exam1 || ' ' ||
        any_student.Exam2 || ' ' ||
        any_student.Exam3 || ' ');
    end loop;
end;
begin
    ViewStudentsExams(1);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure ViewStudentsInfoByGroup(IGroup_ID Students.Study_Group%type)
is
cursor students_cursor is select Student_ID,
Surname,
Name,
Patronim,
Birthday,
Phone_Number,
Study_Group
from Students where Study_Group = IGroup_ID;
begin
    for any_student in students_cursor
    loop
        dbms_output.put_line(any_student.Student_ID || ' ' ||
        any_student.Surname || ' ' ||
        any_student.Name || ' ' ||
        any_student.Patronim || ' ' ||
        any_student.Birthday || ' ' ||
        any_student.Phone_Number || ' ' ||
        any_student.Study_Group || ' ');
    end loop;
end;
begin
    ViewStudentsInfoByGroup(1);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;
