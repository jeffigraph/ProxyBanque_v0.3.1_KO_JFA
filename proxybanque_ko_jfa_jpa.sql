-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 03 jan. 2018 à 16:38
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `proxybanque_ko_jfa_jpa`
--
CREATE DATABASE IF NOT EXISTS `proxybanque_ko_jfa_jpa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `proxybanque_ko_jfa_jpa`;

-- --------------------------------------------------------

--
-- Structure de la table `cartebancaire`
--

DROP TABLE IF EXISTS `cartebancaire`;
CREATE TABLE `cartebancaire` (
  `id_carte` bigint(20) NOT NULL,
  `numeroCarte` varchar(255) DEFAULT NULL,
  `typeCarte` varchar(255) DEFAULT NULL,
  `id_compte` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cartebancaire`
--

INSERT INTO `cartebancaire` (`id_carte`, `numeroCarte`, `typeCarte`, `id_compte`) VALUES
(1, '5654564165', 'visa electron', 1),
(2, '567842122525', 'visa premier', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id_client` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `codePostal` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `id_conseiller` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `adresse`, `codePostal`, `nom`, `prenom`, `telephone`, `ville`, `id_conseiller`) VALUES
(1, '23 rue des Canards Sauvages', 20001, 'Einstein', 'Albert', '+33012598774', 'Lille', 1),
(2, '12 rue des Anges Rouges', 45201, 'Marx', 'Karl', '+29454541', 'La Havane', 1);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE `compte` (
  `id_compte` bigint(20) NOT NULL,
  `dateOuverture` varchar(255) DEFAULT NULL,
  `numeroCompte` varchar(255) DEFAULT NULL,
  `solde` double DEFAULT NULL,
  `typeClient` varchar(255) DEFAULT NULL,
  `typeCompte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id_compte`, `dateOuverture`, `numeroCompte`, `solde`, `typeClient`, `typeCompte`) VALUES
(1, '2012-09-24', '5463454sds45445', 100.25, 'particulier', 'courant'),
(2, '2017-05-26', '32467952154', 4500.25, 'particulier', 'courant');

-- --------------------------------------------------------

--
-- Structure de la table `comptecourant`
--

DROP TABLE IF EXISTS `comptecourant`;
CREATE TABLE `comptecourant` (
  `decouvertAutorise` double NOT NULL,
  `id_compte` bigint(20) NOT NULL,
  `id_client` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comptecourant`
--

INSERT INTO `comptecourant` (`decouvertAutorise`, `id_compte`, `id_client`) VALUES
(1000, 1, 1),
(1000, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `compteepargne`
--

DROP TABLE IF EXISTS `compteepargne`;
CREATE TABLE `compteepargne` (
  `id_compte` bigint(20) NOT NULL,
  `id_client` bigint(20) DEFAULT NULL,
  `taux_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conseiller`
--

DROP TABLE IF EXISTS `conseiller`;
CREATE TABLE `conseiller` (
  `id_conseiller` bigint(20) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `typeConseiller` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conseiller`
--

INSERT INTO `conseiller` (`id_conseiller`, `login`, `nom`, `password`, `prenom`, `typeConseiller`) VALUES
(1, 'michel', 'Loiseaux', 'test', 'Michel', 'conseiller'),
(2, 'albin', 'Albin', 'test', 'Michel', 'gerant');

-- --------------------------------------------------------

--
-- Structure de la table `taux`
--

DROP TABLE IF EXISTS `taux`;
CREATE TABLE `taux` (
  `idTaux` bigint(20) NOT NULL,
  `taux` double DEFAULT NULL,
  `id_compte` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `virement`
--

DROP TABLE IF EXISTS `virement`;
CREATE TABLE `virement` (
  `idVirement` bigint(20) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `idCompteCible` varchar(255) DEFAULT NULL,
  `idCompteDepart` varchar(255) DEFAULT NULL,
  `montant` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cartebancaire`
--
ALTER TABLE `cartebancaire`
  ADD PRIMARY KEY (`id_carte`),
  ADD KEY `FK_4pmgu2vad3oj1af64xgqmtwuy` (`id_compte`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `FK_1i88ccgtu18vcfildxjgtta2p` (`id_conseiller`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id_compte`);

--
-- Index pour la table `comptecourant`
--
ALTER TABLE `comptecourant`
  ADD PRIMARY KEY (`id_compte`),
  ADD KEY `FK_caj1872f7xocdelp5geadepq1` (`id_client`);

--
-- Index pour la table `compteepargne`
--
ALTER TABLE `compteepargne`
  ADD PRIMARY KEY (`id_compte`),
  ADD KEY `FK_gha6qyaxb2dimohcweejf5ec3` (`id_client`),
  ADD KEY `FK_c68h823vv1wwgw5khfxuhjxnu` (`taux_id`);

--
-- Index pour la table `conseiller`
--
ALTER TABLE `conseiller`
  ADD PRIMARY KEY (`id_conseiller`);

--
-- Index pour la table `taux`
--
ALTER TABLE `taux`
  ADD PRIMARY KEY (`idTaux`),
  ADD KEY `FK_gp3382geqske5qqbwehx53jfa` (`id_compte`);

--
-- Index pour la table `virement`
--
ALTER TABLE `virement`
  ADD PRIMARY KEY (`idVirement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cartebancaire`
--
ALTER TABLE `cartebancaire`
  MODIFY `id_carte` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id_compte` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `conseiller`
--
ALTER TABLE `conseiller`
  MODIFY `id_conseiller` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `taux`
--
ALTER TABLE `taux`
  MODIFY `idTaux` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `virement`
--
ALTER TABLE `virement`
  MODIFY `idVirement` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cartebancaire`
--
ALTER TABLE `cartebancaire`
  ADD CONSTRAINT `FK_4pmgu2vad3oj1af64xgqmtwuy` FOREIGN KEY (`id_compte`) REFERENCES `comptecourant` (`id_compte`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_1i88ccgtu18vcfildxjgtta2p` FOREIGN KEY (`id_conseiller`) REFERENCES `conseiller` (`id_conseiller`);

--
-- Contraintes pour la table `comptecourant`
--
ALTER TABLE `comptecourant`
  ADD CONSTRAINT `FK_caj1872f7xocdelp5geadepq1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `FK_tlob1f1yi95vu0t2dp1x2yqda` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`);

--
-- Contraintes pour la table `compteepargne`
--
ALTER TABLE `compteepargne`
  ADD CONSTRAINT `FK_aohyvpkmvqmos3om6afxlry2i` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`),
  ADD CONSTRAINT `FK_c68h823vv1wwgw5khfxuhjxnu` FOREIGN KEY (`taux_id`) REFERENCES `taux` (`idTaux`),
  ADD CONSTRAINT `FK_gha6qyaxb2dimohcweejf5ec3` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `taux`
--
ALTER TABLE `taux`
  ADD CONSTRAINT `FK_gp3382geqske5qqbwehx53jfa` FOREIGN KEY (`id_compte`) REFERENCES `compteepargne` (`id_compte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
