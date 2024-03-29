/* MOVIE DATABASE */
/* CREATE ALL TABLES */

--1
CREATE TABLE ACTOR(
AID INTEGER PRIMARY KEY,
ANAME VARCHAR(10),
AGENDER VARCHAR(1));

--2
CREATE TABLE DIRECTOR(
DID INTEGER PRIMARY KEY,
DNAME VARCHAR(10),
PHNO VARCHAR(10));

--3
CREATE TABLE MOVIES(
MID INTEGER PRIMARY KEY,
TITLE VARCHAR(10),
MOYEAR VARCHAR(4),
LANG VARCHAR(10),
DID INTEGER,
FOREIGN KEY(DID) REFERENCES DIRECTOR(DID) ON DELETE CASCADE);

--4
CREATE TABLE MOVIECAST(
AID INTEGER,
FOREIGN KEY(AID) REFERENCES ACTOR(AID) ON DELETE CASCADE,
MID INTEGER,
FOREIGN KEY(MID) REFERENCES MOVIES(MID) ON DELETE CASCADE,
ROLE VARCHAR(10),
PRIMARY KEY(AID,MID));

--5
CREATE TABLE RATING(
MID INTEGER,
FOREIGN KEY(MID) REFERENCES MOVIES(MID) ON DELETE CASCADE,
REV INTEGER CHECK (REV<6),
PRIMARY KEY(MID,REV));

/*INSERT VALUES INTO ALL TABLES */

--1
INSERT INTO ACTOR VALUES(1001,'PREETHAM','M');
INSERT INTO ACTOR VALUES(1002,'JASON','M');
INSERT INTO ACTOR VALUES(1003,'TOM','M');
INSERT INTO ACTOR VALUES(1004,'JENNA','F');
INSERT INTO ACTOR VALUES(1005,'ANNA','F');

--2
INSERT INTO DIRECTOR VALUES(10001,'HITCHCOCK','9889898989');
INSERT INTO DIRECTOR VALUES(10002,'STEVEN','988989845');
INSERT INTO DIRECTOR VALUES(10003,'VARUN','9889898798');
INSERT INTO DIRECTOR VALUES(10004,'NOLAN','9889898111');
INSERT INTO DIRECTOR VALUES(10005,'RICHBITCH','9889898000');

--3
INSERT INTO MOVIES VALUES(100001,'PSYCHO','1960','ENGLISH',10001);
INSERT INTO MOVIES VALUES(100002,'DON','2011','HINDI',10003);
INSERT INTO MOVIES VALUES(100003,'SUPER','2007','KANNADA',10003);
INSERT INTO MOVIES VALUES(100004,'VERTIGO','1958','ENGLISH',10001);
INSERT INTO MOVIES VALUES(100005,'DUNKIRK','2016','ENGLISH',10004);
INSERT INTO MOVIES VALUES(100006,'JAWS','1975','ENGLISH',10002);

--4
INSERT INTO MOVIECAST VALUES(1001,100003,'PSCHO');
INSERT INTO MOVIECAST VALUES(1004,100005,'LEAD ROLE');
INSERT INTO MOVIECAST VALUES(1003,100002,'VILLIAN');
INSERT INTO MOVIECAST VALUES(1002,100001,'LEAD ROLE');
INSERT INTO MOVIECAST VALUES(1005,100004,'SIDE ACTOR');
INSERT INTO MOVIECAST VALUES(1001,100006,'LEAD ACTOR');

--5
INSERT INTO RATING VALUES(100001,3);
INSERT INTO RATING VALUES(100002,4);
INSERT INTO RATING VALUES(100003,5);
INSERT INTO RATING VALUES(100004,1);
INSERT INTO RATING VALUES(100005,3);
INSERT INTO RATING VALUES(100006,2.5);

/*DISPLAY CONTENTS OF ALL TABLES */

SELECT * FROM ACTOR;
SELECT * FROM DIRECTOR;
SELECT * FROM MOVIES;
SELECT * FROM MOVIECAST;
SELECT * FROM RATING;

/* QUERIES */

--1
SELECT * FROM MOVIES,DIRECTOR
WHERE DIRECTOR.DID=MOVIES.DID AND
DNAME='HITCHCOCK';

--2
SELECT TITLE FROM MOVIES
WHERE MID IN (SELECT MID
FROM MOVIECAST
WHERE AID IN (SELECT AID
FROM MOVIECAST
GROUP BY AID
HAVING COUNT(AID)>1));

--3
SELECT ANAME, TITLE, MOYEAR
FROM ACTOR A
JOIN MOVIECAST C ON A.AID = C.AID
JOIN MOVIES M ON C.MID=M.MID
WHERE M.MOYEAR NOT BETWEEN 2000 AND 2015;

--4
SELECT TITLE, MAX(REV), COUNT(REV)
FROM MOVIES, RATING
WHERE MOVIES.MID = RATING.MID
GROUP BY MOVIES.TITLE
ORDER BY MOVIES.TITLE;

--5
UPDATE RATING SET REV=5
WHERE MID IN (SELECT MID
FROM MOVIES, DIRECTOR
WHERE MOVIES.DID = DIRECTOR.DID AND DNAME='STEVEN');

SELECT * FROM RATING;
