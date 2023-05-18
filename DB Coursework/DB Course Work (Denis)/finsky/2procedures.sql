create or replace procedure add_technology(iname technologies.name%type, --technologies --?????
idifficulty technologies.difficulty%type,
inumber_of_projects technologies.number_of_projects%type)
is
begin
    insert into technologies (name, difficulty, number_of_projects)
    values (iname, idifficulty, inumber_of_projects);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_technology(iname technologies.name%type)
is
begin
    delete from technologies where name = iname;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_technology_difficulty(idifficulty technologies.difficulty%type)
is
begin
    delete from technologies where difficulty = idifficulty;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_technology(iname technologies.name%type,
idifficulty technologies.difficulty%type,
inumber_of_projects technologies.number_of_projects%type)
is
begin
    update technologies set
	difficulty = idifficulty,
	number_of_projects = inumber_of_projects
	where name = iname;
	exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_team(iname teams.name%type, --teams
itechnology teams.technology%type)
is
begin
    insert into teams (name, technology)
    values (iname, itechnology);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_team(iteam_id teams.team_id%type,
iname teams.name%type, 
itechnology teams.technology%type)
is
begin
    update teams set
	name = iname,
	technology = itechnology
	where team_id = iteam_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_team(iteam_id teams.team_id%type)
is
begin
    delete from teams where team_id = iteam_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_team_name(iname teams.name%type)
is
begin
    delete from teams where name = iname;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_project(iname projects.name%type, --projects
idescription projects.description%type,
iteam projects.team%type)
is
begin
    insert into projects (name, description, team)
    values (iname, idescription, iteam);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_project(iproject_id projects.project_id%type,
iname projects.name%type,
idescription projects.description%type,
iteam projects.team%type)
is
begin
    update projects set
	name = iname,
	description = idescription,
	team = iteam
	where project_id = iproject_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_language(iname languages.name%type, --languages
idifficulty languages.difficulty%type)
is
begin
    insert into languages (name, difficulty)
    values (iname, idifficulty);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_mentor(isurname mentors.surname%type, --mentors
iname mentors.name%type,
ipatronim mentors.patronim%type,
iphone_number mentors.phone_number%type,
iskype mentors.skype%type,
iposition mentors.position%type,
idate_of_entry mentors.date_of_entry%type,
iteam mentors.team%type,
ilanguage mentors.language%type,
ilanguage_level mentors.language_level%type)
is
begin
    insert into mentors (surname, name, patronim, phone_number, skype, position, date_of_entry, team, language, language_level)
    values (isurname, iname, ipatronim, iphone_number, iskype, iposition, idate_of_entry, iteam, ilanguage, ilanguage_level);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_mentor(imentor_id mentors.mentor_id%type,
isurname mentors.surname%type,
iname mentors.name%type,
ipatronim mentors.patronim%type,
iphone_number mentors.phone_number%type,
iskype mentors.skype%type,
iposition mentors.position%type,
idate_of_entry mentors.date_of_entry%type,
iteam mentors.team%type,
ilanguage mentors.language%type,
ilanguage_level mentors.language_level%type)
is
begin
    update mentors set
	surname = isurname,
	name = iname,
	patronim = ipatronim,
	phone_number = iphone_number,
	skype = iskype,
	position = iposition,
	date_of_entry = idate_of_entry,
	team = iteam,
	language = ilanguage,
	language_level = ilanguage_level
	where mentor_id = imentor_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_sandbox(iname sandboxes.name%type, --sandboxes
icreate_date sandboxes.create_date%type,
istart_date sandboxes.start_date%type,
iend_date sandboxes.end_date%type,
inumber_of_candidates sandboxes.number_of_candidates%type,
imentor sandboxes.mentor%type)
is
begin
    insert into sandboxes (name, create_date, start_date, end_date, number_of_candidates, mentor)
    values (iname, icreate_date, istart_date, iend_date, inumber_of_candidates, imentor);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_sandbox(isandbox_id sandboxes.sandbox_id%type, 
iname sandboxes.name%type, 
icreate_date sandboxes.create_date%type,
istart_date sandboxes.start_date%type,
iend_date sandboxes.end_date%type,
inumber_of_candidates sandboxes.number_of_candidates%type,
imentor sandboxes.mentor%type)
is
begin
    update sandboxes set
	name = iname,
	create_date = icreate_date,
	start_date = istart_date,
	end_date = iend_date,
	number_of_candidates = inumber_of_candidates,
	mentor = imentor
	where sandbox_id = isandbox_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_candidate(isurname candidates.surname%type, --candidates
iname candidates.name%type,
ipatronim candidates.patronim%type,
iphone_number candidates.phone_number%type,
iskype candidates.skype%type,
idate_of_entry candidates.date_of_entry%type,
imentor candidates.mentor%type,
isandbox candidates.sandbox%type,
ilanguage candidates.language%type,
ilanguage_level candidates.language_level%type,
istatus candidates.status%type,
itasks_completed candidates.tasks_completed%type)
is
begin
    insert into candidates (surname, name, patronim, phone_number, skype, mentor, sandbox, language, language_level, status, tasks_completed)
    values (isurname, iname, ipatronim, iphone_number, iskype, imentor, isandbox, ilanguage, ilanguage_level, istatus, itasks_completed);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_candidate(icandidate_id candidates.candidate_id%type,
isurname candidates.surname%type,
iname candidates.name%type,
ipatronim candidates.patronim%type,
iphone_number candidates.phone_number%type,
iskype candidates.skype%type,
idate_of_entry candidates.date_of_entry%type,
imentor candidates.mentor%type,
isandbox candidates.sandbox%type,
ilanguage candidates.language%type,
ilanguage_level candidates.language_level%type,
istatus candidates.status%type,
itasks_completed candidates.tasks_completed%type)
is
begin
    update candidates set
	surname = isurname,
	name = iname,
	patronim = ipatronim,
	phone_number = iphone_number,
	skype = iskype,
	date_of_entry = idate_of_entry,
	mentor = imentor,
	sandbox = isandbox,
	language = ilanguage,
	language_level = ilanguage_level,
	status = istatus,
	tasks_completed = itasks_completed
	where candidate_id = icandidate_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


create or replace procedure add_feedbacks(imentor feedbacks.mentor%type, --feedbacks
icandidate feedbacks.candidate%type,
idescription feedbacks.description%type)
is
begin
    insert into feedbacks (mentor, candidate, description)
    values (imentor, icandidate, idescription);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_feedback(ifeedback_id feedbacks.feedback_id%type)
is
begin
    delete from feedbacks where feedback_id = ifeedback_id;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_feedback_mentor(imentor feedbacks.mentor%type)
is
begin
    delete from feedbacks where mentor = imentor;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure delete_feedback_candidate(icandidate feedbacks.candidate%type)
is
begin
    delete from feedbacks where candidate = icandidate;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure update_feedback(ifeedback_id feedbacks.feedback_id%type,
imentor feedbacks.mentor%type,
icandidate feedbacks.candidate%type,
idescription feedbacks.description%type)
is
begin
    update feedbacks set
	mentor = imentor,
	candidate = icandidate,
	description = idescription
	where feedback_id = ifeedback_id;
	exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;


declare procedure view_candidate_info_by_id(icandidate_id candidates.candidate_id%type) -- select procedures
is
cursor candidates_cursor is select candidate_id,
surname,
name,
patronim,
phone_number,
skype,
date_of_entry,
mentor,
sandbox,
language,
language_level,
status,
tasks_completed
from candidates where candidate_id = icandidate_id;
begin
    for any_candidate in candidates_cursor
    loop
        dbms_output.put_line(any_candidate.surname || ' ' ||
        any_candidate.name || ' ' ||
        any_candidate.patronim || ' ' ||
        any_candidate.phone_number || ' ' ||
        any_candidate.skype || ' ' ||
        any_candidate.date_of_entry || ' ' ||
        any_candidate.mentor || ' ' ||
		any_candidate.sandbox || ' ' ||
		any_candidate.language || ' ' ||
		any_candidate.language_level || ' ' ||
		any_candidate.status || ' ' ||
		any_candidate.tasks_completed || ' ');
    end loop;
end;
begin
    view_candidate_info_by_id(1);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure view_sandbox_info_by_id(isandbox_id sandboxes.sandbox_id%type)
is
cursor sandboxes_cursor is select sandbox_id,
name,
create_date,
start_date,
end_date,
number_of_candidates,
mentor
from sandboxes where sandbox_id = isandbox_id;
begin
    for any_sandbox in sandboxes_cursor
    loop
        dbms_output.put_line(any_sandbox.sandbox_id || ' ' ||
        any_sandbox.name || ' ' ||
        any_sandbox.create_date || ' ' ||
        any_sandbox.start_date || ' ' ||
        any_sandbox.end_date || ' ' ||
        any_sandbox.number_of_candidates || ' ' ||
        any_sandbox.mentor || ' ');
    end loop;
end;
begin
    view_sandbox_info_by_id(1);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure completed_tasks_by_id(icandidate_id candidates.candidate_id%type)
is
cursor candidates_cursor1 is select candidate_id,
tasks_completed
from candidates where candidate_id = icandidate_id;
begin
    for any_candidate1 in candidates_cursor1
    loop
        dbms_output.put_line(any_candidate1.candidate_id || ' ' ||
        any_candidate1.tasks_completed || ' ');
    end loop;
end;
begin
    completed_tasks_by_id(1);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;