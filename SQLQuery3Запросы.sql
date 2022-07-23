SELECT capacity FROM hall_row WHERE hall_id_h = 3 AND number = 2

SELECT * FROM film, screening WHERE 
time > '20210601 11:35:00 AM' AND screening.film_id = id_film;

SELECT film.name, hall.id_hall, screening.time FROM film, screening, hall WHERE 
time > '20210601 7:35:00 PM' AND screening.film_id = film.id_film 
AND screening.hall_id = hall.id_hall AND hall.id_hall = 2;

SELECT film.name, hall.name, screening.time FROM film, screening, hall WHERE 
time > '20210101 11:00:00 AM' AND screening.film_id = film.id_film 
AND screening.hall_id = hall.id_hall ORDER BY hall.name, screening.time;

SELECT count(*) FROM film

SELECT * FROM film 
ORDER BY name 
OFFSET 3 ROWS
FETCH NEXT 2 ROWS ONLY

SELECT * FROM film ORDER BY name

SELECT * FROM film ORDER BY name DESC

SELECT * FROM film WHERE name LIKE 'А%'

SELECT * FROM film WHERE id_film IN(1, 20)

SELECT max(cost) FROM tickets

SELECT id_film, name, description FROM film

SELECT * FROM screening 
INNER JOIN film ON film_id = id_film

SELECT film_id, COUNT(*) as nor FROM screening
GROUP BY film_id
HAVING COUNT(*)=(SELECT max(nor) FROM 
(SELECT film_id,COUNT(*) as nor FROM screening GROUP BY film_id) screening)


SELECT name, description_hall title FROM hall
INNER JOIN hall_row on id_hall=hall_id_h 

SELECT name, description_hall FROM hall AS p 
LEFT JOIN hall_row AS s on id_hall=id_hall_row

SELECT number, capacity, category, description FROM hall_row
INNER JOIN hall on hall_id_h  = id_hall

SELECT * FROM film WHERE name=(SELECT name FROM film WHERE name= 'Балто')

SELECT * FROM hall
INNER JOIN hall_row on id_hall =hall_id_h

SELECT * FROM hall AS p 
LEFT JOIN hall_row AS s on id_hall=id_hall_row

CREATE VIEW screening_view  
AS   
SELECT film.name, hall.description_hall, screening.time FROM film, screening, hall WHERE 
time > '20210101 11:00:00 AM' AND screening.film_id = film.id_film 
AND screening.hall_id = hall.id_hall 
GO  
 SELECT * FROM screening_view
 