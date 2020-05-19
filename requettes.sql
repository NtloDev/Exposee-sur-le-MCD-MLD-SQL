1 Donnez le numéro, le nom de tous les médecins ayant la spécialité S1 

SELECT num_medecin, nom_medecin 
FROM `medecin` 
WHERE specialite_medecin ="S1" 

2 Donnez les différentes spécialités. 

SELECT specialite_medecin 
FROM `medecin` 

3 Donnez le numéro, le nom et la date de naissance de tous les malades de sexe masculin par ordre croissant de l’âge. 

 SELECT num_malade, nom_malade, date_naissance_malade 
 FROM `malade` WHERE 
 sexe_malade="H" ORDER BY 
 date_naissance_malade ASC; 

4 Donnez le numéro, le nom et la date de naissance de tous les malades de sexe féminin dont l’adresse contient « p » par ordre croissant du nom. 

SELECT num_malade, nom_malade, date_naissance_malade 
FROM `malade` WHERE sexe_malade="F" 
AND lieu_naissance_malade LIKE '%P%' 
ORDER BY nom_malade ASC; 

5 Donnez le numéro, le nom et la date de naissance du malade ainsi que le numéro, la catégorie et le type de la chambre occupé par chaque malade. 

SELECT malade.num_malade, malade.nom_malade, malade.date_naissance_malade, chambre.num_chambre,
 chambre.category_chambre, chambre.type_chambre 
 FROM malade,chambre,occuper,lit 
 WHERE malade.num_malade=occuper.num_malade
 AND occuper.num_lit=lit.num_lit 
 AND chambre.num_chambre=lit.num_chambre; 
 
6 Donnez le numéro, le nom et la date de naissance du malade ainsi que le numéro et le des départements où le malade né le 22-4-2012 ont été internés.  

SELECT malade.num_malade, malade.nom_malade,malade.date_naissance_malade,interner.numdepartement,
departement.nom_departement 
FROM malade,interner,departement 
WHERE malade.num_malade=interner.num_malade 
AND departement.numdepartement=interner.numdepartement 
AND malade.date_naissance_malade="2012-04-22"

7 Donnez le numéro, le nom et la date de naissance de tous les malades suivis par le médecin M3 

SELECT malade.num_malade, malade.nom_malade, malade.date_naissance_malade 
FROM malade,medecin,suivre 
WHERE malade.num_malade=suivre.num_medecin 
AND medecin.nom_medecin='M3' 
AND medecin.num_medecin=suivre.num_medecin; 

8 Donnez le numéro, le nom et la date de naissance de tous les malades suivis par le médecin M3 et qui ont occupé le lit numéro 21. 
SELECT malade.num_malade, malade.nom_malade, malade.date_naissance_malade 
FROM malade,medecin,suivre,occuper 
WHERE malade.num_malade=suivre.num_medecin 
AND medecin.nom_medecin='M' 
AND medecin.num_medecin=suivre.num_medecin 
AND occuper.num_lit='23'; 

9 Donnez le numéro, le nom et la date de naissance de tous les malades qui ont occupé le lit numéro 21. 

SELECT malade.num_malade, malade.nom_malade, malade.date_naissance_malade 
FROM malade,occuper 
WHERE occuper.num_lit='21'; 

10 Donnez le numéro, le nom et la date de naissance du malade ainsi que le numéro et la date pour le suivit de l’évolution du malade numéro 11. 

SELECT malade.num_malade, malade.nom_malade, malade.date_naissance_malade,interner.numEv,
interner.date_Ev 
FROM malade,interner 
WHERE malade.num_malade='1' 
AND malade.num_malade=interner.num_malade; 

11 Donnez le nombre de malades internés dans chaque département. 

SELECT COUNT(interner.num_malade) 
FROM interner 
GROUP BY interner.numdepartement; 

12 Donnez le numéro, le nom, l’adresse du malade ainsi que le nom du médecin de tous les malades suivis par un médecin du département D2. 
 
SELECT malade.num_malade, malade.nom_malade, malade.adress_malade, medecin.nom_medecin 
FROM malade,medecin,interner 
WHERE malade.num_malade=interner.num_malade 
AND medecin.numdepartement='2' 
AND interner.numdepartement='2'; 

13 Donnez le numéro, le nom, l’adresse de tous les malades qui ont été internés au mois de février ou au mois de décembre. 

SELECT malade.num_malade, malade.nom_malade, malade.adress_malade 
FROM malade WHERE malade.date_naissance_malade 
LIKE '%%%%-12-%%' 
OR malade.date_naissance_malade 
LIKE '%%%%-02-%%'; 

14 Donnez toutes les informations de la chambre ayant accueilli le plus de malade. 

SELECT chambre.num_chambre,chambre.category_chambre,chambre.type_chambre , 
COUNT(lit.num_chambre)as plusoccuper 
FROM lit, chambre WHERE lit.num_chambre=chambre.num_chambre 
group by lit.num_chambre 
ORDER BY plusoccuper DESC LIMIT 1 

15 Donnez toutes les informations du département ayant accueilli le plus de malade. 

SELECT departement.numdepartement,departement.nom_departement, 
COUNT(interner.numdepartement)as plusoccuper 
FROM interner, departement WHERE interner.numdepartement=departement.numdepartement 
group by interner.numdepartement 
ORDER BY plusoccuper DESC LIMIT 1 

16 Donnez toutes les informations de la chambre ayant accueilli le plus de malade. 

SELECT chambre.num_chambre,chambre.category_chambre,chambre.type_chambre , 
COUNT(lit.num_chambre)as plusoccuper 
FROM lit, chambre 
WHERE lit.num_chambre=chambre.num_chambre 
group by lit.num_chambre 
ORDER BY plusoccuper 
DESC LIMIT 1 

17 Donnez toutes les informations du médecin ayant suivi le plus de malade. 

SELECT medecin.num_medecin,medecin.nom_medecin, medecin.specialite_medecin, medecin.numdepartement ,
COUNT(suivre.num_medecin)as plusoccuper 
FROM suivre, medecin 
WHERE suivre.num_medecin=medecin.num_medecin 
group by suivre.num_medecin 
ORDER BY plusoccuper 
DESC LIMIT 1 

18 Donnez le numéro, le nom et la date de naissance du malade, le numéro de la chambre et le numéro du lit des patients qui son suivi par un médecin avec la spécialité S2 

SELECT malade.num_malade,malade.nom_malade,malade.adress_malade,
malade.sexe_malade,malade.date_naissance_malade,malade.lieu_naissance_malade
FROM malade malade 
JOIN occuper on malade.num_malade=occuper.num_malade
JOIN LIT ON occuper.num_lit=lit.num_lit 
JOIN chambre ON chambre.num_chambre=lit.num_chambre 
JOIN suivre suivre ON malade.num_malade=suivre.num_malade 
JOIN medecin ON suivre.num_medecin=medecin.num_medecin 
where medecin.specialite_medecin='S2' 

19 Donnez l’évolution du premier malade qui à été interné au département D2 en juin 2020 

SELECT interner.num_malade,interner.numdepartement,interner.numEv,interner.date_Ev 
FROM interner,departement 
WHERE interner.numdepartement =departement.numdepartement 
AND year(interner.date_Ev)=2020 
and MONTH(interner.date_Ev)=6 
ORDER BY interner.date_Ev LIMIT 1 


20	Donnez le numéro des lits qui n’ont pas été occupés au mois de mars. 

SELECT DISTINCT lit.num_lit 
FROM LIT, occuper 
WHERE LIT.num_lit 
NOT IN (SELECT occuper.num_lit 
FROM occuper,interner 
WHERE MONTH(interner.date_Ev)=3) 


