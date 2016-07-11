----Intervalul mediu petrecut in parcare
SELECT SUM(dbo.Vizita.durata)/COUNT(dbo.Vizita.ID) AS IntervalMediuPetrecutInParcare
FROM dbo.Vizita