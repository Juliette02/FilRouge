/*******************************************************************Formaliser des requêtes à l'aide du langage SQL***********************************************************************************/

-- Chiffre d'affaires mois par mois pour une année sélectionnée

SELECT MONTH(dat_cmd) AS 'Mois', SUM(pri_ven*qte_art) AS 'CA' 
FROM DetailsCommande
JOIN Commande ON DetailsCommande.id_cmd = Commande.id_cmd
WHERE year(dat_cmd) = 2022
GROUP BY MONTH(dat_cmd);

-- Chiffre d'affaires généré pour un fournisseur

SELECT nom_fou AS 'Fournisseur', SUM(pri_ven*qte_art) AS 'CA' 
FROM DetailsCommande
JOIN Produit ON DetailsCommande.id_pro = Produit.id_pro
JOIN Fournisseur ON Produit.id_fou = Fournisseur.id_fou
GROUP BY nom_fou;

-- TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)

SELECT lib_cou_pro AS 'Référence', lib_lon_pro AS 'Nom du produit', qte_art AS 'Quantité Commandée', nom_fou AS 'Nom du Fournisseur'
FROM DetailsCommande
JOIN Produit ON DetailsCommande.id_pro = Produit.id_pro
JOIN Fournisseur ON Produit.id_fou = Fournisseur.id_fou
GROUP BY DetailsCommande.id_pro
ORDER BY qte_art desc
LIMIT 10;

-- TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)

SELECT lib_cou_pro AS 'Référence', lib_lon_pro AS 'Nom du Produit', SUM(pri_ht_pro-pri_ach_pro) AS 'Marge', nom_fou AS 'Fournisseur'
FROM DetailsCommande
JOIN Commande ON DetailsCommande.id_cmd = Commande.id_cmd
JOIN Produit ON DetailsCommande.id_pro = Produit.id_pro
JOIN Fournisseur ON Produit.id_fou = Fournisseur.id_fou
WHERE YEAR(dat_cmd) = 2022
GROUP BY DetailsCommande.id_pro
ORDER BY SUM(pri_ach_pro-pri_ht_pro) DESC
LIMIT 10;

-- Top 10 des clients en nombre de commandes ou chiffre d'affaires

SELECT nom_cli AS 'Nom du Client',  SUM(pri_ven*qte_art) AS 'CA'
FROM DetailsCommande
JOIN Commande ON DetailsCommande.id_cmd = Commande.id_cmd
JOIN Client ON Commande.id_cli = Client.id_cli
GROUP BY Client.id_cli
ORDER BY CA DESC
LIMIT 10;

-- Répartition du chiffre d'affaires par type de client

SELECT cat_cli AS 'Catégorie du Client',  SUM(pri_ven*qte_art) AS 'CA'
FROM DetailsCommande
JOIN Commande ON DetailsCommande.id_cmd = Commande.id_cmd
JOIN Client ON Commande.id_cli = Client.id_cli
GROUP BY Client.cat_cli;

-- Nombre de commandes en cours de livraison.

SELECT count(id_cmd) AS 'Nombre de commande en cours de livraison'
FROM Livraison
WHERE dat_liv > NOW();

/*****************************************************************************************************Programmer des procédures stockées sur le SGBD*********************************************************************/

DELIMITER |

CREATE PROCEDURE CommandeLivraison()
BEGIN 
	SELECT count(id_cmd) AS 'Nombre de commande en cours de livraison'
	FROM Livraison
	WHERE dat_liv > NOW();
END |

DELIMITER ;

CALL CommandeLivraison();

/*.........................................*/

DELIMITER |

CREATE PROCEDURE DélaiMoyLiv()
BEGIN 
	SELECT ROUND(AVG(DATEDIFF(dat_liv, dat_fac))) AS 'Délai moyen dat_fac et dat_liv'
	FROM Commande
	JOIN Livraison ON Commande.id_cmd = Livraison.id_cmd
	JOIN Facture ON Commande.id_cmd = Facture.id_cmd;
END |

DELIMITER ;

CALL DélaiMoyLiv();

/***************************************************************************************************Gérer les vues*****************************************************************************/

-- Créez une vue correspondant à la jointure Produits - Fournisseurs

CREATE VIEW v_Pro_Fou
AS
SELECT id_pro,lib_cou_pro,lib_lon_pro,ref_fou_pro,pho_pro,pri_ach_pro,pri_ht_pro,ctg_pro,id_rub,id_liv,Produit.id_fou,nom_fou,adr_fou,ema_fou,tel_fou
FROM Produit
JOIN Fournisseur ON Produit.id_fou = Fournisseur.id_fou;

-- Créez une vue correspondant à la jointure Produits - Catégorie/Sous catégorie

CREATE VIEW v_Pro_Rub
AS
SELECT id_pro,lib_cou_pro,lib_lon_pro,ref_fou_pro,pho_pro,pri_ach_pro,pri_ht_pro,ctg_pro,Produit.id_rub,id_liv,id_fou,nom_rub,id_rub_1
FROM Produit
JOIN Rubrique ON Produit.id_rub = Rubrique.id_rub;