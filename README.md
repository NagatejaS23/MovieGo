# MovieGo
# MovieGo SQL Project

This repository contains SQL scripts for the MovieGo ticket booking application. The scripts include table creations, stored procedures, and functions to manage users, theatres, shows, and bookings.

## Table of Contents
- [Introduction](#introduction)
- [Database Schema](#database-schema)
- [Stored Procedures](#stored-procedures)
- [Functions](#functions)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
MovieGo is a ticket booking application that allows registered users to book movie tickets in theatres of their choice based on location. Users can view available shows, book tickets, and view their booking history.

## Database Schema
The database schema consists of the following tables:
- Users: Contains user details.
- TheatreDetails: Contains theatre information.
- ShowDetails: Contains show information.
- BookingDetails: Contains booking information.

## Stored Procedures
- `usp_BookTheTicket`: Used to book tickets for a show.

## Functions
- `ufn_GetMovieShowtimes`: Retrieves show details based on movie name and location.
- `ufn_BookedDetails`: Retrieves booking details based on booking ID.

## Usage
To use these SQL scripts, you can create a new database in your SQL Server instance and execute the scripts to set up the schema and functions. Sample data is also provided for testing purposes.

## Contributing
Contributions to improve this project are welcome! Feel free to fork the repository, make changes, and submit pull requests.

## License
This project is licensed under the [MIT License](LICENSE).
