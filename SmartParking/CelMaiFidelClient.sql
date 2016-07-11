CREATE VIEW wv_fidel as
Select  COUNT(*) AS C,M.Numar
FROM dbo.Vizita V,dbo.Masini M
WHERE V.MasinaID=M.ID 
GROUP BY M.Numar 

SELECT TOP(1) Numar AS CelMaiFidelClient
FROM wv_fidel


