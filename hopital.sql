-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 19 mai 2020 à 19:20
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `hopital`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `num_chambre` int(11) NOT NULL AUTO_INCREMENT,
  `category_chambre` varchar(50) NOT NULL,
  `type_chambre` varchar(5) NOT NULL,
  PRIMARY KEY (`num_chambre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`num_chambre`, `category_chambre`, `type_chambre`) VALUES
(1, 'category1', 'Type1'),
(2, 'category2', 'type2'),
(3, 'category3', 'type3'),
(4, 'category4', 'type4'),
(5, 'category5', 'type5');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `numdepartement` int(11) NOT NULL AUTO_INCREMENT,
  `nom_departement` varchar(50) NOT NULL,
  PRIMARY KEY (`numdepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`numdepartement`, `nom_departement`) VALUES
(1, 'departement1'),
(2, 'departement2'),
(3, 'departement3'),
(4, 'departement4');

-- --------------------------------------------------------

--
-- Structure de la table `interner`
--

DROP TABLE IF EXISTS `interner`;
CREATE TABLE IF NOT EXISTS `interner` (
  `numdepartement` int(11) NOT NULL,
  `num_malade` int(11) NOT NULL,
  `numEv` int(11) NOT NULL,
  `date_Ev` date NOT NULL,
  PRIMARY KEY (`numdepartement`,`num_malade`),
  KEY `INTERNER_MALADE0_FK` (`num_malade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `interner`
--

INSERT INTO `interner` (`numdepartement`, `num_malade`, `numEv`, `date_Ev`) VALUES
(1, 2, 1, '2020-05-22'),
(1, 4, 3, '2020-05-07'),
(2, 1, 2, '2020-05-04'),
(2, 5, 6, '2020-05-14'),
(3, 3, 4, '2020-09-09'),
(3, 6, 7, '2020-05-15'),
(4, 7, 5, '2020-05-23');

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

DROP TABLE IF EXISTS `lit`;
CREATE TABLE IF NOT EXISTS `lit` (
  `num_lit` int(11) NOT NULL AUTO_INCREMENT,
  `num_chambre` int(11) NOT NULL,
  PRIMARY KEY (`num_lit`),
  KEY `LIT_CHAMBRE_FK` (`num_chambre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`num_lit`, `num_chambre`) VALUES
(1, 1),
(6, 1),
(7, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

DROP TABLE IF EXISTS `malade`;
CREATE TABLE IF NOT EXISTS `malade` (
  `num_malade` int(11) NOT NULL AUTO_INCREMENT,
  `nom_malade` varchar(50) NOT NULL,
  `adress_malade` varchar(50) NOT NULL,
  `sexe_malade` varchar(50) NOT NULL,
  `date_naissance_malade` date NOT NULL,
  `lieu_naissance_malade` varchar(50) NOT NULL,
  PRIMARY KEY (`num_malade`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`num_malade`, `nom_malade`, `adress_malade`, `sexe_malade`, `date_naissance_malade`, `lieu_naissance_malade`) VALUES
(1, 'Mame', 'Dakar', 'H', '2012-04-22', 'DAKAR'),
(2, 'Fama', 'Fass', 'F', '2020-05-05', 'Fass'),
(3, 'Ousseynou', 'Rufisque', 'H', '2020-05-13', 'Rufisque'),
(4, 'Fanta', 'Patar', 'F', '2020-05-18', 'Patar'),
(5, 'Jean', 'Fass', 'H', '2020-04-22', ''),
(6, 'Pierre', 'Kaolack', 'H', '2020-03-17', 'Kaolack'),
(7, 'Paul', 'Fouta', 'H', '2019-12-11', 'Fouta');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `num_medecin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_medecin` varchar(50) NOT NULL,
  `specialite_medecin` varchar(50) NOT NULL,
  `numdepartement` int(11) NOT NULL,
  PRIMARY KEY (`num_medecin`),
  KEY `MEDECIN_DEPARTEMENT_FK` (`numdepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`num_medecin`, `nom_medecin`, `specialite_medecin`, `numdepartement`) VALUES
(1, 'Cheikh', 'S1', 1),
(2, 'Bacary', 'S2', 2),
(3, 'M3', 'S3', 4),
(4, 'Fanta', 'S4', 3);

-- --------------------------------------------------------

--
-- Structure de la table `occuper`
--

DROP TABLE IF EXISTS `occuper`;
CREATE TABLE IF NOT EXISTS `occuper` (
  `num_lit` int(11) NOT NULL,
  `num_malade` int(11) NOT NULL,
  PRIMARY KEY (`num_lit`,`num_malade`),
  KEY `OCCUPER_MALADE0_FK` (`num_malade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `occuper`
--

INSERT INTO `occuper` (`num_lit`, `num_malade`) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 3),
(5, 5),
(6, 7),
(7, 6);

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
CREATE TABLE IF NOT EXISTS `suivre` (
  `num_medecin` int(11) NOT NULL,
  `num_malade` int(11) NOT NULL,
  PRIMARY KEY (`num_medecin`,`num_malade`),
  KEY `SUIVRE_MALADE0_FK` (`num_malade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`num_medecin`, `num_malade`) VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 7),
(3, 3),
(4, 4),
(4, 6);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `interner`
--
ALTER TABLE `interner`
  ADD CONSTRAINT `INTERNER_DEPARTEMENT_FK` FOREIGN KEY (`numdepartement`) REFERENCES `departement` (`numdepartement`),
  ADD CONSTRAINT `INTERNER_MALADE0_FK` FOREIGN KEY (`num_malade`) REFERENCES `malade` (`num_malade`);

--
-- Contraintes pour la table `lit`
--
ALTER TABLE `lit`
  ADD CONSTRAINT `LIT_CHAMBRE_FK` FOREIGN KEY (`num_chambre`) REFERENCES `chambre` (`num_chambre`);

--
-- Contraintes pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD CONSTRAINT `MEDECIN_DEPARTEMENT_FK` FOREIGN KEY (`numdepartement`) REFERENCES `departement` (`numdepartement`);

--
-- Contraintes pour la table `occuper`
--
ALTER TABLE `occuper`
  ADD CONSTRAINT `OCCUPER_LIT_FK` FOREIGN KEY (`num_lit`) REFERENCES `lit` (`num_lit`),
  ADD CONSTRAINT `OCCUPER_MALADE0_FK` FOREIGN KEY (`num_malade`) REFERENCES `malade` (`num_malade`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `SUIVRE_MALADE0_FK` FOREIGN KEY (`num_malade`) REFERENCES `malade` (`num_malade`),
  ADD CONSTRAINT `SUIVRE_MEDECIN_FK` FOREIGN KEY (`num_medecin`) REFERENCES `medecin` (`num_medecin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
