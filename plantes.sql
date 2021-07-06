drop database if exists Plantes;
CREATE DATABASE Plantes;
USE Plantes;

CREATE TABLE Plantes_clients (
id_cli int(11) NOT NULL AUTO_INCREMENT,
nom_cli varchar(100),
prenom_cli varchar(100),
adr_cli varchar(300),
cp_cli int(5),
ville_cli varchar(100),
date_crea_cli date,
isdeleted_cli tinyint(1),
email_cli varchar(45),
mpasse_cli varchar(20),
tel_cli varchar(20),
CONSTRAINT pk_plantes_clients PRIMARY KEY (id_cli)
);


CREATE TABLE Plantes_produits(
id_prod int(11) NOT NULL AUTO_INCREMENT,
libelle_court_prod varchar(300),
libelle_long_prod varchar(300),
chemin_photo_prod varchar(300),
isdeleted_prod tinyint(1),
date_crea_prod date,
quantite_prod int(10),
message_prod varchar(100),
date_derniere_commande date,
CONSTRAINT pk_id_prod PRIMARY KEY(id_prod)
);

CREATE TABLE Plantes_commande(
id_comm int(11) NOT NULL AUTO_INCREMENT,
id_clients_comm int(11),
date_comm date,
montant_comm decimal(11,2),
isdeleted_comm tinyint(1),
date_validation date,
CONSTRAINT ck_id_comm PRIMARY KEY(id_comm)
);

CREATE TABLE Plantes_detail_commande(
id_detail_DC int(11) NOT NULL  AUTO_INCREMENT,
id_comm_DC int(11),
id_produit_DC int(11),
Qte_DC int(11),
date_crea_DC date,
is_deleted_DC int(11),
CONSTRAINT ck_id_detail_DC PRIMARY KEY (id_detail_DC),
FOREIGN KEY fk_id_comm_DC (id_comm_DC) REFERENCES Plantes_commande(id_comm)

);

CREATE TABLE Plantes_paiement(
id_paie int(11) NOT NULL AUTO_INCREMENT,
date_paie date,
date_traitement_paie date,
date_validation_paie date,
id_comm_paie int(11),
CONSTRAINT id_paie PRIMARY KEY (id_paie),
FOREIGN KEY ck_id_comm_paie (id_comm_paie) REFERENCES Plantes_commande(id_comm)
);

CREATE TABLE Plantes_prix(
id_prix int(11) NOT NULL AUTO_INCREMENT,
date_debutVal_prix date,
date_finVal_prix date,
isdeleted tinyint(1),
id_produit_prix int(11),
prix_prix decimal(10,0),
CONSTRAINT id_prix PRIMARY KEY (id_prix),
FOREIGN KEY ck_id_produit_prix(id_produit_prix) REFERENCES Plantes_produits(id_prod)
);

CREATE TABLE Plantes_users_admin(
id_user int(6) NOT NULL AUTO_INCREMENT,
nom_user varchar(50),
prenom_user varchar(50),
pseudo_user varchar(50),
mp_user varchar(50),
conn_date_user date,
CONSTRAINT id_user PRIMARY KEY (id_user)
);

delimiter |
CREATE TRIGGER message_produit AFTER INSERT ON Plantes_detail_commande
FOR EACH ROW
BEGIN
	UPDATE Plantes_produits SET message_prod = 'produit commandé',
	date_derniere_commande= NOW()
	WHERE id_prod =NEW.id_produit_DC;
END;
|
delimiter ;

drop procedure if exists nouvel_cmd;
delimiter |
create procedure nouvel_cmd ( id_cli int(11), mont_comm DECIMAL(11,2))
begin
insert into plantes_commande (id_clients_comm,date_comm,montant_comm) values (id_cli,now(),mont_comm);
END;
 |
delimiter ;

drop procedure if exists nouveau_paiement;
delimiter |
create procedure nouveau_paiement( datePaie date, dateTraitement_paie date, dateValidation_paie date,idComm int(11))
begin
insert into plantes_paiement (date_paie, date_traitement_paie, date_validation_paie, id_comm) values (datePaie, dateTraitement_paie, dateValidation_paie,idComm);
END;
 |
delimiter ;