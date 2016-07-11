
DECLARE @Start datetime2
DECLARE @End datetime2
DECLARE @AllDates TABLE(Day datetime2, NumarMasini int );
DECLARE @dCounter datetime2
DECLARE @numar int

SET @Start=(SELECT MIN(dbo.Vizita.DataSosire) AS First FROM dbo.Vizita)
SET @End=(SELECT MAX(dbo.Vizita.DataPlecare) AS Last FROM dbo.Vizita)
SET @dCounter = @Start
DECLARE @Nr int 


WHILE  @dCounter<=@End
BEGIN
SET @Nr=( SELECT  COUNT(dbo.Vizita.ID) 
FROM dbo.Vizita
WHERE
 (CAST(@dCounter AS DATE)=CAST(dbo.Vizita.DataSosire AS date)))

INSERT INTO @AllDates (Day, NumarMasini) 
VALUES (@dCounter,@Nr);
SET @dCounter=DATEADD(Day,1,@dCounter)
END


SElECT *
FROM @AllDates

--SELECT TOP(1) Day AS CeaMaiAglomerataZiDinAN,NumarMasini
--FROM @AllDates
SELECT SUM(NumarMasini)/COUNT(DAY) AS MediaMasinilorPeZi
FROM @AllDates