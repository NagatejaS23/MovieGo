-- Create the database
CREATE DATABASE MovieGo;
GO

-- Use the database
USE MovieGo;
GO

-- Create Users table
CREATE TABLE Users (
    UserId VARCHAR(50) PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    EmailId VARCHAR(50) UNIQUE,
    PhoneNumber NUMERIC(10) NOT NULL
);
GO

-- Create TheatreDetails table
CREATE TABLE TheatreDetails (
    TheatreId INT IDENTITY(1,1) PRIMARY KEY,
    TheatreName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL
);
GO

-- Create ShowDetails table
CREATE TABLE ShowDetails (
    ShowId INT IDENTITY(1001,1) PRIMARY KEY,
    TheatreId INT NOT NULL FOREIGN KEY REFERENCES TheatreDetails(TheatreId),
    ShowDate DATE NOT NULL,
    ShowTime TIME NOT NULL,
    MovieName VARCHAR(50) NOT NULL,
    TicketCost DECIMAL(6,2) NOT NULL,
    TicketsAvailable INT NOT NULL
);
GO

-- Create BookingDetails table
CREATE TABLE BookingDetails (
    BookingId VARCHAR(5) PRIMARY KEY,
    UserId VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Users(UserId),
    ShowId INT NOT NULL FOREIGN KEY REFERENCES ShowDetails(ShowId),
    NoOfTickets INT NOT NULL,
    TotalAmt DECIMAL(6,2) NOT NULL
);
GO

-- Insert sample data into Users table
INSERT INTO Users (UserId, UserName, Password, Age, Gender, EmailId, PhoneNumber)
VALUES 
('mary_potter', 'Mary Potter', 'Mary@123', 25, 'F', 'mary_p@gmail.com', 9786543211),
('jack_sparrow', 'Jack Sparrow', 'Spar78!jack', 28, 'M', 'jack_spa@yahoo.com', 7865432102);
GO

-- Insert sample data into TheatreDetails table
INSERT INTO TheatreDetails (TheatreName, Location)
VALUES 
('PVR', 'Pune'),
('Inox', 'Delhi');
GO

-- Insert sample data into ShowDetails table
INSERT INTO ShowDetails (TheatreId, ShowDate, ShowTime, MovieName, TicketCost, TicketsAvailable)
VALUES 
(2, '2018-05-28', '14:30:00', 'Avengers', 250.00, 100),
(2, '2018-05-30', '17:30:00', 'Hit Man', 200.00, 150);
GO

-- Insert sample data into BookingDetails table
INSERT INTO BookingDetails (BookingId, UserId, ShowId, NoOfTickets, TotalAmt)
VALUES 
('B1001', 'jack_sparrow', 1001, 2, 500.00),
('B1002', 'mary_potter', 1002, 5, 1000.00);
GO
