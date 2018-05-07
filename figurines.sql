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
-- Base de données :  `figurines`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `idcategorie` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idcategorie`, `nom`) VALUES
(3, 'Autre'),
(1, 'Star Wars'),
(2, 'X-men');

-- --------------------------------------------------------

--
-- Structure de la table `figurines`
--

CREATE TABLE `figurines` (
  `idfigurine` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prix` decimal(5,2) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `idcat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `figurines`
--

INSERT INTO `figurines` (`idfigurine`, `nom`, `prix`, `photo`, `description`, `quantite`, `idcat`) VALUES
(1, 'Luke', '100.00', 'luke.jpg', 'Luke.. tu sais c\'est qui', 1, 1),
(2, 'Wolverine', '50.00', 'wolverine.jpg', 'Wolverine... Le gars avec les Claws', 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idcategorie`),
  ADD UNIQUE KEY `nom_UNIQUE` (`nom`);

--
-- Index pour la table `figurines`
--
ALTER TABLE `figurines`
  ADD PRIMARY KEY (`idfigurine`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `idcategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `figurines`
--
ALTER TABLE `figurines`
  MODIFY `idfigurine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `figurines`
--
ALTER TABLE `figurines`
  ADD CONSTRAINT `figurines_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categories` (`idcategorie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
