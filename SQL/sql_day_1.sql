drop database if exists school;
create database school;

use school;

create table Students (
FirstName varchar(50),
LastName varchar(50),
Student_Id int unique,
age int);-- 

describe Students;

insert into Students(FirstName,LastName,Student_Id,age) values
('Jane','Doe',001,20);

select FirstName,LastName from Students;

insert into Students(FirstName,LastName,Student_Id,age) values
('John','Doe',002,23);

alter table Students
add column Subject varchar(255);

select * from Students;

SET SQL_SAFE_UPDATES = 0;


UPDATE Students
SET Subject = 'Math'
WHERE Student_Id = 1;