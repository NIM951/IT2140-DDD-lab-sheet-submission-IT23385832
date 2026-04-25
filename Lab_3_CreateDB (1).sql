CREATE TABLE Course
 (
 	CID integer PRIMARY KEY,
	Cname varchar(25),
 	C_Description varchar(60),
 	C_fee Money
 )
 
 CREATE TABLE Module 
 (
 	Mcode integer PRIMARY KEY,
 	Mname varchar(25),
 	M_Description varchar(60),
  	NoOfCredits integer 
 )
 
 CREATE TABLE Student  
 (
 	SID integer PRIMARY KEY,
 	Sname varchar(25),
 	Address varchar(60),
	dob Date,
   	NIC char(10),
  	CID integer foreign key references Course 
 )
 CREATE TABLE Offers
 (
 	CID integer FOREIGN KEY references Course(cid) ,
   	Mcode integer FOREIGN KEY references Module(mcode) ,
   	Accadamic_year integer,
   	Semester integer,
 )
 --1)Student=primary key - SID,Foreign Keys-CID --
 --Course=primary key - CID,Foreign Keys-none --
 --Module=primary key - Mcode,Foreign Keys-none --
 --Offers=primary key - Composite key - (CID, Mcode),Foreign Keys-CID, Mcode --

---2)Course,Module,Student,Offers --

---3)
ALTER TABLE Student
ADD CONSTRAINT chk_nic
CHECK (NIC LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]');

ALTER TABLE Module
ADD CONSTRAINT chk_credits
CHECK (NoOfCredits IN (1, 2, 3, 4));