CREATE DATABASE DWH
GO

USE DWH
GO

-- Tabela wymiaru: Typ Przychodu
CREATE TABLE dTypPrzychodu (
    dTPr_id INT IDENTITY(1,1) PRIMARY KEY,
    dTPr_nazwa VARCHAR(20) NOT NULL
);

-- Tabela wymiaru: Kategoria Wydatku
CREATE TABLE dKategoriaWydatku (
    dKWy_id INT IDENTITY(1,1) PRIMARY KEY,
    dKWy_nazwa VARCHAR(20) NOT NULL,
    dKWy_typ VARCHAR(20) NOT NULL
);

-- Tabela wymiaru: Czas
CREATE TABLE dCzas (
    dCz_id INT IDENTITY(1,1) PRIMARY KEY,  
    dCz_dzien DATE NOT NULL,             
    dCz_miesiac DATE NOT NULL,            
    dCz_rok INT NOT NULL,                
    dCz_dzien_tygodnia INT NOT NULL,      
    dCz_nazwa_dt VARCHAR(50) NOT NULL    
);

-- Tabela wymiaru: Miejscowoœæ
CREATE TABLE dMiejscowosc (
    dM_id INT IDENTITY(1,1) PRIMARY KEY,
    dM_nazwa VARCHAR(30),
    dM_typ_miejscowosci VARCHAR(20)
);

-- Tabela wymiaru: Forma P³atnoœci
CREATE TABLE dFormaPlatnosci (
    dFP_id INT IDENTITY(1,1) PRIMARY KEY,
    dFP_nazwa VARCHAR(20)
);

-- Tabela wymiaru: Osoba
CREATE TABLE dOsoba (
    dOs_id INT IDENTITY(1,1) PRIMARY KEY,
    dOs_id_indeks VARCHAR(10),
    dOs_nazwa VARCHAR(80),
    dOs_plec CHAR(1),
    dOs_data_ur DATE,
    dOs_rocznik AS YEAR([dOs_data_ur]),
    dOs_wiek AS YEAR(GETDATE()) - YEAR([dOs_data_ur]),
    dOs_miejscowosc_miesz VARCHAR(30),
    dOs_miejscowosc_studia VARCHAR(30),
    dOs_typ_miejscowosc_miesz VARCHAR(30),
    dOs_typ_miejscowosc_studia VARCHAR(30)
);

-- Tabela wymiaru: Kategoria Czasu
CREATE TABLE dKategoriaCzasu (
    dKCz_id INT IDENTITY(1,1) PRIMARY KEY,
    dKCz_nazwa VARCHAR(20) NOT NULL,
	dKCz_typ VARCHAR(20) NOT NULL
);

-- Tabela faktów: Przychód
CREATE TABLE fPrzychod (
    fPR_id INT IDENTITY(1,1) PRIMARY KEY,
    fPR_dOs_id INT,
    fPR_dTPR_id INT,
    fPR_dCz_id INT,
    fPR_kwota DECIMAL(9, 2),
    fPR_czas_trwania DECIMAL(9, 2),
    fPR_liczba INT,
    FOREIGN KEY (fPR_dOs_id) REFERENCES dOsoba(dOs_id),
    FOREIGN KEY (fPR_dTPR_id) REFERENCES dTypPrzychodu(dTPr_id),
    FOREIGN KEY (fPR_dCz_id) REFERENCES dCzas(dCz_id)
);

-- Tabela faktów: Wydatek
CREATE TABLE fWydatek (
    fW_id INT IDENTITY(1,1) PRIMARY KEY,
    fWy_dCz_id INT,
    fWy_dOs_id INT,
    fWy_dKWy_id INT,
    fWy_dMi_id INT,
    fWy_dFP_id INT,
    fW_kwota DECIMAL(9, 2),
    fW_liczba INT,
    FOREIGN KEY (fWy_dOs_id) REFERENCES dOsoba(dOs_id),
    FOREIGN KEY (fWy_dKWy_id) REFERENCES dKategoriaWydatku(dKWy_id),
    FOREIGN KEY (fWy_dFP_id) REFERENCES dFormaPlatnosci(dFP_id),
    FOREIGN KEY (fWy_dMi_id) REFERENCES dMiejscowosc(dM_id),
    FOREIGN KEY (fWy_dCz_id) REFERENCES dCzas(dCz_id)
);

-- Tabela faktów: Czas Spêdzony
CREATE TABLE fCzasSpedzony (
    fCS_id INT IDENTITY(1,1) PRIMARY KEY,             
    fCS_dOs_id INT,                         
    fCS_dCz_id INT,
    fCS_dMi_id INT,
    fCS_dKCz_id INT,   
    fCS_czas_trwania DECIMAL(5, 2),              
    FOREIGN KEY (fCS_dOs_id) REFERENCES dOsoba(dOs_id),
    FOREIGN KEY (fCS_dCz_id) REFERENCES dCzas(dCz_id),
    FOREIGN KEY (fCS_dMi_id) REFERENCES dMiejscowosc(dM_id),
    FOREIGN KEY (fCS_dKCz_id) REFERENCES dKategoriaCzasu(dKCz_id)
);
