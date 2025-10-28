USE DivisionPolitica;
GO

-- Crear tabla Moneda
CREATE TABLE Moneda (
    Id INT IDENTITY(1,1) NOT NULL,
    CONSTRAINT pkMoneda_Id PRIMARY KEY (Id),
    Nombre VARCHAR(100) NOT NULL,
    Sigla VARCHAR(100) NOT NULL,
    Imagen VARCHAR(100) NOT NULL
);


ALTER TABLE Pais
ADD IdMoneda INT  NULL;

ALTER TABLE Pais
ADD CONSTRAINT fkPais_IdMoneda FOREIGN KEY (IdMoneda)
REFERENCES Moneda(Id);

INSERT INTO Moneda (Nombre, Sigla, Imagen)
SELECT DISTINCT Moneda, '', ''
FROM Pais
WHERE Moneda IS NOT NULL;

UPDATE Pais
SET IdMoneda = M.Id
FROM Pais P
JOIN Moneda M ON P.Moneda = M.Nombre;

ALTER TABLE Pais
DROP COLUMN Moneda;

select * from Pais


ALTER TABLE Pais
ADD Mapa varchar(100) NULL,
    Bandera varchar(100)  NULL



