DROP DATABASE if EXISTS BlueVillage;

CREATE DATABASE BlueVillage;

USE BlueVillage;

CREATE TABLE client(
   id INT AUTO_INCREMENT NOT NULL,
   categorie VARCHAR(255) NOT NULL ,
   adresse_livraison VARCHAR(255) NOT NULL ,
   cp_livraison VARCHAR(255) NOT NULL ,
   ville_livraison VARCHAR(255) NOT NULL ,
   adresse_facture VARCHAR(255) NOT NULL ,
   cp_facture VARCHAR(255) NOT NULL ,
   ville_facture VARCHAR(255) NOT NULL ,
   mode_paiement VARCHAR(255) NOT NULL ,
   reduction DECIMAL(5,2)  DEFAULT NULL ,
   coefficient DECIMAL(5,2) NOT NULL  ,
   numero_siret VARCHAR(255) DEFAULT NULL  ,
   nom VARCHAR(255) NOT NULL ,
   prenom VARCHAR(255) NOT NULL ,
   nom_entreprise VARCHAR(255) DEFAULT NULL ,
   PRIMARY KEY(id)
);
CREATE INDEX numero_client ON client(id);

CREATE TABLE users(
   id INT AUTO_INCREMENT NOT NULL,
   client_id INT,
   email VARCHAR(255) NOT NULL,
   roles LONGTEXT NOT NULL,
   password VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(client_id) REFERENCES client(id)
);

CREATE TABLE commercial(
   id INT AUTO_INCREMENT NOT NULL ,
   nom VARCHAR(255) NOT NULL ,
   prenom VARCHAR(255) NOT NULL ,
   adresse VARCHAR(255) NOT NULL,
   cp VARCHAR(255) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   email VARCHAR(255) NOT NULL,
   telephone VARCHAR(255) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE fournisseur(
   id INT AUTO_INCREMENT NOT NULL,
   nom VARCHAR(255) NOT NULL,
   adresse varchar(255) NOT NULL,
   cp VARCHAR(255) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   email varchar(255) NOT NULL,
   telephone varchar(255) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE commande(
   id INT AUTO_INCREMENT NOT NULL ,
   date DATE NOT NULL ,
   adresse_livraison VARCHAR(255) NOT NULL  ,
   cp_livraison VARCHAR(255) NOT NULL,
   ville_livraison VARCHAR(255) NOT NULL,
   adresse_facture VARCHAR(255) NOT NULL ,
   cp_facture VARCHAR(255) NOT NULL,
   ville_facture VARCHAR(255) NOT NULL,
   date_facture DATE NOT NULL,
   total DECIMAL(19,4) NOT NULL ,
   client_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(client_id) REFERENCES client(id)
);
CREATE INDEX numero_commande ON commande(id);

CREATE TABLE livraison(
   id INT AUTO_INCREMENT NOT NULL ,
   commande_id INT NOT NULL,
   date DATE NOT NULL ,
   adresse VARCHAR(255) NOT NULL,
   cp VARCHAR(255) NOT NULL,
   ville VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(commande_id) REFERENCES commande(id)
);

CREATE TABLE rubrique(
   id INT AUTO_INCREMENT NOT NULL ,
   nom VARCHAR(255) NOT NULL ,
   rubrique_id INT DEFAULT NULL,
   photo VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(rubrique_id) REFERENCES rubrique(id)
);
CREATE INDEX rubrique ON rubrique(nom);

CREATE TABLE produit(
   id INT AUTO_INCREMENT NOT NULL,
   libelle_court VARCHAR(255) NOT NULL,
   libelle_long VARCHAR(255) NOT NULL,
   photo VARCHAR(255) NOT NULL,
   prix_achat DECIMAL(19,4) NOT NULL,
   prix_hors_taxe DECIMAL(19,4) NOT NULL,
   rubrique_id INT NOT NULL,
   fournisseur_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(rubrique_id) REFERENCES rubrique(id),
   FOREIGN KEY(fournisseur_id) REFERENCES fournisseur(id)
);
CREATE INDEX nom_produit ON produit(libelle_court);


CREATE TABLE livraison_produit(
   id INT AUTO_INCREMENT NOT NULL ,
   produit_id INT NOT NULL,
   livraison_id INT NOT NULL,
   quantite_produit_livre INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(produit_id) REFERENCES produit(id),
   FOREIGN KEY(livraison_id) REFERENCES livraison(id)
);


CREATE TABLE commercial_client(
   client_id INT NOT NULL ,
   commercial_id INT NOT NULL ,
   PRIMARY KEY(commercial_id, client_id),
   FOREIGN KEY(client_id) REFERENCES client(id),
   FOREIGN KEY(commercial_id) REFERENCES commercial(id)
);

CREATE TABLE detail_commande(
   id INT AUTO_INCREMENT NOT NULL,
   commande_id INT NOT NULL ,
   produit_id INT NOT NULL ,
   quantite_article INT NOT NULL ,
   prix_vente DECIMAL(19,4) NOT NULL ,
   prix_hors_taxe DECIMAL(19,4) NOT NULL ,
   tva_produit DECIMAL(5,2)  NOT NULL ,
   PRIMARY KEY(id),
   FOREIGN KEY(produit_id) REFERENCES produit(id),
   FOREIGN KEY(commande_id) REFERENCES commande(id)
);
