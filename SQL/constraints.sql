use school;
drop table students;
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    PRIMARY KEY (StudentID)
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    PRIMARY KEY (CourseID),
    CONSTRAINT CHK_Credits CHECK (Credits > 0)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    PRIMARY KEY (EnrollmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE,
    UNIQUE (StudentID, CourseID)
);

-- CREATE TABLE Enrollments (
--     EnrollmentID INT AUTO_INCREMENT,
--     StudentID INT,
--     CourseID INT,
--     EnrollmentDate DATE NOT NULL,
--     PRIMARY KEY (EnrollmentID),
--     FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE SET NULL,
--     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE SET NULL
-- );



INSERT INTO Students (FirstName, LastName, BirthDate) VALUES
('John', 'Doe', '2000-01-15'),
('Jane', 'Smith', '1999-11-30'),
('Michael', 'Brown', '2001-06-22');

INSERT INTO Courses (CourseName, Credits) VALUES
('Mathematics', 3),
('Science', 4),
('History', 2);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-02-12'),
(3, 3, '2024-03-15');

-- Primary Key Constraint
INSERT INTO Students (StudentID, FirstName, LastName, BirthDate) 
VALUES (1, 'Alice', 'Johnson', '1998-05-05');

-- Check constraints
INSERT INTO Courses (CourseName, Credits) 
VALUES ('Invalid Course', -1);

-- Foreign Key Constraint
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) 
VALUES (4, 1, '2024-04-01');

-- Constraint
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate) 
VALUES (1, 1, '2024-01-11');

-- On Delete Cascade
DELETE FROM Students WHERE StudentID = 1;


-- Query the data
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

ALTER TABLE Courses
ADD COLUMN Description VARCHAR(255) DEFAULT 'No description';

-- Insert new course to demonstrate the default value
INSERT INTO Courses (CourseName, Credits) VALUES ('Art', 3);

-- Query the Courses table to see the new column and default value
SELECT * FROM Courses;


