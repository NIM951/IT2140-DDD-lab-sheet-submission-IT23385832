CREATE DATABASE emp_dept_db;
USE emp_dept_db;
CREATE TABLE emp (
    eid INTEGER PRIMARY KEY,
    ename VARCHAR(25),
    age INT,
    salary FLOAT
);

CREATE TABLE dept (
    did CHAR(12) PRIMARY KEY,
    budget FLOAT,
    managerId INT,
    FOREIGN KEY (managerId) REFERENCES emp(eid)
);

CREATE TABLE works (
    eid INT,
    did CHAR(12),
    pct_time INT,
    PRIMARY KEY (eid, did),
    FOREIGN KEY (eid) REFERENCES emp(eid),
    FOREIGN KEY (did) REFERENCES dept(did)
);

insert into emp values(1000,'Lakmal',33,90000)
insert into emp values(1001,'Nadeeka',24,28000)
insert into emp values(1002,'Amila',26,35000)
insert into emp values(1003,'Nishani',28,60000)
insert into emp values(1004,'Krishan',36,95000)
insert into emp values(1005,'Surangi',37,22000)
insert into emp values(1006,'Shanika',24,18000)
insert into emp values(1007,'Amali',21,20000)
insert into emp values(1008,'Charith',28,35000)
insert into emp values(1009,'Prasad',40,95000)

insert into dept values('Academic',900000,1002)
insert into dept values('Admin',120000,1000)
insert into dept values('Finance',3000000,1008)
insert into dept values('ITSD',4500000,1000)
insert into dept values('Maintenance',40000,1004)
insert into dept values('SESD',20000,1004)
insert into dept values('Marketing',90000,1008)

insert into works values(1000,'Admin',40)
insert into works values(1000,'ITSD',50)
insert into works values(1001,'Admin',100)
insert into works values(1002,'Academic',100)
insert into works values(1003,'Admin',20)
insert into works values(1003,'Academic',30)
insert into works values(1003,'ITSD',45)
insert into works values(1004,'Admin',60)
insert into works values(1004,'Finance',30)
insert into works values(1006,'Finance',45)
insert into works values(1006,'Maintenance',52)
insert into works values(1008,'Maintenance',30)
insert into works values(1008,'ITSD',30)
insert into works values(1008,'Finance',35)
insert into works values(1009,'Admin',100)


SELECT did
FROM works
GROUP BY did
HAVING COUNT(eid) < 3;


SELECT managerId, COUNT(*) AS dept_count
FROM dept
GROUP BY managerId
HAVING COUNT(*) > 1
ORDER BY dept_count ASC;


SELECT age, AVG(salary) AS avg_salary
FROM emp
GROUP BY age
HAVING AVG(salary) > 40000;


SELECT eid, COUNT(*) AS assignment_count
FROM works
GROUP BY eid
HAVING COUNT(*) > 2;


SELECT did, budget
FROM dept
WHERE budget > 1000000;




