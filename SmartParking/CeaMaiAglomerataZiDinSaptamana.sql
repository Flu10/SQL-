DECLARE @DayWeek TABLE (ID int ,DayWeek varchar(20) , NumarMasini int)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (1,'Monday',NULL)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (2,'Tuesday',NULL)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (3,'Wednesday',NULL)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (4,'Thursday',NULL)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (5,'Friday',NULL)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (6,'Saturday',NULL)
INSERT INTO @DayWeek(ID,DayWeek,NumarMasini)
VALUES (7,'Sunday',NULL)


DECLARE @i int 
SET @i=1
DECLARE @Nr int
WHILE @i<=7
BEGIN
SET @Nr=( SELECT  COUNT(dbo.Vizita.ID) 
FROM dbo.Vizita
WHERE
 (SELECT DayWeek FROM @DayWeek WHERE ID=@i)=DATENAME(dw,dbo.Vizita.DataSosire))
 UPDATE @DayWeek 
 SET NumarMasini=@Nr
 WHERE ID=@i
 SET @i=@i+1
 END


 SELECT DayWeek AS CeaMaiAglomerataZiDinSaptamana

FROM @DayWeek

WHERE NumarMasini=( SELECT MAX(NumarMasini) FROM @DayWeek)





