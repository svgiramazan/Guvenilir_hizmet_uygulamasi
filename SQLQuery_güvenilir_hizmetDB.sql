-- Kullan�c� Tablosu
CREATE TABLE Kullanici(
    kullanici_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    kullanici_ad VARCHAR(50) NOT NULL,
    kullanici_soyad VARCHAR(50) NOT NULL,
    kullanici_email VARCHAR(75) NOT NULL,
    kullanici_sifre VARCHAR(50) NOT NULL,
    kullanici_tel VARCHAR(75) NOT NULL,
    kullanici_adres VARCHAR(100)
);
-- Hizmet Kategorisi Tablosu
CREATE TABLE Hizmetkategorisi(
    hizmetkategorisi_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    hizmetkategorisi_ad VARCHAR(50) NOT NULL
);

-- Hizmet Sa�lay�c� Tablosu
CREATE TABLE Hizmetsaglayici (
    hizmetsaglayici_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    hizmetsaglayici_ad VARCHAR(50) NOT NULL,
    hizmetkategorisi_id INT NOT NULL,
    hizmetsaglayici_email VARCHAR(75) NOT NULL,
    hizmetsaglayici_tel VARCHAR(75) NOT NULL,
    hizmetsaglayici_adres VARCHAR(100),
    FOREIGN KEY (hizmetkategorisi_id) REFERENCES hizmetkategorisi(hizmetkategorisi_id)
);

-- Hizmet �cretleri Tablosu
CREATE TABLE hizmetucretleri (
    hizmetkategorisi_id INT NOT NULL,
    hizmetsaglayici_id INT NOT NULL,
    ucret DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (hizmetkategorisi_id, hizmetsaglayici_id),
    FOREIGN KEY (hizmetkategorisi_id) REFERENCES Hizmetkategorisi(hizmetkategorisi_id),
    FOREIGN KEY (hizmetsaglayici_id) REFERENCES hizmetsaglayici(hizmetsaglayici_id)
);

-- Rezervasyon Tablosu
CREATE TABLE rezervasyon (
    rezervasyon_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    kullanici_id INT ,
    hizmetsaglayici_id INT,
    tarih DATE,
    rezervasyon_adres NVARCHAR(255) NOT NULL,
    FOREIGN KEY (kullanici_id) REFERENCES kullanici(kullanici_id),
    FOREIGN KEY (hizmetsaglayici_id) REFERENCES hizmetsaglayici(hizmetsaglayici_id)
);

-- De�erlendirme Tablosu
CREATE TABLE degerlendirme(
    degerlendirme_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT, 
    hizmetsaglayici_id INT,
    puan TINYINT,
    yorum VARCHAR(100),
    FOREIGN KEY (kullanici_id) REFERENCES kullanici(kullanici_id),
    FOREIGN KEY (hizmetsaglayici_id) REFERENCES hizmetsaglayici(hizmetsaglayici_id)
);

-- Kullan�c�lar Tablosuna Veri Ekleme
INSERT INTO kullanici (kullanici_ad, kullanici_soyad, kullanici_email, kullanici_sifre, kullanici_tel, kullanici_adres) VALUES 
('Ay�e', 'Ak', 'ayse@example.com', 'ayse123', '5534567890', 'Mamak/ANKARA'),
('Ali', 'Dursun', 'ali@example.com', 'ali123', '5534567899', 'Sel�uklu/KONYA'),
('Buse', 'K���k', 'buse@example.com', 'buse123', '5534567888', 'Beyo�lu/�STANBUL'),
('Berkay', 'Emin', 'berkay@example.com', 'berkay123', '5534567777', '�orlu/TEK�RDA�'),
('Zeynep', 'Sar�', 'zeynep@example.com', 'zeynep123', '5534566666', '�ankaya/ANKARA'),
('Gonca', 'G�l', 'gonca@example.com', 'gonca123', '5534555555', 'Kaman/KIR�EH�R'),
('�smail', 'Er', 'ismail@example.com', 'ismail123', '5534444444', 'Meram/KONYA'),
('Dilara', 'A��k', 'dilos@example.com', 'dilos123', '5534444478', 'Atakum/SAMSUN'),
('�mran', 'Al', 'umran@example.com', 'umran123', '5577444478', '�enkaya/ERZURUM'),
('Ey�p', 'Emir', 'eyup@example.com', 'eyup123', '5576644478', '�aban�z�/�ANKIRI'),
('Ahmet', 'Aslan', 'ahmet@example.com', 'ahmet123', '5577444999', 'Fethiye/Mu�la'),
('Nisa','Su','nisa@example.com', 'nisa123', '5576664999', 'Bayat/�orum'),
('Mehmet','Kara','mehmet@example.com', 'mehmet123', '5511664999', 'Ala�ehir/MAN�SA'),
('Zehra','Masum','zehra@example.com', 'zehra123', '5511664779', 'Pamukkale/DEN�ZL�'),
('Kerem','Y�lmaz','kerem@example.com', 'kerem123', '5518864779', 'Ceyhan/ADANA');

-- Hizmet Kategorileri Tablosuna Veri Ekleme
INSERT INTO hizmetkategorisi (hizmetkategorisi_ad) VALUES
('Ev Temizli�i'),
('Bah�e Temizli�i'),
('Ta��mac�l�k'),
('Evcil Hayvan'),
('Boyama'),
('Sa�l�k'),
('Tadilat'),
('Organizasyon'),
('�zel Ders'),
('Bebek Bak�m�'),
('Oto Bak�m'),
('Spor E�itimi'),
('Emlak��'),
('Foto�raf ve Video'),
('Ara� Kiralama');

-- Hizmet Sa�lay�c�lar� Tablosuna Veri Ekleme
INSERT INTO hizmetsaglayici (hizmetsaglayici_ad, hizmetkategorisi_id, hizmetsaglayici_email, hizmetsaglayici_tel, hizmetsaglayici_adres)
VALUES 
('Temizlik A.�.', 1, 'temizlik@ornek.com', '5551234567', 'Pamukkale/DEN�ZL�'),
('Profesyonel Temizlik', 1, 'prof.temiz@example.com', '5557891234', 'Beyo�lu/�STANBUL'),
('Bah�e Bak�m Hizmetleri', 2, 'bahce@example.com', '5551112233', 'Meram/KONYA'),
('Bah�e D�zenleme', 2, 'bahceduzen@example.com', '5557778899', '�enkaya/ERZURUM'),
('�ehir Nakliyat', 3, 'nakliyat@example.com', '5554445576', 'Kaman/KIR�EH�R'),
('�ehirleraras� Ta��ma', 3, 'sehirlerarasi@example.com', '5554445466', '�aban�z�/�ANKIRI'),
('Kedi Oteli', 4, 'kedioteli@example.com', '5554445466', '�ankaya/ANKARA'),
('Veterinerlik', 4, 'veterinerlik@example.com', '5554445411', 'Kaman/KIR�EH�R'),
('Mobilya Boya', 5, 'mobilyaboya@example.com', '5550112233', 'Meram/KONYA'),
('Ah�ap Boya', 5, 'ahsapboya@example.com', '5550445566', 'Beyo�lu/�STANBUL'),
('Diyetisyen', 6, 'diyetisyen@example.com', '5557775566', 'Atakum/SAMSUN'),
('Psikolog', 6, 'psikolog@example.com', '5557775544', 'Ceyhan/ADANA'),
('Tesisat Tadilat', 7, 'tesisattadilat@example.com', '5556663344', 'Sel�uklu/KONYA'),
('Elektrik Tadilat', 7, 'elektriktadilat@example.com', '5556661122', 'Beyo�lu/�STANBUL'),
('D���n Organizasyon', 8, 'dugun@example.com', '5553331122', '�aban�z�/�ANKIRI'),
('Parti Organizasyon', 8, 'parti@example.com', '5553322111', 'Fethiye/Mu�la'),
('Matematik �zel Ders', 9, 'matematik@example.com', '5552299775', 'Pamukkale/DEN�ZL�'),
('Fizik �zel Ders', 9, 'fizik@example.com', '5551188225', 'Ala�ehir/MAN�SA'),
('Bebek Bak�c�s�', 10, 'bebek@example.com', '5555544332', 'Atakum/SAMSUN'),
('Oyun Ablas�', 10, 'oyun@example.com', '5555544331', 'Bayat/�orum'),
('Oto Servis', 11, 'otoservis@example.com', '5554433221', '�orlu/TEK�RDA�'),
('Oto Y�kama', 11, 'otoyikama@example.com', '5554433220', 'Ceyhan/ADANA'),
('Fitness E�itmeni', 12, 'fitness@example.com', '5552211220', 'Ceyhan/ADANA'),
('Yoga E�itmeni', 12, 'yoga@example.com', '5552211221', 'Atakum/SAMSUN'),
('Gayrimenkul Dan��man�', 13, 'gayrimenkul@example.com', '5559911221', 'Pamukkale/DEN�ZL�'),
('Emlak Ofisi', 13, 'emlakofisi@example.com', '5559911222', '�orlu/TEK�RDA�'),
('D���n Foto�raf��s�', 14, 'dugunfoto@example.com', '5558899776', 'Beyo�lu/�STANBUL'),
('Do�um Foto�raf��s�', 14, 'dogumfoto@example.com', '5558899777', 'Beyo�lu/�STANBUL'),
('Ara� Kiralama', 15, 'arackiralama@example.com', '5556677889', 'Fethiye/Mu�la'),
('L�ks Ara� Kiralama', 15, 'luksarackiralama@example.com', '5556677888', 'Pamukkale/DEN�ZL�');

-- Hizmet �cretleri Tablosuna Veri Ekleme
INSERT INTO hizmetucretleri (hizmetkategorisi_id, hizmetsaglayici_id, ucret) VALUES
(1, 1, 150.00),
(1, 2, 180.00),
(2, 3, 200.00),
(2, 4, 250.00),
(3, 5, 500.00),
(3, 6, 600.00),
(4, 7, 50.00),
(4, 8, 80.00),
(5, 9, 100.00),
(5, 10, 120.00),
(6, 11, 200.00),
(6, 12, 220.00),
(7, 13, 300.00),
(7, 14, 350.00),
(8, 15, 400.00),
(8, 16, 450.00),
(9, 17, 80.00),
(9, 18, 90.00),
(10, 19, 70.00),
(10, 20, 60.00),
(11, 21, 150.00),
(11, 22, 130.00),
(12, 23, 110.00),
(12, 24, 120.00),
(13, 25, 400.00),
(13, 26, 500.00),
(14, 27, 300.00),
(14, 28, 350.00),
(15, 29, 500.00),
(15, 30, 600.00);


-- Rezervasyon Tablosuna Veri Ekleme
INSERT INTO rezervasyon (kullanici_id, hizmetsaglayici_id, tarih, rezervasyon_adres) VALUES
(1, 1, '2024-06-01', 'Mamak/ANKARA'),
(2, 3, '2024-06-02', 'Sel�uklu/KONYA'),
(3, 5, '2024-06-03', 'Beyo�lu/�STANBUL'),
(4, 7, '2024-06-04', '�orlu/TEK�RDA�'),
(5, 9, '2024-06-05', '�ankaya/ANKARA'),
(6, 11, '2024-06-06', 'Kaman/KIR�EH�R'),
(7, 13, '2024-06-07', 'Meram/KONYA'),
(8, 15, '2024-06-08', 'Atakum/SAMSUN'),
(9, 17, '2024-06-09', '�enkaya/ERZURUM'),
(10, 19, '2024-06-10', '�aban�z�/�ANKIRI'),
(11, 21, '2024-06-11', 'Fethiye/MU�LA'),
(12, 23, '2024-06-12', 'Bayat/�ORUM'),
(13, 25, '2024-06-13', 'Ala�ehir/MAN�SA'),
(14, 27, '2024-06-14', 'Pamukkale/DEN�ZL�'),
(15, 29, '2024-06-15', 'Ceyhan/ADANA');


-- De�erlendirme Tablosuna Veri Ekleme
INSERT INTO degerlendirme (kullanici_id, hizmetsaglayici_id, puan, yorum) VALUES
(1, 1, 5, 'M�kemmel hizmet!'),
(2, 3, 4, '�ok iyi.'),
(3, 5, 3, 'Fena de�il.'),
(4, 7, 4, 'G�zeldi.'),
(5, 9, 5, 'Harika!'),
(6, 11, 2, 'Pek memnun kalmad�m.'),
(7, 13, 5, '�ok be�endim.'),
(8, 15, 4, 'Gayet iyi.'),
(9, 17, 3, 'Ortalama.'),
(10, 19, 5, 'M�kemmeldi.'),
(11, 21, 2, 'Daha iyi olabilir.'),
(12, 23, 4, 'G�zel hizmet.'),
(13, 25, 3, '�dare eder.'),
(14, 27, 4, 'Ba�ar�l�.'),
(15, 29, 5, 'Harika bir deneyim.');



SELECT *FROM Kullanici

SELECT *FROM Hizmetkategorisi


SELECT *FROM Hizmetsaglayici


SELECT *FROM hizmetucretleri

SELECT *FROM rezervasyon


SELECT *FROM degerlendirme



---tablo silme 
--DROP TABLE IF EXISTS rezervasyon;
--DROP TABLE IF EXISTS degerlendirme;
--DROP TABLE IF EXISTS hizmetucretleri;
--DROP TABLE IF EXISTS kullanici;
--DROP TABLE IF EXISTS hizmetsaglayici;
--DROP TABLE IF EXISTS hizmetkategorisi;


SELECT 
    hs.hizmetsaglayici_ad, 
    hk.hizmetkategorisi_ad, 
    AVG(d.puan) AS ortalama_puan
FROM 
    hizmetsaglayici hs
JOIN 
    degerlendirme d ON hs.hizmetsaglayici_id = d.hizmetsaglayici_id
JOIN 
    Hizmetkategorisi hk ON hs.hizmetkategorisi_id = hk.hizmetkategorisi_id
GROUP BY 
    hs.hizmetsaglayici_id, hs.hizmetsaglayici_ad, hk.hizmetkategorisi_ad
ORDER BY 
    ortalama_puan DESC;




	SELECT 
    k.kullanici_ad, 
    k.kullanici_soyad, 
    COUNT(r.rezervasyon_id) AS rezervasyon_sayisi
FROM 
    Kullanici k
JOIN 
    rezervasyon r ON k.kullanici_id = r.kullanici_id
GROUP BY 
    k.kullanici_id, k.kullanici_ad, k.kullanici_soyad
ORDER BY 
    rezervasyon_sayisi DESC;



	---M��terilerin En �ok Yapt��� Rezervasyon T�r�:
SELECT 
    k.kullanici_ad, 
    k.kullanici_soyad, 
    hk.hizmetkategorisi_ad AS en_cok_rezervasyon_turu,
    COUNT(r.rezervasyon_id) AS rezervasyon_sayisi
FROM 
    Kullanici k
JOIN 
    rezervasyon r ON k.kullanici_id = r.kullanici_id
JOIN 
    hizmetsaglayici hs ON r.hizmetsaglayici_id = hs.hizmetsaglayici_id
JOIN 
    Hizmetkategorisi hk ON hs.hizmetkategorisi_id = hk.hizmetkategorisi_id 
GROUP BY 
    k.kullanici_id, k.kullanici_ad, k.kullanici_soyad, hk.hizmetkategorisi_ad
ORDER BY 
    rezervasyon_sayisi DESC;


	--Hizmet Sa�lay�c�lar� ve Hizmet Kategorileri �le Birlikte �cretleri G�sterme:
SELECT 
    h.hizmetsaglayici_ad,
    hk.hizmetkategorisi_ad,
    hu.ucret
FROM 
    Hizmetsaglayici h
JOIN 
    Hizmetkategorisi hk ON h.hizmetkategorisi_id = hk.hizmetkategorisi_id
JOIN 
    hizmetucretleri hu ON h.hizmetsaglayici_id = hu.hizmetsaglayici_id
ORDER BY 
    h.hizmetsaglayici_ad;

	--Belirli Bir Kullan�c�n�n Yapt��� Rezervasyonlar ve Hizmet Sa�lay�c�lar�:
SELECT 
    k.kullanici_ad,
    k.kullanici_soyad,
    h.hizmetsaglayici_ad,
    hk.hizmetkategorisi_ad,
    r.tarih
FROM 
    rezervasyon r
JOIN 
    kullanici k ON r.kullanici_id = k.kullanici_id
JOIN 
    hizmetsaglayici h ON r.hizmetsaglayici_id = h.hizmetsaglayici_id
JOIN 
    Hizmetkategorisi hk ON h.hizmetkategorisi_id = hk.hizmetkategorisi_id
WHERE 
    k.kullanici_id = 5; 



	--belirlenen adresteki hizmet sa�lay�c�lar� bulmak i�in SP:

	--CREATE PROCEDURE adres(@adres varchar(50))
	--AS
	--SELECT * FROM hizmetsaglayici WHERE hizmetsaglayici_adres=@adres

	--exec adres 'Ceyhan/ADANA'


	--Hizmet katagorisindeki hizmet sa�lay�c�lar�n ortalama fiyat�:

--CREATE PROCEDURE HizmetKategoriOrtalamaUcret
--    @HizmetKategoriID INT
--AS
--BEGIN
--    SELECT 
--        hk.hizmetkategorisi_ad,
--        AVG(hu.ucret) AS OrtalamaUcret
--    FROM 
--        hizmetucretleri hu
--    JOIN 
--        Hizmetkategorisi hk ON hu.hizmetkategorisi_id = hk.hizmetkategorisi_id
--    WHERE 
--        hu.hizmetkategorisi_id = @HizmetKategoriID
--    GROUP BY 
--        hk.hizmetkategorisi_ad;
--END;


--EXEC HizmetKategoriOrtalamaUcret @HizmetKategoriID = 5;


ALTER TABLE hizmetsaglayici
ADD ortalama_puan INT;  


CREATE TRIGGER PuanGuncelleme
ON degerlendirme
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @hizmetsaglayici_id INT;
    SELECT 
        @hizmetsaglayici_id = hizmetsaglayici_id
    FROM inserted;

    UPDATE Hizmetsaglayici
    SET ortalama_puan = (
        SELECT AVG(puan)
        FROM degerlendirme
        WHERE hizmetsaglayici_id = @hizmetsaglayici_id
    )
    WHERE hizmetsaglayici_id = @hizmetsaglayici_id;
END;

UPDATE degerlendirme
SET puan = 4
WHERE degerlendirme_id = 1;

SELECT hizmetsaglayici_ad, ortalama_puan
FROM hizmetsaglayici
WHERE hizmetsaglayici_id = 1;