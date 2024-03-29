/* COLLEGE DATABASE */
/* CREATE ALL TABLES*/

--1
CREATE TABLE STUDENT(
USN VARCHAR(10) PRIMARY KEY,
SNAME VARCHAR(25),
ADDRESS VARCHAR(25),
PHONE VARCHAR(10),
GENDER CHAR(1));

--2
CREATE TABLE SEMSEC(
SSID VARCHAR(5) PRIMARY KEY,
SEM INTEGER,
SEC CHAR(1));

--3
CREATE TABLE CLASS(
USN VARCHAR(10),
SSID VARCHAR(5),
PRIMARY KEY(USN,SSID),
FOREIGN KEY(USN) REFERENCES STUDENT(USN),
FOREIGN KEY(SSID) REFERENCES SEMSEC(SSID));

--4
CREATE TABLE SUBJECT(
SUBCODE VARCHAR(8) PRIMARY KEY,
TITLE VARCHAR(20),
SEM INTEGER,
CREDITS INTEGER);

--5
CREATE TABLE IAMARKS(
USN VARCHAR(10),
SUBCODE VARCHAR(8),
SSID VARCHAR(5),
TEST1 INTEGER,
TEST2 INTEGER,
TEST3 INTEGER,
FINALIA INTEGER,
PRIMARY KEY(USN,SUBCODE,SSID),
FOREIGN KEY(USN) REFERENCES STUDENT(USN),
FOREIGN KEY(SUBCODE) REFERENCES SUBJECT(SUBCODE),
FOREIGN KEY(SSID) REFERENCES SEMSEC(SSID));

/* INSERT VALUES INTO ALL TABLES */

--1
INSERT INTO STUDENT VALUES ('1BY21IS001','AKSHAY','BELAGAVI',8877881122,'M');
INSERT INTO STUDENT VALUES ('1BY21IS002','SANDHYA','BENGALURU',7722829912,'F');
INSERT INTO STUDENT VALUES ('1BY21IS003','TEESHA','BENGALURU',7712312312,'F');
INSERT INTO STUDENT VALUES ('1BY21IS004','SUPRIYA','MANGALURU',8877881122,'F');
INSERT INTO STUDENT VALUES ('1BY21IS005','ABHAY','BENGALURU',9900211201,'M');
INSERT INTO STUDENT VALUES('1BY21IS006','BHASKAR','BENGALURU',9923211099,'M');
INSERT INTO STUDENT VALUES ('1BY21IS007','ASMI','BENGALURU',7894737377,'F');
INSERT INTO STUDENT VALUES ('1BY21IS008','AJAY','TUMKUR',9845091341,'M');
INSERT INTO STUDENT VALUES ('1BY21IS009','CHITRA','DAVANGERE',7696772121,'F');
INSERT INTO STUDENT VALUES ('1BY21IS010','JEEVA','BELLARY',9944850121,'M');
INSERT INTO STUDENT VALUES('1BY21IS011','SANTOSH','MANGALURU',8812332201,'M');
INSERT INTO STUDENT VALUES ('1BY21IS012','ISMAIL','KALBURGI',9900232201,'M');
INSERT INTO STUDENT VALUES ('1BY21IS013','SAMEERA','SHIMOGA',9905542212,'F');
INSERT INTO STUDENT VALUES ('1BY21IS014','VINAYAKA','CHIKAMAGALUR',8800880011,'M');

--2
INSERT INTO SEMSEC VALUES ('ISE8A', 8,'A');
INSERT INTO SEMSEC VALUES ('ISE8B', 8,'B');
INSERT INTO SEMSEC VALUES ('ISE8C', 8,'C');
INSERT INTO SEMSEC VALUES ('ISE7A', 7,'A');
INSERT INTO SEMSEC VALUES ('ISE7B', 7,'B');
INSERT INTO SEMSEC VALUES ('ISE7C', 7,'C');
INSERT INTO SEMSEC VALUES ('ISE6A', 6,'A');
INSERT INTO SEMSEC VALUES ('ISE6B', 6,'B');
INSERT INTO SEMSEC VALUES ('ISE6C', 6,'C');
INSERT INTO SEMSEC VALUES ('ISE5A', 5,'A');
INSERT INTO SEMSEC VALUES ('ISE5B', 5,'B');
INSERT INTO SEMSEC VALUES ('ISE5C', 5,'C');
INSERT INTO SEMSEC VALUES ('ISE4A', 4,'A');
INSERT INTO SEMSEC VALUES ('ISE4B', 4,'B');
INSERT INTO SEMSEC VALUES ('ISE4C', 4,'C');
INSERT INTO SEMSEC VALUES ('ISE3A', 3,'A');
INSERT INTO SEMSEC VALUES ('ISE3B', 3,'B');
INSERT INTO SEMSEC VALUES ('ISE3C', 3,'C');
INSERT INTO SEMSEC VALUES ('ISE2A', 2,'A');
INSERT INTO SEMSEC VALUES ('ISE2B', 2,'B');
INSERT INTO SEMSEC VALUES ('ISE2C', 2,'C');
INSERT INTO SEMSEC VALUES ('ISE1A', 1,'A');
INSERT INTO SEMSEC VALUES ('ISE1B', 1,'B');
INSERT INTO SEMSEC VALUES ('ISE1C', 1,'C');

--3
INSERT INTO CLASS VALUES ('1BY21IS001','ISE8A');
INSERT INTO CLASS VALUES ('1BY21IS002','ISE8A');
INSERT INTO CLASS VALUES ('1BY21IS003','ISE8B');
INSERT INTO CLASS VALUES ('1BY21IS004','ISE8C');
INSERT INTO CLASS VALUES ('1BY21IS005','ISE7A');
INSERT INTO CLASS VALUES ('1BY21IS006','ISE7A');
INSERT INTO CLASS VALUES ('1BY21IS008','ISE7A');
INSERT INTO CLASS VALUES ('1BY21IS007','ISE4A');
INSERT INTO CLASS VALUES ('1BY21IS009','ISE4A');
INSERT INTO CLASS VALUES ('1BY21IS010','ISE4B');
INSERT INTO CLASS VALUES ('1BY21IS011','ISE4C');
INSERT INTO CLASS VALUES ('1BY21IS012','ISE3A');
INSERT INTO CLASS VALUES ('1BY21IS013','ISE3B');
INSERT INTO CLASS VALUES ('1BY21IS014','ISE3C');

--4
INSERT INTO SUBJECT VALUES ('19CS81','ACA', 8, 4);
INSERT INTO SUBJECT VALUES ('19CS82','SSM', 8, 4);
INSERT INTO SUBJECT VALUES ('19CS83','NM', 8, 4);
INSERT INTO SUBJECT VALUES ('19CS84','CC', 8, 4);
INSERT INTO SUBJECT VALUES ('19CS85','PW', 8, 4);
INSERT INTO SUBJECT VALUES ('20CS71','OOAD', 7, 4);
INSERT INTO SUBJECT VALUES ('20CS72','ECS', 7, 4);
INSERT INTO SUBJECT VALUES ('20CS73','PTW', 7, 4);
INSERT INTO SUBJECT VALUES ('20CS74','DWDM', 7, 4);
INSERT INTO SUBJECT VALUES ('20CS75','JAVA', 7, 4);
INSERT INTO SUBJECT VALUES ('20CS76','SAN', 7, 4);
INSERT INTO SUBJECT VALUES ('21CS51','ME', 5, 4);
INSERT INTO SUBJECT VALUES ('21CS52','CN', 5, 4);
INSERT INTO SUBJECT VALUES ('21CS53','DBMS', 5, 4);
INSERT INTO SUBJECT VALUES ('21CS54','ATC', 5, 4);
INSERT INTO SUBJECT VALUES ('21CS55','JAVA', 5, 3);
INSERT INTO SUBJECT VALUES ('21CS56','AI', 5, 3);
INSERT INTO SUBJECT VALUES ('22CS41','ME', 4, 4);
INSERT INTO SUBJECT VALUES ('22CS42','SE', 4, 4);
INSERT INTO SUBJECT VALUES ('22CS43','DAA', 4, 4);
INSERT INTO SUBJECT VALUES ('22CS44','MPMC', 4, 4);
INSERT INTO SUBJECT VALUES ('22CS45','OOC', 4, 3);
INSERT INTO SUBJECT VALUES ('22CS46','DC', 4, 3);
INSERT INTO SUBJECT VALUES ('23CS31','ME', 3, 4);
INSERT INTO SUBJECT VALUES ('23CS32','ADE', 3, 4);
INSERT INTO SUBJECT VALUES ('23CS33','DSA', 3, 4);
INSERT INTO SUBJECT VALUES ('23CS34','CO', 3, 4);
INSERT INTO SUBJECT VALUES ('23CS35','USP', 3, 3);
INSERT INTO SUBJECT VALUES ('23CS36','DMS', 3, 3);

--5
INSERT INTO IAMARKS (USN, SUBCODE, SSID, TEST1, TEST2, TEST3) VALUES ('1BY21IS007','22CS41', 'ISE4A', 15, 16, 18);
INSERT INTO IAMARKS (USN, SUBCODE, SSID, TEST1, TEST2, TEST3) VALUES ('1BY21IS007','22CS42', 'ISE4A', 12, 19, 14);
INSERT INTO IAMARKS (USN, SUBCODE, SSID, TEST1, TEST2, TEST3) VALUES ('1BY21IS007','22CS43', 'ISE4A', 19, 15, 20);
INSERT INTO IAMARKS (USN, SUBCODE, SSID, TEST1, TEST2, TEST3) VALUES ('1BY21IS007','22CS44', 'ISE4A', 20, 16, 19);
INSERT INTO IAMARKS (USN, SUBCODE, SSID, TEST1, TEST2, TEST3) VALUES ('1BY21IS007','22CS45', 'ISE4A', 15, 15, 12);

/* DISPLAY CONTENTS OF ALL TABLES */

SELECT * FROM STUDENT;
SELECT * FROM SEMSEC;
SELECT * FROM CLASS;
SELECT * FROM SUBJECT;
SELECT * FROM IAMARKS;

/* QUERIES */

--1
SELECT S.USN,SNAME,ADDRESS,PHONE,GENDER
FROM STUDENT S, CLASS C, SEMSEC SS
WHERE SEM=4 AND
SEC='C' AND
SS.SSID=C.SSID AND
C.USN=S.USN;

--2
SELECT SEM,SEC,GENDER,COUNT(*)
FROM STUDENT S, SEMSEC SS,CLASS C
WHERE S.USN = C.USN AND
C.SSID = SS.SSID
GROUP BY SEM,SEC,GENDER
ORDER BY SEM;

--3
CREATE VIEW TEST1 AS
SELECT SUBCODE,TEST1
FROM IAMARKS
WHERE USN='1BY21IS007';

SELECT * FROM TEST1;

--4
UPDATE IAMARKS SET FINALIA = (((TEST1 + TEST2 + TEST3) -
LEAST(TEST1, TEST2, TEST3))/2);

SELECT * FROM IAMARKS;

--5
SELECT S.USN,S.SNAME,S.ADDRESS,S.PHONE,S.GENDER,
CASE WHEN IA.FINALIA BETWEEN 17 AND 20 THEN 'OUTSTANDING'
WHEN IA.FINALIA BETWEEN 12 AND 16 THEN 'AVERAGE'
ELSE 'WEAK'
END AS CAT
FROM STUDENT S,SEMSEC SS,IAMARKS IA,SUBJECT SUB
WHERE S.USN=IA.USN AND
SS.SSID=IA.SSID AND
SUB.SUBCODE=IA.SUBCODE AND
SUB.SEM=4;
