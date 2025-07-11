-- 1 --

INSERT INTO dTypPrzychodu (dTPr_nazwa)
VALUES
    ('Zwrot kosztów'),
    ('Wynajem'),
    ('Wynagrodzenie'),
    ('Stypendium'),
	('Zwrot podatku'),
	('Darowizna'),
	('Darowizna'),
	('Sprzeda¿'),
	('Inne');

-- 2 --

INSERT INTO dFormaPlatnosci (dFP_nazwa)
VALUES
    ('gotówka'),
    ('przelew'),
    ('karta p³atnicza'),
    ('polecenie zap³aty'),
    ('inna');

-- 3 --

DECLARE @data_poczatek date;
DECLARE @data_koniec date;
DECLARE @data date;
DECLARE @i int;
SET @data_poczatek = '2019-06-30';
SET @data_koniec = '2020-06-30';
SET @data = @data_poczatek;
SET @i = 1;

WHILE @data <= @data_koniec
	BEGIN
		INSERT INTO [dbo].[dCzas]
				   ([dCz_id]
				   ,[dCz_dzien]
				   ,[dCz_miesiac]
				   ,[dCz_rok]
				   ,[dCz_dzien_tygodnia]
				   ,[dCz_nazwa_dt])
			 VALUES
				   (@i
				   ,@data
				   ,cast(SUBSTRING ( CAST( @data AS varchar(10)) ,1, 8 )+'01' AS date)
				   ,cast(SUBSTRING ( CAST( @data AS varchar(10)) ,1, 4 ) AS int)
				   ,DATEPART(dw,@data)
				   ,DATENAME(weekday,@data))
		;
		SET @data = DATEADD(d,1,@data);
		SET @i = @i + 1;
	END;
GO

SELECT * FROM [dbo].[dCzas]
GO

SET IDENTITY_INSERT dbo.dCzas ON
