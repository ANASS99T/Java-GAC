-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 28, 2020 at 02:25 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `absence`
--

CREATE TABLE `absence` (
  `idAbsence` int(11) NOT NULL,
  `jour` date NOT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL,
  `excuse` tinyint(1) NOT NULL,
  `idEleve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absence`
--

INSERT INTO `absence` (`idAbsence`, `jour`, `heureDebut`, `heureFin`, `excuse`, `idEleve`) VALUES
(1, '2020-05-20', '08:00:00', '10:00:00', 1, 25),
(2, '2020-01-01', '08:00:00', '12:00:00', 1, 41),
(3, '2020-01-01', '08:00:00', '10:00:00', 0, 1),
(4, '2020-01-01', '08:00:00', '12:00:00', 0, 9),
(5, '2020-05-27', '14:00:00', '16:00:00', 0, 362);

-- --------------------------------------------------------

--
-- Table structure for table `affectation`
--

CREATE TABLE `affectation` (
  `idAffectation` int(11) NOT NULL,
  `idCours` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  `heurDebut` time NOT NULL,
  `heurFin` time NOT NULL,
  `jour` date NOT NULL,
  `idClasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `affectation`
--

INSERT INTO `affectation` (`idAffectation`, `idCours`, `idSalle`, `heurDebut`, `heurFin`, `jour`, `idClasse`) VALUES
(1, 13, 17, '10:00:00', '12:00:00', '2020-05-20', 1),
(3, 21, 19, '08:00:00', '09:00:00', '2020-05-20', 8),
(4, 14, 8, '08:30:00', '12:00:00', '2020-05-21', 2),
(5, 21, 20, '10:00:00', '12:00:00', '2020-05-20', 7),
(8, 24, 10, '08:30:00', '12:00:00', '2020-05-20', 16),
(12, 24, 6, '14:00:00', '16:00:00', '2020-05-20', 16),
(13, 18, 1, '08:00:00', '10:00:00', '2020-05-30', 17),
(14, 19, 1, '08:00:00', '10:00:00', '2020-05-30', 3),
(15, 20, 1, '08:00:00', '10:00:00', '2020-05-30', 1),
(16, 21, 1, '08:00:00', '10:00:00', '2020-05-30', 15),
(17, 13, 2, '14:00:00', '16:00:00', '2020-05-27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `idClasse` int(11) NOT NULL,
  `nomClasse` varchar(30) NOT NULL,
  `nombreEleve` int(11) NOT NULL,
  `niveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`idClasse`, `nomClasse`, `nombreEleve`, `niveau`) VALUES
(1, 'C6-1', 20, 6),
(2, 'C6-2', 20, 6),
(3, 'C6-3', 20, 6),
(4, 'C6-4', 20, 6),
(5, 'C6-5', 20, 6),
(6, 'C5-1', 20, 5),
(7, 'C5-2', 20, 5),
(8, 'C5-3', 20, 5),
(9, 'C5-4', 20, 5),
(10, 'C4-1', 20, 4),
(11, 'C4-2', 20, 4),
(12, 'C4-3', 20, 4),
(13, 'C4-4', 20, 4),
(14, 'C3-1', 20, 3),
(15, 'C3-2', 20, 3),
(16, 'C3-3', 20, 3),
(17, 'C3-4', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `idCours` int(11) NOT NULL,
  `nomCours` varchar(30) NOT NULL,
  `idEnseignant` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`idCours`, `nomCours`, `idEnseignant`, `disponible`) VALUES
(13, 'Mathe', 1, 1),
(14, 'Physique', 2, 1),
(15, 'Physique TP', 2, 1),
(16, 'Chemie', 10, 1),
(17, 'Chemie TP', 10, 1),
(18, 'Sport 1', 3, 1),
(19, 'Sport 2', 4, 1),
(20, 'Sport 3', 5, 1),
(21, 'Francais', 11, 1),
(23, 'Latine', 8, 1),
(24, 'Arabe', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eleve`
--

CREATE TABLE `eleve` (
  `idEleve` int(11) NOT NULL,
  `nomEleve` varchar(30) NOT NULL,
  `prenomEleve` varchar(30) NOT NULL,
  `idClasse` int(11) NOT NULL,
  `adresseEleve` varchar(300) NOT NULL,
  `teleparentEleve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eleve`
--

INSERT INTO `eleve` (`idEleve`, `nomEleve`, `prenomEleve`, `idClasse`, `adresseEleve`, `teleparentEleve`) VALUES
(1, 'Eleve 1', 'Eleve 1', 1, 'ici l\'adresse de l\'eleve', 687654321),
(2, 'Eleve 2', 'Eleve 2', 1, 'ici l\'adresse de l\'eleve', 687654321),
(3, 'Eleve 3', 'Eleve 3', 2, 'ici l\'adresse de l\'eleve', 687654321),
(4, 'Eleve 4', 'Eleve 4', 1, 'ici l\'adresse de l\'eleve', 687654321),
(5, 'Eleve 5', 'Eleve 5', 1, 'ici l\'adresse de l\'eleve', 687654321),
(6, 'Eleve 6', 'Eleve 6', 1, 'ici l\'adresse de l\'eleve', 687654321),
(7, 'Eleve 7', 'Eleve 7', 1, 'ici l\'adresse de l\'eleve', 687654321),
(8, 'Eleve 9', 'Eleve 9', 1, 'ici l\'adresse de l\'eleve', 687654321),
(9, 'Eleve 10', 'Eleve 10', 1, 'ici l\'adresse de l\'eleve', 687654321),
(10, 'Eleve 11', 'Eleve 11', 1, 'ici l\'adresse de l\'eleve', 687654321),
(11, 'Eleve 12', 'Eleve 12', 1, 'ici l\'adresse de l\'eleve', 687654321),
(12, 'Eleve 13', 'Eleve 13', 1, 'ici l\'adresse de l\'eleve', 687654321),
(13, 'Eleve 14', 'Eleve 14', 1, 'ici l\'adresse de l\'eleve', 687654321),
(14, 'Eleve 15', 'Eleve 15', 1, 'ici l\'adresse de l\'eleve', 687654321),
(15, 'Eleve 16', 'Eleve 16', 1, 'ici l\'adresse de l\'eleve', 687654321),
(16, 'Eleve 17', 'Eleve 17', 1, 'ici l\'adresse de l\'eleve', 687654321),
(17, 'Eleve 18', 'Eleve 18', 1, 'ici l\'adresse de l\'eleve', 687654321),
(18, 'Eleve 19', 'Eleve 19', 1, 'ici l\'adresse de l\'eleve', 687654321),
(19, 'Eleve 8', 'Eleve 8', 1, 'ici l\'adresse de l\'eleve', 687654321),
(20, 'Eleve 20', 'Eleve 20', 1, 'ici l\'adresse de l\'eleve', 687654321),
(21, 'Eleve 21', 'Eleve 21', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(22, 'Eleve 22', 'Eleve 22', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(23, 'Eleve 23', 'Eleve 23', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(24, 'Eleve 24', 'Eleve 24', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(25, 'Eleve 25', 'Eleve 25', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(26, 'Eleve 26', 'Eleve 26', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(27, 'Eleve 27', 'Eleve 27', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(28, 'Eleve 28', 'Eleve 28', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(29, 'Eleve 29', 'Eleve 29', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(30, 'Eleve 30', 'Eleve 30', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(31, 'Eleve 31', 'Eleve 31', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(32, 'Eleve 32', 'Eleve 32', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(33, 'Eleve 33', 'Eleve 33', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(34, 'Eleve 34', 'Eleve 34', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(35, 'Eleve 35', 'Eleve 35', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(36, 'Eleve 36', 'Eleve 36', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(37, 'Eleve 37', 'Eleve 37', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(38, 'Eleve 38', 'Eleve 38', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(39, 'Eleve 39', 'Eleve 39', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(40, 'Eleve 40', 'Eleve 40', 2, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(41, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(42, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(43, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(44, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(45, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(46, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(47, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(48, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(49, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(50, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(51, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(52, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(53, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(54, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(55, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(56, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(57, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(58, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(59, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(60, 'Eleve 41', 'Eleve 41', 3, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(61, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(62, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(63, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(64, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(65, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(66, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(67, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(68, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(69, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(70, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(71, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(72, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(73, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(74, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(75, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(76, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(77, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(78, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(79, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(80, 'Eleve 60', 'Eleve 60', 4, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(81, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(82, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(83, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(84, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(85, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(86, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(87, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(88, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(89, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(90, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(91, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(92, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(93, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(94, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(95, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(96, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(97, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(98, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(99, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(100, 'Eleve 80', 'Eleve 80', 5, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(101, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(102, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(103, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(104, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(105, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(106, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(107, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(108, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(109, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(110, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(111, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(112, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(113, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(114, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(115, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(116, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(117, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(118, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(119, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(120, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(121, 'Eleve 100', 'Eleve 100', 6, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(122, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(123, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(124, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(125, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(126, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(127, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(128, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(129, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(130, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(131, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(132, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(133, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(134, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(135, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(136, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(137, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(138, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(139, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(140, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(141, 'Eleve 120', 'Eleve 120', 7, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(142, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(143, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(144, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(145, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(146, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(147, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(148, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(149, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(150, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(151, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(152, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(153, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(154, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(155, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(156, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(157, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(158, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(159, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(160, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(161, 'Eleve 140', 'Eleve 140', 8, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(162, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(163, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(164, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(165, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(166, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(167, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(168, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(169, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(170, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(171, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(172, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(173, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(174, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(175, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(176, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(177, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(178, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(179, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(180, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(181, 'Eleve 160', 'Eleve 160', 9, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(182, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(183, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(184, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(185, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(186, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(187, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(188, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(189, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(190, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(191, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(192, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(193, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(194, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(195, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(196, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(197, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(198, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(199, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(200, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(201, 'Eleve 180', 'Eleve 180', 10, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(202, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(203, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(204, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(205, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(206, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(207, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(208, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(209, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(210, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(211, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(212, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(213, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(214, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(215, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(216, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(217, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(218, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(219, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(220, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(221, 'Eleve 200', 'Eleve 200', 11, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(222, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(223, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(224, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(225, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(226, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(227, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(228, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(229, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(230, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(231, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(232, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(233, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(234, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(235, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(236, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(237, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(238, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(239, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(240, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(241, 'Eleve 220', 'Eleve 220', 12, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(242, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(243, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(244, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(245, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(246, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(247, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(248, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(249, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(250, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(251, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(252, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(253, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(254, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(255, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(256, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(257, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(258, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(259, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(260, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(261, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(262, 'Eleve 240', 'Eleve 240', 13, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(263, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(264, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(265, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(266, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(267, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(268, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(269, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(270, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(271, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(272, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(273, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(274, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(275, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(276, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(277, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(278, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(279, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(280, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(281, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(282, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(283, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(284, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(285, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(286, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(287, 'Eleve 260', 'Eleve 260', 14, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(288, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(289, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(290, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(291, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(292, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(293, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(294, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(295, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(296, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(297, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(298, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(299, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(300, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(301, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(302, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(303, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(304, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(305, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(306, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(307, 'Eleve 300', 'Eleve 300', 15, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(308, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(309, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(310, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(311, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(312, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(313, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(314, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(315, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(316, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(317, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(318, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(319, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(320, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(321, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(322, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(323, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(324, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(325, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(326, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(327, 'Eleve 330', 'Eleve 330', 16, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(328, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(329, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(330, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(331, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(332, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(333, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(334, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(335, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(336, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(337, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(338, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(339, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(340, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(341, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(342, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(343, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(344, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(345, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(346, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(347, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(348, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(349, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(350, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(351, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(352, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(353, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(354, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(355, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(356, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(357, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(358, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(359, 'Eleve 360', 'Eleve 360', 17, 'ici l\'adresse de l\'eleve\r\n', 687654321),
(362, 'OULED BEN TAHAR', 'ANASS', 1, 'casablanca', 600000000);

-- --------------------------------------------------------

--
-- Table structure for table `enseigant`
--

CREATE TABLE `enseigant` (
  `idEnseignant` int(11) NOT NULL,
  `nomEnseignant` varchar(30) NOT NULL,
  `prenomEnseignant` varchar(30) NOT NULL,
  `adresseEnseignant` varchar(300) NOT NULL,
  `telEnseignant` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enseigant`
--

INSERT INTO `enseigant` (`idEnseignant`, `nomEnseignant`, `prenomEnseignant`, `adresseEnseignant`, `telEnseignant`) VALUES
(1, 'Mohamed', 'Mohamed', 'ici l\'adresse de l\'enseignant', '0612345678'),
(2, 'Ahmed', 'Ahmed', 'ici l\'adresse de l\'enseignant', '0612345678'),
(3, 'Omar', 'Omar', 'ici l\'adresse de l\'enseignant', '0612345678'),
(4, 'Karim', 'Karim', 'ici l\'adresse de l\'enseignant', '0612345678'),
(5, 'Ali', 'Ali', 'ici l\'adresse de l\'enseignant', '0612345678'),
(6, 'Abderrahma', 'Abderrahman', 'ici l\'adresse de l\'enseignant', '0612345678'),
(7, 'Zakaria', 'Zakaria', 'ici l\'adresse de l\'enseignant', '0612345678'),
(8, 'Nizar', 'Nizar', 'ici l\'adresse de l\'enseignant', '0612345678'),
(9, 'Brahim', 'Brahim', 'ici l\'adresse de l\'enseignant', '0612345678'),
(10, 'Zineb', 'Zineb', 'ici l\'adresse de l\'enseignant', '0612345678'),
(11, 'Imane', 'Imane', 'ici l\'adresse de l\'enseignant', '0612345678');

-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE `materiel` (
  `idMateriel` int(11) NOT NULL,
  `nomMateriel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `materiel`
--

INSERT INTO `materiel` (`idMateriel`, `nomMateriel`) VALUES
(1, 'rideaux noirs et de projecteurs video'),
(2, 'retro-projecteurs, ecrans, triples tableaux'),
(3, 'equipement sportif'),
(7, 'laboratoire de physique'),
(8, 'laboratoire de chemie');

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `idSalle` int(11) NOT NULL,
  `nomSalle` varchar(30) NOT NULL,
  `capaciteSalle` int(11) NOT NULL,
  `idMateriel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`idSalle`, `nomSalle`, `capaciteSalle`, `idMateriel`) VALUES
(1, 'Sport', 150, 3),
(2, 'video 1', 30, 1),
(3, 'video 2', 35, 1),
(4, 'Labo Physique', 45, 7),
(5, 'Labo chemie', 45, 8),
(6, 'Normale', 35, 2),
(7, 'Normale', 30, 2),
(8, 'Normale', 35, 2),
(9, 'Normale', 25, 2),
(10, 'Normale', 45, 2),
(11, 'Normale', 30, 2),
(12, 'Normale', 20, 2),
(13, 'Normale', 30, 2),
(14, 'Normale', 40, 2),
(15, 'Normale', 33, 2),
(16, 'Normale', 35, 2),
(17, 'Normale', 30, 2),
(18, 'Normale', 30, 2),
(19, 'Normale', 30, 2),
(20, 'Normale', 30, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absence`
--
ALTER TABLE `absence`
  ADD PRIMARY KEY (`idAbsence`),
  ADD KEY `idEleve` (`idEleve`);

--
-- Indexes for table `affectation`
--
ALTER TABLE `affectation`
  ADD PRIMARY KEY (`idAffectation`),
  ADD KEY `idCours` (`idCours`),
  ADD KEY `idSalle` (`idSalle`),
  ADD KEY `idClasse` (`idClasse`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idClasse`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`idCours`),
  ADD KEY `idEnseigant` (`idEnseignant`);

--
-- Indexes for table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`idEleve`),
  ADD KEY `idClasse` (`idClasse`);

--
-- Indexes for table `enseigant`
--
ALTER TABLE `enseigant`
  ADD PRIMARY KEY (`idEnseignant`);

--
-- Indexes for table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`idMateriel`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`idSalle`),
  ADD KEY `idMateriel` (`idMateriel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absence`
--
ALTER TABLE `absence`
  MODIFY `idAbsence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `affectation`
--
ALTER TABLE `affectation`
  MODIFY `idAffectation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `idClasse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cours`
--
ALTER TABLE `cours`
  MODIFY `idCours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `idEleve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT for table `enseigant`
--
ALTER TABLE `enseigant`
  MODIFY `idEnseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `idMateriel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `idSalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absence`
--
ALTER TABLE `absence`
  ADD CONSTRAINT `absence_ibfk_1` FOREIGN KEY (`idEleve`) REFERENCES `eleve` (`idEleve`);

--
-- Constraints for table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `affectation_ibfk_1` FOREIGN KEY (`idCours`) REFERENCES `cours` (`idCours`),
  ADD CONSTRAINT `affectation_ibfk_2` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`),
  ADD CONSTRAINT `affectation_ibfk_3` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`);

--
-- Constraints for table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`idEnseignant`) REFERENCES `enseigant` (`idEnseignant`);

--
-- Constraints for table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `idClasse` FOREIGN KEY (`idClasse`) REFERENCES `classe` (`idClasse`);

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`idMateriel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
