create role sandbox_admin;
grant all on technologies to sandbox_admin;
grant all on teams to sandbox_admin;
grant all on projects to sandbox_admin;
grant all on languages to sandbox_admin;
grant all on mentors to sandbox_admin;
grant all on sandboxes to sandbox_admin;
grant all on candidates to sandbox_admin;
grant all on feedbacks to sandbox_admin;

create role sandbox_mentor;
grant select on technologies to sandbox_mentor;
grant select on teams to sandbox_mentor;
grant select on projects to sandbox_mentor;
grant select on languages to sandbox_mentor;
grant select on mentors to sandbox_mentor;
grant all on sandboxes to sandbox_mentor;
grant all on candidates to sandbox_mentor;
grant all on feedbacks to sandbox_mentor;

create role sandbox_candidate;
grant select on candidates to sandbox_candidate;



create user fin_admin identified by Pa$$w0rd;
grant sandbox_admin to fin_admin;

create user fin_mentor identified by Pa$$w0rd;
grant sandbox_mentor to fin_mentor;

create user fin_candidate identified by Pa$$w0rd;
grant sandbox_candidate to fin_candidate;