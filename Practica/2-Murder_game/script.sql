/*Run this query to find the names of the tables in this database*/
SELECT name 
  FROM sqlite_master
 where type = 'table'

/*Run this query to find the structure of the `crime_scene_report` table*/
SELECT sql 
  FROM sqlite_master
 where name = 'crime_scene_report'

/*Seleccionar el reportaje de escenas de crimen que hayan sido el JAN.15,2018 en SQL City*/
SELECT *
FROM crime_scene_report
WHERE (date = 20180115) AND (city = "SQL City")

/*Encontrar a Annabel dentro de personas => ID: 16371*/
SELECT *
FROM person
WHERE ("address_street_name" = "Franklin Ave") AND name LIKE "%Annabel%"

/*La primera testigo vive en la última casa de "Nortwestern Dr" ==> Morty Schapiro	Northwestern Dr	4919*/
SELECT name, address_street_name, address_number
FROM person
WHERE address_street_name = "Northwestern Dr"
ORDER BY address_number DESC
LIMIT 1

/*Accedemos a los id de las personas ID: 14887*/
SELECT id, name
FROM person
WHERE ("address_street_name" = "Northwestern Dr") AND (name = "Morty Schapiro")

/*INTERVIEW DE ANNABEL =>	Vi ocurrir el asesinato y reconocí al asesino en mi 
gimnasio cuando estaba entrenando la semana pasada, el 9 de enero.*/
SELECT *
FROM interview
WHERE "person_id"=16371
  
/*INTERVIEW DE MORTY =>	Oí un disparo y luego vi a un hombre salir corriendo. 
Llevaba una bolsa de gimnasio "Get Fit Now". El número de socio empezaba por "48Z".
Solo los miembros Gold tienen esas bolsas. El hombre se subió a un coche con matrícula "H42W"*/  
SELECT *
FROM interview
WHERE "person_id"=14887 


/*Seleccionar dentro de get_fit_now_check_in ese día que empiece porc el numero de socio
 que nos dice Morty*/
SELECT *
FROM get_fit_now_check_in
WHERE (check_in_date = 20180109)AND (membership_id LIKE "%48Z%")


/*Seleccionar dentro de get_fit_now_member los que son gold y que su id empiece por 48Z
1)=>48Z7A	28819	Joe Germuska	20160305	gold
2)=>48Z55	67318	Jeremy Bowers	20160101	gold*/
SELECT *
FROM get_fit_now_member
WHERE (membership_status LIKE "%gold%" ) AND (id LIKE "%48Z%")

/*Sacar lod datos de persona de Joe y Jeremy para saber su matricula
joe=> license_id: 	173289*/
SELECT *
FROM person
WHERE name LIKE "Joe Germuska"

/*Sacar lod datos de persona de Joe y Jeremy para saber su matricula
jeremy=> license_id: 423327*/
SELECT *
FROM person
WHERE name LIKE "Jeremy Bowers"

/*Dentro de drivers_license aplicamos un filtro IN donde 
selecciona solo las filas donde la columna id tenga uno de esos dos valores.*/
SELECT *
FROM drivers_license
WHERE id IN(423327,173289)

/*SOLUCIÓN:423327 es la license_id de Jeremy Bowers */