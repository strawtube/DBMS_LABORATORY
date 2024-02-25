/* ORDERS DATABASE */
/* CREATE ALL TABLES */

--1
CREATE TABLE SALESMAN(
SALESMAN_ID INTEGER PRIMARY KEY,
NAME VARCHAR(10) NOT NULL,
CITY VARCHAR(15) NOT NULL,
COMMISSION INTEGER);

--2
CREATE TABLE CUSTOMER(
CUSTOMER_ID INTEGER PRIMARY KEY,
CUST_NAME VARCHAR(10) NOT NULL,
CITY VARCHAR(10) NOT NULL,
GRADE INTEGER NOT NULL,
SALESMAN_ID INTEGER,
FOREIGN KEY(SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID) ON DELETE CASCADE);

--3
CREATE TABLE ORDERS(
ORD_NO INTEGER PRIMARY KEY,
PURCHASE_AMT INTEGER NOT NULL,
ORD_DATE DATE NOT NULL,
CUSTOMER_ID INTEGER,
FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE,
SALESMAN_ID INTEGER,
FOREIGN KEY(SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID) ON DELETE CASCADE);

/* INSERT VALUES INTO ALL TABLES */

--1
INSERT INTO SALESMAN VALUES(1000, 'RAJESH', 'BANGALORE', 50);
INSERT INTO SALESMAN VALUES(2000, 'ASHWIN', 'TUMKUR', 30);
INSERT INTO SALESMAN VALUES(3000, 'SURESH', 'MUMBAI', 40);
INSERT INTO SALESMAN VALUES(4000, 'LAVANYA', 'BANGALORE', 40);
INSERT INTO SALESMAN VALUES(5000, 'ROHIT', 'MYSORE', 60);

--2
INSERT INTO CUSTOMER VALUES(11, 'INFOSYS', 'BANGALORE', 4, 1000);
INSERT INTO CUSTOMER VALUES(22, 'TCS', 'BANGALORE', 4, 2000);
INSERT INTO CUSTOMER VALUES(33, 'WIPRO', 'MYSORE', 7, 1000);
INSERT INTO CUSTOMER VALUES(44, 'TCS', 'MYSORE', 6, 2000);
INSERT INTO CUSTOMER VALUES(55, 'ORACLE', 'TUMKUR', 3, 3000);

--3
INSERT INTO ORDERS VALUES(1, 200000, '2016-04-12', 11, 1000);
INSERT INTO ORDERS VALUES(2, 300000, '2016-04-12', 11, 2000);
INSERT INTO ORDERS VALUES(3, 400000, '2017-04-15', 22, 1000);

/* DISPLAY CONTENTS OF ALL TABLES */

SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

/* QUERIES */

--1
SELECT COUNT(CUSTOMER_ID)
FROM CUSTOMER
WHERE GRADE>(SELECT AVG(GRADE)
FROM CUSTOMER
WHERE CITY LIKE '%BANGALORE');

--2
SELECT NAME, COUNT(CUSTOMER_ID)
FROM SALESMAN S, CUSTOMER C
WHERE S.SALESMAN_ID=C.SALESMAN_ID
GROUP BY NAME
HAVING COUNT(CUSTOMER_ID)>1;

--3
(SELECT NAME
FROM SALESMAN S, CUSTOMER C
WHERE S.SALESMAN_ID=C.SALESMAN_ID AND
S.CITY=C.CITY)
UNION
(SELECT NAME
FROM SALESMAN
WHERE SALESMAN_ID NOT IN(SELECT S1.SALESMAN_ID
FROM SALESMAN S1, CUSTOMER C1
WHERE S1.SALESMAN_ID=C1.SALESMAN_ID AND
S1.CITY=C1.CITY));

--4
CREATE VIEW SALES_HIGHERODER AS
SELECT SALESMAN_ID, PURCHASE_AMT
FROM ORDERS
WHERE PURCHASE_AMT=(SELECT MAX(O.PURCHASE_AMT)
FROM ORDERS O
WHERE O.ORD_DATE='2016-04-12');

SELECT * FROM SALES_HIGHERODER;

--5
DELETE FROM SALESMAN
WHERE SALESMAN_ID = 1000;

SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMER;
