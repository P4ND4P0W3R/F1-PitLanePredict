-- Active: 1700584730411@@127.0.0.1@3306@formula1_db

DROP DATABASE IF EXISTS formula1_db;

CREATE DATABASE IF NOT EXISTS formula1_db;

USE formula1_db;

DROP TABLE IF EXISTS Results;

DROP TABLE IF EXISTS Bets;

DROP TABLE IF EXISTS Races;

DROP TABLE IF EXISTS Drivers;

DROP TABLE IF EXISTS Teams;

DROP TABLE IF EXISTS Users;

CREATE TABLE
    Users (
        userId INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        password VARCHAR(255) NOT NULL,
        balance DECIMAL(10, 2) DEFAULT 0.00,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        last_login DATETIME,
        country VARCHAR(50),
        user_type ENUM('regular', 'admin') DEFAULT 'regular',
        UNIQUE KEY (username),
        UNIQUE KEY (email)
    );

CREATE TABLE
    Constructors (
        constructorId VARCHAR(50) PRIMARY KEY,
        name VARCHAR(100),
        nationality VARCHAR(50),
        url VARCHAR(255),
        teamLogo VARCHAR(255) -- URL or file path
    );

CREATE TABLE
    Drivers (
        driverId VARCHAR(50) PRIMARY KEY,
        code VARCHAR(10),
        permanentNumber INT,
        givenName VARCHAR(100),
        familyName VARCHAR(100),
        dateOfBirth DATE,
        nationality VARCHAR(50),
        url VARCHAR(255),
        driverImage VARCHAR(255),
        -- URL or file path
        constructorId VARCHAR(50),
        FOREIGN KEY (constructorId) REFERENCES Constructors(constructorId)
    );

CREATE TABLE
    Races (
        raceId INT AUTO_INCREMENT PRIMARY KEY,
        season VARCHAR(4),
        round INT,
        raceName VARCHAR(255),
        circuitId VARCHAR(255),
        circuitName VARCHAR(255),
        locality VARCHAR(255),
        country VARCHAR(255),
        date DATE,
        time TIME,
        url VARCHAR(255)
    );

CREATE TABLE
    Bets (
        betId INT AUTO_INCREMENT PRIMARY KEY,
        userId INT,
        raceId INT,
        driverId VARCHAR(50),
        amount DECIMAL(10, 2) NOT NULL,
        odds DECIMAL(5, 2) NOT NULL,
        betStatus ENUM('pending', 'won', 'lost') DEFAULT 'pending',
        createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (userId) REFERENCES users(userId),
        FOREIGN KEY (raceId) REFERENCES races(raceId),
        FOREIGN KEY (driverId) REFERENCES drivers(driverId)
    );

CREATE TABLE
    Results (
        resultId INT AUTO_INCREMENT PRIMARY KEY,
        raceId INT,
        driverId VARCHAR(50),
        position INT NOT NULL,
        points INT NOT NULL,
        FOREIGN KEY (raceId) REFERENCES races(raceId),
        FOREIGN KEY (driverId) REFERENCES drivers(driverId)
    );

INSERT INTO
    Constructors (
        constructorId,
        name,
        nationality,
        url,
        teamLogo
    )
VALUES (
        'alfa',
        'Alfa Romeo',
        'Swiss',
        'http://en.wikipedia.org/wiki/Alfa_Romeo_in_Formula_One',
        'logo.jpg'
    ), (
        'alphatauri',
        'AlphaTauri',
        'Italian',
        'http://en.wikipedia.org/wiki/Scuderia_AlphaTauri',
        'logo.jpg'
    ), (
        'alpine',
        'Alpine F1 Team',
        'French',
        'http://en.wikipedia.org/wiki/Alpine_F1_Team',
        'logo.jpg'
    ), (
        'aston_martin',
        'Aston Martin',
        'British',
        'http://en.wikipedia.org/wiki/Aston_Martin_in_Formula_One',
        'logo.jpg'
    ), (
        'ferrari',
        'Ferrari',
        'Italian',
        'http://en.wikipedia.org/wiki/Scuderia_Ferrari',
        'logo.jpg'
    ), (
        'haas',
        'Haas F1 Team',
        'American',
        'http://en.wikipedia.org/wiki/Haas_F1_Team',
        'logo.jpg'
    ), (
        'mclaren',
        'McLaren',
        'British',
        'http://en.wikipedia.org/wiki/McLaren',
        'logo.jpg'
    ), (
        'mercedes',
        'Mercedes',
        'German',
        'http://en.wikipedia.org/wiki/Mercedes-Benz_in_Formula_One',
        'logo.jpg'
    ), (
        'red_bull',
        'Red Bull',
        'Austrian',
        'http://en.wikipedia.org/wiki/Red_Bull_Racing',
        'logo.jpg'
    ), (
        'williams',
        'Williams',
        'British',
        'http://en.wikipedia.org/wiki/Williams_Grand_Prix_Engineering',
        'logo.jpg'
    );

INSERT INTO
    Drivers (
        driverId,
        code,
        permanentNumber,
        givenName,
        familyName,
        dateOfBirth,
        nationality,
        url,
        driverImage,
        constructorId
    )
VALUES (
        'albon',
        'ALB',
        23,
        'Alexander',
        'Albon',
        '1996-03-23',
        'Thai',
        'http://en.wikipedia.org/wiki/Alexander_Albon',
        'image.png',
        'williams'
    ), (
        'alonso',
        'ALO',
        14,
        'Fernando',
        'Alonso',
        '1981-07-29',
        'Spanish',
        'http://en.wikipedia.org/wiki/Fernando_Alonso',
        'image.png',
        'aston_martin'
    ), (
        'bottas',
        'BOT',
        77,
        'Valtteri',
        'Bottas',
        '1989-08-28',
        'Finnish',
        'http://en.wikipedia.org/wiki/Valtteri_Bottas',
        'image.png',
        'alfa'
    ), (
        'de_vries',
        'DEV',
        21,
        'Nyck',
        'de Vries',
        '1995-02-06',
        'Dutch',
        'http://en.wikipedia.org/wiki/Nyck_de_Vries',
        'image.png',
        'alphatauri'
    ), (
        'gasly',
        'GAS',
        10,
        'Pierre',
        'Gasly',
        '1996-02-07',
        'French',
        'http://en.wikipedia.org/wiki/Pierre_Gasly',
        'image.png',
        'alpine'
    ), (
        'hamilton',
        'HAM',
        44,
        'Lewis',
        'Hamilton',
        '1985-01-07',
        'British',
        'http://en.wikipedia.org/wiki/Lewis_Hamilton',
        'image.png',
        'mercedes'
    ), (
        'hulkenberg',
        'HUL',
        27,
        'Nico',
        'Hülkenberg',
        '1987-08-19',
        'German',
        'http://en.wikipedia.org/wiki/Nico_H%C3%BClkenberg',
        'image.png',
        'haas'
    ), (
        'lawson',
        'LAW',
        40,
        'Liam',
        'Lawson',
        '2002-02-11',
        'New Zealander',
        'http://en.wikipedia.org/wiki/Liam_Lawson',
        'image.png',
        'alphatauri'
    ), (
        'leclerc',
        'LEC',
        16,
        'Charles',
        'Leclerc',
        '1997-10-16',
        'Monegasque',
        'http://en.wikipedia.org/wiki/Charles_Leclerc',
        'image.png',
        'ferrari'
    ), (
        'kevin_magnussen',
        'MAG',
        20,
        'Kevin',
        'Magnussen',
        '1992-10-05',
        'Danish',
        'http://en.wikipedia.org/wiki/Kevin_Magnussen',
        'image.png',
        'haas'
    ), (
        'norris',
        'NOR',
        4,
        'Lando',
        'Norris',
        '1999-11-13',
        'British',
        'http://en.wikipedia.org/wiki/Lando_Norris',
        'image.png',
        'mclaren'
    ), (
        'ocon',
        'OCO',
        31,
        'Esteban',
        'Ocon',
        '1996-09-17',
        'French',
        'http://en.wikipedia.org/wiki/Esteban_Ocon',
        'image.png',
        'alpine'
    ), (
        'perez',
        'PER',
        11,
        'Sergio',
        'Pérez',
        '1990-01-26',
        'Mexican',
        'http://en.wikipedia.org/wiki/Sergio_P%C3%A9rez',
        'image.png',
        'red_bull'
    ), (
        'piastri',
        'PIA',
        81,
        'Oscar',
        'Piastri',
        '2001-04-06',
        'Australian',
        'http://en.wikipedia.org/wiki/Oscar_Piastri',
        'image.png',
        'mclaren'
    ), (
        'ricciardo',
        'RIC',
        3,
        'Daniel',
        'Ricciardo',
        '1989-07-01',
        'Australian',
        'http://en.wikipedia.org/wiki/Daniel_Ricciardo',
        'image.png',
        'alphatauri'
    ), (
        'russell',
        'RUS',
        63,
        'George',
        'Russell',
        '1998-02-15',
        'British',
        'http://en.wikipedia.org/wiki/George_Russell_(racing_driver)',
        'image.png',
        'mercedes'
    ), (
        'sainz',
        'SAI',
        55,
        'Carlos',
        'Sainz',
        '1994-09-01',
        'Spanish',
        'http://en.wikipedia.org/wiki/Carlos_Sainz_Jr.',
        'image.png',
        'ferrari'
    ), (
        'sargeant',
        'SAR',
        2,
        'Logan',
        'Sargeant',
        '2000-12-31',
        'American',
        'http://en.wikipedia.org/wiki/Logan_Sargeant',
        'image.png',
        'williams'
    ), (
        'stroll',
        'STR',
        18,
        'Lance',
        'Stroll',
        '1998-10-29',
        'Canadian',
        'http://en.wikipedia.org/wiki/Lance_Stroll',
        'image.png',
        'aston_martin'
    ), (
        'tsunoda',
        'TSU',
        22,
        'Yuki',
        'Tsunoda',
        '2000-05-11',
        'Japanese',
        'http://en.wikipedia.org/wiki/Yuki_Tsunoda',
        'image.png',
        'alphatauri'
    ), (
        'max_verstappen',
        'VER',
        33,
        'Max',
        'Verstappen',
        '1997-09-30',
        'Dutch',
        'http://en.wikipedia.org/wiki/Max_Verstappen',
        'image.png',
        'red_bull'
    ), (
        'zhou',
        'ZHO',
        24,
        'Guanyu',
        'Zhou',
        '1999-05-30',
        'Chinese',
        'http://en.wikipedia.org/wiki/Zhou_Guanyu',
        'image.png',
        'alfa'
    );

INSERT INTO
    Races (
        season,
        round,
        raceName,
        circuitId,
        circuitName,
        locality,
        country,
        date,
        time,
        url
    )
VALUES (
        '2023',
        1,
        'Bahrain Grand Prix',
        'bahrain',
        'Bahrain International Circuit',
        'Sakhir',
        'Bahrain',
        '2023-03-05',
        '15:00:00',
        'https://en.wikipedia.org/wiki/2023_Bahrain_Grand_Prix'
    ), (
        '2023',
        2,
        'Saudi Arabian Grand Prix',
        'jeddah',
        'Jeddah Corniche Circuit',
        'Jeddah',
        'Saudi Arabia',
        '2023-03-19',
        '17:00:00',
        'https://en.wikipedia.org/wiki/2023_Saudi_Arabian_Grand_Prix'
    ), (
        '2023',
        3,
        'Australian Grand Prix',
        'albert_park',
        'Albert Park Grand Prix Circuit',
        'Melbourne',
        'Australia',
        '2023-04-02',
        '05:00:00',
        'https://en.wikipedia.org/wiki/2023_Australian_Grand_Prix'
    ), (
        '2023',
        4,
        'Azerbaijan Grand Prix',
        'baku',
        'Baku City Circuit',
        'Baku',
        'Azerbaijan',
        '2023-04-30',
        '11:00:00',
        'https://en.wikipedia.org/wiki/2023_Azerbaijan_Grand_Prix'
    ), (
        '2023',
        5,
        'Miami Grand Prix',
        'miami',
        'Miami International Autodrome',
        'Miami',
        'USA',
        '2023-05-07',
        '19:30:00',
        'https://en.wikipedia.org/wiki/2023_Miami_Grand_Prix'
    ), (
        '2023',
        6,
        'Monaco Grand Prix',
        'monaco',
        'Circuit de Monaco',
        'Monte-Carlo',
        'Monaco',
        '2023-05-28',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Monaco_Grand_Prix'
    ), (
        '2023',
        7,
        'Spanish Grand Prix',
        'catalunya',
        'Circuit de Barcelona-Catalunya',
        'Montmeló',
        'Spain',
        '2023-06-04',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Spanish_Grand_Prix'
    ), (
        '2023',
        8,
        'Canadian Grand Prix',
        'villeneuve',
        'Circuit Gilles Villeneuve',
        'Montreal',
        'Canada',
        '2023-06-18',
        '18:00:00',
        'https://en.wikipedia.org/wiki/2023_Canadian_Grand_Prix'
    ), (
        '2023',
        9,
        'Austrian Grand Prix',
        'red_bull_ring',
        'Red Bull Ring',
        'Spielberg',
        'Austria',
        '2023-07-02',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Austrian_Grand_Prix'
    ), (
        '2023',
        10,
        'British Grand Prix',
        'silverstone',
        'Silverstone Circuit',
        'Silverstone',
        'UK',
        '2023-07-09',
        '14:00:00',
        'https://en.wikipedia.org/wiki/2023_British_Grand_Prix'
    ), (
        '2023',
        11,
        'Hungarian Grand Prix',
        'hungaroring',
        'Hungaroring',
        'Budapest',
        'Hungary',
        '2023-07-23',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Hungarian_Grand_Prix'
    ), (
        '2023',
        12,
        'Belgian Grand Prix',
        'spa',
        'Circuit de Spa-Francorchamps',
        'Spa',
        'Belgium',
        '2023-07-30',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Belgian_Grand_Prix'
    ), (
        '2023',
        13,
        'Dutch Grand Prix',
        'zandvoort',
        'Circuit Park Zandvoort',
        'Zandvoort',
        'Netherlands',
        '2023-08-27',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Dutch_Grand_Prix'
    ), (
        '2023',
        14,
        'Italian Grand Prix',
        'monza',
        'Autodromo Nazionale di Monza',
        'Monza',
        'Italy',
        '2023-09-03',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Italian_Grand_Prix'
    ), (
        '2023',
        15,
        'Singapore Grand Prix',
        'marina_bay',
        'Marina Bay Street Circuit',
        'Marina Bay',
        'Singapore',
        '2023-09-17',
        '12:00:00',
        'https://en.wikipedia.org/wiki/2023_Singapore_Grand_Prix'
    ), (
        '2023',
        16,
        'Japanese Grand Prix',
        'suzuka',
        'Suzuka Circuit',
        'Suzuka',
        'Japan',
        '2023-09-24',
        '05:00:00',
        'https://en.wikipedia.org/wiki/2023_Japanese_Grand_Prix'
    ), (
        '2023',
        17,
        'Qatar Grand Prix',
        'losail',
        'Losail International Circuit',
        'Al Daayen',
        'Qatar',
        '2023-10-08',
        '17:00:00',
        'https://en.wikipedia.org/wiki/2023_Qatar_Grand_Prix'
    ),
    (
        '2023',
        18,
        'United States Grand Prix',
        'americas',
        'Circuit of the Americas',
        'Austin',
        'USA',
        '2023-10-22',
        '19:00:00',
        'https://en.wikipedia.org/wiki/2023_United_States_Grand_Prix'
    ), (
        '2023',
        19,
        'Mexico City Grand Prix',
        'rodriguez',
        'Autódromo Hermanos Rodríguez',
        'Mexico City',
        'Mexico',
        '2023-10-29',
        '20:00:00',
        'https://en.wikipedia.org/wiki/2023_Mexico_City_Grand_Prix'
    ), (
        '2023',
        20,
        'São Paulo Grand Prix',
        'interlagos',
        'Autódromo José Carlos Pace',
        'São Paulo',
        'Brazil',
        '2023-11-05',
        '17:00:00',
        'https://en.wikipedia.org/wiki/2023_S%C3%A3o_Paulo_Grand_Prix'
    ), (
        '2023',
        21,
        'Las Vegas Grand Prix',
        'vegas',
        'Las Vegas Strip Street Circuit',
        'Las Vegas',
        'United States',
        '2023-11-19',
        '06:00:00',
        'https://en.wikipedia.org/wiki/2023_Las_Vegas_Grand_Prix'
    ), (
        '2023',
        22,
        'Abu Dhabi Grand Prix',
        'yas_marina',
        'Yas Marina Circuit',
        'Abu Dhabi',
        'UAE',
        '2023-11-26',
        '13:00:00',
        'https://en.wikipedia.org/wiki/2023_Abu_Dhabi_Grand_Prix'
    );

INSERT INTO
    Results (
        raceId,
        driverId,
        position,
        points
    )
VALUES 
(1, 'max_verstappen', 1, 25), (1, 'perez', 2, 18), (1, 'alonso', 3, 15), (1, 'sainz', 4, 12), (1, 'hamilton', 5, 10), (1, 'stroll', 6, 8), (1, 'russell', 7, 6), (1, 'bottas', 8, 4), (1, 'gasly', 9, 2), (1, 'albon', 10, 1), (1, 'tsunoda', 11, 0), (1, 'sargeant', 12, 0), (1, 'kevin_magnussen', 13, 0), (1, 'de_vries', 14, 0), (1, 'hulkenberg', 15, 0), (1, 'zhou', 16, 0), (1, 'norris', 17, 0), (1, 'ocon', 18, 0), (1, 'leclerc', 19, 0), (1, 'piastri', 20, 0), 
(2, 'perez', 1, 25), (2, 'max_verstappen', 2, 19), (2, 'alonso', 3, 15), (2, 'russell', 4, 12), (2, 'hamilton', 5, 10), (2, 'sainz', 6, 8), (2, 'leclerc', 7, 6), (2, 'ocon', 8, 4), (2, 'gasly', 9, 2), (2, 'kevin_magnussen', 10, 1), (2, 'tsunoda', 11, 0), (2, 'hulkenberg', 12, 0), (2, 'zhou', 13, 0), (2, 'de_vries', 14, 0), (2, 'piastri', 15, 0), (2, 'sargeant', 16, 0), (2, 'norris', 17, 0), (2, 'bottas', 18, 0), (2, 'albon', 19, 0), (2, 'stroll', 20, 0),
(3, 'max_verstappen', 1, 25), (3, 'hamilton', 2, 18), (3, 'alonso', 3, 15), (3, 'stroll', 4, 12), (3, 'perez', 5, 11), (3, 'norris', 6, 8), (3, 'hulkenberg', 7, 6), (3, 'piastri', 8, 4), (3, 'zhou', 9, 2), (3, 'tsunoda', 10, 1), (3, 'bottas', 11, 0), (3, 'sainz', 12, 0), (3, 'gasly', 13, 0), (3, 'ocon', 14, 0), (3, 'de_vries', 15, 0), (3, 'sargeant', 16, 0), (3, 'kevin_magnussen', 17, 0), (3, 'russell', 18, 0), (3, 'albon', 19, 0), (3, 'leclerc', 20, 0),
(4, 'perez', 1, 25), (4, 'max_verstappen', 2, 18), (4, 'leclerc', 3, 15), (4, 'alonso', 4, 12), (4, 'sainz', 5, 10), (4, 'hamilton', 6, 8), (4, 'stroll', 7, 6), (4, 'russell', 8, 5), (4, 'norris', 9, 2), (4, 'tsunoda', 10, 1), (4, 'piastri', 11, 0), (4, 'albon', 12, 0), (4, 'kevin_magnussen', 13, 0), (4, 'gasly', 14, 0), (4, 'ocon', 15, 0), (4, 'sargeant', 16, 0), (4, 'hulkenberg', 17, 0), (4, 'bottas', 18, 0), (4, 'zhou', 19, 0), (4, 'de_vries', 20, 0),
(5, 'max_verstappen', 1, 26), (5, 'perez', 2, 18), (5, 'alonso', 3, 15), (5, 'russell', 4, 12), (5, 'sainz', 5, 10), (5, 'hamilton', 6, 8), (5, 'leclerc', 7, 6), (5, 'gasly', 8, 4), (5, 'ocon', 9, 2), (5, 'kevin_magnussen', 10, 1), (5, 'tsunoda', 11, 0), (5, 'stroll', 12, 0), (5, 'bottas', 13, 0), (5, 'albon', 14, 0), (5, 'hulkenberg', 15, 0), (5, 'zhou', 16, 0), (5, 'norris', 17, 0), (5, 'de_vries', 18, 0), (5, 'piastri', 19, 0), (5, 'sargeant', 20, 0),
(6, 'max_verstappen', 1, 25), (6, 'alonso', 2, 18), (6, 'ocon', 3, 15), (6, 'hamilton', 4, 13), (6, 'russell', 5, 10), (6, 'leclerc', 6, 8), (6, 'gasly', 7, 6), (6, 'sainz', 8, 4), (6, 'norris', 9, 2), (6, 'piastri', 10, 1), (6, 'bottas', 11, 0), (6, 'de_vries', 12, 0), (6, 'zhou', 13, 0), (6, 'albon', 14, 0), (6, 'tsunoda', 15, 0), (6, 'perez', 16, 0), (6, 'hulkenberg', 17, 0), (6, 'sargeant', 18, 0), (6, 'kevin_magnussen', 19, 0), (6, 'stroll', 20, 0),
(7, 'max_verstappen', 1, 26), (7, 'hamilton', 2, 18), (7, 'russell', 3, 15), (7, 'perez', 4, 12), (7, 'sainz', 5, 10), (7, 'stroll', 6, 8), (7, 'alonso', 7, 6), (7, 'ocon', 8, 4), (7, 'zhou', 9, 2), (7, 'gasly', 10, 1), (7, 'leclerc', 11, 0), (7, 'tsunoda', 12, 0), (7, 'piastri', 13, 0), (7, 'de_vries', 14, 0), (7, 'hulkenberg', 15, 0), (7, 'albon', 16, 0), (7, 'norris', 17, 0), (7, 'kevin_magnussen', 18, 0), (7, 'bottas', 19, 0), (7, 'sargeant', 20, 0),
(8, 'max_verstappen', 1, 25), (8, 'alonso', 2, 18), (8, 'hamilton', 3, 15), (8, 'leclerc', 4, 12), (8, 'sainz', 5, 10), (8, 'perez', 6, 9), (8, 'albon', 7, 6), (8, 'ocon', 8, 4), (8, 'stroll', 9, 2), (8, 'bottas', 10, 1), (8, 'piastri', 11, 0), (8, 'gasly', 12, 0), (8, 'norris', 13, 0), (8, 'tsunoda', 14, 0), (8, 'hulkenberg', 15, 0), (8, 'zhou', 16, 0), (8, 'kevin_magnussen', 17, 0), (8, 'de_vries', 18, 0), (8, 'russell', 19, 0), (8, 'sargeant', 20, 0),
(9, 'max_verstappen', 1, 26), (9, 'leclerc', 2, 18), (9, 'perez', 3, 15), (9, 'norris', 4, 12), (9, 'alonso', 5, 10), (9, 'sainz', 6, 8), (9, 'russell', 7, 6), (9, 'hamilton', 8, 4), (9, 'stroll', 9, 2), (9, 'gasly', 10, 1), (9, 'albon', 11, 0), (9, 'zhou', 12, 0), (9, 'sargeant', 13, 0), (9, 'ocon', 14, 0), (9, 'bottas', 15, 0), (9, 'piastri', 16, 0), (9, 'de_vries', 17, 0), (9, 'kevin_magnussen', 18, 0), (9, 'tsunoda', 19, 0), (9, 'hulkenberg', 20, 0),
(10, 'max_verstappen', 1, 26), (10, 'norris', 2, 18), (10, 'hamilton', 3, 15), (10, 'piastri', 4, 12), (10, 'russell', 5, 10), (10, 'perez', 6, 8), (10, 'alonso', 7, 6), (10, 'albon', 8, 4), (10, 'leclerc', 9, 2), (10, 'sainz', 10, 1), (10, 'sargeant', 11, 0), (10, 'bottas', 12, 0), (10, 'hulkenberg', 13, 0), (10, 'stroll', 14, 0), (10, 'zhou', 15, 0), (10, 'tsunoda', 16, 0), (10, 'de_vries', 17, 0), (10, 'gasly', 18, 0), (10, 'kevin_magnussen', 19, 0), (10, 'ocon', 20, 0),
(11, 'max_verstappen', 1, 26), (11, 'norris', 2, 18), (11, 'perez', 3, 15), (11, 'hamilton', 4, 12), (11, 'piastri', 5, 10), (11, 'russell', 6, 8), (11, 'leclerc', 7, 6), (11, 'sainz', 8, 4), (11, 'alonso', 9, 2), (11, 'stroll', 10, 1), (11, 'albon', 11, 0), (11, 'bottas', 12, 0), (11, 'ricciardo', 13, 0), (11, 'hulkenberg', 14, 0), (11, 'tsunoda', 15, 0), (11, 'zhou', 16, 0), (11, 'kevin_magnussen', 17, 0), (11, 'sargeant', 18, 0), (11, 'ocon', 19, 0), (11, 'gasly', 20, 0),
(12, 'max_verstappen', 1, 25), (12, 'perez', 2, 18), (12, 'leclerc', 3, 15), (12, 'hamilton', 4, 13), (12, 'alonso', 5, 10), (12, 'russell', 6, 8), (12, 'norris', 7, 6), (12, 'ocon', 8, 4), (12, 'stroll', 9, 2), (12, 'tsunoda', 10, 1), (12, 'gasly', 11, 0), (12, 'bottas', 12, 0), (12, 'zhou', 13, 0), (12, 'albon', 14, 0), (12, 'kevin_magnussen', 15, 0), (12, 'ricciardo', 16, 0), (12, 'sargeant', 17, 0), (12, 'hulkenberg', 18, 0), (12, 'sainz', 19, 0), (12, 'piastri', 20, 0),
(13, 'max_verstappen', 1, 25), (13, 'alonso', 2, 19), (13, 'gasly', 3, 15), (13, 'perez', 4, 12), (13, 'sainz', 5, 10), (13, 'hamilton', 6, 8), (13, 'norris', 7, 6), (13, 'albon', 8, 4), (13, 'piastri', 9, 2), (13, 'ocon', 10, 1), (13, 'stroll', 11, 0), (13, 'hulkenberg', 12, 0), (13, 'lawson', 13, 0), (13, 'bottas', 14, 0), (13, 'tsunoda', 15, 0), (13, 'kevin_magnussen', 16, 0), (13, 'russell', 17, 0), (13, 'zhou', 18, 0), (13, 'leclerc', 19, 0), (13, 'sargeant', 20, 0),
(14, 'max_verstappen', 1, 25), (14, 'perez', 2, 18), (14, 'sainz', 3, 15), (14, 'leclerc', 4, 12), (14, 'russell', 5, 10), (14, 'hamilton', 6, 8), (14, 'albon', 7, 6), (14, 'norris', 8, 4), (14, 'alonso', 9, 2), (14, 'bottas', 10, 1), (14, 'lawson', 11, 0), (14, 'piastri', 12, 0), (14, 'sargeant', 13, 0), (14, 'zhou', 14, 0), (14, 'gasly', 15, 0), (14, 'stroll', 16, 0), (14, 'hulkenberg', 17, 0), (14, 'kevin_magnussen', 18, 0), (14, 'ocon', 19, 0), (14, 'tsunoda', 20, 0),
(15, 'sainz', 1, 25), (15, 'norris', 2, 18), (15, 'hamilton', 3, 16), (15, 'leclerc', 4, 12), (15, 'max_verstappen', 5, 10), (15, 'gasly', 6, 8), (15, 'piastri', 7, 6), (15, 'perez', 8, 4), (15, 'lawson', 9, 2), (15, 'kevin_magnussen', 10, 1), (15, 'albon', 11, 0), (15, 'zhou', 12, 0), (15, 'hulkenberg', 13, 0), (15, 'sargeant', 14, 0), (15, 'alonso', 15, 0), (15, 'russell', 16, 0), (15, 'bottas', 17, 0), (15, 'ocon', 18, 0), (15, 'tsunoda', 19, 0), (15, 'stroll', 20, 0),
(16, 'max_verstappen', 1, 26), (16, 'norris', 2, 18), (16, 'piastri', 3, 15), (16, 'leclerc', 4, 12), (16, 'hamilton', 5, 10), (16, 'sainz', 6, 8), (16, 'russell', 7, 6), (16, 'alonso', 8, 4), (16, 'ocon', 9, 2), (16, 'gasly', 10, 1), (16, 'lawson', 11, 0), (16, 'tsunoda', 12, 0), (16, 'zhou', 13, 0), (16, 'hulkenberg', 14, 0), (16, 'kevin_magnussen', 15, 0), (16, 'albon', 16, 0), (16, 'sargeant', 17, 0), (16, 'stroll', 18, 0), (16, 'perez', 19, 0), (16, 'bottas', 20, 0),
(17, 'max_verstappen', 1, 26), (17, 'piastri', 2, 18), (17, 'norris', 3, 15), (17, 'russell', 4, 12), (17, 'leclerc', 5, 10), (17, 'alonso', 6, 8), (17, 'ocon', 7, 6), (17, 'bottas', 8, 4), (17, 'zhou', 9, 2), (17, 'perez', 10, 1), (17, 'stroll', 11, 0), (17, 'gasly', 12, 0), (17, 'albon', 13, 0), (17, 'kevin_magnussen', 14, 0), (17, 'tsunoda', 15, 0), (17, 'hulkenberg', 16, 0), (17, 'lawson', 17, 0), (17, 'sargeant', 18, 0), (17, 'hamilton', 19, 0), (17, 'sainz', 20, 0),
(18, 'max_verstappen', 1, 25), (18, 'norris', 2, 18), (18, 'sainz', 3, 15), (18, 'perez', 4, 12), (18, 'russell', 5, 10), (18, 'gasly', 6, 8), (18, 'stroll', 7, 6), (18, 'tsunoda', 8, 5), (18, 'albon', 9, 2), (18, 'sargeant', 10, 1), (18, 'hulkenberg', 11, 0), (18, 'bottas', 12, 0), (18, 'zhou', 13, 0), (18, 'kevin_magnussen', 14, 0), (18, 'ricciardo', 15, 0), (18, 'alonso', 16, 0), (18, 'piastri', 17, 0), (18, 'ocon', 18, 0), (18, 'hamilton', 19, 0), (18, 'leclerc', 20, 0),
(19, 'max_verstappen', 1, 25), (19, 'hamilton', 2, 19), (19, 'leclerc', 3, 15), (19, 'sainz', 4, 12), (19, 'norris', 5, 10), (19, 'russell', 6, 8), (19, 'ricciardo', 7, 6), (19, 'piastri', 8, 4), (19, 'albon', 9, 2), (19, 'ocon', 10, 1), (19, 'gasly', 11, 0), (19, 'tsunoda', 12, 0), (19, 'hulkenberg', 13, 0), (19, 'zhou', 14, 0), (19, 'bottas', 15, 0), (19, 'sargeant', 16, 0), (19, 'stroll', 17, 0), (19, 'alonso', 18, 0), (19, 'kevin_magnussen', 19, 0), (19, 'perez', 20, 0),
(20, 'max_verstappen', 1, 25), (20, 'norris', 2, 19), (20, 'alonso', 3, 15), (20, 'perez', 4, 12), (20, 'stroll', 5, 10), (20, 'sainz', 6, 8), (20, 'gasly', 7, 6), (20, 'hamilton', 8, 4), (20, 'tsunoda', 9, 2), (20, 'ocon', 10, 1), (20, 'sargeant', 11, 0), (20, 'hulkenberg', 12, 0), (20, 'ricciardo', 13, 0), (20, 'piastri', 14, 0), (20, 'russell', 15, 0), (20, 'bottas', 16, 0), (20, 'zhou', 17, 0), (20, 'kevin_magnussen', 18, 0), (20, 'albon', 19, 0), (20, 'leclerc', 20, 0),
(21, 'max_verstappen', 1, 25), (21, 'leclerc', 2, 18), (21, 'perez', 3, 15), (21, 'ocon', 4, 12), (21, 'stroll', 5, 10), (21, 'sainz', 6, 8), (21, 'hamilton', 7, 6), (21, 'russell', 8, 4), (21, 'alonso', 9, 2), (21, 'piastri', 10, 2), (21, 'gasly', 11, 0), (21, 'albon', 12, 0), (21, 'kevin_magnussen', 13, 0), (21, 'ricciardo', 14, 0), (21, 'zhou', 15, 0), (21, 'sargeant', 16, 0), (21, 'bottas', 17, 0), (21, 'tsunoda', 18, 0), (21, 'hulkenberg', 19, 0), (21, 'norris', 20, 0),
(22, 'max_verstappen', 1, 26), (22, 'leclerc', 2, 18), (22, 'russell', 3, 15), (22, 'perez', 4, 12), (22, 'norris', 5, 10), (22, 'piastri', 6, 8), (22, 'alonso', 7, 6), (22, 'tsunoda', 8, 4), (22, 'hamilton', 9, 2), (22, 'stroll', 10, 1), (22, 'ricciardo', 11, 0), (22, 'ocon', 12, 0), (22, 'gasly', 13, 0), (22, 'albon', 14, 0), (22, 'hulkenberg', 15, 0), (22, 'sargeant', 16, 0), (22, 'zhou', 17, 0), (22, 'sainz', 18, 0), (22, 'bottas', 19, 0), (22, 'kevin_magnussen', 20, 0);