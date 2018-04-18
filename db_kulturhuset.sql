-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Vært: 127.0.0.1
-- Genereringstid: 18. 04 2018 kl. 17:58:11
-- Serverversion: 5.6.24
-- PHP-version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_kulturhuset`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_events`
--

CREATE TABLE IF NOT EXISTS `tb_events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(50) NOT NULL,
  `event_text` text NOT NULL,
  `event_dateStart` datetime NOT NULL,
  `event_dateEnd` datetime NOT NULL,
  `event_imagePath` varchar(255) NOT NULL,
  `fk_event_type` int(11) NOT NULL,
  `fk_seating` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_events`
--

INSERT INTO `tb_events` (`event_id`, `event_name`, `event_text`, `event_dateStart`, `event_dateEnd`, `event_imagePath`, `fk_event_type`, `fk_seating`) VALUES
(1, 'Anden på coke!', 'Kom og genoplev Anden på coke!', '2018-05-15 18:30:00', '2018-05-15 20:00:00', 'anden-på-coke.jpg', 6, 1),
(2, 'Stargate', 'Kom og se et rerun af den originale Stargate film!', '2018-07-10 18:00:00', '2018-07-10 20:00:30', 'stargate_movie.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_event_types`
--

CREATE TABLE IF NOT EXISTS `tb_event_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `type_text` text NOT NULL,
  `type_imagePath` varchar(255) NOT NULL,
  `type_color` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_event_types`
--

INSERT INTO `tb_event_types` (`type_id`, `type_name`, `type_text`, `type_imagePath`, `type_color`) VALUES
(1, 'Film', 'Spændende film i vores hyggelige sale', 'film.jpg', ''),
(2, 'Koncert', 'Fede koncerter på kulturhavnen', 'koncert.jps', ''),
(3, 'Kunst', 'Kunst udstilling hos kulturhavnen Gilleleje', 'kunst.jpg', ''),
(4, 'Fordrag', 'Lærerige fordrag i hyggelige omgivelser', 'fordrag.jpg', ''),
(5, 'Teater', 'Flotte teater forstillinger hos kulturhavnen', 'teater.jpg', '57A88B'),
(6, 'Standup', 'Sjove og vovende standup sjovs', 'standup.jpg', '1E64FF');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_reservations`
--

CREATE TABLE IF NOT EXISTS `tb_reservations` (
  `reservation_id` int(11) NOT NULL,
  `fk_event_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_seating`
--

CREATE TABLE IF NOT EXISTS `tb_seating` (
  `seating_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_seating`
--

INSERT INTO `tb_seating` (`seating_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_site_information`
--

CREATE TABLE IF NOT EXISTS `tb_site_information` (
  `site_name` int(11) NOT NULL,
  `site_phone` varchar(10) NOT NULL,
  `site_email` varchar(100) NOT NULL,
  `site_fax` varchar(10) NOT NULL,
  `site_adress` varchar(50) NOT NULL,
  `site_city` varchar(50) NOT NULL,
  `site_postcode` varchar(4) NOT NULL,
  `fk_site_opening_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_site_opening_hours`
--

CREATE TABLE IF NOT EXISTS `tb_site_opening_hours` (
  `open_id` int(11) NOT NULL,
  `open_day` varchar(10) NOT NULL,
  `open_from` varchar(10) NOT NULL,
  `open_to` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_site_opening_hours`
--

INSERT INTO `tb_site_opening_hours` (`open_id`, `open_day`, `open_from`, `open_to`) VALUES
(1, 'Mandag', '10:00', '20:00'),
(2, 'Tirsdag', '10:00', '20:00'),
(3, 'Onsdag', '10:00', '20:00'),
(4, 'Torsdag', '10:00', '20:00'),
(5, 'Fredag', '10:00', '24:00'),
(6, 'Lørdag', '12:00', '24:00'),
(7, 'Søndag', '12:00', '18:00');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_users`
--

CREATE TABLE IF NOT EXISTS `tb_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(25) NOT NULL,
  `fk_user_info` int(11) NOT NULL,
  `fk_user_role` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `user_name`, `user_password`, `fk_user_info`, `fk_user_role`) VALUES
(1, 'admin', 'password', 1, 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_user_info`
--

CREATE TABLE IF NOT EXISTS `tb_user_info` (
  `info_id` int(11) NOT NULL,
  `info_name` varchar(50) NOT NULL,
  `info_surName` varchar(50) NOT NULL,
  `info-email` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_user_info`
--

INSERT INTO `tb_user_info` (`info_id`, `info_name`, `info_surName`, `info-email`) VALUES
(1, 'Jake', 'Madsen', 'JakeMadsen@KulturHavnen.dk');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `tb_user_roles`
--

CREATE TABLE IF NOT EXISTS `tb_user_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `tb_user_roles`
--

INSERT INTO `tb_user_roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(3, 'Kunde'),
(2, 'Moderator');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `tb_events`
--
ALTER TABLE `tb_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indeks for tabel `tb_event_types`
--
ALTER TABLE `tb_event_types`
  ADD PRIMARY KEY (`type_id`), ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indeks for tabel `tb_reservations`
--
ALTER TABLE `tb_reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indeks for tabel `tb_seating`
--
ALTER TABLE `tb_seating`
  ADD PRIMARY KEY (`seating_id`);

--
-- Indeks for tabel `tb_site_information`
--
ALTER TABLE `tb_site_information`
  ADD PRIMARY KEY (`site_name`);

--
-- Indeks for tabel `tb_site_opening_hours`
--
ALTER TABLE `tb_site_opening_hours`
  ADD PRIMARY KEY (`open_id`);

--
-- Indeks for tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks for tabel `tb_user_info`
--
ALTER TABLE `tb_user_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indeks for tabel `tb_user_roles`
--
ALTER TABLE `tb_user_roles`
  ADD PRIMARY KEY (`role_id`), ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `tb_events`
--
ALTER TABLE `tb_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_event_types`
--
ALTER TABLE `tb_event_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_reservations`
--
ALTER TABLE `tb_reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_seating`
--
ALTER TABLE `tb_seating`
  MODIFY `seating_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_site_information`
--
ALTER TABLE `tb_site_information`
  MODIFY `site_name` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_site_opening_hours`
--
ALTER TABLE `tb_site_opening_hours`
  MODIFY `open_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_user_info`
--
ALTER TABLE `tb_user_info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Tilføj AUTO_INCREMENT i tabel `tb_user_roles`
--
ALTER TABLE `tb_user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
