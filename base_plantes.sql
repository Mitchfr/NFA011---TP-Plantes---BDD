insert into plantes_clients values (1,'Dupont','Didier','12 rue de Lille','59000','LILLE','2019-03-04','0','dupont@aol.com','1234','03.37.87.34.28'); 
insert into plantes_clients values (2,'Anderson','Dean','12675 Hill\'s avenue','62837','San franGohelle','2019-01-01','0','anderson@orange.com','1234','06.17.84.34.15');
insert into plantes_clients values (3,'Roczen','Ken','272 rue de l\'Allemagne','87654','Berlin','2019-05-04','0','Ken@free.fr','1234','03.11.87.31.08');
insert into plantes_clients values (4,'Tomac','Elie','98 rue du Colorado','17987','Tucson','2015-10-04','0','eli@att.com','1234','07.17.87.24.23');
insert into plantes_clients values (5,'Ferrandis','Dylan','25 rue de Yam','83000','Avignon','2019-08-04','0','Dylan@sfr.fr','1234','03.11.87.04.44');

insert into plantes_prix values(1,'2017-06-06','2019-01-14','0',"2",'26.00');
INSERT INTO plantes_produits  VALUES ('1', 'Ficus', 'Ficusorotorus', 'C:\\CNAM\\NFA019- Projet systeme d\\\'information Java', '0', '2016-2-19', '10', NULL, '2020-03-02');

insert into plantes_commande (id_clients_comm,date_comm,montant_comm,date_validation)values(2,'2017-06-06','50.20','2017-06-12');
insert into plantes_commande (id_clients_comm,date_comm,montant_comm,date_validation)values(1,'2018-03-10','30.15','2018-04-12');
insert into plantes_commande (id_clients_comm,date_comm,montant_comm,date_validation)values(1,'2017-01-12','38.25','2017-04-12');
insert into plantes_commande (id_clients_comm,date_comm,montant_comm,date_validation)values(4,'2019-05-06','28.45','2019-06-24');

INSERT INTO plantes_detail_commande VALUES ('1', '1', '1', '5', '2020-03-15', '0');