CREATE DATABASE STEM_Tuition1_db;
USE STEM_Tuition1_db;

/* Relational database of 5 tables based on an online STEM Tuition*/

/* Table 1 provides data on the different tutors at the centre, and the differnt subjects they teach, along with some additional information*/

CREATE TABLE TutorList (
TutorID int NOT NULL,
TutorFirstName VARCHAR(20) NOT NULL,
TutorLastName VARCHAR(20),
TutorSubject VARCHAR(35),
TutorPhoneNo VARCHAR(20),
TutorEmail VARCHAR(30),
CONSTRAINT pk_TutorID
PRIMARY KEY (TutorID)
);

/* Table 2 provides data on all the differnt students enrolled, and some additional data such as personal information along with the subjects they are taking and the year in university they are in*/

CREATE TABLE StudentList (
StudentID int NOT NULL,
StudentFirstName VARCHAR(20) NOT NULL,
StudentLastName VARCHAR(20),
StudentPhoneNo VARCHAR(20),
StudentEmail VARCHAR(30),
StudentYearGroup VARCHAR(10),
CONSTRAINT pk_StudentID
PRIMARY KEY (StudentID)
);

/* Table 3 provides data on all the different subjects available and the start and end dates of each teaching term, along with the tutors who teach the subject */

CREATE TABLE SubjectList (
SubjectID VARCHAR(10) NOT NULL,
SubjectName VARCHAR(30) NOT NULL,
SubjectStartDate DATE,
SubjectEndDate DATE,
TutorID int NOT NULL,
PRIMARY KEY (SubjectID),
CONSTRAINT fk_TutorID FOREIGN KEY (TutorID) REFERENCES TutorList (TutorID)
);

/* Table 4 consists of payment information, the fees owed by each student, along with payment dates */

CREATE TABLE FeesList (
FeeID  int NOT NULL,
PaymentMethod VARCHAR(30),
FeeAmount FLOAT NOT NULL,
PaymentDate DATE,
StudentID int NOT NULL,
PRIMARY KEY (FeeID),
CONSTRAINT fk_StudentID FOREIGN KEY (StudentID) REFERENCES StudentList (StudentID)
);

/* Table 5 consists of registration data for the STEM Tution */

CREATE TABLE RegistrationList (
StudentID int NOT NULL,
SubjectID VARCHAR(10) NOT NULL,
RegistrationDate DATE,
PRIMARY KEY (StudentID,SubjectID),
CONSTRAINT fk_SubjectID FOREIGN KEY (SubjectID) REFERENCES SubjectList (SubjectID)
);

/* Populating the Tables */

INSERT INTO TutorList
(TutorID, TutorFirstName, TutorLastName, TutorSubject, TutorPhoneNo, TutorEmail)
VALUES
('0001', 'Kelly', 'Mathews', 'Mathematics', '07348592847', 'kellymathews0001@gmail.com'),
('0002', 'Ahmed', 'Khan', 'Computer Science', '07395492838', 'ahmedkhan0002@gmail.com'),
('0003', 'SHelbey', 'Johnson', 'Biology', '07348538492', 'shelbeyjognson0003@gmail.com'),
('0004', 'Roy', 'Martin', 'Chemistry', '07342948302', 'roymartin0004@gmail.com'),
('0005', 'Steven', 'Lowes', 'Futher Mathematics', '07343792001', 'stevenlowes0005@gmail.com'),
('0006', 'Sadie', 'Mohamud', 'Physics', '07347482993', 'sadiamohamud0006@gmail.com'),
('0007', 'Ayaan', 'Farah', 'Chemical Engineering', '07343920478', 'ayaanfarah0007@gmail.com'),
('0008', 'Anisa', 'Umar', 'Design and Technology', '07341992840', 'anisaumar0008@gmail.com'),
('0009', 'Clark', 'Stevenson', 'Mechanical Engineering', '07342778390', 'clarkstevenson0009@gmail.com'),
('0010', 'Pauline', 'Clarenson', 'Biochemistry', '07343890228', 'paulineclarenson0010@gmail.com');

INSERT INTO StudentList
(StudentID, StudentFirstName, StudentLastName, StudentPhoneNo, StudentEmail, StudentYearGroup)
VALUES
('1001', 'Khadija', 'Abdi', '07357392049', 'khadijaabdi1001@gmail.com', 'Year 3'),
('1002', 'Yussuf', 'Ali', '07357347830', 'yussufali1002@gmail.com', 'Year 3'),
('1003', 'Zack', 'Jackson', '07357392475', 'zackjackson1003@gmail.com', 'Year 1'),
('1004', 'Anila', 'Damien', '07357392389', 'aniladamien1004@gmail.com', 'Year 3'),
('1005', 'Sofia', 'Jerome', '07357392299', 'sofiajerome1005@gmail.com', 'Year 3'),
('1006', 'Kendra', 'Peterson', '07357392110', 'kendrapeterson1006@gmail.com', 'Year 2'),
('1007', 'Petra', 'Smith', '07357392300', 'petrasmith1007@gmail.com', 'Year 1'),
('1008', 'Suzie', 'Wateson', '07357392209', 'suziewateson1008@gmail.com', 'Year 2'),
('1009', 'Kai', 'Kimmel', '07357392999', 'kaikimmel1009@gmail.com', 'Year 3'),
('1010', 'Claude', 'Cole', '07357392009', 'claudecole1010@gmail.com', 'Year 2'),
('1011', 'Sean', 'Lew', '07357392009', 'seanlew1011@gmail.com', 'Year 2'),
('1012', 'Cameron', 'Harrison', '07357392009', 'cameronharrison1012@gmail.com', 'Year 2'),
('1013', 'Andria', 'Jay', '07357392009', 'andriajay1013@gmail.com', 'Year 2'),
('1014', 'Farah', 'Derek', '07357392009', 'farahderek1014@gmail.com', 'Year 2'),
('1015', 'Tayyab', 'Cranberry', '07357392009', 'tayyabcranberry1015@gmail.com', 'Year 2');

INSERT INTO SubjectList
(SubjectID, SubjectName, SubjectStartDate, SubjectEndDate, TutorID)
VALUE
('M-1', 'Mathematics', '2023-11-01', '2024-05-01', '0001'),
('CS-1', 'Computer Science', '2023-11-01', '2024-05-01', '0002'),
('B-1', 'Biology', '2023-11-01', '2024-05-01', '0003'),
('C-1', 'Chemistry', '2023-11-01', '2024-05-01', '0004'),
('FM-1', 'Further Mathematics', '2023-11-01', '2024-05-01', '0005'),
('P-1', 'Physics', '2023-11-01', '2024-05-01', '0006'),
('CE-1', 'Chemical Engineering', '2023-11-01', '2024-05-01', '0007'),
('DT-1', 'Design Technology', '2023-11-01', '2024-05-01', '0008'),
('ME-1', 'Mechanical Engineering', '2023-11-01', '2024-05-01', '0009'),
('BC-1', 'Biochemistry', '2023-11-01', '2024-05-01', '0010');

INSERT INTO FeesList
(FeeID, PaymentMethod, FeeAmount, PaymentDate, StudentID)
VALUES
('9001', 'Credit Card', '699.00', '2023-10-01', '1001'),
('9002', 'Debit Card', '799.00', '2023-10-04', '1002'),
('9003', 'Credit Card', '599.00', '2023-10-08', '1002'),
('9004', 'Cheque', '499.00', '2023-10-13', '1004'),
('9005', 'Paypal', '899.00', '2023-10-23', '1005'),
('9006', 'Debit Card', '699.00', '2023-10-19', '1006'),
('9007', 'Debit Card', '399.00', '2023-10-06', '1007'),
('9008', 'Credit Card', '599.00', '2023-10-10', '1008'),
('9009', 'Credit Card', '699.00', '2023-10-15', '1009'),
('9010', 'Paypal', '799.00', '2023-10-24', '1010'),
('9011', 'Credit Card', '899.00', '2023-10-24', '1011'),
('9012', 'Cheque', '499.00', '2023-10-24', '1012'),
('9013', 'Paypal', '799.00', '2023-10-24', '1013'),
('9014', 'Debit Card', '499.00', '2023-10-24', '1014'),
('9015', 'Debit Card', '399.00', '2023-10-24', '1015'); 

INSERT INTO RegistrationList
(StudentID, SubjectID, RegistrationDate)
VALUE
('1001', 'M-1', '2023-09-30'),
('1002', 'M-1', '2023-09-30'),
('1003', 'CS-1', '2023-09-30'),
('1004', 'C-1', '2023-09-30'),
('1005', 'M-1', '2023-09-30'),
('1006', 'FM-1', '2023-09-30'),
('1007', 'P-1', '2023-09-30'),
('1008', 'P-1','2023-09-30'),
('1009','CE-1', '2023-09-30'),
('1010', 'DT-1', '2023-09-30'),
('1011', 'ME-1', '2023-09-30'),
('1012', 'DT-1', '2023-09-30'),
('1013', 'ME-1', '2023-09-30'),
('1014', 'BC-1', '2023-09-30'),
('1015', 'BC-1', '2023-09-30');

/* Task 3: Using left joins to see payment dates of all mathematics students */

CREATE VIEW all_mathematics_students AS 
SELECT s.StudentFirstName, s.StudentLastName, s.StudentYearGroup, J.SubjectName, r.SubjectID, f.PaymentDate
FROM StudentList s 
LEFT Join RegistrationList r
ON s.StudentID = r.StudentID
JOIN SubjectList j 
ON j.SubjectID = r.SubjectID
JOIN FeesList f
ON s.StudentID = f.StudentID
WHERE SubjectName = 'Mathematics'

/*  Task 4: Creating a stored function, in which during the beginning of every term, theres a price reductions of 10% to all subjects */

DELIMITER //
CREATE FUNCTION PriceReduced (input_amount DECIMAL(5,2))
RETURNS DECIMAL(5,2)
BEGIN
	DECLARE output_amount DECIMAL(5,2);
	SET output_amount = input_amount - 10 / 100 * input_amount;
	RETURN output_amount;
END//
DELIMITER ;

/* Testing out the stored function from above */

SELECT
f.FeeID,
f.FeeAmount,
PriceReduced(f.FeeAmount) AS ReducedFees
FROM 
FeesList AS f; 
    
/* Task 5: Example query: For students who pay with over 2 different paymets to cover the full amount, 10% interst is added onto their payments, so table below represents the students who will have muliple payments, and thier ammended fees */ 

SELECT StudentID, round(SUM(1.1*FeeAmount),2) as AdjustedFees
FROM FeesList
WHERE StudentID IN (
SELECT s.StudentID FROM StudentList s
JOIN FeesList f
ON s.StudentID = f.StudentID
GROUP BY s.StudentID
HAVING COUNT(f.StudentID) > 2)
GROUP BY StudentID;

/* Advanced Tasks*/

/* Task 1: Create Stored Procedure - All subjects taught by tutors which are related to engineering */

DELIMITER //
CREATE PROCEDURE EngineeringCourseTutors()
BEGIN
	SELECT * FROM SubjectList;
    SELECT s.SubjectName, t.TutorFirstName, t.TutorLastName
FROM SubjectList s
JOIN TutorList t
ON s.TutorID = t.TutorID
WHERE TutorSubject LIKE '%Engineering%';
END//
DELIMITER ;

/* Testing the stored function above */

CALL EngineeringCourseTutors;

/* Task 5: Using group by and order by to determine the most popular subjects and ording them in decending order, in order to determine the amount of time the Tutors have to set aside*/ 

SELECT 
	r.SubjectID,
	COUNT(r.StudentID)
FROM 
RegistrationList AS r
GROUP BY
	r.SubjectID
ORDER BY COUNT(r.StudentID) DESC;

