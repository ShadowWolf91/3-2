CREATE SEQUENCE USERS_ID_SEQ;
CREATE TABLE USERS (
	ID INTEGER DEFAULT USERS_ID_SEQ.NEXTVAL NOT NULL,
	NAME NVARCHAR2(50) NOT NULL,
	EMAIL NVARCHAR2(50) NOT NULL,
	PASSWORD NVARCHAR2(50) NOT NULL,
	CARD NVARCHAR2(50) NOT NULL,
	ADMIN NVARCHAR2(50) DEFAULT 'No',
    CONSTRAINT USERS_PK PRIMARY KEY(ID)
);

CREATE SEQUENCE PLAYES_ID_SEQ;
CREATE TABLE PLAYES (
	HOMETEAM NVARCHAR2(50) NOT NULL,
	GUESTTEAM NVARCHAR2(50) NOT NULL,
	HOMEGOALS INTEGER DEFAULT 0 NOT NULL,
	GUESTGOALS INTEGER DEFAULT 0 NOT NULL,
	HOMEIMAGE BLOB,
	GUESTIMAGE BLOB,
	DATE_ DATE,
    CONSTRAINT PLAYES_PK PRIMARY KEY(DATE_)
);

CREATE SEQUENCE TEAMS_ID_SEQ;
CREATE TABLE TEAMS (
	PLAY_ID INTEGER DEFAULT TEAMS_ID_SEQ.NEXTVAL NOT NULL,
	TEAMS_NAME NVARCHAR2(50) NOT NULL,
	POINTS INTEGER DEFAULT 0 NOT NULL,
	PLACE INTEGER DEFAULT 0 NOT NULL,
	GROUPAB NVARCHAR2(50) NOT NULL,
	GAMES INTEGER DEFAULT 0 NOT NULL,
    CONSTRAINT CHECK_GROUPAB CHECK (GROUPAB in ('A', 'B')),
    CONSTRAINT TEAMS_PK PRIMARY KEY(PLAY_ID)
);

CREATE SEQUENCE TICKETS_ID_SEQ;
CREATE TABLE TICKETS (
    TICKET_ID INTEGER DEFAULT TICKETS_ID_SEQ.NEXTVAL NOT NULL,
	ID_PLAY INTEGER,
	SECTOR INTEGER NOT NULL,
	ROW_ INTEGER NOT NULL,
	PLACE INTEGER NOT NULL,
	DATE_PLAY DATE,
	TIME_PLAY TIMESTAMP,
	USER_ID INTEGER,
    CONSTRAINT TICKETS_PK PRIMARY KEY(TICKET_ID)
);

ALTER TABLE TICKETS ADD CONSTRAINT PLAY_FK FOREIGN KEY (ID_PLAY) REFERENCES TEAMS(PLAY_ID);
ALTER TABLE TICKETS ADD CONSTRAINT DATE_FK FOREIGN KEY (DATE_PLAY) REFERENCES PLAYES(DATE_);
ALTER TABLE TICKETS ADD CONSTRAINT USER_FK FOREIGN KEY (USER_ID) REFERENCES USERS(ID);
ALTER TABLE TICKETS MODIFY TIME_PLAY TIMESTAMP;
ALTER TABLE USERS MODIFY PASSWORD NVARCHAR2(200);

--DROP TABLE USERS;
--DROP TABLE PLAYES;
--DROP TABLE TEAMS;
--DROP TABLE TICKETS;