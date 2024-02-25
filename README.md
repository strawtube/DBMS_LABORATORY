# DATA BASE MANAGEMENT SYSTEMS LABORATORY

## EXERCISE 1
### Library Database
**BOOK (Book_id, Title, Publisher_Name, Pub_Year)** <br>
**BOOK_AUTHORS (Book_id, Author_Name)** <br>
**PUBLISHER (Name, Address, Phone)** <br>
**BOOK_COPIES (Book_id, Programme_id, No_of_Copies)** <br>
**BOOK_LENDING (Book_id, Programme_id, Card_No, Date_Out, Due_Date)** <br>
**LIBRARY_PROGRAMME (Programme_id, Programme_Name, Address)** <br>

### SQL Queries
**1.** Retrieve details of all books in the library – id, title, name of publisher, authors, number of copies in each Programme, etc. <br>
**2.** Get the particulars of borrowers who have borrowed more than 3 books, but from Jan 2017 to Jun 2017. <br>
**3.** Delete a book in BOOK table. Update the contents of other tables to reflect this data manipulation operation. <br>
**4.** Partition the BOOK table based on year of publication. Demonstrate its working with a simple query. <br>
**5.** Create a view of all books and its number of copies that are currently available in the Library. <br>

## EXERCISE 2
### Orders Database
**SALESMAN(Salesman_id,Name, City, Commission)** <br>
**CUSTOMER(Customer_id, Cust_Name, City, Grade, Salesman_id)** <br>
**ORDERS(Ord_No, Purchase_Amt, Ord_Date, Customer_id, Salesman_id)** <br>

### SQL Queries
**1.** Count the customers with grades above Bangalore’s average. <br>
**2.** Find the name and numbers of all salesmen who had more than one customer. <br>
**3.** List the entire salesman and indicate those who have and do not have customers in their cities. *(Use UNION operation)* <br>
**4.** Create a view that finds the salesman who has the customer with the highest order of a day. <br>
**5.** Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted. <br>

## EXERCISE 3
### Movie Database
**ACTOR(Act_id, Act_Name, Act_Gender)** <br>
**DIRECTOR(Dir_id, Dir_Name, Dir_Phone)** <br>
**MOVIES(Mov_id, Mov_Title, Mov_Year, Mov_Lang, Dir_id)** <br>
**MOVIE_CAST(Act_id, Mov_id, Role)** <br>
**RATING(Mov_id, Rev_Stars)** <br>

### SQL Queries
**1.** List the titles of all movies directed by ‘Hitchcock’. <br>
**2.** Find the movie names where one or more actors acted in two or more movies. <br>
**3.** List all actors who acted in a movie before 2000 and in a movie after 2015. *(Use JOIN operation)* <br>
**4.** Find the title of movies and number of stars for each movie that has at least one rating and find the highest number of stars that movie received. Sort the result by movie title. <br>
**5.** Update rating of all movies directed by ‘Steven Spielberg’ to 5. <br>

## EXERCISE 4
### College Database
**STUDENT(USN, SName, Address, Phone, Gender)** <br>
**SEMSEC(SSID, Sem, Sec)** <br>
**CLASS(USN, SSID)** <br>
**COURSE(Subcode, Title, Sem, Credits)** <br>
**IAMARKS(USN, Subcode, SSID, Test1, Test2, Test3, FinalIA)** <br>

### SQL Queries
**1.** List all the student details studying in fourth semester ‘C’ section. <br>
**2.** Compute the total number of male and female students in each semester and in each section. <br>
**3.** Create a view of Test1 marks of student USN ‘1BY21IS007’ in all Courses. <br>
**4.** Calculate the FinalIA (average of best two test marks) and update the corresponding table for all students. <br>
**5.** Categorize students based on the following criterion: <br>
_If FinalIA = 17 to 20 then CAT = ‘Outstanding’_ <br>
_If FinalIA = 12 to 16 then CAT = ‘Average’_ <br>
_If FinalIA< 12 then CAT = ‘Weak’_ <br>
_Give these details only for 4th semester A, B, and C section students._ <br>

## EXERCISE 5
### Company Database
**EMPLOYEE(SSN, Name, Address, Sex, Salary, SuperSSN, DNo)** <br>
**DEPARTMENT(DNo, DName, MgrSSN, MgrStartDate)** <br>
**DLOCATION(DNo,DLoc)** <br>
**PROJECT(PNo, PName, PLocation, DNo)** <br>
**WORKS_ON(SSN, PNo, Hours)** <br>

### SQL Queries
**1.** Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, either as a worker or as a manager of the department that controls the project. <br>
**2.** Show the resulting salaries if every employee working on the ‘IoT’ project is given a 10 percent raise. <br>
**3.** Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum salary, the minimum salary, and the average salary in this department. <br>
**4.** Retrieve the name of each employee who works on all the projects controlled by department number 5. _(Use NOT EXISTS operator)_ <br>
**5.** For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than Rs. 6,00,000. <br>
