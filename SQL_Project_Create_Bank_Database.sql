--Project on creatig a Bank Database Tables Using MSSQL--

--Done By - Kenwin Dass C (D22051)

Objective : To Create a Bank database tables using MSSQL

Description : The bank database schema has a combination of multiple tables like customer, branch, account, trandetails, loan,
where i created  a database schema tables which is more helpful to design a bank database.

--Create the database Bank--
CREATE DATABASE Bank_Database;

--Use the Bank Database--
USE Bank_Database;

--Creating table customer--
CREATE TABLE customer
   (   customer_id VARCHAR(6),
       first_name VARCHAR(30),
       middle_name VARCHAR(30),
       last_name VARCHAR(30),
       city VARCHAR(15),
       mobile_number VARCHAR(10),
       occupation VARCHAR(10),
       date_of_birth DATE,
       CONSTRAINT customer_customer_id_pk PRIMARY KEY(customer_id));

--Creating table branch--
CREATE TABLE branch
   (branch_id VARCHAR(6),
    branch_name VARCHAR(30),
    branch_city VARCHAR(30),
    CONSTRAINT branch_branch_id_pk PRIMARY KEY(branch_id));

--Creating table account--
CREATE TABLE account
   (  account_number VARCHAR(6),
      customer_id  VARCHAR(6),
      branch_id VARCHAR(6),
      opening_balance INT,
      account_opening_date DATE,
      account_type VARCHAR(10),
      account_status VARCHAR(10),
      CONSTRAINT account_account_number_pk PRIMARY KEY(account_number),
      CONSTRAINT account_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
      CONSTRAINT account_branch_id_fk FOREIGN KEY(branch_id) REFERENCES branch(branch_id));

--Creating table transaction details--
CREATE TABLE trandetails
    (transaction_number VARCHAR(6),
     account_number VARCHAR(6),
     date_of_transaction DATE,
     medium_of_transaction VARCHAR(20),
     transaction_type VARCHAR(20),
     transaction_amount INT,    
     CONSTRAINT trandetails_transaction_number_pk PRIMARY KEY(transaction_number),
     CONSTRAINT trandetails_account_number_fk FOREIGN KEY(account_number) REFERENCES account(account_number));

--Creating table loan--
CREATE TABLE loan
   (customer_id VARCHAR(6),
    branch_id VARCHAR(6),
    loan_amount INT,
    CONSTRAINT loan_customer_customer_id_branch_id_pk PRIMARY KEY(customer_id,branch_id),
    CONSTRAINT loan_customer_id_fk FOREIGN KEY(customer_id) REFERENCES  customer(customer_id),
    CONSTRAINT loan_branch_id_fk FOREIGN KEY(branch_id) REFERENCES  branch(branch_id));

--Inserting Record into the customer table--

INSERT INTO customer VALUES('C00001','kenwin','dass','christu','chennai','9543198345','Service','1976-12-06');
INSERT INTO customer VALUES('C00002','edwin',null,'Moses','Delhi','9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','manali','sandeep','parab','mumbai','9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','maheshwari',null,'chellamma','mettupalayam','9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','mahesh','kumar','dhoni','ranchi','8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','prasath',null,'kumar','Mumbai','7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','lakshmi',null,'panchal','Mumbai','9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','sachin',null,'singh','haryana','7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','benwin',null,'anthony','Kolkata','9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','ashwin',null,'kumar','Chennai','8765489076','Service','1976-07-12');

select * from customer;

--Inserting records into the branch table--

INSERT INTO branch VALUES('B00001','Asaf ali road','Delhi');
INSERT INTO branch VALUES('B00002','New delhi main branch','Delhi');
INSERT INTO branch VALUES('B00003','Delhi cantt','Delhi');
INSERT INTO branch VALUES('B00004','Jasola','Delhi');
INSERT INTO branch VALUES('B00005','Mahim','Mumbai');
INSERT INTO branch VALUES('B00006','Vile parle','Mumbai');
INSERT INTO branch VALUES('B00007','Mandvi','Mumbai');
INSERT INTO branch VALUES('B00008','Jadavpur','Kolkata');
INSERT INTO branch VALUES('B00009','Kodambakkam','Chennai');

select * from branch;

--Inserting records into the account table--

INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');

select * from account;

--Inserting records into the trandetails table--

INSERT INTO trandetails VALUES('T00001','A00001','2013-01-01','Cheque','Deposit',2000);
INSERT INTO trandetails VALUES('T00002','A00001','2013-02-01','Cash','Withdrawal',1000);
INSERT INTO trandetails VALUES('T00003','A00002','2013-01-01','Cash','Deposit',2000);
INSERT INTO trandetails VALUES('T00004','A00002','2013-02-01','Cash','Deposit',3000);
INSERT INTO trandetails VALUES('T00005','A00007','2013-01-11','Cash','Deposit',7000);
INSERT INTO trandetails VALUES('T00006','A00007','2013-01-13','Cash','Deposit',9000);
INSERT INTO trandetails VALUES('T00007','A00001','2013-03-13','Cash','Deposit',4000);
INSERT INTO trandetails VALUES('T00008','A00001','2013-03-14','Cheque','Deposit',3000);
INSERT INTO trandetails VALUES('T00009','A00001','2013-03-21','Cash','Withdrawal',9000);
INSERT INTO trandetails VALUES('T00010','A00001','2013-03-22','Cash','Withdrawal',2000);
INSERT INTO trandetails VALUES('T00011','A00002','2013-03-25','Cash','Withdrawal',7000);
INSERT INTO trandetails VALUES('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);

select * from trandetails;

--Inserting records into the loan table--

INSERT INTO loan VALUES('C00001','B00001',100000);
INSERT INTO loan VALUES('C00002','B00002',200000);
INSERT INTO loan VALUES('C00009','B00008',400000);
INSERT INTO loan VALUES('C00010','B00009',500000);
INSERT INTO loan VALUES('C00001','B00003',600000);
INSERT INTO loan VALUES('C00002','B00001',600000);

select * from loan;

-- All tables with records are created, now we will perform queries on these tables--

Problem#1:
/*Write a query to display the customer number, firstname, 
customer’s date of birth. Display in sorted order of date of birth year and within that sort by firstname*/

SELECT customer_id as customer_number,first_name as customer_first_name,date_of_birth as customer_date_of_birth 
FROM customer ORDER BY date_of_birth,first_name ASC;

Problem#2:
/*Write a query to display the customer’s number, first name, and middle name. 
The customer’s who don’t have a middle name, for them display the last name. Give the alias name as Cust_Name*/

SELECT customer_id as customer_number,concat(concat(first_name,' '),
coalesce(middle_name,last_name))as Customer_Name from customer;

Problem#3:
/*Write a query to display account number, customer’s number, customer’s firstname,lastname,account opening date*/

select a.customer_id as account_number,c.customer_id as customer_number,c.first_name as customer_first_name,
c.last_name as customer_last_name,a.account_opening_date from customer c,account a where a.customer_id=c.customer_id;

Problem#4:
/*Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count*/

select count(*) as cust_count_from_delhi from customer where city='delhi';

Problem#5:
/*Write a query to display  the customer number, customer firstname,
account number for the customer’s whose accounts were created after 15th of any month*/

select a.customer_id as customer_number,c.first_name as customer_firstname,a.account_number as customer_account_number 
from account a,customer c where a.customer_id=c.customer_id and day(account_opening_date)>15;

Problem#6:
/*Write a query to display the female customers firstname, city and account number who are not into service or studies*/

select distinct c.first_name,c.city,a.account_number from customer c,account a where a.customer_id=c.customer_id and
occupation not in(select occupation from customer where occupation='Service' or occupation='Student');

Problem#7:
/*Write a query to display city name and count of branches in that city. Give the count of branches an alias name of Count_Branch*/

select branch_city as city_name,count(*) as Count_of_Branch 
from branch group by branch_city;

Problem#8:
/*Write a query to display account id, customer’s firstname, customer’s lastname for the customer’s whose account is Active*/

select a.account_number as account_id,c.first_name as customer_first_name,c.last_name as customer_last_name
from account a,customer c where a.customer_id=c.customer_id and account_status='active';

Problem#9:
/*Write a query to display the customer’s number, customer’s firstname, branch id and loan amount for people who have taken loans*/

select l.customer_id as customer_number,c.first_name as customer_first_name,l.branch_id,l.loan_amount
from loan l,customer c where c.customer_id=l.customer_id;

Problem#10:
/*Write a query to display customer number, customer name, account number where the account status is terminated*/

select a.customer_id as customer_numner,c.first_name as customer_name,a.account_number from account a,customer c 
where a.customer_id=c.customer_id and account_status='terminated';

Problem#11:
/*Write a query to display  the total number of  withdrawals and total number of deposits being done by 
customer whose registration is C00001. Give the count an alias name of Trans_Count. */ 

select count(*) as trans_count from trandetails t,account a 
where t.account_number=a.account_number and a.customer_id='C00001';

Problem#12:
/*Write a query to display the customer number, customer firstname, customer lastname who has taken 
loan from more then 1 bank.*/

select customer_id as customer_number,first_name as customer_first_name,last_name as customer_last_name 
from customer where customer_id in(select customer_id from loan group by customer_id having count(*)>1);

Problem#13:
/*Write a query to display the number of client who have asked for loans but they don’t have any account 
in the bank though they are registered customers. Give the count an alias name of Count.*/

select count(*) as count from loan where customer_id not in
(select distinct customer_id from account);

Problem#14:
/*Write a query to the count the number of customers who have registration but no account in the bank.
Give the alias name as Count_Customer.*/

select count(*) as Count_Customer from customer where customer_id not in
(select distinct customer_id from account);

Problem#15:
/*Write  a query to display the customer’s firstname who have more then 1 account*/

select c.first_name from customer c,account a where a.customer_id=c.customer_id  
group by c.first_name having count(*)>1 ;

Problem#16:
/*Write a query to display the customer’s firstname who have multiple accounts atleast in 2 banks.*/

select c.first_name from customer c,account a,branch b where a.customer_id=c.customer_id 
and a.branch_id=b.branch_id group by c.first_name having count(*)>1;

Problem#17:
/*Write a query to display the  account number who has done the highest transaction.
For example the account A00023 has done 5 transactions i.e. suppose 3 withdrawal and 2 deposits.
Whereas the account A00024 has done 3 transactions i.e. suppose 2 withdrawals and 1 deposit. 
So account number of A00023 should be displayed. */

select account_number from trandetails t group by account_number having count(*)=
(select max(c) from (select count(*)c from trandetails t group by t.account_number)a );
