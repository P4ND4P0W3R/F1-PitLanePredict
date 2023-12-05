-- Active: 1700584730411@@127.0.0.1@3306
DROP DATABASE IF EXISTS formula1_db;

CREATE DATABASE IF NOT EXISTS formula1_db;

USE formula1_db;

DROP TABLE IF EXISTS Results;
DROP TABLE IF EXISTS Bets;
DROP TABLE IF EXISTS Races;
DROP TABLE IF EXISTS Drivers;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Users;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) DEFAULT 0.0,
    registration_date DATETIME NOT NULL,
    last_login DATETIME,
    country VARCHAR(50),
    user_type ENUM('regular', 'admin') DEFAULT 'regular'
);

-- Teams Table
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL,
    team_logo VARCHAR(255) -- URL or file path
);

-- Drivers Table
CREATE TABLE Drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_name VARCHAR(255) NOT NULL,
    team_id INT, -- Foreign Key referencing Teams table
    nationality VARCHAR(50),
    date_of_birth DATE, -- Add the date_of_birth column
    image VARCHAR(255), -- URL or file path
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Races Table
CREATE TABLE Races (
    race_id INT PRIMARY KEY,
    race_name VARCHAR(255) NOT NULL,
    circuit VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    date_of_race DATE NOT NULL,
    winner_id INT,
    FOREIGN KEY (winner_id) REFERENCES Drivers(driver_id)
);

-- Bets Table
CREATE TABLE Bets (
    bet_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    race_id INT,
    driver_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'won', 'lost') DEFAULT 'pending',
    bet_type ENUM('Win', 'Place', 'Show') DEFAULT 'Win',
    bet_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payout DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (race_id) REFERENCES Races(race_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Results Table
CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    team_id INT,
    race_id INT,
    driver_id INT,
    position_driver INT,
    lap_time TIME,
    points_earned DECIMAL(5,2),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (race_id) REFERENCES Races(race_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- INSERTING DATA INTO TABLES
-- Insert data into Teams table
INSERT INTO Teams (team_id, team_name, team_logo) VALUES
(1, 'Mercedes', '/img/teamLogo/mercedes.avif'),
(2, 'Red Bull Racing', '/img/teamLogo/redbull.avif'),
(3, 'McLaren', '/img/teamLogo/mclaren.avif'),
(4, 'Ferrari', '/img/teamLogo/ferrari.avif'),
(5, 'Scuderia AlphaTauri', '/img/teamLogo/alphatauri.avif'),
(6, 'Alpine', '/img/teamLogo/alpine.avif'),
(7, 'Alfa Romeo Racing', '/img/teamLogo/alfaromeo.avif'),
(8, 'Williams', '/img/teamLogo/williams.avif'),
(9, 'Aston Martin', '/img/teamLogo/astonmartin.avif'),
(10, 'Haas', '/img/teamLogo/haas.avif');

-- Insert data into Drivers table
INSERT INTO Drivers (driver_name, team_id, nationality, date_of_birth, image) VALUES
('Max Verstappen', 2, 'Dutch', '1997-09-30', '/img/drivers/verstappen.png'),
('Lewis Hamilton', 1, 'English', '1985-01-07', '/img/drivers/hamilton.png'),
('Valtteri Bottas', 8, 'Finnish', '1989-08-28', '/img/drivers/bottas.png'),
('Sergio Pérez', 2, 'Mexican', '1990-01-26', '/img/drivers/perez.png'),
('Lando Norris', 3, 'British', '1999-11-13', '/img/drivers/norris.png'),
('Charles Leclerc', 4, 'Monegasque', '1997-10-16', '/img/drivers/leclerc.png'),
('Carlos Sainz', 4, 'Spanish', '1994-09-01', '/img/drivers/sainz.png'),
('Yuki Tsunoda', 5, 'Japanese', '1989-07-01', '/img/drivers/tsunoda.png'),
('Pierre Gasly', 7, 'French', '1996-02-07', '/img/drivers/gasly.png'),
('Fernando Alonso', 6, 'Spanish', '1981-07-29', '/img/drivers/alonso.png')

-- Insert data into Races table
INSERT INTO Races (race_id, race_name, circuit, location, date_of_race, winner_id) VALUES
(1, 'FORMULA 1 GULF AIR BAHRAIN GRAND PRIX 2023', 'Bahrain International Circuit', 'Sakhir', '2023-03-05', 1),
(2, 'FORMULA 1 STC SAUDI ARABIAN GRAND PRIX 2023', 'Jeddah Corniche Circuit', 'Jeddah', '2023-03-19', 4),
(3, 'FORMULA 1 ROLEX AUSTRALIAN GRAND PRIX 2023', 'Albert Park Circuit', 'Melbourne', '2023-04-02', 1),
(4, 'FORMULA 1 AZERBAIJAN GRAND PRIX 2023', 'Baku City Circuit', 'Baku', '2023-04-30', 4),
(5, 'FORMULA 1 CRYPTO.COM MIAMI GRAND PRIX 2023', 'Miami International Autodrome', 'Miami', '2023-05-07', 1),
(6, 'FORMULA 1 QATAR AIRWAYS GRAN PREMIO DEL MADE IN ITALY E DELL''EMILIA-ROMAGNA 2023', 'Autodromo Internazionale Enzo e Dino Ferrari', 'Imola', '2023-05-21', 1),
(7, 'FORMULA 1 GRAND PRIX DE MONACO 2023', 'Circuit de Monaco', 'Monaco', '2023-05-28', 1),
(8, 'FORMULA 1 AWS GRAN PREMIO DE ESPAÑA 2023', 'Circuit de Barcelona-Catalunya', 'Spain', '2023-06-04', 1),
(9, 'FORMULA 1 PIRELLI GRAND PRIX DU CANADA 2023', 'Circuit Gilles-Villeneuve', 'Montreal', '2023-06-18', 1),
(10, 'FORMULA 1 ROLEX GROSSER PREIS VON ÖSTERREICH 2023', 'Red Bull Ring', 'Spielberg', '2023-07-02', 1);

INSERT INTO Results (result_id, team_id, race_id, driver_id, position_driver, lap_time, points_earned)
-- Results for Race 1
VALUES
(1, 2, 1, 1, 1, '1:30:00', 25.00),
(2, 1, 1, 2, 2, '1:31:00', 18.00),
(3, 3, 1, 3, 3, '1:32:00', 15.00),
(4, 2, 1, 4, 4, '1:33:00', 12.00),
(5, 5, 1, 5, 5, '1:34:00', 10.00),
(6, 6, 1, 6, 6, '1:35:00', 8.00),
(7, 7, 1, 7, 7, '1:36:00', 6.00),
(8, 8, 1, 8, 8, '1:37:00', 4.00),
(9, 9, 1, 9, 9, '1:38:00', 2.00),
(10, 10, 1, 10, 10, '1:39:00', 1.00),
-- Results Race 2
(11, 2, 2, 4, 1, '1:30:30', 25.00),
(12, 1, 2, 2, 2, '1:31:30', 18.00),
(13, 3, 2, 3, 3, '1:32:30', 15.00),
(14, 2, 2, 1, 4, '1:33:30', 12.00),
(15, 5, 2, 5, 5, '1:34:30', 10.00),
(16, 6, 2, 6, 6, '1:35:30', 8.00),
(17, 7, 2, 7, 7, '1:36:30', 6.00),
(18, 8, 2, 8, 8, '1:37:30', 4.00),
(19, 9, 2, 9, 9, '1:38:30', 2.00),
(20, 10, 2, 10, 10, '1:39:30', 1.00),
-- Results for Race 3
(21, 2, 3, 1, 1, '1:31:15', 25.00),
(22, 1, 3, 2, 2, '1:31:30', 18.00),
(23, 3, 3, 3, 3, '1:31:45', 15.00),
(24, 2, 3, 4, 4, '1:32:00', 12.00),
(25, 5, 3, 5, 5, '1:32:15', 10.00),
(26, 6, 3, 6, 6, '1:32:30', 8.00),
(27, 7, 3, 7, 7, '1:32:45', 6.00),
(28, 8, 3, 8, 8, '1:33:00', 4.00),
(29, 9, 3, 9, 9, '1:33:15', 2.00),
(30, 10, 3, 10, 10, '1:33:30', 1.00),
-- Results for Race 4
(31, 2, 4, 4, 1, '1:29:45', 25.00),
(32, 1, 4, 2, 2, '1:30:00', 18.00),
(33, 3, 4, 3, 3, '1:30:15', 15.00),
(34, 2, 4, 1, 4, '1:30:30', 12.00),
(35, 5, 4, 5, 5, '1:30:45', 10.00),
(36, 6, 4, 6, 6, '1:31:00', 8.00),
(37, 7, 4, 7, 7, '1:31:15', 6.00),
(38, 8, 4, 8, 8, '1:31:30', 4.00),
(39, 9, 4, 9, 9, '1:31:45', 2.00),
(40, 10, 4, 10, 10, '1:32:00', 1.00),
-- Results for Race 5
(41, 2, 5, 1, 1, '1:32:45', 25.00),
(42, 1, 5, 2, 2, '1:33:00', 18.00),
(43, 3, 5, 3, 3, '1:33:15', 15.00),
(44, 2, 5, 4, 4, '1:33:30', 12.00),
(45, 5, 5, 5, 5, '1:33:45', 10.00),
(46, 6, 5, 6, 6, '1:34:00', 8.00),
(47, 7, 5, 7, 7, '1:34:15', 6.00),
(48, 8, 5, 8, 8, '1:34:30', 4.00),
(49, 9, 5, 9, 9, '1:34:45', 2.00),
(50, 10, 5, 10, 10, '1:35:00', 1.00),
-- Results for Race 6
(51, 2, 6, 1, 1, '1:30:00', 25.00),
(52, 1, 6, 2, 2, '1:30:30', 18.00),
(53, 3, 6, 3, 3, '1:31:00', 15.00),
(54, 2, 6, 4, 4, '1:31:30', 12.00),
(55, 5, 6, 5, 5, '1:32:00', 10.00),
(56, 6, 6, 6, 6, '1:32:30', 8.00),
(57, 7, 6, 7, 7, '1:33:00', 6.00),
(58, 8, 6, 8, 8, '1:33:30', 4.00),
(59, 9, 6, 9, 9, '1:34:00', 2.00),
(60, 10, 6, 10, 10, '1:34:30', 1.00),
-- Results for Race 7
(61, 1, 7, 1, 1, '1:30:15', 25.00),
(62, 2, 7, 2, 2, '1:30:30', 18.00),
(63, 3, 7, 3, 3, '1:30:45', 15.00),
(64, 2, 7, 4, 4, '1:31:00', 12.00),
(65, 5, 7, 5, 5, '1:31:15', 10.00),
(66, 6, 7, 6, 6, '1:31:30', 8.00),
(67, 7, 7, 7, 7, '1:31:45', 6.00),
(68, 8, 7, 8, 8, '1:32:00', 4.00),
(69, 9, 7, 9, 9, '1:32:15', 2.00),
(70, 10, 7, 10, 10, '1:32:30', 1.00),
-- Results for Race 8
(71, 2, 8, 1, 1, '1:29:45', 25.00),
(72, 1, 8, 2, 2, '1:30:00', 18.00),
(73, 3, 8, 3, 3, '1:30:15', 15.00),
(74, 2, 8, 4, 4, '1:30:30', 12.00),
(75, 5, 8, 5, 5, '1:30:45', 10.00),
(76, 6, 8, 6, 6, '1:31:00', 8.00),
(77, 7, 8, 7, 7, '1:31:15', 6.00),
(78, 8, 8, 8, 8, '1:31:30', 4.00),
(79, 9, 8, 9, 9, '1:31:45', 2.00),
(80, 10, 8, 10, 10, '1:32', 1.00), 
-- Results for Race 9
(81, 2, 9, 1, 1, '1:32:45', 25.00),
(82, 1, 9, 2, 2, '1:33:00', 18.00),
(83, 3, 9, 3, 3, '1:33:15', 15.00),
(84, 2, 9, 4, 4, '1:33:30', 12.00),
(85, 5, 9, 5, 5, '1:33:45', 10.00),
(86, 6, 9, 6, 6, '1:34:00', 8.00),
(87, 7, 9, 7, 7, '1:34:15', 6.00),
(88, 8, 9, 8, 8, '1:34:30', 4.00),
(89, 9, 9, 9, 9, '1:34:45', 2.00),
(90, 10, 9, 10, 10, '1:35:00', 1.00),
-- Results for Race 10
(91, 2, 10, 1, 1, '1:30:15', 25.00),
(92, 1, 10, 2, 2, '1:30:30', 18.00),
(93, 3, 10, 3, 3, '1:30:45', 15.00),
(94, 2, 10, 4, 4, '1:31:00', 12.00),
(95, 5, 10, 5, 5, '1:31:15', 10.00),
(96, 6, 10, 6, 6, '1:31:30', 8.00),
(97, 7, 10, 7, 7, '1:31:45', 6.00),
(98, 8, 10, 8, 8, '1:32:00', 4.00),
(99, 9, 10, 9, 9, '1:32:15', 2.00),
(100, 10, 10, 10, 10, '1:32:30', 1.00);
