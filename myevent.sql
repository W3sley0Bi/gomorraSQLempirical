-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 02, 2022 alle 18:17
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myevent`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `events`
--

CREATE TABLE `events` (
  `Eid` int(50) NOT NULL,
  `EventName` varchar(80) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `Expiration_Date` datetime NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Description` varchar(200) NOT NULL,
  `EventAddress` varchar(50) NOT NULL,
  `Lng` float NOT NULL,
  `Lat` float NOT NULL,
  `Owner_Id` int(11) NOT NULL,
  `Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `events`
--

INSERT INTO `events` (`Eid`, `EventName`, `Start_Date`, `Expiration_Date`, `Date`, `Description`, `EventAddress`, `Lng`, `Lat`, `Owner_Id`, `Type`) VALUES
(1, 'First of the year 2023', '2022-12-31 22:00:00', '2023-12-01 06:00:00', '2022-12-02 16:56:15', 'A very big party in the centre of lyon', 'Rue Paul Montrochet, 69002 Lyon, France', 4.81836, 45.7397, 4, 'Party'),
(2, 'Eicma 2022', '2022-11-14 09:00:00', '2022-11-20 19:00:00', '2022-12-02 16:56:15', 'EICMA, acronym of International Motorcycle and Accessories Exhibition is, at the world level, the most important trade fair event for the entire 2-wheel sector and represents the marketing tool of ANC', 'Strada Statale Sempione, 28, 20017 Rho MI', 9.07865, 45.5201, 2, 'Showroom'),
(3, 'Wesley\'s Dinner Party', '2023-01-14 19:00:00', '2023-01-14 23:00:00', '2022-12-02 17:04:44', 'A little dinner for my friends to party my birthday!', 'Reichenhainer Str. 41-33, 09126 Chemnitz, Germany', 12.9297, 50.8183, 1, 'Dinner'),
(4, 'MyProtein Brunch', '2022-12-03 11:00:00', '2022-12-03 12:00:00', '2022-12-02 17:04:44', 'Protein brunch sponsorized by Snarpeppo and MyProtein at GospelFood', 'Corso Vercelli, 210/A, 10155 Torino TO', 7.697, 45.1061, 3, 'Brunch');

-- --------------------------------------------------------

--
-- Struttura della tabella `event_types`
--

CREATE TABLE `event_types` (
  `Type_Name` varchar(80) NOT NULL,
  `Value1` int(11) NOT NULL,
  `Value2` int(11) NOT NULL,
  `Value3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `event_types`
--

INSERT INTO `event_types` (`Type_Name`, `Value1`, `Value2`, `Value3`) VALUES
('Brunch', 30, 30, 30),
('Dinner', 40, 40, 40),
('Party', 10, 10, 10),
('Showroom', 20, 20, 20);

-- --------------------------------------------------------

--
-- Struttura della tabella `role`
--

CREATE TABLE `role` (
  `Role_Name` varchar(80) NOT NULL,
  `Creation_Date` datetime NOT NULL,
  `Expiration_Date` datetime NOT NULL,
  `Type_of_permission` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `role`
--

INSERT INTO `role` (`Role_Name`, `Creation_Date`, `Expiration_Date`, `Type_of_permission`) VALUES
('Admin', '2022-12-02 17:41:29', '2026-12-01 17:41:29', 'admin'),
('User', '2022-12-02 17:42:39', '2022-12-02 17:42:39', 'user');

-- --------------------------------------------------------

--
-- Struttura della tabella `tickets`
--

CREATE TABLE `tickets` (
  `Ticket_Id` int(11) NOT NULL,
  `Type` varchar(80) NOT NULL,
  `QrCode` int(11) NOT NULL,
  `ExpirationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Owner_Id` int(11) NOT NULL,
  `Event_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `tickets`
--

INSERT INTO `tickets` (`Ticket_Id`, `Type`, `QrCode`, `ExpirationDate`, `Owner_Id`, `Event_Id`) VALUES
(1, 'StandardTicket', 2165412, '2023-01-02 17:08:48', 2, 1),
(2, 'PremiumTicket', 1321321, '2023-01-02 17:08:48', 1, 1),
(3, 'SuperTicket', 51321321, '2023-01-02 17:08:48', 4, 1),
(4, 'VipTicket', 645132123, '2023-01-02 17:08:48', 3, 1),
(5, 'PremiumTicket', 51351321, '2022-11-21 17:09:56', 1, 2),
(6, 'StandardTicket', 21321321, '2022-11-21 17:09:56', 2, 2),
(7, 'SuperTicket', 5457041, '2022-11-21 17:09:56', 3, 2),
(8, 'VipTicket', 78992246, '2023-01-15 23:00:00', 4, 3),
(9, 'PremiumTicket', 4560921, '2023-01-15 23:00:00', 1, 3),
(10, 'VipTicket', 786214567, '2023-01-15 23:00:00', 2, 3),
(11, 'StandardTicket', 477861206, '2023-01-15 23:00:00', 3, 3),
(12, 'PremiumTicket', 7777777, '2022-12-25 17:09:56', 1, 4),
(13, 'SuperTicket', 5555555, '2022-12-25 17:09:56', 2, 4),
(14, 'VipTicket', 444444, '2022-12-25 17:09:56', 4, 4),
(15, 'StandardTicket', 333333, '2022-12-25 17:09:56', 3, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `ticket_types`
--

CREATE TABLE `ticket_types` (
  `Type_name` varchar(80) NOT NULL,
  `value1` int(11) NOT NULL,
  `value2` int(11) NOT NULL,
  `value3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ticket_types`
--

INSERT INTO `ticket_types` (`Type_name`, `value1`, `value2`, `value3`) VALUES
('PremiumTicket', 100, 100, 100),
('StandardTicket', 10, 10, 10),
('SuperTicket', 1000, 1000, 0),
('VipTicket', 100000, 100000, 100000);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `Uid` int(50) NOT NULL,
  `Username` varchar(80) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `Surname` varchar(80) NOT NULL,
  `E-mail` varchar(80) NOT NULL,
  `Password` varchar(80) NOT NULL,
  `Role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`Uid`, `Username`, `Name`, `Surname`, `E-mail`, `Password`, `Role`) VALUES
(1, 'Admin', 'Wesley Giovanni', 'Obi', 'wesleyobi99@gmail.com', 'admin', 'Admin'),
(2, 'Fridge', 'Diego', 'Imparato', 'diegoimparato2@gmail.com', 'qwerty!', 'User'),
(3, 'Snarpeppo', 'Gabriele', 'Battistata', 'gabriele.battistata98@gmail.com', 'asdasd?', 'User'),
(4, 'Karen', 'Karen', 'Radin', 'karen.radin@gmail.com', 'qwertyasd==', 'User');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`Eid`),
  ADD KEY `type` (`Type`),
  ADD KEY `owner_id` (`Owner_Id`);

--
-- Indici per le tabelle `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`Type_Name`);

--
-- Indici per le tabelle `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_Name`);

--
-- Indici per le tabelle `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`Ticket_Id`),
  ADD KEY `type_ticket` (`Type`),
  ADD KEY `user_id_ticket` (`Owner_Id`),
  ADD KEY `event_ID_ticket` (`Event_Id`);

--
-- Indici per le tabelle `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`Type_name`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Uid`),
  ADD KEY `role` (`Role`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `events`
--
ALTER TABLE `events`
  MODIFY `Eid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `Uid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `owner_id` FOREIGN KEY (`Owner_Id`) REFERENCES `users` (`Uid`),
  ADD CONSTRAINT `type` FOREIGN KEY (`Type`) REFERENCES `event_types` (`Type_Name`);

--
-- Limiti per la tabella `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `event_ID_ticket` FOREIGN KEY (`Event_Id`) REFERENCES `events` (`Eid`),
  ADD CONSTRAINT `type_ticket` FOREIGN KEY (`Type`) REFERENCES `ticket_types` (`Type_name`),
  ADD CONSTRAINT `user_id_ticket` FOREIGN KEY (`Owner_Id`) REFERENCES `users` (`Uid`);

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `role` FOREIGN KEY (`Role`) REFERENCES `role` (`Role_Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
