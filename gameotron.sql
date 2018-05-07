-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 07 mai 2018 à 22:29
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gameotron`
--

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `idgames` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  `rating` int(3) DEFAULT '50',
  `photo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `games`
--

INSERT INTO `games` (`idgames`, `nom`, `description`, `prix`, `rating`, `photo`) VALUES
(1, 'The Witcher 3', 'Wild Hunt', '50.99', 99, 'witcher3.jpg'),
(2, 'Dead Island Riptide', 'Open world zombie slayer', '45.98', 75, 'diriptide.jpg'),
(3, 'Gears Of War 3', 'Everyone dies in this one', '60.00', 88, 'gearsofwar.jpg'),
(4, 'Borderland', 'The Wildest game... Until Borderland 2', '36.45', 66, 'borderland.jpg');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`idgames`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `idgames` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
