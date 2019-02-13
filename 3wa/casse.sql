-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 09 Février 2014 à 15:59
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données: `casse`
--

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` bigint(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `sexe` varchar(2) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `nom`, `age`, `ville`, `sexe`) VALUES
(1, 'Nestor', 96, 'Paris', 'M'),
(2, 'Irma', 20, 'Lille', 'F'),
(3, 'Henri', 45, 'Paris', 'M'),
(4, 'Josette', 34, 'Lyon', 'F'),
(5, 'Jacques', 50, 'Bordeaux', 'F');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
  `date_vente` date NOT NULL,
  `prix` float NOT NULL,
  `id_voiture` bigint(11) NOT NULL,
  `id_personne` bigint(11) NOT NULL,
  KEY `dv` (`date_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vente`
--

INSERT INTO `vente` (`date_vente`, `prix`, `id_voiture`, `id_personne`) VALUES
('1985-12-03', 10000, 1, 1),
('1996-03-30', 70000, 2, 4),
('1998-06-14', 30000, 4, 1),
('2000-04-02', 45000, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE IF NOT EXISTS `voiture` (
  `id_voiture` bigint(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `couleur` varchar(100) NOT NULL,
  PRIMARY KEY (`id_voiture`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `voiture`
--

INSERT INTO `voiture` (`id_voiture`, `marque`, `type`, `couleur`) VALUES
(1, 'Peugeot', '404', 'rouge'),
(2, 'Citroen', 'SM', 'noir'),
(3, 'Renault', 'Floride', 'bleu'),
(4, 'Renault', 'Alpine', 'rose'),
(5, 'Peugeot', '403', 'blanc'),
(6, 'Opel', 'GT', 'blanc');



SELECT marque, COUNT(*) AS compte 
FROM voiture
GROUP BY marque
HAVING compte > 1



-- WHERE ==> FILTRE L'ENSEMBLE DE LA REQUETE (SELECT)
-- HAVING ==> FILTRE SUR LES REGROUPEMENTS

SELECT voiture.couleur, voiture.marque, vente.prix
FROM voiture 
INNER JOIN vente
ON voiture.id_voiture = vente.id_voiture




SELECT vo.couleur, vo.marque, ve.prix
FROM voiture as vo
INNER JOIN vente as ve
INNER JOIN personne as pe
ON vo.id_voiture = ve.id_voiture AND pe.id_personne = ve.id_personne




SELECT vo.couleur, vo.marque, ve.prix, pe.age, pe.nom
FROM voiture as vo
INNER JOIN vente as ve
INNER JOIN personne as pe
ON vo.id_voiture = ve.id_voiture AND pe.id_personne = ve.id_personne


SELECT voiture.id_voiture, vente.id_voiture, voiture.marque, 
  voiture.couleur, voiture.prix
FROM voiture
LEFT OUTER JOIN vente
ON voiture.id_voiture = vente.id_voiture



SELECT voiture.id_voiture, vente.id_voiture, voiture.marque, 
  voiture.couleur, voiture.prix
FROM vente
LEFT OUTER JOIN voiture
ON voiture.id_voiture = vente.id_voiture



UPDATE personne 
SET ville="Paris-Centre" 
WHERE ville="Paris"



SELECT nom, age, ville
FROM personne
ORDER BY ville, age
