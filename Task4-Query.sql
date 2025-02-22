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
HAVING TotaleVendite > AVG(COUNT(Sales.ProductID));


 

