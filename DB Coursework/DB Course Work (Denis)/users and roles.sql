-- roles

create role Admin_Role;

grant all on Logins to Admin_Role;
grant all on Admins to Admin_Role;
grant all on Autodromes to Admin_Role;
grant all on Autoes to Admin_Role;
grant all on Instructors to Admin_Role;
grant all on Teachers to Admin_Role;
grant all on Schools to Admin_Role;
grant all on Cabinets to Admin_Role;
grant all on Groups to Admin_Role;
grant all on Students to Admin_Role;

create role Instructor_Role;

grant all on Autoes to Instructor_Role;

create role Teacher_Role;

grant all on Groups to Teacher_Role;
grant all on Students to Teacher_Role;

create role Student_Role;

grant select on Autodromes to Student_Role;
grant select on Autoes to Student_Role;
grant select on Schools to Student_Role;
grant select on Cabinets to Student_Role;
grant select on Groups to Student_Role;
grant select on Students to Student_Role;

-- users

create user Denis password expire;
grant Admin_Role to Denis;

create user Anton password expire;
grant Instructor_Role to Anton;

create user Makar password expire;
grant Teacher_Role to Makar;

create user Daniil password expire;
grant Student_Role to Daniil;