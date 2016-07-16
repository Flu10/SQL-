
			IF EXISTS (SELECT * FROM sys.procedures WHERE name='ChangePrice')
DROP PROCEDURE [Mkt].[ChangePrice]
GO
		
CREATE PROCEDURE Mkt.ChangePrice(@reduceProductId int)
AS
BEGIN
UPDATE Mkt.Product
SET Mkt.Product.Price=(Mkt.Product.Price-0.5*Mkt.Product.Price )
WHERE Mkt.Product.ProductId=@reduceProductId
 
SELECT *
FROM Mkt.Product
END
GO
--DECLARE @reduceProductId int
--SET @reduceProductId= 4
--EXEC [Mkt].[ChangePrice] @reduceProductId

--UPDATE Mkt.Product
--SET Mkt.Product.Price=(Mkt.Product.Price-0.5*Mkt.Product.Price )
--SELECT *
--FROM Mkt.Product

DECLARE @reduceProductId int
SET @reduceProductId= 4
exec [Mkt].[ChangePrice] @reduceProductId