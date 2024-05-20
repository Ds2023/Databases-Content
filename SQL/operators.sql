-- Operators,In,Between
CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    PRIMARY KEY (AuthorID)
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublicationYear INT,
    Genre VARCHAR(50),
    CopiesAvailable INT,
    PRIMARY KEY (BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

CREATE TABLE Borrows (
    BorrowID INT AUTO_INCREMENT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    PRIMARY KEY (BorrowID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);

-- Insert data into Authors
INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES
('J.K.', 'Rowling', '1965-07-31'),
('George', 'Orwell', '1903-06-25'),
('J.R.R.', 'Tolkien', '1892-01-03');

-- Insert data into Books
INSERT INTO Books (Title, AuthorID, PublicationYear, Genre, CopiesAvailable) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy', 10),
('1984', 2, 1949, 'Dystopian', 8),
('The Hobbit', 3, 1937, 'Fantasy', 5);

-- Insert data into Borrows
INSERT INTO Borrows (BookID, BorrowDate, ReturnDate) VALUES
(1, '2024-05-01', '2024-05-15'),
(2, '2024-05-03', '2024-05-17'),
(3, '2024-05-05', NULL);

-- Comparison operators
SELECT * FROM Books WHERE PublicationYear = 1997;

SELECT * FROM Books WHERE Genre != 'Fantasy';

SELECT * FROM Books WHERE CopiesAvailable > 5;

SELECT * FROM Books WHERE PublicationYear < 1950;

SELECT * FROM Books WHERE PublicationYear >= 2000;

SELECT * FROM Books WHERE CopiesAvailable <= 5;

-- Logical Operators
SELECT * FROM Books WHERE Genre = 'Fantasy' AND CopiesAvailable > 5;

SELECT * FROM Books WHERE Genre = 'Dystopian' OR CopiesAvailable < 5;

SELECT * FROM Books WHERE NOT Genre = 'Fantasy';

SELECT DATEDIFF(ReturnDate, BorrowDate) AS BorrowDuration FROM Borrows WHERE BorrowID = 1;

SELECT Title, (CopiesAvailable * 2) AS DoubledCopies FROM Books;

SELECT AVG(CopiesAvailable) AS AverageCopies FROM Books;

SELECT * FROM Books WHERE AuthorID IN (1, 3);

SELECT * FROM Books WHERE PublicationYear BETWEEN 1930 AND 2000;

-- Finds all books with "Fire" anywhere in the title
SELECT * FROM Books WHERE Title LIKE '%Harry%';

-- Finds all books with titles ending with "stone"
SELECT * FROM Books WHERE Title LIKE '%Stone';

SELECT * FROM Books WHERE Title LIKE 'Harry%';

-- Finds all books with titles starting with "Harry" and ending with "Stone"
SELECT * FROM Books WHERE Title LIKE 'Harry%Stone';

--  Finds all books with titles where the second character is "i". 
SELECT * FROM Books WHERE Title LIKE '_a%';

SELECT * FROM Borrows WHERE ReturnDate IS NULL;

SELECT * FROM Borrows WHERE ReturnDate IS NOT NULL;





