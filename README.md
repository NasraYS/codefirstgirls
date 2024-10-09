# STEM Tuition Institution Database Project

## Overview
This project was created as part of the **CodeFirstGirls Coding Kickstarter - Introduction to Data Science & SQL** course, and it was an incredibly rewarding experience for me. Coming from a chemical engineering background, I was excited to dive into the world of data science and SQL, and this course gave me a solid foundation to build on. I enjoyed every step of the process, from designing the database to writing queries, and I learned so many valuable skills along the way.

The focus of this project is a STEM tuition institution, and through it, I explored various aspects of database management and analytics. The project taught me how to think critically about data structures and how to use SQL to uncover insights from raw data. It also gave me hands-on experience with creating and managing relational databases, working with real-world scenarios, and presenting my work to others.

This repository showcases the final project, and I’m proud to share the skills I gained through this journey. I’m looking forward to applying these new skills to future projects and expanding my knowledge even further.

## Project Structure
The project includes five interconnected tables that store data related to tutors, students, subjects, payments, and course registrations. Several SQL tasks are implemented to showcase complex queries, including analytic views, custom functions, and procedures for specific use cases.

### Key Features:
- **5 Relational Tables**:
  - `TutorList`: Stores data on tutors, including contact information and the subjects they teach.
  - `StudentList`: Stores data on students, including their year group and personal contact information.
  - `SubjectList`: Tracks available subjects, start and end dates, and the tutors teaching them.
  - `FeesList`: Manages payment information for each student, including fees, payment method, and dates.
  - `RegistrationList`: Links students to subjects, recording the date of registration.

- **Analytic Queries and Views**:
  - **Analytic View:** A custom view displays payment dates for students enrolled in mathematics.
  - **Stored Function:** A SQL function applies a 10% discount to fees at the beginning of each term.
  - **Stored Procedure:** Retrieves all tutors teaching engineering-related subjects.
  - **Complex Query:** Identifies students who make payments in multiple installments and applies a 10% interest surcharge to their total fees.

### Database Schema:
#### 1. TutorList
```sql
CREATE TABLE TutorList (
    TutorID INT NOT NULL PRIMARY KEY,
    TutorFirstName VARCHAR(20) NOT NULL,
    TutorLastName VARCHAR(20),
    TutorSubject VARCHAR(35),
    TutorPhoneNo VARCHAR(20),
    TutorEmail VARCHAR(30)
);
```

#### 2. StudentList
```sql
CREATE TABLE StudentList (
    StudentID INT NOT NULL PRIMARY KEY,
    StudentFirstName VARCHAR(20) NOT NULL,
    StudentLastName VARCHAR(20),
    StudentPhoneNo VARCHAR(20),
    StudentEmail VARCHAR(30),
    StudentYearGroup VARCHAR(10)
);
```

#### 3. SubjectList
```sql
CREATE TABLE SubjectList (
    SubjectID VARCHAR(10) NOT NULL PRIMARY KEY,
    SubjectName VARCHAR(30) NOT NULL,
    SubjectStartDate DATE,
    SubjectEndDate DATE,
    TutorID INT NOT NULL,
    FOREIGN KEY (TutorID) REFERENCES TutorList(TutorID)
);
```

#### 4. FeesList
```sql
CREATE TABLE FeesList (
    FeeID INT NOT NULL PRIMARY KEY,
    PaymentMethod VARCHAR(30),
    FeeAmount FLOAT NOT NULL,
    PaymentDate DATE,
    StudentID INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES StudentList(StudentID)
);
```

#### 5. RegistrationList
```sql
CREATE TABLE RegistrationList (
    StudentID INT NOT NULL,
    SubjectID VARCHAR(10) NOT NULL,
    RegistrationDate DATE,
    PRIMARY KEY (StudentID, SubjectID),
    FOREIGN KEY (StudentID) REFERENCES StudentList(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES SubjectList(SubjectID)
);
```

## SQL Tasks:
### 1. View for Mathematics Students' Payment Dates:
A view that retrieves payment information for students enrolled in Mathematics.
```sql
CREATE VIEW all_mathematics_students AS 
SELECT s.StudentFirstName, s.StudentLastName, s.StudentYearGroup, j.SubjectName, r.SubjectID, f.PaymentDate
FROM StudentList s 
LEFT JOIN RegistrationList r ON s.StudentID = r.StudentID
JOIN SubjectList j ON j.SubjectID = r.SubjectID
JOIN FeesList f ON s.StudentID = f.StudentID
WHERE j.SubjectName = 'Mathematics';
```

### 2. Function to Apply a 10% Price Reduction:
A function that applies a 10% discount to course fees at the start of each term.
```sql
DELIMITER //
CREATE FUNCTION PriceReduced (input_amount DECIMAL(5,2))
RETURNS DECIMAL(5,2)
BEGIN
    DECLARE output_amount DECIMAL(5,2);
    SET output_amount = input_amount - 0.10 * input_amount;
    RETURN output_amount;
END//
DELIMITER ;
```

### 3. Query for Multi-Payment Students:
A query that adds 10% interest for students paying with more than two payment methods.
```sql
SELECT StudentID, ROUND(SUM(1.1 * FeeAmount), 2) AS AdjustedFees
FROM FeesList
WHERE StudentID IN (
    SELECT s.StudentID FROM StudentList s
    JOIN FeesList f ON s.StudentID = f.StudentID
    GROUP BY s.StudentID
    HAVING COUNT(f.StudentID) > 2
)
GROUP BY StudentID;
```

### 4. Stored Procedure for Engineering Tutors:
A stored procedure that retrieves all tutors teaching engineering-related subjects.
```sql
DELIMITER //
CREATE PROCEDURE EngineeringCourseTutors()
BEGIN
    SELECT s.SubjectName, t.TutorFirstName, t.TutorLastName
    FROM SubjectList s
    JOIN TutorList t ON s.TutorID = t.TutorID
    WHERE t.TutorSubject LIKE '%Engineering%';
END//
DELIMITER ;
```

### 5. Query for Popular Subjects:
A query that ranks subjects by the number of students enrolled, helping to assess tutor workloads.
```sql
SELECT r.SubjectID, COUNT(r.StudentID)
FROM RegistrationList r
GROUP BY r.SubjectID
ORDER BY COUNT(r.StudentID) DESC;
```

## Database Diagram

Here is the final ER diagram for the database structure used in this project:

<img width="485" alt="sql final diagram" src="https://github.com/user-attachments/assets/b59fc07e-a41e-494d-b38f-bcb4f368ad88">

## Lessons Learned:
This project enhanced my skills in:
- Relational database design and management.
- Writing complex SQL queries, views, and functions.
- Automating tasks using stored procedures.
- Presenting technical data clearly and efficiently.

## Future Improvements:
- Implement triggers for automatic updates when payments are made.
- Expand the database with more detailed information, such as grades and course materials.
