-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 11.Jan 2024, 17:01
-- Verzia serveru: 10.4.27-MariaDB
-- Verzia PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `festivals`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `festival`
--

CREATE TABLE `festival` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `st_number` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `web` text NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `festival`
--

INSERT INTO `festival` (`id`, `name`, `date_from`, `date_to`, `price`, `country`, `city`, `street`, `st_number`, `description`, `web`, `location`) VALUES
(1, 'Festival 1', '2024-01-01', '2024-01-18', '50.00', 'Country 1', 'City 1', 'Street 1', '123', 'Description 1', 'www.test.com', 'Test'),
(2, 'Festival 2', '2024-01-08', '2024-01-15', '40.00', 'Country 2', 'City 2', 'Street 2', '456', 'Description 2', '', 'Music a Cafe Nitra'),
(3, 'GrooveFest', '2024-01-09', '2024-01-13', '25.00', 'FestivalLand', 'MusicCity', 'Rhythm Street', '123', 'A celebration of rhythmic beats', 'http://groovefest.com', 'Harmony Hall'),
(4, 'ArtistryShow', '2024-04-15', '2024-04-20', '15.00', 'Creativia', 'ArtsVille', 'Creativity Street', '456', 'Exploring diverse art forms', 'http://artistryshow.com', 'Art Square'),
(5, 'TasteBurst', '2024-05-10', '2024-05-15', '20.00', 'GourmetLand', 'FlavorCity', 'Taste Boulevard', '789', 'A culinary adventure for the taste buds', 'http://tasteburst.com', 'Flavor Fair'),
(6, 'TechInnovate', '2024-06-20', '2024-06-25', '30.00', 'TechWorld', 'InnoCity', 'Innovation Avenue', '101', 'Exploring the forefront of technology', 'http://techinnovate.com', 'Tech Hub'),
(7, 'CineMagic', '2024-07-05', '2024-07-10', '25.00', 'FilmLand', 'CinemaCity', 'Film Street', '202', 'A magical cinematic experience under the stars', 'http://cinemagic.com', 'Starlight Cinema'),
(8, 'StyleStrut', '2024-08-15', '2024-08-20', '18.00', 'FashionRealm', 'StyleVille', 'Fashion Boulevard', '303', 'Where style takes center stage', 'http://stylestrut.com', 'Fashion Plaza'),
(9, 'DanceFiesta', '2024-09-10', '2024-09-15', '22.00', 'RhythmNation', 'DanceCity', 'Dance Square', '404', 'An electrifying celebration of dance', 'http://dancefiesta.com', 'Dance Dome'),
(10, 'GreenGrove', '2024-10-25', '2024-10-30', '15.00', 'EcoLand', 'GreenCity', 'Eco Park', '505', 'Connecting with nature and environmental awareness', 'http://greengrove.com', 'Eco Pavilion');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `festival_musician`
--

CREATE TABLE `festival_musician` (
  `id` int(11) NOT NULL,
  `festival_id` int(11) NOT NULL,
  `musician_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `festival_musician`
--

INSERT INTO `festival_musician` (`id`, `festival_id`, `musician_id`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4),
(5, 4, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10),
(11, 10, 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `musician`
--

CREATE TABLE `musician` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `musician`
--

INSERT INTO `musician` (`id`, `name`, `genre`, `country`, `about`) VALUES
(1, 'John Doe', 'Pop', 'Slovakia', 'Lorem'),
(2, 'RhythmicBeats', 'World', 'International', 'A group that creates rhythms from around the world.'),
(3, 'ArtisticHarmony', 'Classical', 'United States', 'An orchestra that brings harmony to classical compositions.'),
(4, 'FlavorfulMelodies', 'Culinary', 'France', 'A unique blend of culinary arts and musical melodies.'),
(5, 'TechInnovators', 'Electronic', 'TechLand', 'Pioneers of innovative sounds using cutting-edge technology.'),
(6, 'CinematicMagic', 'Film Score', 'Hollywood', 'Creating magical moments through cinematic scores.'),
(7, 'StyleEnsemble', 'Fashion Beats', 'FashionVille', 'A fusion of fashion and rhythmic beats on the runway.'),
(8, 'DanceDynasty', 'Electronic Dance Music', 'DanceNation', 'Energizing dance beats to get the crowd moving.'),
(9, 'GreenHarmony', 'Environmental Sounds', 'GreenLand', 'Promoting environmental awareness through music.'),
(10, 'MelodicInnovators', 'Experimental', 'International', 'Pushing boundaries with innovative and experimental sounds.');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `festival`
--
ALTER TABLE `festival`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `festival_musician`
--
ALTER TABLE `festival_musician`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `musician`
--
ALTER TABLE `musician`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `festival`
--
ALTER TABLE `festival`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `festival_musician`
--
ALTER TABLE `festival_musician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pre tabuľku `musician`
--
ALTER TABLE `musician`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
