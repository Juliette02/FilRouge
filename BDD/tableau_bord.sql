/*******************************************************************Formaliser des requêtes à l'aide du langage SQL***********************************************************************************/

-- Chiffre d'affaires mois par mois pour une année sélectionnée

SELECT DATE_FORMAT(commande.date, '%M %Y') AS 'Mois',  SUM(prix_vente*quantite_article) AS 'CA' 
FROM detail_commande
JOIN commande ON detail_commande.commande_id = commande.id
WHERE year(commande.date) = 2022
GROUP BY MONTH(commande.date);

-- Chiffre d'affaires généré pour un fournisseur

SELECT fournisseur.nom AS 'Fournisseur', SUM(prix_vente*quantite_article) AS 'CA' 
FROM detail_commande
JOIN produit ON detail_commande.produit_id = produit.id
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id
GROUP BY fournisseur.nom;

-- TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)

SELECT libelle_court AS 'Référence', libelle_long AS 'Nom du produit', quantite_article AS 'Quantité Commandée', fournisseur.nom AS 'Nom du Fournisseur'
FROM detail_commande
JOIN produit ON detail_commande.produit_id = produit.id
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id
GROUP BY detail_commande.produit_id
ORDER BY quantite_article desc
LIMIT 10;

-- TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)

SELECT libelle_court AS 'Référence', libelle_long AS 'Nom du Produit', SUM(produit.prix_hors_taxe-produit.prix_achat) AS 'Marge', fournisseur.nom AS 'Fournisseur'
FROM detail_commande
JOIN commande ON detail_commande.commande_id = commande.id
JOIN produit ON detail_commande.produit_id = produit.id
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id
WHERE YEAR(commande.date) = 2022
GROUP BY detail_commande.id
ORDER BY SUM(produit.prix_hors_taxe-produit.prix_achat) DESC
LIMIT 10;

-- Top 10 des clients en nombre de commandes ou chiffre d'affaires

SELECT client.nom AS 'Nom du Client',  SUM(prix_vente*quantite_article) AS 'CA'
FROM detail_commande
JOIN commande ON detail_commande.commande_id = commande.id
JOIN client ON commande.client_id = client.id
GROUP BY client.id
ORDER BY CA DESC
LIMIT 10;

-- Répartition du chiffre d'affaires par type de client

SELECT categorie AS 'Catégorie du Client',  SUM(prix_vente*quantite_article) AS 'CA'
FROM detail_commande
JOIN commande ON detail_commande.commande_id = commande.id
JOIN client ON commande.client_id = client.id
GROUP BY client.categorie;

-- Nombre de commandes en cours de livraison.

SELECT count(livraison.id) AS 'Nombre de commande en cours de livraison'
FROM livraison
WHERE livraison.date > NOW();

/*****************************************************************************************************Programmer des procédures stockées sur le SGBD*********************************************************************/

DELIMITER |

CREATE PROCEDURE CommandeLivraison()
BEGIN 
	SELECT count(commande.id) AS 'Nombre de commande en cours de livraison'
	FROM livraison
	WHERE livraison.date > NOW();
END |

DELIMITER ;

CALL CommandeLivraison();

/*.........................................*/

DELIMITER |

CREATE PROCEDURE DélaiMoyLiv()
BEGIN 
	SELECT ROUND(AVG(DATEDIFF(livraison.date, date_facture))) AS 'Délai moyen date_facture et date_livraison'
	FROM commande
	JOIN livraison ON commande.id = livraison.commande_id;
END |

DELIMITER ;

CALL DélaiMoyLiv();

/***************************************************************************************************Gérer les vues*****************************************************************************/

-- Créez une vue correspondant à la jointure Produits - Fournisseurs

CREATE VIEW v_Pro_Fou
AS
SELECT produit.id,produit.libelle_court,produit.libelle_long,produit.photo,produit.prix_achat,produit.prix_hors_taxe,produit.rubrique_id,produit.fournisseur_id,fournisseur.nom,fournisseur.adresse,fournisseur.email,fournisseur.telephone
FROM produit
JOIN fournisseur ON produit.fournisseur_id = fournisseur.id;

-- Créez une vue correspondant à la jointure Produits - Rubrique/Sous rubrique

CREATE VIEW v_Pro_Rub
AS
SELECT produit.id,produit.libelle_court,produit.libelle_long,produit.photo,produit.prix_achat,produit.prix_hors_taxe,produit.fournisseur_id,produit.rubrique_id,rubrique.nom
FROM produit
JOIN rubrique ON rubrique.id = produit.rubrique_id;