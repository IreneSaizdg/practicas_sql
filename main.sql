/*EJERCICIO 1: clientes de brasil ---------------------------------------------------*/
SELECT firstname, lastname 
FROM customers 
WHERE country='Brazil'


/*EJERCICIO 2: empleados que son agentes de ventas -----------------------------------*/
SELECT * 
FROM employees 
WHERE title='Sales Support Agent'


/*EJERCICIO 3: canciones de 'AC/DC' -----------------------------------*/
SELECT tracks.Name, albums.Title, artists.Name 
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.name = 'AC/DC'


/*EJERCICIO 4: campos de los clientes que no sean de USA: Nombre completo, ID, País -------*/
SELECT firstname, lastname, customerid, country
FROM customers
WHERE country NOT LIKE 'USA'


/*EJERCICIO 5: los empleados que son agentes de ventas: nombre completo, dirección(ciudad, estado y país) y email -------*/
SELECT firstname, lastname, employeeid, address, city, state, country, email
FROM employees
WHERE title= 'Sales Manager'


/*EJERCICIO 6: paises no repetidos a los que se han emitido facturas ------- */
SELECT DISTINCT billingcountry /*Distinct indica los distintos*/
FROM invoices 


/*EJERCICIO 7: estados de usa no repetidos de donde son los clientes y cuantos clientes hay en cada uno ----------------- */
SELECT DISTINCT 