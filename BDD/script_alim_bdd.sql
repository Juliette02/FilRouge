
INSERT INTO rubrique(nom, rubrique_id, photo) VALUES 
('Guitares', NULL, '1guitares.jpeg'),
('Batteries',NULL, '2batteries.jpeg'),
('Pianos',NULL, '3piano.jpeg'),
('Instruments à vent',NULL, '4instrument_a_vent.jpeg'),
('Instruments Traditionnels', NULL, '5instrument_traditionnels.jpeg'),
('Sonorisation', NULL, '6sonorisation.jpeg'),
('Lumière',NULL, '7lumiere.jpeg'),
('Accessoires',NULL, '8accessoires.jpeg'),
('Guitares Electriques',1 , 'guitare_electrique.jpeg'),
('Guitares Classiques',1 , 'guitare_classique.jpeg'),
('Guitares de Voyage',1 , 'guitare_de_voyage.jpeg'),
('Batteries Acoustiques',2, 'batterie_accoustique.jpeg'),
('Batteries Electroniques',2, 'batterie_electroniques.jpeg'),
('Pianos Droits',3 , 'piano_droit.jpeg'),
('Pianos à Queue',3 , 'piano_a_queue.jpeg'),
('Pianos Numériques',3 , 'piano_numerique.jpeg'),
('Saxophone',4 , 'saxophone.jpeg'),
('Trompettes',4, 'trompette.jpeg'),
('Ocarinas',4, 'ocarinas.jpeg'),
('Flûtes',4 , 'flutes.jpeg'),
('Accordéons',5, 'accordeons.jpeg'),
('Folklore',5, 'folklore.jpeg'),
('Cordes Frottées',5, 'corde_frottees.jpeg'),
('Enceintes',6 , 'enceintes.jpeg'),
('Microphones',6 , 'microphones.jpeg'),
('Tables de mixage',6, 'table_de_mixage.jpeg'),
('Projecteurs',7 , 'projecteur.jpeg'),
('Stroboscope',7 , 'stroboscope.jpeg'),
('Lasers',7 , 'lasers.jpeg'),
('Suports',8, 'support.png'),
('Sièges',8 , 'sieges.jpeg'),
('Casques audio',8 , 'casque_audio.jpeg');

INSERT INTO client(categorie,adresse_livraison,cp_livraison,ville_livraison,adresse_facture,cp_facture,ville_facture,mode_paiement,reduction,coefficient,numero_siret,nom,prenom,nom_entreprise) VALUES 
('Particulier','39193 Lulu Way Apt. 696', '80287', 'Baton Rouge','39193 Lulu Way Apt. 696','80287', 'Baton Rouge','CB',NULL,0,NULL,'Bazinet','Jules', NULL),
('Particulier','4968 Marie Street', '21217', 'Baltimore', '4968 Marie Street', '21217', 'Baltimore', 'CB',NULL,1.05,NULL,'Bureau','Ray', NULL),
('Particulier','3083 Norma Lane', '71201', 'Monroe', '3083 Norma Lane', '71201', 'Monroe','CB',NULL,1.1,NULL,'Meilleur','Parnella', NULL),
('Professionnel','1292 Waterview Lane', '88005', 'Las Cruces','2212 Neville Street', '47802', 'Terre Haute','Virement/Chèque',NULL,1.15,12345678912345,'Bouchard','Percy', 'Album ETC'),
('Professionnel','1728 Meadowview Drive', '22821', 'Dayton','1728 Meadowview Drive', '22821', 'Dayton','Virement/Chèque',NULL,1.1,98765432109876,'Faure','Eustache', 'Fantômes Jazzy'),
('Professionnel','3570 County Line Road', '33602', 'Tampa','2511 Mount Olive Road', '30501', 'Gainesville','Virement/Chèque',1.05,1.09,36925814701234,'Flamand','William', 'Mane 5'),
('Particulier','1 rue des tests', '12345', 'TEST','1 rue des tests', '12345', 'TEST', 'CB',NULL,'0',NULL,'Teste','Tesse',NULL);

INSERT INTO users (client_id,email,roles,password) VALUES 
(NULL,'admin@admin.fr','["ROLE_ADMIN"]','$13$bQdLAkvQExnlgbF5alX2WOoIOMAF5o5Kjf8qUKUYda1eTHw9lZPWe'),
(7,'test@test.fr', '["ROLE_USER"]','$13$bQdLAkvQExnlgbF5alX2WOoIOMAF5o5Kjf8qUKUYda1eTHw9lZPWe');


INSERT INTO commercial (nom,prenom,adresse,cp,ville,email,telephone) VALUES 
('Desnoyer','Gemma','1331 Central Avenue', '07608', 'Teterboro','GemmaDesnoyer@teleworm.us','201-344-4226'),
('Labrecque','Emilie','3678 Winifred Way', '46135', 'Greencastle','EmilieLabrecque@jourrapide.com','765-658-3252'),
('Guimond','Arber','2584 Badger Pond Lane', '33637', 'Tampa','ArberGuimond@teleworm.us','727-249-5016');

INSERT INTO commercial_client(client_id,commercial_id) VALUES
(1,1),
(2,2),
(3,2),
(4,3),
(5,3),
(6,3);

INSERT INTO fournisseur(nom,adresse,cp,ville,email,telephone) VALUES
('Musique', '1572 Trymore Road', '56014', 'Bricelyn', 'Musique@rhyta.com', '920-313-5594'),
('Comme aux Musiques', '885 Hillcrest Avenue', '72002', 'Little Rock', 'Commeauxmusiques@armyspy.com', '401-398-0267'),
('Musique Percussion', '1546 Cherry Camp Road', '07102', ' Newark', 'Musiqueperussion@jourrapide.com', '704-903-2431'),
('Vivre Art Loux', '1723 Stoneybrook Road', '60457', 'Hickory Hills', 'Vivreartloux@armyspy.com', '916-235-8206'),
('Le Musique en ville', '46 Linden Avenue', '53188', 'Waukesha', 'Lemusiqueenville@jourrapide.com', '217-650-2213');

INSERT INTO produit(libelle_court, libelle_long, photo, prix_achat, prix_hors_taxe, rubrique_id, fournisseur_id)VALUES
('The box pro Achat 104','Enceinte large bande passive 4\" + 1\" 
		Puissance: 40 Watt / 8 Ohm (RMS) - 160 Watt / 8 Ohm (crête) 
		Réponse en fréquence: 100 Hz - 20 kHzSPL max: 109 dB 
		Dispersion: 90° x 90° 2x connecteurs Speaker Twist NL4 et borniers Montage aérien pas de vis M6
		Dimensions: 144 x 146 x 214 mm
		Poids: 2,5 kg
		Couleur: noireSupport de montage mural disponible en option, article n°: 251424Conçue en Allemagne
		','TBPro.jpg',36,46.4,24,3),

('HK Audio Premium PR:O 15', '
		Enceinte large bande passive 15\" + 1\"
		
			Puissance: 400 Watt RMS
			Impédance: 8 Ohm
			Réponse en fréquence: 60 Hz - 19 kHz
			SPL max: 128 dB - continu: 104 dB
			Dispersion: 60° x 40°
			Entrée et sortie Speaker Twist
			2x poignées latérales
			Œillet pour pied d enceinte
			Pas de vis M8 pour montage aérien (x2)
			Peinture texturée noire
			Dimensions: 47 x 61,5 x 41 cm
			Poids: 22 kg
		', 'HKA.jpg', 400,495.2,24,4),

('FBT HIMaxX 60', '
		Enceinte large bande passive 2 voies
		
			Haut-parleur 15\" et tweeter 1,4\"
			Puissance: 700 Watt sous 8 Ohm
			Dispersion: 90° x 60°
			Enceinte en polypropylène
			Œillet pour pied de montage
			Montage aérien M10 (x4)
			Couleur: noir
			Dimensions: 482 x 757 x 427 mm
			Poids: 26 kg
		', 'FBTHX.jpg',575,639.2, 24, 1 ),

('Shure SM58 LC', '
		Microphone de chant dynamique

			Version sans interrupteur marche/arrêt
			Directivité: Cardioïde
			Réponse en fréquence: 50 - 15.000 Hz
			Sensibilité: -56 dBV/Pa (1,85 mV)
			Dimensions: 23 x 162 x 51 mm
			Poids: 298 g
			Pince, adaptateur de réduction de pas de vis 3/8\" et trousse incl.
		', 'SM58.jpg', 70, 78.4, 25 , 2),

('the t bone MB 88U Dual', 'Microphone de chant dynamique

			Connecteurs XLR et USB
			Directivité: Cardioïde
			Réponse en fréquence: 20 - 16.000 Hz
			SPL max.: 137 dB
			Impédance: 600 Ohm
			Convertisseur AN 16 bits/48 KHz
			Ne nécessite pas de pilote USB
			Pour Mac et PC
			Dimensions: 182 x 51 mm
			Câble USB incl.', 'TTBone.jpg', 20, 31.2, 25, 5),

('Sennheiser E835 S', 'Microphone dynamique
		
			Directivité: Cardioïde
			Bande passante: 40 - 16.000 Hz
			Impédance: 350 Ohm
			Interrupteur on/off
			Dimensions: Ø 48 x 180 mm
			Poids: 330 g
			Pince et trousse inclus', 'E835S.jpg', 60, 70.4, 25, 3),

('Behringer Xenyx X2222USB', 'Table de mixage

			22 canaux
			8 entrées micro avec alimentation fantôme +48 Volts et filtre coupe-bas 75 Hz
			Égaliseur 3 bandes avec bande médium paramétrique, compresseur et insert par canal micro
			4 entrées stéréo
			3 retours stéréo
			3 circuits auxiliaires
			Commutateur de sourdine (Mute) et LED de crête par canal
			Unité multi-effets 24 bits interne avec 16 préréglages
			2 sous-groupes avec sortie séparée
			Faders 60 mm
			Entrée et sortie 2-Tracks
			Sorties principales XLR
			Carte son USB intégrée
			Alimentation interne
			Dimensions (H x L x P) : 90 x 430 x 355 mm
			Poids : 4,78 kg
			Kit de montage en rack 19\" inclus', 'X2222USB.jpg', 150, 215.2,  26, 2),
            
('the t.mix xmix 1002 FX USB', 'Mélangeur 10 canaux

			Avec processeur d effets intégré
			4 entrées micro / ligne XLR
			Alimentation fantôme 48V
			Égaliseur 3 bandes et panoramique
			2 entrées stéréo
			Sortie master via 2x XLR et 2x jack 6,3 mm
			Sortie Control Room supplémentaire
			Entrée sortie enregistrement via RCA (2-Track in / out)
			Sortie casque contrôlable séparément
			Port USB
			1 sortie auxiliaire
			Connexion pour pédale footswitch (effets marche / arrêt)
			Dimensions (LxHxP): 265 x 100 x 340 mm
			Poids: 3,85 kg', 'TTMix.jpg', 105, 94.4, 26, 4),

('Soundcraft Signature 12MTK', 'Console de mixage 12 canaux

			8 entrées mono
			2 entrées stéréo
			EQ à 3 bandes avec médiums paramétriques
			2 canaux micro avec compresseur/limiteur dbx intégré
			3 Auxiliaires
			Commutateurs Solo/Mute
			Dispositif d effet Lexicon intégré
			LED d écrêtage par canal
			Alimentation électrique intégrée
			Faders de 60 mm
			Interface USB à 12 canaux (livré avec le logiciel Ableton Live 9 Lite)
			Dimensions : 113 x 380 x 388 mm
			Poids : 5,86 kg', '12MTK.jpg', 300, 355.2, 26, 1),

('Roland FR-4 X BK', 'Accordéon numérique
		
			37 touches de mélodie
			120 boutons de basse
			Compact et léger
			Moteur de sons et interface utilisateur du FR-8x
			Sortie casque
			Sortie ligne
			100 sets de sons d accordéon (67 presets)
			162 sons d orchestre
			32 sons d orgue
			3 sets de batterie
			Effets: Chorus, réverbération, rotary
			Enregistreur audio intégré
			Réponse rapide et précise des capteurs de pression du soufflet
			Vis de réglage de la résistance du soufflet
			Système de haut-parleurs: 2 x11 Watt
			Ecran LCD
			4 ports d extension pour bibliothèques sonores (extensions Balkans et Dallapé préinstallées)
			Editeur FR-4x pour programmation comfortable
			Port USB
			MIDI In/Out
			Port USB pour enregistrement et lecture de fichiers audio
			Fonctionne avec un bloc d alimentation ou 10 piles AA
			Bloc d alimentation PSB-7U incl.
			Dimensions: 481 x 270 x 430 mm
			Poids: 8,9 kg
			Couleur: Noir', 'FR4XBK.jpg', 1900, 2767.2, 21, 4 ),

('Startone Piano Accordion 72 Blue MKII', 'Accordéon piano
		
			34 touches de mélodie
			3 chœurs de mélodie
			5 registres de mélodie
			72 boutons de basse
			Dimensions (L x P x H): 390 x 190 x 430 mm
			Poids: 7,7 kg
			Couleur: Bleu
			Bretelles et housse avec sangles sac à dos incl.', 'MKII.jpg', 300, 423.2, 21,1),

('Weltmeister Saphir 41/120/IV115', 'Accordéon piano
		
			Plaquettes italiennes
			41 touches de mélodie
			120 boutons de basse
			11 registres de mélodie
			5 registres de basse
			4 chœurs de mélodie
			4 chœurs de basse
			Poids: 10,6 kg
			Couleur: Noir
			Bretelles Weltmeister 34/41 Comfort et étui incl.', 'SAPHIR.jpg', 2800, 3119.2,  21, 3),

('Salvi SALDEL-ESS Delta Ebony', 'Harpe électrique
		
			Tessiture: Do - Do3
			Gamme de fréquence: 65,41- 1046,40 Hz
			Préamplificateur intégré
			Contrôles: Volume et tonalité
			Sortie sur Jack 6,3 mm
			Les cordes reposent sur un chevalet, ce qui permet de jouer des techniques telles que le bend et le slide
			Le système de micro chevalet fournit un son clairement défini sur l ensemble du spectre sonore et permet une flexibilité maximale dans la création de son
			Longueur: 1160 mm
			Poids: 6,5 kg
			Couleur: Noir mat
			Sangle, support, housse et clé d accordage incl.', 'SALDEL.jpg', 3000, 3432,  22, 2),

('Thomann SQB Celtic Harp Beech 29 Str', 'Harpe celtique
		
			29 cordes
			Tessiture: Sol3 - Sol
			Corps et cadre en hêtre
			Leviers de demi-ton
			Hauteur: env. 1030 mm
			Largeur: env. 630 mm
			Poids: env. 8,3 kg','SQB.jpg', 300,398.4,  22, 5),

('Auris My Little Lyre', 'Lyre
		
			En érable ciré
			7 cordes
			Pentatonique Ré1 - Mi2
			Forme ergonomique
			Livrée avec clé d accordage
			Dimensions: 31 x 19 x 5 cm','MLL.jpg', 80,116,  22 , 1),

('Thomann 111VN 3/4 Double Bass', 'Contrebasse 3/4

			Forme de violon
			Table en tilleul laminé
			Fond et éclisses en tilleul laminé
			Manche en érable
			Touche en ébène
			Cordes Artino
			Couleur: Marron clair mat
			Housse, archet en composite et colophane incl.', '111VN.jpg', 500, 599.2, 23,4),

('Duke Two Tone BRG Double Bass 3/4', 'Contrebasse 3/4

			Forme de viole de gambe
			Table laminée
			Fond laminé
			Touche en ébène naturel huilé
			Cordes Gut-a-Like
			Pique réglable en hauteur
			Mécaniques tyroliennes
			Sillet supérieur et inférieur en ébène
			Position des cordes pour Slap
			Couleur: Marron foncé transparent avec bords blancs Vintage', 'DDB.jpg', 2000, 2239.2, 23,3),

('Thomann Rockabilly Psycho Slap BK/RD', 'Contrebasse 3/4

			Table, fond et éclisses en tilleul laminé
			Touche ronde en ébène
			Pique réglable en hauteur
			Cordes Weed Wackers Kevlar Core Nylon Ultra-Light Red
			Diapason: env. 1060 mm
			Couleur: Noir avec graphisme os
			Archet en composite et housse incl.', 'BKRD.jpg', 600, 872, 23,2),

('Harley Benton ST-20HSS SBK Standard Series', 'Guitare électrique		
			Corps en tilleul
			Manche vissé en érable
			Touche en amarante
			Repères \"points\"
			Profil du manche: Modern \"C\"
			Rayon de la touche: 350 mm
			Diapason: 648 mm
			Largeur au sillet: 42 mm
			Barre de réglage (Truss Rod) double action
			22 frettes
			2 micros simple bobinage (manche et milieu)
			1 micro double bobinage (chevalet)
			1 réglage de volume
			2 réglages de tonalité
			Sélecteur 5 positions
			Vibrato synchronisé
			Mécaniques moulées sous pression
			Accastillage noir
			Tirant des cordes: .009 - .042
			Couleur: Satin Black', '20HSS.jpg', 60, 87.2, 9, 1),

('Fender Jim Root Stratocaster EB BK', 'Guitare électrique
		
			Signature Jim Root
			Corps en acajou
			Manche en érable
			Profil du manche: Modern C
			Touche en ébène
			22 frettes Jumbo
			Diapason: 648 mm
			Largeur au sillet: 42 mm
			Accastillage noir
			Cordes traversantes
			Pickguard 3 plis noir
			1 micro EMG 60 (manche)
			1 micro EMG 81 (chevalet)
			Sélecteur 3 positions
			1 réglage de volume
			Couleur: Flat Black
			Livrée en étui tweed noir', 'EBBK.jpg', 1200,1650, 9 , 4),

('ESP LTD MH-10 Black', 'Guitare électrique
		
			Corps en tilleul
			Manche vissé en érable
			Touche en bois dur d ingénierie
			Rayon de la touche: 350 mm
			Largeur au sillet: 42 mm
			Diapason: 648 mm (25,5\")
			Profil du manche en U
			24 frettes Extra Jumbo
			1 micro passif ESP Designed LH-150N (manche)
			1 micro passif ESP Designed LH-150B (chevalet)
			1 réglage de volume
			1 réglage de tonalité
			Sélecteur 3 positions
			Mécaniques LTD
			Chevalet TOM (cordes traversantes)
			Accastillage chromé
			Cordes D Addario XL110 (.010/.013/.017/.026/.036/.046)
			Couleur: Noir
			Livrée en housse', 'MH10.jpg', 100, 191.2, 9,2),

('Harley Benton GL-2NT Guitarlele', 'Guitalélé
		
			Guitare classique 1/8
			Table en épicéa
			Fond et éclisses en acajou (Entandrophragma cylindricum)
			Manche en nato
			Touche en blackwood (Pinus radiata)
			Filet noir
			17 frettes
			Diapason: 433 mm
			Largeur au sillet: 48 mm
			Chevalet en blackwood (Pinus radiata)
			Sillet de chevalet: 68 x 8 x 3 mm
			Mécaniques de guitare classique
			Cordes en nylon de tension moyenne
			Accordage: La, Ré, Sol, Do, Mi, La
			Longueur totale: 710 mm
			Largeur: 225 mm
			Couleur: Naturel mat
			Livrée en housse', 'GL2NT.jpg', 30, 47.2, 10, 5),

('Startone CG-851 1/8 Pink', 'Guitare classique
		
			Taille: 1/8
			Corps en tilleul
			Manche en nato
			Touche en érable
			Diapason: 465 mm
			Largeur au sillet: 39 mm
			Filet de corps noir
			Longueur totale: 762 mm
			Cordes en nylon
			Couleur: Rose satin', 'CG851.jpg', 22, 30.4, 10, 2),

('Yamaha GL1', 'Guitalélé
		
			6 cordes
			Table en épicéa
			Fond et éclisses en méranti
			Touche en sonokeling
			Accordage: La, Ré, Sol, Do, Mi, La
			Largeur au sillet: 47,5 mm
			Dimensions: 85 x 230 x 700 mm
			Livrée en housse', 'GL1.jpg', 48, 68, 10 , 4),

('Taylor Baby Mahogany-e BT2e', 'Guitare électro-acoustique

			Small Body Dreadnought
			Table en acajou massif
			Barrage en X
			Fond et éclisses en contreplaqué de sapele
			Manche en sapele
			Touche en ébène
			Repères \"points\"
			19 frettes
			Diapason: 578 mm
			Largeur au sillet: 42,8 mm
			Sillets de tête et de chevalet NuBone
			Electronique Expression System Baby
			Cordes Elixir Phosphor Bronze Light (185024)
			Couleur: Naturel
			Livrée en housse Taylor', 'BT2E.jpg', 300, 399.2, 11,3),

('Furch LJ-10', 'Guitare acoustique de voyage pliable
		
			Modèle Little Jane
			Table en cèdre massif
			Fond et éclisses en acajou massif
			Manche en acajou
			Touche et chevalet en ébène
			Largeur au sillet: 45 mm
			Mécaniques bloquantes
			Longueur totale: 910 mm
			Dimensions du corps: 410 x 305 x 100 mm
			Diamètre de la rosace: 88 mm
			Cordes Elixir Ph-Br Nanoweb 012-053 (185024)
			Livrée en housse
			Fabriquée en République tchèque', 'LJ10.jpg',700, 990,  11, 1),

('LAVA MUSIC ME 2 BK', 'Guitare acoustique compacte
		
			Idéale comme instrument de voyage
			Construction monobloc en fibre de carbone AirSonic moulée par injection pour une meilleure conductivité physique, avec un son plus rond et un sustain plus long
			Supporte des températures entre -20° à 90° et une humidité de 10% à 90%
			Table en composite de fibre de carbone Super AirSonic extra rigide - particulièrement mince et résonnant
			Touche en HPL (High-Pressure Laminate)
			Diapason: 597 mm (23,5\")
			Largeur au sillet: 42,9 mm (1,69\")
			Sillet Tusq
			18 frettes
			Chevalet en HPL (High-Pressure Laminate)
			Mécaniques en alliage d aluminium (démultiplication: 21:1)
			Cordes Elixir 16052 (012.-053.)
			Couleur: Noir
			Livrée en housse', 'ME2BK.jpg',400, 479.2, 11,2),

('Yamaha b1 PE', 'Piano droit

			Banc et lampe incl.
			88 touches
			3 pédales
			Largeur: 148 cm
			Hauteur: 109 cm
			Profondeur: 54 cm
			Poids: 174 kg
			Finition: Noir poli', 'Yamaha b1 PE.jpg', 3075, 3690, 14, 1),

('Yamaha b3 PE', 'Piano droit :

			Banc et lampe incl. ,
			88 touches ,
			Table d harmonie en épicéa massif ,
			3 pédales ,
			Largeur: 152 cm , 
			Hauteur: 121 cm , 
			Profondeur: 61 cm , 
			Poids: 237 kg , 
			Avec roulettes , 
			Finition: Noir brillant ', 'Yamaha b3 PE.jgp', 4825, 5790, 14, 1),

('Kawai K 15 E E/P Piano', 'Piano droit

			88 touches
			Mécanique \"Ultra Responsive Action\"
			Têtes des marteaux en feutre pressé (100% laine)
			3 pédales
			Hauteur: 110 cm
			Largeur: 149 cm
			Profondeur: 59 cm
			Poids: 196 kg
			Finition: Noir poli', 'Kawai K15 E EP.jpg', 3325, 3990, 14, 1),

('Kawai GL 10 E/P Grand Piano', 'Piano à queue
		
			Mécanique Millennium III avec pièces en ABS Styran
			Pédale sostenuto
			Têtes des marteaux avec feutre
			Couvre clavier à fermeture lente
			Longueur: 153 cm
			Poids: 282 kg
			Finition: Noir poli
			Banc incl.', 'Kawai GL 10 EP.jpg', 9075, 10890, 15, 2),

('Yamaha C 3 X PE Grand Piano', 'Piano à queue de concert
		
			Conçu pour créer un lien singulier avec le pianiste, les développeurs des instruments de la série CX ont donné naissance à un piano qui peut vraiment chanter
			Finition: noir brillant
			Longueur: 186 cm (6 1 \")
			Largeur: 149 cm (59 \")
			Hauteur: 101 cm (40 \")
			Poids: 320 kg (704 lbs)
			Livré avec un banc de piano', 'Yamaha C3X PE.jpg', 24990, 29990, 15, 2),

('Steinway & Sons B-211', 'Piano à queue
		
			Année de construction: 1923
			Longueur: 211 cm
			Largeur: 148 cm
			Garantie Thomann de 5 ans
			Poids: env. 345 kg
			Finition: Noir mat
			Banc de haute qualité Andexinger incl.', 'Steinway & Sons B221.jpg', 44416, 53300, 15, 2),

('Thomann DP-95 WH', 'Piano numérique
		
			Avec accompagnement automatique
			88 touches lestées
			Mécanique à marteaux
			500 sons
			200 styles
			60 morceaux internes
			2 morceaux de démonstration
			Ecran LCD
			Polyphonie 128 voix
			Harmony
			Réverbération
			Sequenceur (3 morceaux utilisateur)
			Sync Start
			Sync Stop
			Intro/Ending
			Fill-In A
			Fill-In B
			Bouton One Touch Setting
			Mode accord
			Modes Dual et Split
			Métronome
			Fonction Transpose
			3 pédales
			2 sorties casque
			USB to Host (MIDI uniquement, Windows 8 ou plus récent, Mac OSX 10.8 ou plus récent)
			MIDI In/Out
			Entrée Aux
			Sortie Aux
			Système de haut-parleurs: 2 x 25 Watt + 2 x 20 Watt
			Couvre clavier rétractable
			Dimensions: 1380 x 514 x 906 mm
			Poids: 53 kg
			Couleur: Blanc', 'Thomann DP95.jpg', 4825, 5790, 16, 3),

('Hemingway DP-501 MKII AT', 'Piano numérique

			88 touches lestées
			Écran LCD avec rétro-éclairage bleu
			16 sons
			Polyphonie 64 voix
			16 morceaux de démonstration
			Réverbération
			Chorus
			Métronome
			Fonctions Transposer, Split et Layer
			3 pédales
			Couvre clavier rétractable
			Enregistreur interne: 3 pistes / 90000 notes
			Enregistrement MIDI via USB: Lecture/enregistrement MIDI
			Fonction d apprentissage
			Mode Duo
			Amplification: 2 x 20 Watt
			Dimensions: 1400 x 490 x 860 mm
			Poids: 54 kg
			Couleur: Anthracite
			Bloc d alimentation secteur inclus', 'Hemingway DP501.jpg', 425, 511, 16, 3),

('Kawai CN-29 B Set', 'Kawai CN-29 B

			Piano numérique
			88 touches avec surface en ivoire de synthèse
			Mécanique Responsive Hammer III
			Simulation du point de pression
			Système de détection à trois capteurs
			19 sons
			Polyphonie 192 voix
			Technologie Bluetooth MIDI
			Fonction d apprentissage
			Mode Dual
			Mode 4 mains
			Métronome
			Transposeur
			19 morceaux de démonstration
			Enregistreur 1 piste (3 morceaux - 10000 notes)
			Couvre clavier rétractable
			3 pédales avec mécanique Grand Feel
			2 sorties casque
			MIDI In/Out
			USB to Host
			Bluetooth 4.1
			Système d amplification Onkyo 2 x 20 Watt
			Dimensions: 1360 x 405 x 860 mm
			Poids: 43 kg
			Finition: Noir satiné
		
		Thomann KB-47BM
		
			Banc de piano
			Système de levage double croisillon sur axe
			Hauteur réglable de 450 à 580 mm
			Dimensions de l assise: 520 x 300 mm
			Revêtement de l assise: Velours noir
			Poids: 8,75 kg
			Couleur de la monture: Noir mat
		
		AKG K-72
		
			Casque Hi-Fi
			Fermé
			Circum-aural
			Impédance: 32 Ohm
			Sensibilité: 112 dB SPL/V
			Bande passante: 16 - 20.000 Hz
			Puissance admissible: 200 mW
			Câble de 3 m avec fiche mini Jack stéréo 3,5 mm
			Adaptateur 6,3 mm incl.
			Poids: 200 g', 'Kawai CN29.png', 1132, 1359, 16, 3),

('Yamaha YAS-280 Alto Sax', 'Saxophone alto
		
			Modèle étudiant
			Bague de serrage du bocal améliorée
			Bascule Si-Do# grave améliorée
			Repose-pouce réglable
			Clé de Fa# aigu
			Clé de Fa avant
			Corps en laiton
			Finition corps et clétage: Vernis doré
			Etui souple avec sangles sac à dos, bec Yamaha 4C, sangle et graisse pour liège incl.', 'Yamaha YAS280.jpg', 825, 990, 17, 4),

('Thomann TAS-180 Alto Sax', 'Saxophone alto
		
			Corps, bocal et mécanique en laiton
			Clé de Fa# aigu
			Clé de Fa avant
			Vis de réglage séparées pour Ré, Mi, Fa, La, Si
			Repose-pouce réglable en matière plastique
			Clés de Sol# et Fa# massives
			Pavillon amovible
			Finition: Vernis clair
			Etui souple avec sangles sac à dos incl.', 'Thomann TAS180.jpg', 248, 298, 17, 4),

('Startone SAS-75 Alto Sax', 'Saxophone alto en Mib
		
			Clé de Fa# aigu
			Bascule
			Repose-pouce réglable
			Corps et clétage en laiton
			Finition: Vernis doré
			Bec et étui souple incl.', 'Startone SAS75.jpg', 224, 269, 17, 4),

('Thomann TR 5 Bb-Pocket Trumpet', 'Trompette de poche en Sib
		
			Pistons Périnet
			Corps en laiton
			Diamètre du pavillon: 95 mm
			Poids: 890 g
			Longueur: 230 mm
			Finition: Vernis
			Embouchure 7C et étui incl.', 'Thomann TR5BB.jpg', 107.5, 129, 18, 5),

('Thomann TR 200 Bb-Trumpet', 'Trompette en Sib
		
			Successeur du modèle TR-4
			Branche d embouchure en laiton doré
			Pistons en acier inoxydable
			Perce: ML
			Crochet de pouce sur la 1ère coulisse
			Anneau réglable sur la coulisse du 3ème piston
			Coulisses extérieures en maillechort
			Pavillon en laiton
			Finition: Vernis clair
			Embouchure 7C et étui souple avec sangles sac à dos incl.', 'Thomman TR200BB.jpg', 132.5, 159, 18, 5),

('Bach TR-450S Bb- Trumpet', 'Trompette en Sib
		
			Perce ML: 11,66 mm (.459\")
			Nouvelle forme de pavillon en 2 parties pour un son rayonnant et plein
			Pavillon en laiton
			Diamètre du pavillon: 120 mm (4 3/4\")
			Bord du pavillon renforcé de fil
			Logo gravé
			Branche d embouchure en laiton doré
			Chambres des pistons 2 pièces en maillechort/laiton
			Coulisses extérieures en maillechort
			Pistons en acier inoxydable avec guides de piston en aluminium
			Crochet de pouce sur la 1ère coulisse
			Anneau fixe sur la coulisse du 3ème piston
			3ème piston 2 pièces (design Stradivarius)
			1 clé d eau design Bach sur la coulisse d accord
			Finition: Argenté
			Housse Bach SPS avec sangles sac à dos et embouchure Vincent Bach 7C incl.', 'Bach TR450S.jpg', 640, 769, 18, 5),

('Thomann 12H Ocarina C3 dark blue', 'Ocarina 12 trous
		
			Longueur: 175 mm
			Tonalité: Do majeur
			Tessiture: La1 - Fa3
			En matière plastique
			Poids: 171 g
			Couleur: Bleu foncé
			Méthode incl.
			Livré en coffret cadeau', 'Thomman 12H.jpg', 16.50, 19.90, 19, 1),

('Thomann AC Stein Double Ocarina reg.', 'Double ocarina en pierre
		
			Fabriqué à la main
			2 octaves
			Tessiture: La1 - Do4
			Tonalité: Do majeur
			Finition: Cuit au feu de paille, chaque ocarina est un modèle unique
			Tablature et trousse incl.', 'Thomann ACStein.jpg', 82.5, 99, 19, 1),

('Thomann Zfan Fairy Ocarina AC 12-H C3', 'Ocarina alto 12 trous
		
			En céramique
			Longueur: 15,5cm
			Tonalité: Do majeur
			Tessiture: La1 - Fa3
			Méthode de 72 pages et trousse en matière plastique incl.
			Couleur: Bleu royal', 'Thomann Zfan.jpg', 45.80, 55, 19, 1),

('Thomann FL-200R Flute Open Holes', 'Flûte traversière
		
			Tête, corps et mécanique en maillechort argenté
			Mi mécanique
			Plateaux creux
			Sol décalé
			Patte d Ut
			Etui et écouvillon incl.', 'Thomann FL200.jpg', 132.50, 159, 20, 1),

('Muramatsu EX-III-RBE Flute', 'Flûte traversière
		
			Tête en argent massif
			Plateaux creux
			Mi mécanique
			Sol décalé
			Patte de Si
			Corps et mécanique argentés
			Etui et écouvillon incl.', 'Muramatsu EX.jpg', 3333, 3999, 20, 1),

('Pearl Flutes PF-505 RE Quantz Flute', 'Flûte traversière
		
			Série Quantz
			Corps, tête et mécanique en maillechort
			Finition: Plaqué argent
			Plateaux creux
			Mécanique à pointe
			Sol décalé
			Mi mécanique
			Patte d Ut
			Etui et accessoires incl.', 'Pearl PF505.jpg', 462, 555, 20, 1),

('ETC S4 PAR EA','PAR Wash

			Pour ampoule HPL jusqu à 750 Watt
			Réflecteur EA (aluminium amélioré)
			Réflecteur à facettes moulées
			4 lentilles interchangeables (VNSP, NSP, MFL, WFL)
			En aluminium moulé sous pression
			Dimensions: 280 x 280 x 410mm
			Poids sans ampoule: 5 kg','ETC.jpg',150,256.8, 27,1),

('Eurolite LED SL-400 DMX Search Light','Poursuite avec LED blanc chaud de 300 Watt
		
			Pour moyennes distances jusqu à 50 m
			Zoom manuel de 7° à 13°
			CRI > 80
			4 filtres de correction: CTB, cyan, magenta, jaune, roue de 5 couleurs
			Iris: 5 - 100%
			Gradateur continu: 0 - 100 %
			Dimensions: 770 x 270 x 290 mm
			Poids: 12 kg
			Indice de protection: IP20','Eurolite.jpg',1200,1500,27,1),

('Cameo Matrix Panel 10 W RGB','Panneau matriciel RVB
		
			Panneau matriciel 5x LED RVB de 5 Watt avec contrôle d un seul pixel
			Convient pour des faisceaux lumineux sans scintillement et des effets Blinder, Chase et Strobe passionnants
			Avec loquets encastrés sur tous les côtés, les panneaux matriciels peuvent être facilement assemblés pour former de grandes cloisons légères et efficaces
			Support oméga inclus
		
		Données techniques :
		
			Type de LED : 25 LED RVB de 10 Watt
			Angle du faisceau : 40°
			Éclairement lumineux : 6950 lx @ 1m
			Taux de rafraichissement : 8000 Hz
			Modes automatique, musique, maître/esclave et DMX
			Nombre de canaux DMX : 3/5/19/28/78
			Entrée/sortie DMX XLR 3 broches
			Alimentation : 100 V AC - 240 V AC / 50 - 60 Hz
			Consommation électrique : 180 W
			Entrée et sortie Power Twist bleu et blanc (entrée/sortie Power Twist)
			Refroidissement : Ventilateur
			Dimensions (L x H x P) : 580 x 580 x 580 x 125 mm
			Poids : 13,7 kg','Cameo.jpg',400,431.2,27,1),

('Stairville Wild Wash 132 LED RGB','Projecteur multifonctionnel SMD LED
		
			4 effets dans un seul appareil: Fluter, Wall Wash, Blinder, Strobe
			Source: 132 LEDs 5050 SMD RGB de 0,2 Watt
			Mélange de couleur RGB en continu
			Angle de diffusion: env. 75°
			Modes de fonctionnement: DMX-512, musique, automatique avec programmes intégrés, maître/esclave
			8 modes DMX: 1, 2, 2, 3, 3, 3, 4, 6 canaux
			Ecran de contrôle avec 4 boutons
			Entrée et sortie DMX sur XLR 3 broches
			Entrée CEI
			Température de fonctionnement: 0°C - 40°C
			Alimentation: 100/240 V, AC 50/60 Hz
			Consommation max.: 30 Watt
			Indice de protection: IP20
			2 étriers de montage (utilisation au sol possible)
			Dimensions: 310 x 70 x 70 mm
			Poids: 1,05 kg','Stairville.jpg',50,63.2,28,1),

('Martin by Harman Atomic 3000 LED','Stroboscope à LEDs
		
			Stroboscope traditionnel avec technologie moderne LED
			Illumination colorée du réflecteur pour effets supplémentaires
			Macros d effets internes
			Peut être combiné avec l Atomic Colors Scroller
			Source: 228 LEDs Cree XLamp XP-L blanches de 10 Watt
			Température de couleur: 5700°K
			Taux de flash: 0.289 - 16.667 Hz
			Réflecteur Aura: 64 LEDs Osram RGB
			Flux lumineux total: 180.000 lumens
			Modes DMX: 3, 4 ou 14 canaux
			Compatible RDM
			Ecran graphique
			Refroidissement par ventilateur
			Indice de protection: IP 20
			Entrée et sortie DMX sur XLR 5 broches
			Entrée et sortie électrique sur Power Twist TR1
			Connexion pour Atomic Colors sur XLR 4 broches
			Alimentation: AC 100/240 V - 50/60 Hz
			Consommation sous 230 V / 50 Hz: 642 Watt / 3.2 A
			Dimensions avec étrier: 245 x 425 x 240 mm
			Poids: 7,8 kg','Martin.jpg',1900,2318.4,28,1),

('Varytec Colors SonicStrobe','Stroboscope LED avec effet d ambiance

			216 LEDs CW SMD 5730 LED de 0,5 Watt (stroboscope)
			144 LEDs RGB SMD 5050 LED (effet d ambiance)
			1, 4 ou 48 segments contrôlables (effet d ambiance)
			Fonctionnement sans scintillement grâce au taux de rafraîchissement élevé des LEDs (4000 Hz)
			Modes de fonctionnement: DMX (7/13/22/148 canaux), maître/esclave, 17 programmes internes, musique
			Ecran LCD avec 4 boutons
			Taux de flash: 0 - 20 Hz
			Entrée et sortie DMX sur XLR 3 broches
			Entrée et sortie électrique sur Power Twist
			Alimentation: 100/240 V - 50/60 Hz
			Consommation: 130 Watt
			Boîtier en métal
			Etrier de fixation
			Dimensions: 476 x 241 x 88 mm
			Poids: 3,9 kg','Varytec.jpg',100,141.6, 28,1),

('Laserworld DS-1000RGB MK3','Système laser \"Pure Diode\" RVB
		
			Avec interface réseau ShowNET intégrée
			Avec diodes semi-conductrices et une puissance totale garantie de 1000 mW
			Rouge : 200 mW / 638 nm
			Vert : 250 mW / 520 nm
			Bleu : 700 mW / 450 nm
			Modulation analogique
			ILDA
			DMX
			Environ 3 mm / 0.9 mrad (angle complet)
			ILDA Max : 40 kpps @ 8°
			Angle de balayage max : 50°
			Sécurité de balayage
			Interlock : entrée / sortie RJ45
			Boutons-poussoirs pour inverser les axes X/Y
			Connexion électrique : entrée / sortie Power Twist
			Alimentation électrique : 85V - 250 V / AC 50/60 Hz PSU interne
			Consommation électrique : 40 Watt
			Dimensions : 200 x 140 x 110 mm
			Poids : 2,8 kg
			Licence de logiciel Showeditor version complète incluse','Laserworld.jpg',500,596,29,1),

('ADJ Stinger II','Effets Moonflower/stroboscope/laser
		
			Effet Moonflower: 6 LEDs RGBAWP de 5 watt (rouge, vert, bleu, ambre, blanc, rose
			Stroboscope: 8 LEDs UV de 3 Watt
			Laser de classe 3R: Rouge et vert
			Moteurs pas à pas de 1,8°
			3 modes de fonctionnement: DMX-512 (10 canaux), misique, maître/esclave
			15 programmes de couleurs
			Ecran de contrôle avec 4 boutons
			Entrée et sortie DMX sur XLR 3 broches
			Effet stroboscopique et de pulsation
			Gradateur électronique: 0 - 100%
			Entrée et sortie CEI
			Consommation max: 70 Watt
			Alimentation multi-tension: AC 100V/240V - 50/60Hz
			Durée de vie des LEDs: env. 50.000 h
			Dimensions: 304 x 230 x 98 mm
			Poids: 5 kg
			Attention: Cet appareil contient un laser de classe 3R (classification selon la norme DIN EN 60825-1:2007)','ADj.jpg',150,172,29,1),

('Laserworld PL-5000RGB MK2','Laser couleur à diode haute puissance Purelight
		
			Avec carte mère multi-contrôle intégrée
			Puissance garantie de 5000 mW après optique
			Rouge 1200 mW / 638 nm
			Vert 1700 mW / 520 nm
			Bleu 3000 mW / 450 nm
			Capacité graphique 40kpps @ 8° ILDA
			Angle de balayage max. 50°
			Laser couleur avec modulation analogique
			Faisceaux nets et intenses d environ 5.0 mm de diamètre et divergence de 1,0 mrad
			Les réglages peuvent être stockés directement dans le laser et sont alors valables pour tous les modes de fonctionnement
			Bouclage facile : alimentation, réseau, interlock, signal DMX et ILDA
			Modes de fonctionnement multiples : mode automatique, DMX, ArtNet, LAN et ILDA
			Affichage pour une sélection facile des modes de fonctionnement
			Coffret plastique étanche inclus
			Alimentation : 85-250 V CA 50/60 Hz
			Consommation : 150 Watt
			Dimensions : 320 x 220 x 180 mm
			Poids : 10,1 kg
			Livré avec étui en plastique étanche','Laserworld1.jpg',1900,2199.2,29,4),

('Gravity LTS 01 B Set', 'Gravity LTS 01 B

			Support pliable pour ordinateur portable et contrôleur
			Avec compartiment de rangement supplémentaire
			Convient aux formats d ordinateurs portables de 12\" à 17\"
			Construction en aluminium très robuste et léger
			Montage rapide
			Inclinaison variable de l étagère et du pied
			Patins antidérapants
			Système de démontage rapide
			Dimensions: 280 x 260 x 270 mm
			Poids: 1,6 kg
			Couleur noir
			Sac disponible en option, article n° : 465796 (non fourni)
		
		Gravity BG LTS 01 B
		
			Sac de transport pour support d ordinateur portable
			Sac de transport hydrofuge avec double fermeture à glissière
			En néoprène de haute qualité solidement traité
			Protège contre la saleté et les rayures
			Dimensions : 300 x 350 x 20 mm
			Couleur : noir / vert néon','Gravity.jpg',40,61.6,30,4),

('Roadworx Multi Electric Stand','Support à hauteur réglable électrique
		
			Pour claviers, synthétiseurs, pianos de scène, tables de mixage/consoles numériques, équipement de studio, etc.
			Hauteur réglable en continu d env. 610 à env. 1260 mm
			4 positions mémorisables librement
			Longueur des bras de support: 350 mm
			Largeur: env. 1130 mm
			Longueur des pieds: 550 mm
			Charge admissible: 150 kg
			Poids: 22 kg
			Couleur: Noir','Roadworx.jpg',200,231.2,30,4),

('Standback Ampstand','Support d inclinaison
		
			Adapté à presque tous les combos
			Léger et résistant (renforcé de Kevlar)
			N élimine pas les fréquences basses obtenues (effet de couplage)
			Rentre dans n importe quelle housse une fois plié
			Inclinaison réglable sur 3 niveaux
			Supporte une charge max. (selon le fabricant) de 37 kg','Standback.jpg',15,23.2,30,1),

('Millenium MDT5S-Pro Drum Throne Saddle','Siège pour batteur
		
			Avec dossier
			Assise type selle
			Trépied double embase
			Hauteur réglable par tige filetée d env. 52 à env. 65 cm','Millenium.jpg',50,55.2,31,3),

('Mapex MXT765ASER Drum Stool','Siège pour batteur
		
			Assise ronde
			Diamètre de l assise: 30,5cm
			Epaisseur du rembourrage de l assise: 6,5cm
			Revêtement en vinyle souple
			6 positions de réglage en hauteur de 44cm à 56cm - Tube percé avec vis de verrouillage
			Trépied double embase','Mapex.jpg',100,127.2,31,3),

('DW 9120AL Drum Stool','Siège pour batteur

			Série Air Lift
			Assise rembourrée type selle
			Quadripode double embase
			Hauteur réglable par système pneumatique de 510 à 690 mm','DW.jpg',200,255.2,31,3),

('Boss Waza Air Guitar Headphones','Système audio pour guitare avec casque sans fil

			Contient des sons d amplificateurs et d effets Premium
			Connectivité sans fil 2,4 GHz
			Construction durable avec des pièces en métal chromé
			Design bidirectionnel polyvalent
			Pliable pour un rangement compact ou un transport à plat
			Batterie rechargeable intégrée avec fonction Standby/Wake automatique pour protéger la durée de vie de la batterie
			Jusqu à 5 heures d autonomie pour le casque et jusqu à 12 heures pour l émetteur WL-T incl.
			Contrôles: Commutateur Power, bouton Volume, boutons Ch Up/Down, bouton Bluetooth Multi-Function
			Affichage: Charge, Power/Battery, Bluetooth, Guitar Wireless
			Batterie lithium-ion rechargeable
			Consommation lors de la charge: 470 mA
			Poids du casque: 320 g
			Emetteur WL-T et un câble micro USB incl.','Boss.jpg',250,303.2,32,3),

('Metrophones MPD-G Headphones LCD Metronom','Casque pour batteur
		
			Métronome intégré 42-250 bpm avec écran LCD
			2 voies séparés - métronome et entrée ligne
			Bande passante: 15 - 25000 Hz
			Contrôle du volume intégré
			Câble interchangeable de 3 m
			Atténuation du volume: 29 dB
			Coussinets d oreille remplis de gel','Metrophones.jpg',120,168.8,32,3),

('Superlux HD-681','Casque studio
		
			Semi-ouvert
			Dynamique
			Circum-aural
			SPL max.: 98 dB
			Impédance: 32 Ohm
			Bande passante: 10 - 30.000 Hz
			Puissance absorbée: 300 mW
			THD: 100 mW à 1 KHZ <1%
			Serre-tête bandeau auto-ajustable pour un bon confort
			Câble de 2,5 m avec fiche mini Jack stéréo 3,5 mm
			Poids avec câble: 278 g
			Poids sans câble: 230 g
			Adaptateur 3,5/6,3mm et trousse incl.','Superlux.jpg',10,18.08,32,5),

('Pearl EXX725SBR/C Export Aztec Gold','Batterie complète - Version Fusion 2

			Edition limitée
			Grosse caisse 22\"x18\"
			Tom 10\"x07\"
			Tom 12\"x08\"
			Stand tom 16\"x16\"
			Caisse claire 14\"x5,5\"
			Fûts en acajou asiatique/peuplier
			Accastillage chromé
			Peaux Remo UT
			Finition: Rhodoïd
			Couleur: Mirror Chrome #49
		
		Set de hardware HWP830:
		
			Pied perche de cymbale BC-830
			Pied droit de cymbale C-830
			Pied de caisse claire S-830
			Pédale de charleston H-830
			Pédale de grosse caisse P-930 Demonator
			2 supports simple de tom TH-70I
		
		Set de cymbales en laiton Sabian SBR:
		
			Cymbales charleston 14\"
			Crash 16\"
			Ride 20\"','Pearl.jpg',450,599.2,12,3),

('Tama STAR Drum Bubinga White Ebony','Set de fûts - Shell Set

			Série Factory Vault
			Edition limitée
			Grosse caisse 22\"x16\" (cercles de couleur identique aux fûts)
			Tom 10\"x07\"
			Tom 12\"x08\"
			Stand tom 14\"x14\"
			Stand tom 16\"x16\"
			Fût 5 plis en bubinga + 1 pli intérieur en cordia + 1 pli extérieur en ébène
			Epaisseur des fûts: 5 mm
			Anneaux de renfort Sound Focus Ring (SFR) de 9 mm
			Accastillage chromé
			Chanfreins spéciaux: Couches externes 3,5 mm
			Plis intérieurs/chanfreins huilés à la main
			Système de suspension des toms \"Super Resonant Mounting System\" avec attache \"Quick-Lock\"
			Pieds des stands toms avec patins en caoutchouc souple
			Pieds de grosse caisse avec gros patins/piques réglables en 2 étapes
			Coquilles avec un minimum de contact sur les fûts
			Cercles des toms moulés
			Peaux de frappe toms/stands toms: Remo Ambassador sablées
			Peaux de résonance toms/stands toms: Remo Ambassador transparentes
			Peau de frappe grosse caisse: Remo Powerstroke 3 sablée
			Peaux de résonance grosse caisse: Remo Fiberskyn Powerstroke 3 Diplomat
			Couleur: White Ebony (NWE)','Tama.jpg',6000,7199.2,12,3),

('Sonor AQX Jungle Set BOS','Set de fûts - Shell Set

			Série AQX
			Grosse caisse 16\"x15\" (avec attache pour support de tom)
			Tom 10\"x07\"
			Stand tom 13\"x12\"
			Caisse claire 13\"x06\"
			Fûts en peuplier
			Accastillage chromé
			Adaptateur \"réhausseur\" de grosse caisse et support de cymbale/tom incl.
			Couleur: Blue Ocean Sparkle (BOS)','Sonor.jpg',350,399.2,12,5),

('Roland VAD706-GC E-Drum Set Bundle','Roland VAD706-GC E-Drum Set

			Batterie électronique V-Drum
			Design V-Drums Acoustic
			Pads de batterie de taille standard
			Grosse caisse et toms en bois
			Couleur: Gloss Cherry
			Caisse claire en acier inoxydable
			Nouveau design de cymbales plus légères et plus minces pour un comportement de jeu plus réaliste
		
		Module de sons TD-50X:
		
			100 kits de batterie
			Technologie de modélisation de son prismatique
			Lecture de samples WAV à partir d une carte SD
			10 canaux de sortie audio USB pour enregistrement multipistes via un seul câble USB
			14 entrées triggers sur Jack stéréo 6,3 mm
			3 entrées triggers numériques pour pads numériques Roland dotés de la technologie multicapteurs
			2 sorties Main symétriques sur XLR
			8 sorties directes sur Jack 6,3 mm
			Sortie casque sur mini Jack stéréo 3,5 mm
			Entrée sur mini Jack stéréo 3,5 mm pour lecteurs MP3/CD
			MIDI In/Out
			Interface USB-MIDI pour connexion directe sur Mac ou PC
			Connexion sur Jack stéréo 6,3 mm pour commutateur au pied
			Métronome avec fonction \"Quiet Count\"
			EQ 3 bandes et compresseur sur chaque pad
			3 processeurs multi-effets avec 30 algorithmes
			Multi-compresseur 2 bandes et EQ 4 bandes pour les sorties','Roland.jpg',6000,6872,13,2),

('Alesis Strike Pro Special Edition','Batterie électronique

			Pads composés de plusieurs plis de bois
			Peaux maillées améliorées pour un rebond plus réaliste
			Accastillage noir avec vis de serrage dorées
			Pads de cymbales optique martelé
			Rack, pied de caisse claire, bloc d alimentation, câblage et paire de baguettes incl.
			Surface au sol requise: env. 170 x 120 cm
		
		Module de sons Strike Performance:
		
			1800 sons
			136 kits
			Ecran couleur LED 4,3\"
			Sampling de sons personnels (format wav) sur carte SD 16 GB fournie
			Configuration du module via le logiciel d édition Strike
			Mixer 12 canaux
			Section d effets: Reverb, Flanger, Chorus, Vibrato, Delay
			Enregistreur de sample
			12 entrées trigger sur Jack stéréo 6,3 mm
			2 sorties Main sur Jack 6,3 mm (symériques)
			8 sorties Direct sur Jack 6,3 mm (symériques)
			1 sortie casque sur Jack stéréo 6,3 mm
			1 entrée ligne sur mini Jack stéréo 3,5 mm
			Fente pour carte SD (max. 64 GB)
			USB MIDI
			Entrée et sortie MIDI','Alesis.jpg',1500,1887.2,13,3),

('Millenium HD-120 E-Drum Set','Batterie électronique complète
		
			Pour débutants et enfants
			Surface au sol requise: 100 x 60 cm
			12 kits de batterie
			Métronome 40-240 bpm
			Sortie ligne sur mini Jack mono 3,5 mm
			Sortie casque sur mini Jack stéréo 3,5 mm
			Entrée Aux sur mini Jack stéréo 3,5 mm
			MIDI-USB
			1 pad de caisse claire 07\"
			3 pads de toms 07\"
			1 contrôleur de grosse caisse
			3 pads de cymbales 09\"
			1 contrôleur de charleston
			Rack
			Câblage, siège, casque, paire de baguettes, support de baguettes et bloc d alimentation (100-240V) incl.','Millenium1.jpg',100,158.4, 13,3);


INSERT INTO commande(date,adresse_livraison,cp_livraison,ville_livraison,adresse_facture,cp_facture,ville_facture,date_facture,total,client_id) VALUE
('2022-02-17', '39193 Lulu Way Apt. 696', '80287', 'Baton Rouge', '39193 Lulu Way Apt. 696', '80287', 'Baton Rouge', '2022-05-17', 12.45, 1),
('2022-03-17', '1292 Waterview Lane', '88005', 'Las Cruces',  '2212 Neville Street', '80287', 'Terre Haute', '2022-05-26', NULL, 4),
('2022-04-17', '3083 Norma Lane', '71201', 'Monroe', '3083 Norma Lane', '71201', 'Monroe', '2022-05-17', NULL,3),
('2022-05-17', '4968 Marie Street', '21217', 'Baltimore', '4968 Marie Street', '21217', 'Baltimore', '2022-05-17', NULL,2),
('2022-06-03', '3570 County Line Road', '33602', 'Tampa', '2511 Mount Olive Road', '30501', 'Gainesville', '2022-06-23', NULL,6),
('2022-07-03', '1728 Meadowview Drive', '22821', 'Dayton', '1728 Meadowview Drive', '22821', 'Dayton', '2022-05-17', NULL,5);

INSERT INTO detail_commande(produit_id,commande_id,quantite_article,prix_vente,prix_hors_taxe,tva_produit) VALUES
(4,4,8,98,90,8),
(3,4,6,799,750,49),
(8,4,2,444,400,44),
(71,1,1,1887.2,1500,387.2),
(63,1,3,255.3,200,55.3),
(61,3,1,55.2,50,5.2),
(53,3,3,2318.4,1900,418.4),
(29,3,2,5790,4825,965),
(24,6,9,58,78,8),
(39,6,2,269,224,45),
(60,6,1,23.2,15,8.2),
(2,2,2,419,400,19),
(12,2,3,4290,4000,290),
(50,2,1,1500,1200,300),
(48,5,1,555,462,93),
(19,5,2,109,95,14),
(31,5,3,10890,9075,1815);

INSERT INTO livraison (commande_id,date,adresse,cp,ville) VALUES
(1,NOW(),'39193 Lulu Way Apt. 696', '80287', 'Baton Rouge'),
(2,NOW(),'1292 Waterview Lane','88005','Las Cruces'),
(3,NOW(),'3083 Norma Lane', '71201', 'Monroe'),
(4,NOW(),'4968 Marie Street', '21217', 'Baltimore'),
(5,NOW(),'3570 County Line Road', '33602', 'Tampa'),
(6,'2023-05-03','1728 Meadowview Drive', '22821', 'Dayton');

INSERT INTO livraison_produit (produit_id,livraison_id,quantite_produit_livre) VALUES 
(4,4,8),
(3,4,6),
(8,4,2),
(71,1,1),
(63,1,3),
(61,3,1),
(53,3,3),
(29,3,2),
(24,6,9),
(39,6,2),
(60,6,1),
(2,2,2),
(12,2,3),
(50,2,1),
(48,5,1),
(19,5,2),
(31,5,3);