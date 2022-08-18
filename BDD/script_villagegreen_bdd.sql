DROP DATABASE if EXISTS VillageGreen;

CREATE DATABASE VillageGreen;

USE VillageGreen;

CREATE TABLE Client(
   id_cli INT AUTO_INCREMENT NOT NULL,
   cat_cli VARCHAR(255) NOT NULL ,
   adr_liv_cli VARCHAR(255) NOT NULL ,
   adr_fac_cli VARCHAR(255) NOT NULL ,
   mod_pai_cli VARCHAR(255) NOT NULL ,
   red_cli DECIMAL(5,2)  DEFAULT NULL ,
   coe_cli DECIMAL(5,2) NOT NULL  ,
   num_sir_cli VARCHAR(255) DEFAULT NULL  ,
   nom_cli VARCHAR(255) NOT NULL ,
   pre_cli VARCHAR(255) NOT NULL ,
   nom_ent_cli VARCHAR(255) DEFAULT NULL ,
   PRIMARY KEY(id_cli)
);
CREATE INDEX Num_Cli ON Client(id_cli);


CREATE TABLE Commercial(
   id_com INT AUTO_INCREMENT NOT NULL ,
   nom_com VARCHAR(255) NOT NULL ,
   pre_com VARCHAR(255) NOT NULL ,
   adr_com VARCHAR(255) NOT NULL,
   ema_com VARCHAR(255) NOT NULL,
   tel_com VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_com)
);

CREATE TABLE Catalogue(
   id_cat INT NOT NULL ,
   sto_cat INT NOT NULL ,
   nvx_pro_cat VARCHAR(255) DEFAULT NULL ,
   des_pro_cat VARCHAR(255) DEFAULT NULL ,
   PRIMARY KEY(id_cat)
);

CREATE TABLE Fournisseur(
   id_fou INT AUTO_INCREMENT NOT NULL ,
   nom_fou VARCHAR(255) NOT NULL ,
   adr_fou varchar(255) not null,
   ema_fou varchar(255) not null,
   tel_fou varchar(255) not null
   PRIMARY KEY(id_fou)
);

CREATE TABLE Commande(
   id_cmd INT AUTO_INCREMENT NOT NULL ,
   dat_cmd DATE NOT NULL ,
   adr_liv_cmd VARCHAR(255) NOT NULL  ,
   adr_fac_cmd VARCHAR(255) NOT NULL ,
   tot_cmd DECIMAL(19,4) NOT NULL ,
   id_cli INT NOT NULL,
   PRIMARY KEY(id_cmd),
   FOREIGN KEY(id_cli) REFERENCES Client(id_cli)
);
CREATE INDEX Num_Cmd ON Commande(id_cmd);

CREATE TABLE Livraison(
   id_liv INT AUTO_INCREMENT NOT NULL ,
   qte_pro_liv INT NOT NULL ,
   dat_liv DATE NOT NULL ,
   id_cmd INT NOT NULL,
   adr_liv VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_liv),
   FOREIGN KEY(id_cmd) REFERENCES Commande(id_cmd)
);

CREATE TABLE Facture(
   id_fac INT AUTO_INCREMENT NOT NULL ,
   dat_fac DATE NOT NULL ,
   id_cli INT NOT NULL,
   id_cmd INT NOT NULL,
   adr_fac varchar(255) not null,
   PRIMARY KEY(id_fac),
   FOREIGN KEY(id_cli) REFERENCES Client(id_cli),
   FOREIGN KEY(id_cmd) REFERENCES Commande(id_cmd)
);

CREATE TABLE Rubrique(
   id_rub INT AUTO_INCREMENT NOT NULL ,
   nom_rub VARCHAR(255) NOT NULL ,
   id_rub_1 INT DEFAULT NULL,
   PRIMARY KEY(id_rub),
   FOREIGN KEY(id_rub_1) REFERENCES Rubrique(id_rub)
);
CREATE INDEX rub ON Rubrique(nom_rub);

CREATE TABLE Produit(
   id_pro INT AUTO_INCREMENT NOT NULL ,
   lib_cou_pro VARCHAR(255) NOT NULL ,
   lib_lon_pro VARCHAR(255) NOT NULL ,
   ref_fou_pro VARCHAR(255) NOT NULL ,
   pho_pro VARCHAR(255) NOT NULL ,
   pri_ach_pro DECIMAL(19,4) NOT NULL ,
   pri_ht_pro DECIMAL(19,4) NOT NULL ,
   ctg_pro VARCHAR(255) NOT NULL ,
   id_rub INT NOT NULL ,
   id_liv INT DEFAULT NULL ,
   id_fou INT NOT NULL ,
   PRIMARY KEY(id_pro),
   FOREIGN KEY(id_rub) REFERENCES Rubrique(id_rub),
   FOREIGN KEY(id_liv) REFERENCES Livraison(id_liv),
   FOREIGN KEY(id_fou) REFERENCES Fournisseur(id_fou),
);
CREATE INDEX nom_pro ON Produit(lib_cou_pro);


CREATE TABLE ClientCommercial(
   id_cli INT NOT NULL ,
   id_com INT NOT NULL ,
   PRIMARY KEY(id_cli, id_com),
   FOREIGN KEY(id_cli) REFERENCES Client(id_cli),
   FOREIGN KEY(id_com) REFERENCES Commercial(id_com)
);

CREATE TABLE DetailsCommande(
   id_pro INT NOT NULL ,
   id_cmd INT NOT NULL ,
   qte_art INT NOT NULL ,
   pri_ven DECIMAL(19,4) NOT NULL ,
   pri_ht DECIMAL(19,4) NOT NULL ,
   tva_pro DECIMAL(5,2)  NOT NULL ,
   PRIMARY KEY(id_pro, id_cmd),
   FOREIGN KEY(id_pro) REFERENCES Produit(id_pro),
   FOREIGN KEY(id_cmd) REFERENCES Commande(id_cmd)
);
