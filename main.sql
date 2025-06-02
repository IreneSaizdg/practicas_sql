/*PRIMERA PARTE*/

/*EJERCICIO 1: -------------------------------------------------------------
    clientes de brasil */
SELECT firstname, lastname 
FROM customers 
WHERE country='Brazil'


/*EJERCICIO 2: -------------------------------------------------------------
    empleados que son agentes de ventas */
SELECT * 
FROM employees 
WHERE title='Sales Support Agent'


/*EJERCICIO 3: -------------------------------------------------------------
    canciones de 'AC/DC' */
SELECT tracks.Name, albums.Title, artists.Name 
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.name = 'AC/DC'


/*EJERCICIO 4: -------------------------------------------------------------
    campos de los clientes que no sean de USA: Nombre completo, ID, País */
SELECT firstname, lastname, customerid, country
FROM customers
WHERE country NOT LIKE 'USA'


/*EJERCICIO 5: -------------------------------------------------------------
    los empleados que son agentes de ventas: nombre completo, dirección(ciudad, estado y país) y email */
SELECT firstname, lastname, employeeid, address, city, state, country, email
FROM employees
WHERE title= 'Sales Manager'


/*EJERCICIO 6: -------------------------------------------------------------
    paises no repetidos a los que se han emitido facturas */
SELECT DISTINCT billingcountry /*Distinct indica los distintos*/
FROM invoices 


/*EJERCICIO 7: -------------------------------------------------------------
    estados de USA no repetidos de donde son los clientes y cuantos clientes hay en cada uno */
SELECT state, COUNT(customerid) /*cuenta cuantos customer id hay en cada grupo(estado)*/
FROM customers /*Extrae de la tabla customers*/ 
WHERE state IS NOT NULL /*Trae sólo los no nulos*/
GROUP BY state /*Agrupa según la columna state*/


/*EJERCICIO 8: -------------------------------------------------------------
    cuantos artículos tiene la factura 37 */
SELECT COUNT(*)  /*Selecciona la cuenta de articulos totales*/
FROM invoice_items
WHERE invoiceid = 37;


/*EJERCICIO 9: -------------------------------------------------------------
    cuántas canciones tiene 'AC/DC' */
SELECT COUNT(*) AS NumeroCanciones /*El AS permite dar un nombre a la columna*/
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.name = 'AC/DC'


/*EJERCICIO 10: -------------------------------------------------------------
    cuántos artículos tiene cada factura */
SELECT invoiceid, COUNT(*)
FROM invoice_items
GROUP BY invoiceid


/*EJERCICIO 11: -------------------------------------------------------------
    cuántas facturas hay de cada país */
SELECT billingcountry, COUNT(*) AS 'Numero de facturas por pais'
FROM invoices
GROUP BY billingcountry;


/*EJERCICIO 12: -------------------------------------------------------------
    cuántas facturas ha habido en 2009 y 2011 */
SELECT '2009' AS Año, COUNT(*) AS NumeroFacturas
FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2009' /*strftime(formato, fecha) -> Método específico para trabajar con fechas de sqlite*/

UNION ALL /*Junta resultados de varias consultas*/

SELECT '2011' AS Año, COUNT(*) AS NumeroFacturas
FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2011';


/*EJERCICIO 13: -------------------------------------------------------------
    cuántas facturas ha habido entre 2009 y 2011 */
SELECT COUNT(*) AS NumeroFacturasEntre2009y2011
FROM invoices
WHERE strftime('%Y', InvoiceDate) BETWEEN '2009' AND '2011' /*strftime(formato, fecha) -> Método específico para trabajar con fechas de sqlite*/

    
/*EJERCICIO 14: -------------------------------------------------------------
    cuántos clientes hay de España y de Brasil */
SELECT country, COUNT(*) AS numeroClientes
FROM customers
WHERE country IN ('Brazil','Spain') /*WHERE country = 'Brazil' OR country = 'Spain'*/
GROUP BY country; /*Separa el count por los paises indicados*/





/*SEGUNDA PARTE*/

/*EJERCICIO 1: -------------------------------------------------------------
    Facturas de Clientes de Brasil, Nombre del cliente, Id de factura, fecha de la factura y el país de la factura*/
SELECT customers.firstname, invoices.CustomerId, invoices.InvoiceDate, invoices.BillingCountry
FROM invoices /*Indica la tabla de origen*/
JOIN customers ON invoices.CustomerId = customers.CustomerId /*Indica la tabla con la que se fusionará -> cada cliente con sus facturas. */
WHERE invoices.BillingCountry = 'Brazil'


/*EJERCICIO 2: -------------------------------------------------------------
    Obtén cada factura asociada a cada agente de ventas con su nombre completo*/
SELECT 
  invoices.InvoiceId,
  employees.FirstName AS EmployeesFirstName, 
  employees.LastName AS EmployeesLastName
FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId /* Une la tabla de clientes con la de facturas, emparejando el ID del cliente en las dos tablas */
JOIN employees ON customers.SupportRepId = employees.EmployeeId


/*EJERCICIO 3: -------------------------------------------------------------
    Obtén el nombre del cliente, el país, el nombre del agente y el total*/
SELECT 
  invoices.InvoiceId,
  invoices.Total,
  employees.FirstName || ' ' || employees.LastName AS EmployeeName,
  customers.FirstName || ' ' || customers.LastName AS CustomerName,
  customers.Country
FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId 
JOIN employees ON customers.SupportRepId = employees.EmployeeId


/*EJERCICIO 4: -------------------------------------------------------------
    Obtén cada artículo de la factura con el nombre de la canción*/



/*EJERCICIO 5: -------------------------------------------------------------
    Muestra todas las canciones con su nombre, formato, álbum y género*/
SELECT 
 	tracks.Name AS TrackName,
 	media_types.Name AS MediaType,
 	albums.Title AS AlbumTitle,
 	genres.Name AS GenreName
FROM tracks
JOIn media_types ON tracks.MediaTypeId = media_types.MediaTypeId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN genres ON tracks.GenreId = genres.GenreId;    



/*EJERCICIO 6: -------------------------------------------------------------
    Cuántas canciones hay en cada playlist*/


/*EJERCICIO 7: -------------------------------------------------------------
    Cuánto ha vendido cada empleado*/


/*EJERCICIO 8: -------------------------------------------------------------
    ¿Quién ha sido el agente de ventas que más ha vendido en 2009?*/


/*EJERCICIO 9: -------------------------------------------------------------
    ¿Cuáles son los 3 grupos que más han vendido?*/