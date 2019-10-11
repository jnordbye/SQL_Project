CREATE VIEW CustomersInWAORCA
AS 
SELECT Id, FirstName, LastName, Address, City, State, USZipCode
FROM Customers
WHERE State IN (N'WA', N'OR', N'CA');
GO