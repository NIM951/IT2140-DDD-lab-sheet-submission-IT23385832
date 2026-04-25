-- Create Course Table
CREATE TABLE Course (
    CID VARCHAR(10) PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    C_Description VARCHAR(500),
    C_fee DECIMAL(10,2)
);

-- Create Student Table
CREATE TABLE Student (
    SID VARCHAR(20) PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Dob DATE,
    NIC VARCHAR(15),
    CID VARCHAR(10) FOREIGN KEY REFERENCES Course(CID)
);

-- Create Module Table
CREATE TABLE Module (
    Mcode VARCHAR(20) PRIMARY KEY,
    Mname VARCHAR(100) NOT NULL,
    M_Description VARCHAR(200),
    NoOfCredits INT
);

-- Create Offers Table (linking Course + Module)
CREATE TABLE Offers (
    CID VARCHAR(10) FOREIGN KEY REFERENCES Course(CID),
    Mcode VARCHAR(20) FOREIGN KEY REFERENCES Module(Mcode),
    Accadamic_year VARCHAR(10),
    Semester VARCHAR(5),
    PRIMARY KEY (CID, Mcode)
);

INSERT INTO Student (SID, Sname, Address, Dob, NIC, CID) 
VALUES 
('CN18384756', 'Kamal', 'No122, Rose street, Matale', '1994-05-02', '946785467v', 'CSNE'),
('DS18234876', 'Pubudu', 'No678, 3rd new lane, Maharahgama', '1994-11-08', '948763759v', 'DS'),
('IT18234568', 'Ann', 'No12, Kings street, Colombo', '1996-11-11', '961234587v', 'IT'),
('SE19238567', 'Malith', 'No08, St.Thomas street, Kandy', '1992-12-20', '922356785v', 'SE');

INSERT INTO Course (CID, Cname, C_Description, C_fee) 
VALUES 
('IT', 'Information Technology', 'The programme is designed for technically focused students who capabilities in programming', 175000),
('SE', 'Software Engineering', 'Software engineering is the discipline of designing, creating and maintaining', 185000),
('CSNE', 'Computer Systems And Network Engineering', 'The programme aims to provide students with the knowledge, skills, planning, and designing', 155000),
('DS', 'Data Science', 'The meticulous curriculum focuses on the fundamentals of computer science, statistics, and applied mathematics', 170000);

INSERT INTO Module (Mcode, Mname, M_Description, NoOfCredits) 
VALUES 
('SE3050', 'User Experience Engineering', 'subject under SE', 4),
('IT1010', 'Introduction to Programming', 'subject under IT', 4),
('IT2050', 'Computer Networks', 'subject under IT', 4),
('IT3051', 'Fundamentals of Data Mining', 'subject under DS', 4);


INSERT INTO Offers (CID, Mcode, Accadamic_year, Semester) 
VALUES 
('SE', 'SE3050', 'Y3', '2'),
('IT', 'IT1010', 'Y1', '2'),
('IT', 'IT2050', 'Y2', '1'),
('DS', 'IT3051', 'Y3', '2');