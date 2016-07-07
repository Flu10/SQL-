---Am afisat dintr-un view , numele persoanelor care au Judetul 
--din Adresa de
----domiciliu cu codul ='BR'

CREATE VIEW Countryview
AS

SELECT p.Nume,p.Prenume,J.CodJudet, A.Strada
 
FROM  dbo.JudetRO J  ,
dbo.AdresaRO A,  dbo.Persoana p,
 dbo.NomenclatorAdresa NA,LocalitateRO L
WHERE p.Adresa=NA.NomenID AND AdresaDomiciliu=A.AdresaID
AND A.Localitate=L.LocalitateID AND A.Judet=J.JudetID AND L.Judet=J.JudetID
GROUP BY p.Nume ,p.Prenume,J.CodJudet ,A.Strada

SELECT Nume
FROM Countryview
WHERE CodJudet='BR'
