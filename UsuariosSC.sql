-- Create the UsuariosSC database
CREATE DATABASE UsuariosSC;

-- Use the UsuariosSC database
USE UsuariosSC;

-- Create the UserRegistry table
CREATE TABLE UserRegistry (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Password VARCHAR(100)
);

-- Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDate VARCHAR(100)
);

-- Create the CourseRegistry table
CREATE TABLE CourseRegistry (
    UserID INT,
    CourseID INT,
    CourseDate VARCHAR(100),
    DisplayName VARCHAR(100),
    Cedular VARCHAR(20),
    PRIMARY KEY (UserID, CourseID),
    FOREIGN KEY (UserID) REFERENCES UserRegistry(UserID),
    FOREIGN KEY (CourseID, CourseDate) REFERENCES Courses(CourseID, CourseDate)



);



INSERT INTO Courses (CourseID, CourseName, CourseDate) VALUES
    ('001', 'Ciencias Naturales', CURDATE()),
    ('002', 'Quimica y Biologia', CURDATE()),
    ('003', 'Programacion', CURDATE());

