Sub Create_Tables()

DoCmd.RunSQL "CREATE TABLE Drivers(" & _
   "DriverID INT," & _
   "FirstName VARCHAR(50)," & _
   "LastName VARCHAR(50)," & _
   "Nationality VARCHAR(50)," & _
   "DateOfBirth DATE," & _
   "TeamID INT NOT NULL TeamID," & _
   "PRIMARY KEY(DriverID)," & _
   "UNIQUE(TeamID)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Teams(" & _
   "TeamID INT," & _
   "TeamName VARCHAR(50)," & _
   "TeamPrincipal VARCHAR(50)," & _
   "Headquarters VARCHAR(50)," & _
   "EngineSupplier VARCHAR(50)," & _
   "ChassisSupplier VARCHAR(50)," & _
   "PRIMARY KEY(TeamID)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Races(" & _
   "RaceID INT," & _
   "RaceName VARCHAR(50)," & _
   "Circuit VARCHAR(50)," & _
   "Location VARCHAR(50)," & _
   "DateOfRace DATE," & _
   "WinnerID INT," & _
   "PRIMARY KEY(RaceID)," & _
   "UNIQUE(WinnerID)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Results(" & _
   "ResultID INT," & _
   "TeamID INT," & _
   "RaceID INT," & _
   "DriverID INT," & _
   "PositionDriver INT," & _
   "LapTime VARCHAR(50)," & _
   "PointsEarned DECIMAL(15,2)," & _
   "PRIMARY KEY(ResultID)," & _
   "UNIQUE(TeamID)," & _
   "UNIQUE(RaceID)," & _
   "UNIQUE(DriverID)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Obtain(" & _
   "DriverID INT," & _
   "ResultID INT," & _
   "PRIMARY KEY(DriverID, ResultID)," & _
   "FOREIGN KEY(DriverID) REFERENCES Drivers(DriverID)," & _
   "FOREIGN KEY(ResultID) REFERENCES Results(ResultID)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Accumulate(" & _
   "TeamID INT," & _
   "ResultID INT," & _
   "PRIMARY KEY(TeamID, ResultID)," & _
   "FOREIGN KEY(TeamID) REFERENCES Teams(TeamID)," & _
   "FOREIGN KEY(ResultID) REFERENCES Results(ResultID)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Determine(" & _
   "RaceID INT," & _
   "ResultID INT," & _
   "PRIMARY KEY(RaceID, ResultID)," & _
   "FOREIGN KEY(RaceID) REFERENCES Races(RaceID)," & _
   "FOREIGN KEY(ResultID) REFERENCES Results(ResultID)" & _
");"   

End Sub

INSERT INTO Drivers (DriverID, FirstName, LastName, Nationality, DateOfBirth, TeamID)
VALUES
(1, 'Verstappen', 'Max', 'Dutch', '1997-09-30', 2),
(2, 'Hamilton', 'Lewis', 'English', '1985-01-7', 1),
(3, 'Valtteri', 'Bottas', 'Finnish', '1989-08-28', 8),
(4, 'Sergio', 'Pérez', 'Mexican', '1990-01-26', 2),
(5, 'Lando', 'Norris', 'British', '1999-11-13', 3),
(6, 'Charles', 'Leclerc', 'Monegasque', '1997-10-16', 4),
(7, 'Carlos', 'Sainz', 'Spanish', '1994-09-01', 4),
(8, 'Tsunoda', 'Yuki', 'Japanese', '1989-07-01', 5),
(9, 'Pierre', 'Gasly', 'French', '1996-02-07', 7),
(10, 'Fernando', 'Alonso', 'Spanish', '1981-07-29', 6);

INSERT INTO Teams (TeamID, TeamName, TeamPrincipal, Headquarters, EngineSupplier, ChassisSupplier)
VALUES
(1, 'Mercedes', 'Toto Wolff', 'Brackley, UK', 'Mercedes', 'Mercedes'),
(2, 'Red Bull Racing', 'Christian Horner', 'Milton Keynes, UK', 'Honda', 'Red Bull Technology'),
(3, 'McLaren', 'Zak Brown', 'Woking, UK', 'Mercedes', 'McLaren'),
(4, 'Ferrari', 'Frédéric Vasseur', 'Maranello, Italy', 'Ferrari', 'Ferrari'),
(5, 'Scuderia AlphaTauri', 'Franz Tost', 'Faenza, Italy', 'Honda', 'AlphaTauri'),
(6, 'Aston Martin', 'Mike Krack', 'Silverstone, UK', 'Mercedes', 'Aston Martin'),
(7, 'Alpine', 'Laurent Rossi', 'Enstone, UK', 'Renault', 'Alpine'),
(8, 'Alfa Romeo Racing', 'Andreas Seidl', 'Hinwil, Switzerland', 'Ferrari', 'Sauber'),
(9, 'Williams', 'James Vowles', 'Grove, UK', 'Mercedes', 'Williams'),
(10, 'Haas', 'Guenther Steiner', 'Kannapolis, USA', 'Ferrari', 'Dallara');

INSERT INTO Races (RaceID, RaceName, Circuit, Location, DateOfRace, WinnerID)
VALUES
(1, 'FORMULA 1 GULF AIR BAHRAIN GRAND PRIX 2023', 'Bahrain International Circuit', 'Sakhir', '2023-03-05', 1),
(2, 'FORMULA 1 STC SAUDI ARABIAN GRAND PRIX 2023', 'Jeddah Corniche Circuit', 'Jeddah', '2023-03-19', 4), 
(3, 'FORMULA 1 ROLEX AUSTRALIAN GRAND PRIX 2023', 'Albert Park Circuit', 'Melbourne', '2023-04-02', 1),
(4, 'FORMULA 1 AZERBAIJAN GRAND PRIX 2023', 'Baku City Circuit', 'Baku', '2023-04-30', 4),
(5, 'FORMULA 1 CRYPTO.COM MIAMI GRAND PRIX 2023', 'Miami International Autodrome', 'Miami', '2023-05-07', 1),
(6, 'FORMULA 1 QATAR AIRWAYS GRAN PREMIO DEL MADE IN ITALY E DELL'EMILIA-ROMAGNA 2023', 'Autodromo Internazionale Enzo e Dino Ferrari', 'Imola', '2023-05-21', 1),
(7, 'FORMULA 1 GRAND PRIX DE MONACO 2023', 'Circuit de Monaco', 'Monaco', '2023-05-28', 1),
(8, 'FORMULA 1 AWS GRAN PREMIO DE ESPAÑA 2023', 'Circuit de Barcelona-Catalunya', 'Spain', '2023-06-04', 1),
(9, 'FORMULA 1 PIRELLI GRAND PRIX DU CANADA 2023', 'Circuit Gilles-Villeneuve', 'Montreal', '2023-06-18', 1),
(10, 'FORMULA 1 ROLEX GROSSER PREIS VON ÖSTERREICH 2023', 'Red Bull Ring', 'Spielberg', '2023-07-02', 1);

INSERT INTO Results (ResultID, TeamID, RaceID, DriverID, PositionDriver, LapTime, PointsEarned)
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