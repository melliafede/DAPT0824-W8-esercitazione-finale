-- 1 - Verificare che i campi definiti come PK siano univoci.
-- In altre parole, scrivi una query per determinare l’univocità dei valori di ciascuna PK (una query per tabella implementata).
SELECT COUNT(DISTINCT ID) AS NumeroID_Distinti, COUNT(ID) AS NumeroID_Totali from Product;
SELECT COUNT(DISTINCT ID) AS NumeroID_Distinti, COUNT(ID) AS NumeroID_Totali from Region;
SELECT COUNT(DISTINCT ID) AS NumeroID_Distinti, COUNT(ID) AS NumeroID_Totali from Category;
SELECT COUNT(DISTINCT ID) AS NumeroID_Distinti, COUNT(ID) AS NumeroID_Totali from Sales;

-- 2 - Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto,
-- la categoria del prodotto, il nome dello stato, il nome della regione di vendita e un campo booleano valorizzato
-- in base alla condizione che siano passati più di 180 giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)
SELECT Sales.CodiceDocumento AS CodiceDocumento, Sales.Date AS DataVendita, Product.Name AS NomeProdotto, Category.Name AS CategoriaProdotto,
State.Name AS NomeStato, Region.Name AS NomeRegioneVendita, IF(DATEDIFF(CURRENT_DATE, Sales.Date) > 180, "TRUE", "FALSE") AS PiuDi180Giorni
FROM Category
JOIN Product ON Category.ID = Product.CategoryID
JOIN Sales ON Sales.ProductID = Product.ID
JOIN Region ON Region.ID = Sales.RegionID
JOIN State ON State.RegionID = Region.ID;

-- 3 - Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito.
-- (ogni valore della condizione deve risultare da una query e non deve essere inserito a mano).
-- Nel result set devono comparire solo il codice prodotto e il totale venduto.

SELECT Product.ID AS CodiceProdotto, COUNT(Sales.ProductID) AS TotaleVendite
FROM Product 
JOIN Sales ON Product.ID = Sales.ProductID
GROUP BY Product.ID
HAVING TotaleVendite > (SELECT AVG(SalesCount) AS AverageSales
FROM (SELECT COUNT(*) AS SalesCount FROM Sales WHERE Date >= (SELECT MAX(Date) - INTERVAL 1 YEAR FROM Sales) GROUP BY ProductID) AS DerivedTable)
ORDER BY TotaleVendite DESC;

-- 4 - Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno
-- Espone l'elenco dei soli prodotti venduti
SELECT ID AS CodiceProdotto, Name AS NomeProdotto
FROM Product
WHERE Product.ID IN (SELECT ProductID FROM Sales);

SELECT Product.ID AS CodiceProdotto, Product.Name AS NomeProdotto, YEAR(Sales.Date) AS Anno, SUM(Product.Price) AS FatturatoTotale
FROM Product JOIN Sales ON Product.ID = Sales.ProductID -- Inner join restituisce solo i prodotti che compaiono in sales, quindi solo i prodotti venduti
GROUP BY CodiceProdotto, Anno
ORDER BY CodiceProdotto;

-- 5 - Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente.
SELECT State.Name AS NomeStato, YEAR(Sales.Date) AS Anno, SUM(Product.Price) AS FatturatoTotale
FROM Product JOIN Sales ON Product.ID = Sales.ProductID
JOIN Region ON Sales.RegionID = Region.ID
JOIN State ON State.RegionID = Region.ID
GROUP BY NomeStato, Anno
ORDER BY Anno, FatturatoTotale DESC;

-- 6 - Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?
SELECT NomeCategoria, NumeroVendite
FROM (
	SELECT Category.Name AS NomeCategoria, COUNT(Sales.ProductID) AS NumeroVendite
	FROM Category JOIN Product ON Category.ID = Product.CategoryID
	JOIN Sales ON Product.ID = Sales.ProductID
	GROUP BY NomeCategoria
) AS VenditePerCategoria
WHERE NumeroVendite = (SELECT MAX(NumeroVendite) FROM (
	SELECT COUNT(Sales.ProductID) AS NumeroVendite
    FROM Category JOIN Product ON Category.ID = Product.CategoryID
    JOIN Sales ON Product.ID = Sales.ProductID
    GROUP BY Category.ID
) AS Subquery);

-- 7 - Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
-- Primo approccio
SELECT ID AS CodiceProdotto, Name AS NomeProdotto
FROM Product
WHERE ID NOT IN (SELECT ProductID FROM Sales);

-- Secondo approccio
SELECT Product.ID AS CodiceProdotto, Product.Name AS NomeProdotto
FROM Product LEFT JOIN Sales ON Product.ID = Sales.ProductID
WHERE Sales.CodiceDocumento IS NULL;

-- 8 - Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili (codice prodotto, nome prodotto, nome categoria)
CREATE VIEW ProdottiCategorie AS
SELECT Product.ID AS CodiceProdotto, Product.Name AS NomeProdotto, Category.Name AS NomeCategoria
FROM Product JOIN Category ON Product.CategoryID = Category.ID;
 
-- 9 - Creare una vista per le informazioni geografiche
CREATE VIEW InfoGeografiche AS
SELECT State.Name AS NomeStato, Region.Name AS NomeRegione
FROM State JOIN Region ON State.RegionID = Region.ID;
