/* COMPANY DATABASE */
/* CREATE ALL TABLES */

--1
CREATE TABLE DEPARTMENT(
DNO VARCHAR(20) PRIMARY KEY,
DNAME VARCHAR(20),
MGRSTARTDATE DATE,
MGRSSN VARCHAR(20));

--2
CREATE TABLE EMPLOYEE(
SSN VARCHAR(20) PRIMARY KEY,
FNAME VARCHAR(20),
LNAME VARCHAR(20),
ADDRESS VARCHAR(20),
SEX CHAR (1),
SALARY INTEGER,
SUPERSSN VARCHAR(20),
DNO VARCHAR(20),
FOREIGN KEY(DNO) REFERENCES DEPARTMENT (DNO));

ALTER TABLE DEPARTMENT
ADD FOREIGN KEY(MGRSSN) REFERENCES EMPLOYEE (SSN);

--3
CREATE TABLE DLOCATION(
DLOC VARCHAR(20),
DNO VARCHAR(20),
FOREIGN KEY(DNO) REFERENCES DEPARTMENT (DNO),
PRIMARY KEY(DNO, DLOC));

--4
CREATE TABLE PROJECT(
PNO INTEGER PRIMARY KEY,
PNAME VARCHAR(20),
PLOCATION VARCHAR(20),
DNO VARCHAR(20),
FOREIGN KEY(DNO) REFERENCES DEPARTMENT (DNO));

--5
CREATE TABLE WORKS_ON(
HOURS INTEGER,
SSN VARCHAR(20),
FOREIGN KEY(SSN) REFERENCES EMPLOYEE (SSN),
PNO INTEGER,
FOREIGN KEY(PNO) REFERENCES PROJECT(PNO),
PRIMARY KEY (SSN, PNO));

/* INSERT VALUES INTO ALL TABLES */

--1
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSECE01','JOHN','SCOTT','BANGALORE','M', 450000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSISE01','JAMES','SMITH','BANGALORE','M', 500000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSISE02','HEARN','BAKER','BANGALORE','M', 700000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSISE03','EDWARD','SCOTT','MYSORE','M', 500000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSISE04','PAVAN','HEGDE','MANGALORE','M', 650000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSISE05','GIRISH','MALYA','MYSORE','M', 450000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSISE06','NEHA','SN','BANGALORE','F', 800000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSACC01','AHANA','K','MANGALORE','F', 350000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSACC02','SANTHOSH','KUMAR','MANGALORE','M', 300000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSCSE01','VEENA','M','MYSORE','M', 600000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES ('BMSETE01','NAGESH','HR','BANGALORE','M', 500000);

--2
INSERT INTO DEPARTMENT VALUES ('1','ACCOUNTS','2001-01-01','BMSACC02');
INSERT INTO DEPARTMENT VALUES ('2','ECE','2016-08-01','BMSETE01');
INSERT INTO DEPARTMENT VALUES ('3','ECE','2008-06-01','BMSECE01');
INSERT INTO DEPARTMENT VALUES ('4','ISE','2015-08-01','BMSCSE01');
INSERT INTO DEPARTMENT VALUES ('5','CSE','2002-06-01','BMSISE05');

UPDATE EMPLOYEE SET
SUPERSSN=NULL, DNO='3'
WHERE SSN='BMSECE01';

UPDATE EMPLOYEE SET
SUPERSSN='BMSISE02', DNO='5'
WHERE SSN='BMSISE01';

UPDATE EMPLOYEE SET
SUPERSSN='BMSISE03', DNO='5'
WHERE SSN='BMSISE02';

UPDATE EMPLOYEE SET
SUPERSSN='BMSISE04', DNO='5'
WHERE SSN='BMSISE03';

UPDATE EMPLOYEE SET
DNO='5', SUPERSSN='BMSISE05'
WHERE SSN='BMSISE04';

UPDATE EMPLOYEE SET
DNO='5', SUPERSSN='BMSISE06'
WHERE SSN='BMSISE05';

UPDATE EMPLOYEE SET
DNO='5', SUPERSSN=NULL
WHERE SSN='BMSISE06';

UPDATE EMPLOYEE SET
DNO='1', SUPERSSN='BMSEEE02'
WHERE SSN='BMSACC01';

UPDATE EMPLOYEE SET
DNO='1', SUPERSSN=NULL
WHERE SSN='BMSACC02';

UPDATE EMPLOYEE SET
DNO='4', SUPERSSN=NULL
WHERE SSN='BMSCSE01';

UPDATE EMPLOYEE SET
DNO='2', SUPERSSN=NULL
WHERE SSN='BMSETE01';

--3
INSERT INTO DLOCATION VALUES ('BANGALORE', '1');
INSERT INTO DLOCATION VALUES ('BANGALORE', '2');
INSERT INTO DLOCATION VALUES ('BANGALORE', '3');
INSERT INTO DLOCATION VALUES ('MANGALORE', '4');
INSERT INTO DLOCATION VALUES ('MANGALORE', '5');

--4
INSERT INTO PROJECT VALUES (100,'IOT','BANGALORE','5');
INSERT INTO PROJECT VALUES (101,'CLOUD','BANGALORE','5');
INSERT INTO PROJECT VALUES (102,'BIG DATA','BANGALORE','5');
INSERT INTO PROJECT VALUES (103,'SENSORS','BANGALORE','3');
INSERT INTO PROJECT VALUES (104,'BANK MANAGEMENT','BANGALORE','1');
INSERT INTO PROJECT VALUES (105,'SALARY MANAGEMENT','BANGALORE','1');
INSERT INTO PROJECT VALUES (106,'OPENSTACK','BANGALORE','4');
INSERT INTO PROJECT VALUES (107,'SMART CITY','BANGALORE','2');

--5
INSERT INTO WORKS_ON VALUES (4, 'BMSISE01', 100);
INSERT INTO WORKS_ON VALUES (6, 'BMSISE01', 101);
INSERT INTO WORKS_ON VALUES (8, 'BMSISE01', 102);
INSERT INTO WORKS_ON VALUES (10, 'BMSISE02', 100);
INSERT INTO WORKS_ON VALUES (3, 'BMSISE04', 100);
INSERT INTO WORKS_ON VALUES (4, 'BMSISE05', 101);
INSERT INTO WORKS_ON VALUES (5, 'BMSISE06', 102);
INSERT INTO WORKS_ON VALUES (6, 'BMSISE03', 102);
INSERT INTO WORKS_ON VALUES (7, 'BMSECE01', 103);
INSERT INTO WORKS_ON VALUES (5, 'BMSACC01', 104);
INSERT INTO WORKS_ON VALUES (6, 'BMSACC02', 105);
INSERT INTO WORKS_ON VALUES (4, 'BMSCSE01', 106);
INSERT INTO WORKS_ON VALUES (10,'BMSETE01', 107);

/* DISPLAY CONTENTS OF ALL TABLES */

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM DLOCATION;
SELECT * FROM PROJECT;
SELECT * FROM WORKS_ON;

/* QUERIES */

--1
(SELECT DISTINCT P.PNO
FROM PROJECT P, DEPARTMENT D, EMPLOYEE E
WHERE E.DNO=D.DNO AND
D.MGRSSN=E.SSN AND
E.LNAME='SCOTT')
UNION
(SELECT DISTINCT P1.PNO
FROM PROJECT P1, WORKS_ON W, EMPLOYEE E1
WHERE P1.PNO=W.PNO AND
E1.SSN=W.SSN AND
E1.LNAME='SCOTT');

--2
SELECT E.FNAME, E.LNAME, 1.1*E.SALARY AS INCR_SAL
FROM EMPLOYEE E, WORKS_ON W, PROJECT P
WHERE E.SSN=W.SSN
AND W.PNO=P.PNO
AND P.PNAME='IOT';

--3
SELECT SUM(E.SALARY), MAX(E.SALARY), MIN(E.SALARY), AVG(E.SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DNO AND
D.DNAME='ACCOUNTS';

--4
SELECT E.FNAME, E.LNAME
FROM EMPLOYEE E
WHERE NOT EXISTS(
  SELECT PNO
  FROM PROJECT
  WHERE DNO = '5'AND
  PNO NOT IN (SELECT PNO
  FROM WORKS_ON W
  WHERE E.SSN = W.SSN)
);

--5
SELECT D.DNO, COUNT(*)
FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.DNO = E.DNO
WHERE E.SALARY > 600000 AND
D.DNO IN (SELECT E1.DNO
FROM EMPLOYEE E1
GROUP BY E1.DNO
HAVING COUNT(*) > 5)
GROUP BY D.DNO;
