create table technologies
(name nvarchar2(20) primary key,
difficulty int,
number_of_projects int,
constraint check_difficulty1 check (difficulty in (1, 2, 3, 4, 5)));

create sequence teams_id_seq;
create table teams
(team_id int default teams_id_seq.nextval not null,
name nvarchar2(50),
technology nvarchar2(20),
constraint team_pk primary key (team_id));

create sequence projects_id_seq;
create table projects
(project_id int default projects_id_seq.nextval not null,
name nvarchar2(50),
description nvarchar2(300),
team int,
constraint project_pk primary key (project_id));

create table languages
(name nvarchar2(30) primary key,
difficulty int,
constraint check_difficulty2 check (difficulty in (1, 2, 3, 4, 5)));

create sequence mentors_id_seq;
create table mentors 
(mentor_id int default mentors_id_seq.nextval not null,
surname nvarchar2(50) unique,
name nvarchar2(50),
patronim nvarchar2(50),
phone_number nvarchar2(20),
skype nvarchar2(30),
position nvarchar2(50),
date_of_entry date,
team int,
language nvarchar2(30),
language_level nvarchar2(5),
constraint mentor_pk primary key (mentor_id),
constraint check_language_level1 check (language_level in ('A1', 'A2', 'B1', 'B2', 'C1', 'C2')));

create sequence sandboxes_id_seq;
create table sandboxes
(sandbox_id int default sandboxes_id_seq.nextval not null,
name nvarchar2(50),
create_date date,
start_date date,
end_date date,
number_of_candidates int,
mentor nvarchar2(50),
constraint sandbox_pk primary key (sandbox_id));

create sequence candidates_id_seq;
create table candidates 
(candidate_id int default candidates_id_seq.nextval not null,
surname nvarchar2(50) unique,
name nvarchar2(50),
patronim nvarchar2(50),
phone_number nvarchar2(20),
skype nvarchar2(30),
date_of_entry date,
mentor nvarchar2(50),
sandbox int,
language nvarchar2(30),
language_level nvarchar2(5),
status nvarchar2(30),
tasks_completed int,
constraint candidate_pk primary key (candidate_id),
constraint check_language_level2 check (language_level in ('A1', 'A2', 'B1', 'B2', 'C1', 'C2')),
constraint check_status check (status in ('not started', 'started', 'completed')));

create sequence feedback_id_seq;
create table feedbacks
(feedback_id int default feedback_id_seq.nextval not null,
mentor nvarchar2(50), 
candidate nvarchar2(50),
description nvarchar2(300),
constraint feedback_pk primary key (feedback_id));


alter table teams add constraint team_fk foreign key (technology) references technologies(name); --foreign keys
alter table projects add constraint project_fk foreign key (team) references teams(team_id);
alter table mentors add constraint mentor_fk1 foreign key (team) references teams(team_id);
alter table mentors add constraint mentor_fk2 foreign key (language) references languages(name);
alter table sandboxes add constraint sandbox_fk foreign key (mentor) references mentors(surname);
alter table candidates add constraint candidate_fk1 foreign key (mentor) references mentors(surname);
alter table candidates add constraint candidate_fk2 foreign key (sandbox) references sandboxes(sandbox_id);
alter table candidates add constraint candidate_fk3 foreign key (language) references languages(name);
alter table feedbacks add constraint feedback_fk1 foreign key (mentor) references mentors(surname);
alter table feedbacks add constraint feedback_fk2 foreign key (candidate) references candidates(surname);


