-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 14 mai 2022 à 12:47
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ds_commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(5, 'Guitares', 'guitares'),
(6, 'Pianos et Claviers', 'pianos'),
(7, 'Amplis et effets', 'amplis-et-effets'),
(8, 'Batteries', 'batteries'),
(10, 'Accessoires', 'accessoires'),
(12, 'Micros', 'micros'),
(13, 'casques', 'casques'),
(14, 'Cables', 'cables'),
(15, 'Enregistrements', 'enregistrements');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `note` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `product_id`, `note`, `content`, `full_name`, `posted_at`) VALUES
(3, 7, 10, 4, 'Superbe article !', 'Archibald Auduget', '2022-05-08 16:40:38'),
(4, 22, 10, 1, 'Mécanisme de mauvaise qualité, n\'achetez pas !!', 'Archi Auduget', '2022-05-08 16:44:40'),
(5, 22, 11, 5, 'Magnifique guitare, j\'adore', 'Archi Auduget', '2022-05-08 17:04:47'),
(6, 13, 10, 5, 'une qualité absolument incroyable !', 'Archibald Auduget', '2022-05-08 17:38:42'),
(7, 7, 11, 4, 'c\'est vraiment une super guitare', 'Archibald Auduget', '2022-05-08 20:59:54');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220323045201', '2022-03-23 05:52:09', 31),
('DoctrineMigrations\\Version20220323050250', '2022-03-23 06:02:59', 31),
('DoctrineMigrations\\Version20220323095340', '2022-03-23 10:53:46', 31),
('DoctrineMigrations\\Version20220323114651', '2022-03-23 12:46:55', 31),
('DoctrineMigrations\\Version20220323120720', '2022-03-23 13:07:23', 28),
('DoctrineMigrations\\Version20220330084752', '2022-03-30 10:48:01', 50),
('DoctrineMigrations\\Version20220330132322', '2022-03-30 15:23:27', 81),
('DoctrineMigrations\\Version20220418105904', '2022-04-18 12:59:12', 47),
('DoctrineMigrations\\Version20220418110015', '2022-04-18 13:00:19', 84),
('DoctrineMigrations\\Version20220418114611', '2022-04-18 13:46:18', 29),
('DoctrineMigrations\\Version20220420080232', '2022-04-20 10:02:38', 42),
('DoctrineMigrations\\Version20220503150050', '2022-05-03 17:01:19', 87),
('DoctrineMigrations\\Version20220503152340', '2022-05-03 17:23:45', 32),
('DoctrineMigrations\\Version20220503192111', '2022-05-03 21:21:17', 163),
('DoctrineMigrations\\Version20220503194705', '2022-05-03 21:47:11', 31),
('DoctrineMigrations\\Version20220503200134', '2022-05-03 22:01:47', 33),
('DoctrineMigrations\\Version20220503200934', '2022-05-03 22:09:41', 89),
('DoctrineMigrations\\Version20220503201141', '2022-05-03 22:11:46', 59),
('DoctrineMigrations\\Version20220508133448', '2022-05-08 15:35:01', 155),
('DoctrineMigrations\\Version20220508133538', '2022-05-08 15:35:43', 31),
('DoctrineMigrations\\Version20220508143722', '2022-05-08 16:40:05', 48),
('DoctrineMigrations\\Version20220510050211', '2022-05-10 07:02:17', 78),
('DoctrineMigrations\\Version20220510220229', '2022-05-11 00:02:37', 99);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `n_sell` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `slug`, `price`, `picture`, `short_description`, `in_stock`, `n_sell`) VALUES
(4, 'Eagletone Cubase LE 11', 'eagletone-cubase-le-11', 3299, 'eagletone-tiny-key-cubase-625fc2af42282126433188.jpg', 'Cubase LE est une version petite version qui utilise les mêmes technologies que Cubase Pro. Il fournit tous les outils de base pour enregistrer, éditer et mixer de la musique, de l\'idée initiale à l\'œuvre finale. Cubase LE est parfait pour entrer dans le monde de la production musicale assistée par ordinateur. Performant et facile d\'utilisation.', 1, 5),
(5, 'Alesis VI25', 'alesis-vi25', 13599, 'alesis-v125-625fc3d3aa294606749453.jpg', 'Conçus pour exploiter au maximum les logiciels de production musicale d\'aujourd\'hui, les claviers de la série VI sont la parfaite combinaison d\'un clavier, de Pads rétroéclairés, de potentiomètres et de boutons, tous assignables. Que ce soit pour le contrôle de votre ordinateur en USB ou la gestion de modules de son externe en MIDI, le claviers maîtres VI 25 d\'ALESIS vous permettront à l\'aide du logiciel d\'édition fourni d\'optimiser vos performances en toutes circonstances.\r\n\r\nCaractéristiques :\r\n- 25 touches de piano sensibles à la vélocité\r\n- Clavier semi-lesté avec aftertouch\r\n- Molettes de Pitch Bend et Modulation\r\n- 16 pads avec multicolore à LED\r\n- 8 contrôleurs\r\n- 24 boutons\r\n- Boutons pour transport et sélection de preset\r\n- Entrée pour pédale de sustain\r\n- USB MIDI\r\n- Sortie MIDI\r\n- Générateur d\'horloge interne pour Sync, Tempo, Rolls, etc.\r\n- Inclus : Câble USB, locigiels (téléchargements) \"Ableton Live Lite\" et \"xpand!2 by air music tech\"', 1, 9),
(6, 'M-AUDIO HAMMER 88 PRO', 'm-audio-hammer-88-pro', 61999, 'm-audio-hammer-88-pro-625fc471622e6805013795.jpg', 'Le Hammer 88 Pro est un clavier-maître au format 88 touches conçu pour les musiciens de tous horizons, du pianiste chevronné au producteur à l\'aise avec la MAO. Avec son clavier présentant un toucher lourd Graded Hammer Action, assurant un lestage progressif des notes comme sur un véritable piano classique, combiné des pads rétroéclairés sensibles à la vélocité et à de nombreux contrôles physiques pour piloter DAWs et instruments virtuels, le Hammer 88 Pro est tout naturellement le futur standard en matière de clavier maître de 88 touches.\r\n\r\nLogiciels inclus :\r\n\r\n- Ableton Live Lite\r\n- Mini Grand, Velvet, Hybrid 3, Touch Loops\r\n- MPC Beats : 3 instruments virtuels - TubeSynth, Electric, Bassline, 80 plugins d\'effets, 2 Go de contenu usine avec une librairie bonus F9 instruments\r\n\r\nCaractéristiques:\r\n\r\n- Clavier de 88 touches Graded Hammer Action (toucher lourd à lestage progressif) avec aftertouch et zones programmables.\r\n- 16 pads programmables rétroéclairés RVB sensibles à la vélocité, avec Note Repeat\r\n- 8 potentiomètres et boutons programmables\r\n- 9 faders programmables\r\n- Boutons DAW et Preset : pilotage des DAW auto-mappés et des paramètres de plugins\r\n- Mode Smart Chord pour jouer des voix enharmoniques ou des accords personnalisés\r\n- Mode Smart Scale éliminant les fausses notes\r\n- Arpégiateur avec contrôles Type, Octave, Gate et Swing\r\n- Molettes de pitch et de modulation ergonomiques, 3 entrées pour footswitch et une entrée pour pédale d’expression\r\n- Connexion USB-Midi, entrées et sorties MIDI 5 broches\r\n- Interface intuitive et écran OLED pour une édition rapide des paramètres.\r\n- Alimentation: via USB ou en option 9V DC, bloc d\'alimentation 800mA (non inclus)\r\n- Dimensions : 1422 x 283 x 127 mm\r\n- Poids: 18,5 kg', 1, 3),
(7, 'KURZWEIL M-230 SR', 'kurzweil-m-230-sr', 99999, '2kurzweil-m-230-sr-625fc518a5c9b929314843.jpg', 'Piano numérique de la série M2 avec 88 touches, clavier à marteau gradué entièrement pondéré avec sensibilité au toucher réglable. Profitez d\'une large gamme de sélections de sons prédéfinis, avec des pianos, des pianos électriques, des orgues et des instruments d\'orchestre. Patterns rythmiques pré-enregistrés dans une variété de styles pour jouer avec.\r\n\r\nCaractéristiques\r\n- 88 touches à marteaux\r\n- Accompagnements automatiques: Oui\r\n- Système d’apprentissage: Oui\r\n- Puissance des haut-parleurs: 40 W\r\n- Nombre de sons: 30\r\n- Entrées: Line Jack 3,5 mm TRS, Mic Jack 6,3 mm TS, 2x RCA\r\n- Sorties: 2x Headphone Jack 6,3 mm TRS , Unbalanced RCA\r\n- Polyphonie: 128\r\n- USB to host: Oui\r\n- USB to device: Non\r\n- USB midi: Oui\r\n- Inclus : Banquette finition palissandre\r\n- Dimensions: 1384 x 415 x 837 mm\r\n- Poids: 51 kg\r\n- Couleur: Palissandre foncé', 1, 26),
(8, 'KORG C1 AIR BK', 'korg-c1-air-bk', 91599, 'korg-c1-air-625fc667aa854626565391.jpg', 'Le C1 Air est un piano numérique réellement exceptionnel. Grâce au savoir-faire unique de KORG dans la conception d\'instruments de musique et sa parfaite maîtrise de la technologie audio, le C1 Air offre des niveaux de jouabilité et de polyvalence qui dépassent les attentes du pianiste le plus exigeant.\r\n\r\nUne variété de fonctionnalités : 30 sons d\'instruments superbement réalistes, la diffusion audio Bluetooth et l\'enregistrement intégré, développeront la créativité à un niveau supérieur pour les joueurs de tous niveaux augmentant de manière significative leur plaisir musical. Conçu et fabriqué au Japon, le KORG C1 Air redéfinit le piano numérique.\r\n\r\nCaractéristiques :\r\n- Clavier : Clavier 88 touches (A0–C8), RH3 (Real Weighted Hammer Action 3)\r\n- Sélection de la coube de toucher : Cinq types\r\n- Accordage : Transposition, Accord général\r\n- Tempérament Trois types\r\n- Génération de sons : PCM stéréo\r\n- Polyphonie maximale : 120 voix (max)\r\n- Sons : 30 sons (10 x 3 banques)\r\n- Effets : Brillance, réverbération et Chorus (3 niveaux pour chaque effet)\r\n- Recorder : 2 parts, Maximum 14,000 notes (approx. 100k bytes)\r\n- Titres de démonstration : 50 (Titres de démonstration des sons : 10, Piano songs: 40)\r\n- Métronome : Tempo, battement, son, niveau\r\n- Pédales : Soutien, douce, Sostenuto\r\n- Connexions : Sortie ligne, MIDI (IN, OUT), Casques x 2, pédale, haut-parleurs, DC 24V\r\n- Contrôles : Alimentation, VOLUME, PIANO SONG, TRANSPOSE, FUNCTION, TOUCH, BRILLIANCE, REVERB, CHORUS, BANK, SOUNDS X 10, DISPLAY, +, -, METRONOME, PLAY/PAUSE, STOP, REC, PART1, PART2\r\n- Technologie sans fil : Bluetooth (A2DP Sink)\r\n- Haut-parleurs : 10 cm (3.94\") x 2\r\n- Puissance de sortie : 25 W x 2\r\n- Alimentation secteur : DC 24 V inclus\r\n- Consommation électrique : 18 W\r\n- Coloris disponibles : Noir (C1Air-BK), Blanc (C1Air-WH), Brun (C1Air-BR, finition bois), White Ash (C1 Air-WA, finition bois)\r\n- Dimensions (L x l x P) : 1,346 mm x 347 mm x 770 mm\r\n- Poids : 35 kg', 1, 3),
(9, 'WOODBRASS KBE-20', 'woodbrass-kbe-20', 1999, 'woodbrass-kbe20-625fc78b58248705487636.jpg', 'Caractéristiques :\r\n- Banquette clavier ajustable\r\n- Modèle en X\r\n- Revêtement en simili-cuir\r\n- Assise rembourrée\r\n- 3 hauteurs de réglage : 42, 45 ou 48 cm\r\n- Dimensions de l\'assise : 40 x 30 cm\r\n- Poids: 3,5 kg\r\n- Finition : Noir', 1, 1),
(10, 'EAGLETONE MM100', 'eagletone-mm100', 1999, 'eagletone-mm100-625fc80220d48025314021.jpg', 'Caractéristiques :\r\n\r\n- Mécanisme en métal de qualité supérieure\r\n- Indication des mesures courantes\r\n- 40 – 208 BPM\r\n- Tolérance ‹1%\r\n- Alimentation : Mécanisme à remontoir (pas de pile nécessaire)\r\n- Dimensions : 204 x 104 x 119 mm\r\n- Poids : 650 g', 1, 25),
(11, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 'fender-player-stratocaster-pf-fiesta-red', 78999, 'fmic-0144503540-625fc890285e0326314868.jpg', 'Le son inspirant d\'une Stratocaster, voilà l\'un des piliers de Fender. La Player Stratocaster délivre ce son classique avec des aigus cristallins, des médiums dynamiques et des graves puissants, sans oublier sa précision parfaite, le tout avec le style et l\'esprit authentiques de Fender.\r\n\r\n\r\nCette guitare est assez polyvalente pour s\'intégrer à n\'importe quel style. Elle incarnera parfaitement votre vision musicale et vous aidera à créer votre signature sonore. \r\n\r\n\r\nCorps : Aulne\r\nFinition du corps : Polyester brillant\r\nForme du corps : Stratocaster\r\nBoutons : Parchemin Plastique\r\nTouche : Erable\r\nAccastillage: Nickel/Chrome\r\nPickguard : Parchemin 3 plis\r\nIncrustations : Point Noir\r\nFinition du manche: Finition uréthane satinée à l\'arrière, Finition uréthane brillante à l\'avant\r\nMicro manche : Player Series Alnico 5 Strat Single-Coil\r\nOrientation : Droitier\r\nConfiguration : SSS\r\nSillet : Os synthétique\r\nClé Truss rod : 3/16\" Hex (Allen)\r\nMicro chevalet : Player Series Alnico 5 Strat Single-Coil\r\nMicro central : Player Series Alnico 5 Strat Single-Coil\r\nSélecteur 5 positions : Position 1. Micro chevalet, Position 2. Micro chevalet et milieu, Position 3. Micro central, Position 4. Micro milieu et manche, Position 5. Micro manche\r\nConfiguration des micros : SSS Chevalet : Tremolo synchronisé 2 points avec pontets en acier courbé\r\nMécaniques : Standard à bain d\'huile\r\nCordes : Fender USA 250L en acier nickelé (jauges .009-.042), PN 0730250403\r\nRadius : 9,5\" (241 mm) Moderne\r\nFrettes : Medium Jumbo\r\nMatière du manche : Erable\r\nMatière du manche : Érable\r\nProfil du manche : Moderne \"C\"\r\nFrettes : 22\r\nLargeur de l\'écrou : 1.650\" (42 mm)\r\nDiapason: 25,5\" (648 mm)\r\nTruss rod : Standard\r\nClef de truss rod : ajustement hexagonal de 3/16 po\r\nContrôles : Master Volume, Tone 1. (Micros manche/milieu), Tone 2. (Micro chevalet)', 1, 32),
(12, 'EAGLETONE SOUTH STATE DC100 CHERRY', 'eagletone-south-state-dc100-cherry', 19999, 'eagletone-south-state-dc100-cherry-625fc8dc47154940774434.jpg', 'Le look de la South State DC100 est chargé de l\'histoire de la musique moderne, Angus Young (AC/DC), Eric Clapton, Robby Krieger (The Doors) entre autres... Au delà de l\'aspect esthétique, c\'est la configuration chevalet tune o matic et micros double bobinage qui plaît tant aux guitaristes blues et aux rockeurs pour sa polyvalence et ses attaques féroces.\r\nLook emblématique, fabrication et finitions soignées, la South State DC100 est idéale pour faire ses premiers pas dans le rock.\r\n\r\nCaractéristiques techniques :\r\n\r\n- Corps : Tilleul, Double cutaway\r\n- Manche : Vissé, Nato\r\n- Touche: Palissandre\r\n- Diapason : 628 mm (24.75\")\r\n- Frettes : 22 Medium Jumbo\r\n- Chevalet : Tune o matic\r\n- Mécaniques : Type Kluson\r\n- Accastillage : Chrome\r\n- Micros : 2 double bobinage\r\n- Plaque de protection : Noire\r\n- Contrôles : 2 Volumes, 2 Tonalités\r\n- Sélecteur : 3 positions\r\n- Finition : Cherry', 1, 2),
(13, 'BIRD INSTRUMENTS DG1 NATURELLE', 'bird-instruments-dg1-naturelle', 8499, 'bird-dg1-nl-625fc943536bc985059292.jpg', 'Caractéristiques :\r\n\r\n- Modèle : Dreadnought\r\n- Table : Epicéa\r\n- Dos et éclisses : Acajou\r\n- Touche et chevalet : Palissandre\r\n- Plaque de protection : Noire\r\n- Filets de table, de dos et de manche\r\n- Mécaniques : Bain d\'huile\r\n- Cordes : Américaines\r\n- Finition : Naturel brillant', 1, 16),
(14, 'TOBAGO ETUI SOFTCASE ESF/N', 'tobago-etui-softcase-esf-n', 7999, 'tobago-hto-esf-n-b-625fc9c5ea951608216394.jpg', 'Excellent compromis entre la housse et l\'étui, le softcase soulage votre dos tout en assurant une protection optimale de votre instrument préféré.\r\n\r\nPolyester 600 deniers de haute qualité. Intérieur en polyester haute densité avec doublure en velours noir. Compartiment intérieur pour accessoires. Bretelles réglables amovibles. Couleur noire.', 0, 1),
(15, 'ELIXIR 16052 NANOWEB ACOUSTIQUE 12-53', 'elixir-16052-nanoweb-acoustique-12-53', 1499, 'elixir-16052-625fca47df988709920837.jpg', 'Les cordes Elixir ont un revêtement unique en Goretex qui leur donne une durée de vie 4 à 5 fois plus longue. Touchez, comparez et vous constaterez qu\'elles sonnent ! Elixir a été le premier à faire des cordes à revêtement.', 1, 6),
(16, 'ROLAND TD-07DMK', 'roland-td-07dmk', 74999, 'roland-td-07dmk-625fcb255ec95795606708.jpg', 'Batterie électronique abordable et compacte avec expression et des fonctions héritées des V-Drums plus avancés.\r\nCompacte et d\'un prix abordable, mais dotée d\'un son, d\'un toucher et de fonctions professionnels pour vous faire progresser rapidement, la TD-07DMK est le point d\'entrée de la série V-Drums.\r\n\r\nBien que les pads soient plus petits que ceux des kits de la gamme supérieure, vous apprécierez la sensation satisfaisante que procurent la caisse claire PDX-8 et des trois toms PDX-6A, tous dotés des peaux ultra-silencieuses Roland à mailles doubles. Les cymbales compactes CY-5 (crash et ride) vous permettent de jouer avec expression dans les espaces restreints, tandis qu\'un kick pad monté sur pied s\'associe à l\'encombrement le plus réduit de la gamme TD-07 pour former un kit parfait pour la maison. Malgré sa taille compacte, vous pouvez toujours voir grand grâce à des fonctions créatives qui vont au-delà de tout kit acoustique. Notamment des kits de batteries authentiques couvrant un éventail de types et de genres, ainsi qu\'un système d\'édition de sonorités approfondi qui vous permet d\'obtenir des résultats très précis pour créer le kit parfait. Le mode Coach intégré pour vous aider à apprendre, la connectivité Bluetooth pour vous permettre de jouer avec de la musique diffusée depuis votre téléphone, tablette ou ordinateur, plus un port USB pour vous connecter à un logiciel d\'enregistrement sur ordinateur.\r\n\r\n● Module TD-07 avec 25 kits prédéfinis, 25 kits utilisateur et 143 instruments.\r\n● V-Edit, EQ, ambiance, et 30 multi-effets offrent des outils d\'édition approfondis pour créer vos sons de kit de batterie parfaits.\r\n● Des pads de caisse claire et de tom avec les légendaires peaux en maille à double épaisseur et à tension réglable de Roland.\r\n● Un pad de caisse claire PDX-8 de 8 pouces avec des zones de frappe et de bord indépendantes pour assigner des sons différents et trois pads de tom à zone unique PDX-6A de 6,5 pouces.\r\n● Le kick pad KD-2 se fixe directement sur le stand de batterie.\r\n● CY-5 Cymbales crash et ride de 10 pouces avec fonction d\'étouffement.\r\n● Cymbales charleston CY-5 de 10 pouces et pédale intégrée, avec un contrôle incrémental fin entre les\r\npositions ouverte et fermée.\r\n● stand de batterie à quatre pieds avec une construction métallique et des pinces robustes à forte adhérence.\r\n● Le Bluetooth intégré vous permet de diffuser sans fil du son à partir de smartphones, de tablettes et autres appareils Bluetooth et d\'envoyer des données MIDI à des applications musicales.\r\n● Métronome intégré avancé avec la possibilité de régler la signature temporelle, la valeur de la note et la tonalité du clic.\r\n● La fonction coach embarquée offre des outils interactifs pour développer les compétences en matière de timing et suivre les progrès.\r\n● USB pour l\'enregistrement de données audio et MIDI vers des logiciels de musique sur ordinateur.\r\n● Prise en charge de l\'extension du kit avec une deuxième cymbale crash (CY-8 V-Cymbal et MDY-Standard\r\nbras de cymbale vendus séparément).', 1, 21),
(17, 'EAGLETONE BARROW 40W', 'eagletone-barrow-40w', 13599, 'eagletone-barrow-40w-625fcb9dd1cc4008027013.jpg', 'Caractéristiques :\r\n\r\n- Puissance max : 40W RMS @ 4Ω\r\n- Haut-parleur : 25,4 cm (10\\\") + tweeter coaxial\r\n- Entrées instrument (jack) et microphone (XLR symétrique), avec réglages de volume indépendants\r\n- Sélecteur mode actif/passif\r\n- EQ 3-bandes : graves, médiums semi-paramétrique, aigus\r\n- Réglage de réverbération\r\n- Sortie casque d\\\'écoute\r\n- Entrée jack stéréo pour lecteur CD/MP3\r\n- Réponse en fréquences : 70 Hz - 15 kHz\r\n- Distorsion harmonique : 0,2 %\r\n- Rapport Signal / Bruit : - 68dB\r\n- Impédance d’entrée : 180 kΩ\r\n- Consommation : 80W\r\n- Niveau d’entrée max : 65 mV (RMS)\r\n- Gain max : 45dB (@ 1kHz)\r\n- Dimensions : 400 x 430 x 225 mm\r\n- Poids : 11 kg', 1, 3),
(18, 'SHURE SM58', 'shure-sm58', 9999, '4shure-sm58-lce-625fcc4e5e86a549982574.jpg', 'Choix n°1 des musiciens dans le monde, le SM58 est le micro chant le plus polyvalent et le plus fiable de sa catégorie. On le retrouve sur toutes les scènes, dans toutes les écoles, dans tous les studios de la planète. Propulsé au rang d\'icône par d\'innombrables artistes au fil des années, le célèbre micro de la marque Shure vient de fêter son jubilé en 2016. 50 ans, et pas une ride ! Bénéficiant de la qualité de fabrication légendaire Shure, le SM58 est devenue une véritable référence. Les nombreuses vidéos de tests dans les conditions les plus extrêmes en sont la preuve : vous avez ici un micro qui s\'adapte à tous les environnements et à toutes les situations.\r\n\r\nCaractéristiques :\r\n\r\n- Directivité: Cardioïde\r\n- Réponse en fréquence optimisée pour la voix avec mediums présents et coupe bas\r\n- Source sonore isolée et réduction des bruits de fond\r\n- Absorbeur de chocs pneumatique contre les bruits d\'impact et de manipulation\r\n- Filtre anti-pop intégré\r\n- Réponse en fréquence: 50 - 15.000 Hz\r\n- Impédance: 300 Ohm\r\n- Sensibilité: -54,5 dBV/Pa (1,85 mV)\r\n- SPL max.: 94 dB\r\n- Inclus: Pince, adaptateur de réduction de pas de vis 3/8\" et trousse\r\n- Version sans interrupteur marche/arrêt\r\n- Dimensions: 23 x 162 x 51 mm\r\n- Poids: 298 g', 1, 3),
(19, 'EAGLETONE RS02', 'eagletone-rs02', 3999, 'eagletone-rs02-ecran-acoustique-studio-625fccb3d03c5527397568.jpg', 'Caractéristiques :\r\n- Ecran acoustique isolant offrant des conditions optimales de prise de son pour l\'enregistrement de la voix ou des instruments tels que saxophone, trompette, clarinette, harmonica...\r\n- Reproduit des conditions idéales d\'enregistrement même dans une pièce ayant une mauvaise acoustique\r\n- Très utile pour isoler les sources dans des conditions \"live\"\r\n- Concentre et confine la source à enregistrer\r\n- Isole le micro des réflexions indésirables\r\n- Optimise le niveau de pression acoustique exercé sur le micro\r\n- Permet d\'obtenir un son naturel non coloré par les réflexions, facilite le traitement du son lors du mixage.\r\n- Ecran en mousse acoustique, extérieur en ABS\r\n- Se fixe sur pied de micro avec collier intégré\r\n- Livré en kit avec visserie, montage simple et rapide\r\n- Dimensions : 48 x 29 x 29 cm\r\n- Couleur : Noir', 1, 0),
(20, 'FOCAL LISTEN PRO', 'focal-listen-pro', 19999, '2focal-listen-pro-625fccff7f438453342351.jpg', 'Son équilibre tonal et sa capacité à retranscrire avec précision l’ensemble du spectre audio en font un véritable allié pour vérifier la qualité de transfert du travail réalisé. De plus, son confort et ses accessoires le rendent extrêmement attrayant pour les professionnels en déplacement. Ce casque surprend par sa qualité sonore et sa dynamique, généralement rencontrées sur des niveaux de prix supérieurs.\r\n\r\nCaractéristiques :\r\n- Type: Fermé\r\n- Circum-aural\r\n- Technologie de conversion pour la transparence acoustique et la dynamique\r\n- Impédance: 32 Ohms\r\n- Sensibilité (@ 1 kHz - / 1 Vrms): 122 dB SPL\r\n- THD (THD, @ 1 kHz / 100 dB SPL): 0,3%\r\n- Réponse en fréquence: 5 Hz à 22 kHz\r\n- Connexion: mini-jack 3,5 mm avec 4 contacts\r\n- Inclus: Câble en spirale (5 m) et câble droit (1,4 m)\r\n- Dimensions: 239 x 212 x 111 mm\r\n- Poids: 280 g', 1, 1),
(21, 'BIRD INSTRUMENTS MC23 - XLR / XLR - 10M', 'bird-instruments-mc23-xlr-xlr-10m', 999, 'bird-mc23-625fcd3c4455d754503636.jpg', 'La gamme des câbles Bird propose un large choix de connecteurs et de combinaisons, adaptés aux besoins des musiciens, des ingénieurs du son et des audiophiles. Câbles pour instruments, pour haut-parleurs, liaisons audio symétriques et asymétriques, convertisseurs et prolongateurs sont disponibles dans de multiples longueurs pour s\'adapter au mieux à vos impératifs de connexion. Pour faciliter leur rangement et augmenter leur durée de vie, les câbles Bird sont tous livrés avec un serre-câble en velcro, ingénieux et très utile au quotidien.\r\n\r\nCâble micro Bird MC23 XLR - XLR, longueur 10 mètres.\r\n\r\nCaractéristiques techniques :\r\n\r\n- Câble micro symétrique 10 mètres\r\n- Connecteurs XLR 3 broches en métal avec verrouillage du câble\r\n- Câble symétrique 2 conducteurs + 1 masse\r\n- Cuivre désoxygéné\r\n- Gaine noire diamètre extérieur 6 mm', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `product_category`
--

CREATE TABLE `product_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(4, 6),
(4, 15),
(5, 6),
(5, 15),
(6, 6),
(6, 15),
(7, 6),
(8, 6),
(9, 6),
(9, 10),
(10, 5),
(10, 6),
(10, 8),
(10, 10),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(14, 10),
(15, 5),
(15, 10),
(16, 8),
(17, 5),
(17, 7),
(18, 12),
(19, 10),
(19, 12),
(20, 13),
(21, 12),
(21, 14);

-- --------------------------------------------------------

--
-- Structure de la table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `purchased_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchase`
--

INSERT INTO `purchase` (`id`, `user_id`, `full_name`, `address`, `postal_code`, `city`, `total`, `status`, `carrier`, `sent`, `purchased_at`) VALUES
(1, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 234, 'PENDING', 'Chronopost', 0, '2022-05-03 23:27:17'),
(2, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 38, 'PENDING', 'Chronopost', 0, '2022-05-03 23:48:42'),
(3, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 119, 'PENDING', 'Chronopost', 0, '2022-05-03 23:52:11'),
(4, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19, 'PENDING', 'Chronopost', 0, '2022-05-04 00:07:56'),
(5, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 1539, 'PENDING', 'Chronopost', 0, '2022-05-05 02:50:38'),
(6, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19, 'PENDING', 'Chronopost', 0, '2022-05-05 15:09:24'),
(7, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19, 'PENDING', 'Chronopost', 0, '2022-05-05 15:17:26'),
(8, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19, 'PENDING', 'Chronopost', 0, '2022-05-05 15:17:58'),
(9, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 13599, 'PENDING', 'Chronopost', 0, '2022-05-05 15:20:27'),
(10, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 13599, 'PENDING', 'Chronopost', 0, '2022-05-05 16:03:31'),
(11, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 99999, 'PENDING', 'Chronopost', 0, '2022-05-05 16:09:51'),
(12, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 99999, 'PENDING', 'Chronopost', 0, '2022-05-05 16:14:17'),
(13, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 99999, 'PAID', 'Chronopost', 0, '2022-05-05 16:46:21'),
(14, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 1999, 'PAID', 'Chronopost', 0, '2022-05-05 17:00:19'),
(15, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 3299, 'PAID', 'Chronopost', 0, '2022-05-05 17:06:49'),
(16, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19999, 'PAID', 'Chronopost', 0, '2022-05-05 17:18:56'),
(17, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 78999, 'PAID', 'Chronopost', 0, '2022-05-05 17:19:45'),
(18, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19999, 'PAID', 'Chronopost', 0, '2022-05-05 17:23:16'),
(19, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 78999, 'PENDING', 'Chronopost', 0, '2022-05-05 17:29:10'),
(20, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 87498, 'PAID', 'Chronopost', 0, '2022-05-05 22:19:28'),
(21, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 13599, 'PAID', 'Chronopost', 0, '2022-05-05 22:23:39'),
(22, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 1499, 'PAID', 'Chronopost', 0, '2022-05-05 22:29:08'),
(23, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 999, 'PAID', 'Chronopost', 0, '2022-05-05 23:14:54'),
(24, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 1999, 'PAID', 'Chronopost', 0, '2022-05-05 23:16:48'),
(25, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 13599, 'PAID', 'Chronopost', 0, '2022-05-05 23:32:38'),
(26, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 61999, 'PAID', 'Chronopost', 0, '2022-05-05 23:33:20'),
(27, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 61999, 'PAID', 'Chronopost', 0, '2022-05-05 23:34:10'),
(28, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 114193, 'PAID', 'Chronopost', 0, '2022-05-06 15:55:17'),
(29, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MEAUX', 246996, 'PENDING', 'Chronopost', 0, '2022-05-06 19:52:10'),
(30, 22, 'Archi Auduget', '21c rue victor hugo', '77100', 'MEAUX', 246996, 'PAID', 'Chronopost', 0, '2022-05-06 20:03:45'),
(31, 13, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 1999, 'PAID', 'Chronopost', 0, '2022-05-08 17:36:34'),
(32, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 65298, 'PAID', 'Chronopost', 0, '2022-05-08 20:58:52'),
(33, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 19999, 'PAID', 'Chronopost', 0, '2022-05-13 17:53:04'),
(34, 28, 'Archibald Archi.Audu77100', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 999, 'PENDING', 'Chronopost', 0, '2022-05-14 02:39:40'),
(35, 28, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 999, 'PAID', 'Chronopost', 0, '2022-05-14 02:39:54'),
(36, 7, 'Archibald Auduget', '21c rue victor hugo', '77100', 'MAREUIL LES MEAUX', 3299, 'PAID', 'Chronopost', 0, '2022-05-14 03:31:44');

-- --------------------------------------------------------

--
-- Structure de la table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchase_item`
--

INSERT INTO `purchase_item` (`id`, `product_id`, `purchase_id`, `product_name`, `product_price`, `quantity`, `total`) VALUES
(1, 17, 1, '135.99', 135, 1, 135),
(2, 18, 1, '99.99', 99, 1, 99),
(3, 10, 2, '19.99', 19, 1, 19),
(4, 21, 2, '9.99', 9, 2, 19),
(5, 10, 3, '19.99', 19, 4, 79),
(6, 21, 3, '9.99', 9, 4, 39),
(7, 10, 4, '19.99', 19, 1, 19),
(8, 11, 5, '789.99', 789, 1, 789),
(9, 16, 5, '749.99', 749, 1, 749),
(10, 9, 6, 'WOODBRASS KBE-20', 19, 1, 19),
(11, 9, 7, 'WOODBRASS KBE-20', 19, 1, 19),
(12, 9, 8, 'WOODBRASS KBE-20', 19, 1, 19),
(13, 17, 9, 'EAGLETONE BARROW 40W', 13599, 1, 13599),
(14, 17, 10, 'EAGLETONE BARROW 40W', 13599, 1, 13599),
(15, 7, 11, 'KURZWEIL M-230 SR', 99999, 1, 99999),
(16, 7, 12, 'KURZWEIL M-230 SR', 99999, 1, 99999),
(17, 7, 13, 'KURZWEIL M-230 SR', 99999, 1, 99999),
(18, 10, 14, 'EAGLETONE MM100', 1999, 1, 1999),
(19, 4, 15, 'Eagletone Cubase LE 11', 3299, 1, 3299),
(20, 20, 16, 'FOCAL LISTEN PRO', 19999, 1, 19999),
(21, 11, 17, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 78999, 1, 78999),
(22, 20, 18, 'FOCAL LISTEN PRO', 19999, 1, 19999),
(23, 11, 19, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 78999, 1, 78999),
(24, 11, 20, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 78999, 1, 78999),
(25, 13, 20, 'BIRD INSTRUMENTS DG1 NATURELLE', 8499, 1, 8499),
(26, 5, 21, 'Alesis VI25', 13599, 1, 13599),
(27, 15, 22, 'ELIXIR 16052 NANOWEB ACOUSTIQUE 12-53', 1499, 1, 1499),
(28, 21, 23, 'BIRD INSTRUMENTS MC23 - XLR / XLR - 10M', 999, 1, 999),
(29, 10, 24, 'EAGLETONE MM100', 1999, 1, 1999),
(30, 5, 25, 'Alesis VI25', 13599, 1, 13599),
(31, 6, 26, 'M-AUDIO HAMMER 88 PRO', 61999, 1, 61999),
(32, 6, 27, 'M-AUDIO HAMMER 88 PRO', 61999, 1, 61999),
(33, 5, 28, 'Alesis VI25', 13599, 2, 27198),
(34, 10, 28, 'EAGLETONE MM100', 1999, 4, 7996),
(35, 11, 28, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 78999, 1, 78999),
(36, 11, 29, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 78999, 3, 236997),
(37, 18, 29, 'SHURE SM58', 9999, 1, 9999),
(38, 11, 30, 'FENDER PLAYER STRATOCASTER PF FIESTA RED', 78999, 3, 236997),
(39, 18, 30, 'SHURE SM58', 9999, 1, 9999),
(40, 10, 31, 'EAGLETONE MM100', 1999, 1, 1999),
(41, 4, 32, 'Eagletone Cubase LE 11', 3299, 1, 3299),
(42, 6, 32, 'M-AUDIO HAMMER 88 PRO', 61999, 1, 61999),
(43, 20, 33, 'FOCAL LISTEN PRO', 19999, 1, 19999),
(44, 21, 34, 'BIRD INSTRUMENTS MC23 - XLR / XLR - 10M', 999, 1, 999),
(45, 21, 35, 'BIRD INSTRUMENTS MC23 - XLR / XLR - 10M', 999, 1, 999),
(46, 4, 36, 'Eagletone Cubase LE 11', 3299, 1, 3299);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `first_name`, `last_name`, `address`, `phone_number`, `country`, `postal_code`, `city`) VALUES
(7, 'archibald77100@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$ZE8f8kgJyp.rRXs5PiH8..qKl0f.RH22WQQ0XkXeuBI1x.3QdqK0i', 1, 'Archibald', 'Auduget', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX'),
(13, 'archibald77120@gmail.com', '[]', '$2y$13$FeWK.1c/sUvpfhbzo2ZY6eKFVzZSyYMpy/HSOf39FQ1BI2pYTqpFW', 1, 'Archibald', 'Auduget', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX'),
(22, 'archibald77140@gmail.com', '[]', '$2y$13$l314zWy4/upw167VBalWOu4b9yiGLTSMtAURQPlrRx4CDcbUDx/ua', 1, 'Archi', 'Auduget', '21c rue victor hugo', '661347894', 'France', 77100, 'MEAUX'),
(23, 'archibald77160@gmail.com', '[]', '$2y$13$gS70nyDJlH19gWH.m7gFYeIDud0vYy4FplW/zK6bczJYTvBmYhYAC', 0, 'Archibald', 'Auduget', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX'),
(25, 'dsmusic77101@gmail.com', '[]', '$2y$13$DcXTXj2I9.Uc00AVquKWIe30Mrv7fTVofODAr/SWowvBQ8/REhxwq', 0, 'Archibald', 'Feat', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX'),
(26, 'dsmusic77102@gmail.com', '[]', '$2y$13$0WUKUH3vIfJUDi8oE6quSOJviPOqMPB0vmDWa94Qc9vRGAfjvJ6lS', 0, 'Archibald', 'Feat', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX'),
(27, 'dsmusic77103@gmail.com', '[]', '$2y$13$q.d1.Ud9FsL/qm6avhgZjuxq8d1pB.LmNguksKV65M67BxK3Xaeze', 0, 'Archibald', 'Feat', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX'),
(28, 'dsmusic77100@gmail.com', '[]', '$2y$13$t3oRV43rVUUJdQ6siDPXZu9vgfx7/yWGIu0989lWE0X0AyJ.LMvrS', 1, 'Archibald', 'Archi.Audu77100', '21c rue victor hugo', '661347894', 'France', 77100, 'MAREUIL LES MEAUX');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526C4584665A` (`product_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `IDX_CDFC73564584665A` (`product_id`),
  ADD KEY `IDX_CDFC735612469DE2` (`category_id`);

--
-- Index pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6117D13BA76ED395` (`user_id`);

--
-- Index pour la table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6FA8ED7D4584665A` (`product_id`),
  ADD KEY `IDX_6FA8ED7D558FBEB9` (`purchase_id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `FK_CDFC735612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CDFC73564584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `FK_6117D13BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `FK_6FA8ED7D4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_6FA8ED7D558FBEB9` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
