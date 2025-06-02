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