/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ProductId]
      ,[ProductName]
      ,[Category]
      ,[ExpirationDate]
      ,[Price]
  FROM [Market].[Mkt].[Product]