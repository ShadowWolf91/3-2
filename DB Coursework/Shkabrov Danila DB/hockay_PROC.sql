-- procedures
-- logins

create or replace procedure AddFan(IID USERS.ID%type, ILOGIN_NAME USERS.NAME%type, IEMAIL USERS.EMAIL%type, IPASSWORD USERS.PASSWORD%type, ICARD USERS.CARD%type)
is
begin
    insert into USERS (ID, NAME, EMAIL, PASSWORD, CARD)
    values (IID, ILOGIN_NAME, IEMAIL, IPASSWORD, ICARD);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure AddFans(ILOGIN_NAME USERS.NAME%type, IEMAIL USERS.EMAIL%type, IPASSWORD USERS.PASSWORD%type, ICARD USERS.CARD%type)
is
begin
    insert into USERS (NAME, EMAIL, PASSWORD, CARD)
    values (ILOGIN_NAME, IEMAIL, IPASSWORD, ICARD);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateFan(IID USERS.ID%type, ILOGIN_NAME USERS.NAME%type, IEMAIL USERS.EMAIL%type, IPASSWORD USERS.PASSWORD%type, ICARD USERS.CARD%type)
is
begin
    update USERS set
    ID = IID,
    NAME = ILOGIN_NAME,
    EMAIL = IEMAIL,
    PASSWORD = IPASSWORD,
    CARD = ICARD;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- admins

create or replace procedure AddAdmin(IID USERS.ID%type, ILOGIN_NAME USERS.NAME%type, IEMAIL USERS.EMAIL%type, IPASSWORD USERS.PASSWORD%type, 
ICARD USERS.CARD%type, IADMIN USERS.ADMIN%type)
is
begin
    insert into USERS (ID, NAME, EMAIL, PASSWORD, CARD, ADMIN)
    values (IID, ILOGIN_NAME, IEMAIL, IPASSWORD, ICARD, IADMIN);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateAdmin(IID USERS.ID%type, ILOGIN_NAME USERS.NAME%type, IEMAIL USERS.EMAIL%type, IPASSWORD USERS.PASSWORD%type, 
ICARD USERS.CARD%type, IADMIN USERS.ADMIN%type)
is
begin
    update USERS set
    ID = IID,
    NAME = ILOGIN_NAME,
    EMAIL = IEMAIL,
    PASSWORD = IPASSWORD,
    CARD = ICARD,
    ADMIN = IADMIN;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- playes

create or replace procedure AddPlay (IHOMETEAM PLAYES.HOMETEAM%type, IGUESTTEAM PLAYES.GUESTTEAM%type, IDATE PLAYES.DATE_%type)
is
begin
    insert into PLAYES (HOMETEAM, GUESTTEAM, DATE_)
    values (IHOMETEAM, IGUESTTEAM, IDATE);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdatePlays (IHOMEGOALS PLAYES.HOMEGOALS%type, IGUESTGOALS PLAYES.GUESTGOALS%type, IDATE PLAYES.DATE_%type)
is
begin
    update PLAYES set
    HOMEGOALS = IHOMEGOALS,
    GUESTGOALS = IGUESTGOALS
    WHERE DATE_ = IDATE;
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- teams

create or replace procedure AddTeam (IPLAY_ID TEAMS.PLAY_ID%type, ITNAME TEAMS.TEAMS_NAME%type, IGROUP TEAMS.GROUPAB%type)
is
begin
    insert into TEAMS (PLAY_ID, TEAMS_NAME, GROUPAB)
    values (IPLAY_ID, ITNAME, IGROUP);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure UpdateTeams(IPLAY_ID TEAMS.PLAY_ID%type, IPOINTS TEAMS.POINTS%type, IPLACE TEAMS.PLACE%type, IGAMES TEAMS.GAMES%type)
is
begin
    update TEAMS set
    POINTS = IPOINTS,
    PLACE = IPLACE,
    GAMES = IGAMES
    WHERE PLAY_ID = IPLAY_ID;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteTeam (IPLAY_ID TEAMS.PLAY_ID%type)
is
begin
    delete from TEAMS where PLAY_ID = IPLAY_ID;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- tickets

create or replace procedure AddTicket (ITICKET_ID TICKETS.TICKET_ID%type, IID_PLAY TICKETS.ID_PLAY%type, ISECTOR TICKETS.SECTOR%type, IROW TICKETS.ROW_%type, 
IPLACE TICKETS.PLACE%type, IDATE_PLAY TICKETS.DATE_PLAY%type, ITIME_PLAY TICKETS.TIME_PLAY%type, IUSER_ID TICKETS.USER_ID%type)
is
begin
    insert into TICKETS (TICKET_ID, ID_PLAY, SECTOR, ROW_, PLACE, DATE_PLAY, TIME_PLAY, USER_ID)
    values (ITICKET_ID, IID_PLAY, ISECTOR, IROW, IPLACE, IDATE_PLAY, ITIME_PLAY, IUSER_ID);
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

create or replace procedure DeleteTicket (ITICKET_ID TICKETS.TICKET_ID%type)
is
begin
    delete from TICKETS where TICKET_ID = ITICKET_ID;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

-- others

declare procedure ViewGroupInfo(IGROUP TEAMS.GROUPAB%type)
is
cursor groupab_cursor is select TEAMS_NAME, POINTS, PLACE, GROUPAB, GAMES
from TEAMS where GROUPAB = IGROUP;
begin
    for any_group in groupab_cursor
    loop
        dbms_output.put_line(any_group.TEAMS_NAME || ' ' ||
        any_group.POINTS || ' ' ||
        any_group.PLACE || ' ' ||
        any_group.GROUPAB || ' ' ||
        any_group.GAMES || ' ');
    end loop;
end;
begin
    ViewGroupInfo('A');
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure ViewSectorOccupancy (ISECTOR TICKETS.SECTOR%type)
is
cursor sector_occupancy_cursor is select TICKET_ID, SECTOR, ROW_, PLACE, DATE_PLAY, USER_ID
from TICKETS where SECTOR = ISECTOR;
begin
    for any_sector_occupancy in sector_occupancy_cursor
    loop
        dbms_output.put_line(any_sector_occupancy.TICKET_ID || ' ' ||
        any_sector_occupancy.SECTOR || ' ' ||
        any_sector_occupancy.ROW_ || ' ' ||
        any_sector_occupancy.PLACE || ' ' ||
        any_sector_occupancy.DATE_PLAY || ' ' ||
        any_sector_occupancy.USER_ID || ' ');
    end loop;
end;
begin
    ViewSectorOccupancy(3);
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure ViewGame (IDATE PLAYES.DATE_%type)
is
cursor game_cursor is select HOMETEAM, GUESTTEAM, DATE_
from PLAYES where DATE_ = IDATE;
begin
    for any_game in game_cursor
    loop
        dbms_output.put_line(any_game.HOMETEAM || ' ' ||
        any_game.GUESTTEAM || ' ' ||
        any_game.DATE_ || ' ');
    end loop;
end;
begin
    ViewGame(to_date('2023/05/13', 'yyyy/mm/dd'));
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

declare procedure ViewResult (IDATE PLAYES.DATE_%type)
is
cursor result_cursor is select HOMETEAM, HOMEGOALS, GUESTTEAM, GUESTGOALS, DATE_
from PLAYES where DATE_ = IDATE;
begin
    for any_result in result_cursor
    loop
        dbms_output.put_line(any_result.HOMETEAM || ' ' ||
        any_result.HOMEGOALS || ' ' ||
        any_result.GUESTTEAM || ' ' ||
        any_result.GUESTGOALS || ' ' ||
        any_result.DATE_ || ' ');
    end loop;
end;
begin
    ViewResult(to_date('2023/05/11', 'yyyy/mm/dd'));
    exception
    when others
    then DBMS_OUTPUT.put_line(sqlerrm);
end;

CREATE OR REPLACE PROCEDURE hash_password
IS
BEGIN
    FOR rec IN (SELECT ID, PASSWORD FROM USERS)
    LOOP
    UPDATE users
    SET PASSWORD = RAWTOHEX(DBMS_CRYPTO.HASH(rec.PASSWORD, DBMS_CRYPTO.HASH_MD5))
    WHERE ID = rec.ID;
  END LOOP;
    exception
    when others 
    then DBMS_OUTPUT.put_line(sqlerrm);
END;

drop procedure hash_password;