-- Kullanýcý Tablosu
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

-- Hizmet Saðlayýcý Tablosu
CREATE TABLE Hizmetsaglayici (
    hizmetsaglayici_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    hizmetsaglayici_ad VARCHAR(50) NOT NULL,
    hizmetkategorisi_id INT NOT NULL,
    hizmetsaglayici_email VARCHAR(75) NOT NULL,
    hizmetsaglayici_tel VARCHAR(75) NOT NULL,
    hizmetsaglayici_adres VARCHAR(100),
    FOREIGN KEY (hizmetkategorisi_id) REFERENCES hizmetkategorisi(hizmetkategorisi_id)
);

-- Hizmet Ücretleri Tablosu
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

-- Deðerlendirme Tablosu
CREATE TABLE degerlendirme(
    degerlendirme_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    kullanici_id INT, 
    hizmetsaglayici_id INT,
    puan TINYINT,
    yorum VARCHAR(100),
    FOREIGN KEY (kullanici_id) REFERENCES kullanici(kullanici_id),
    FOREIGN KEY (hizmetsaglayici_id) REFERENCES hizmetsaglayici(hizmetsaglayici_id)
);

-- Kullanýcýlar Tablosuna Veri Ekleme
INSERT INTO kullanici (kullanici_ad, kullanici_soyad, kullanici_email, kullanici_sifre, kullanici_tel, kullanici_adres) VALUES 
('Ayþe', 'Ak', 'ayse@example.com', 'ayse123', '5534567890', 'Mamak/ANKARA'),
('Ali', 'Dursun', 'ali@example.com', 'ali123', '5534567899', 'Selçuklu/KONYA'),
('Buse', 'Küçük', 'buse@example.com', 'buse123', '5534567888', 'Beyoðlu/ÝSTANBUL'),
('Berkay', 'Emin', 'berkay@example.com', 'berkay123', '5534567777', 'Çorlu/TEKÝRDAÐ'),
('Zeynep', 'Sarý', 'zeynep@example.com', 'zeynep123', '5534566666', 'Çankaya/ANKARA'),
('Gonca', 'Gül', 'gonca@example.com', 'gonca123', '5534555555', 'Kaman/KIRÞEHÝR'),
('Ýsmail', 'Er', 'ismail@example.com', 'ismail123', '5534444444', 'Meram/KONYA'),
('Dilara', 'Açýk', 'dilos@example.com', 'dilos123', '5534444478', 'Atakum/SAMSUN'),
('Ümran', 'Al', 'umran@example.com', 'umran123', '5577444478', 'Þenkaya/ERZURUM'),
('Eyüp', 'Emir', 'eyup@example.com', 'eyup123', '5576644478', 'Þabanözü/ÇANKIRI'),
('Ahmet', 'Aslan', 'ahmet@example.com', 'ahmet123', '5577444999', 'Fethiye/Muðla'),
('Nisa','Su','nisa@example.com', 'nisa123', '5576664999', 'Bayat/Çorum'),
('Mehmet','Kara','mehmet@example.com', 'mehmet123', '5511664999', 'Alaþehir/MANÝSA'),
('Zehra','Masum','zehra@example.com', 'zehra123', '5511664779', 'Pamukkale/DENÝZLÝ'),
('Kerem','Yýlmaz','kerem@example.com', 'kerem123', '5518864779', 'Ceyhan/ADANA');

-- Hizmet Kategorileri Tablosuna Veri Ekleme
INSERT INTO hizmetkategorisi (hizmetkategorisi_ad) VALUES
('Ev Temizliði'),
('Bahçe Temizliði'),
('Taþýmacýlýk'),
('Evcil Hayvan'),
('Boyama'),
('Saðlýk'),
('Tadilat'),
('Organizasyon'),
('Özel Ders'),
('Bebek Bakýmý'),
('Oto Bakým'),
('Spor Eðitimi'),
('Emlakçý'),
('Fotoðraf ve Video'),
('Araç Kiralama');

-- Hizmet Saðlayýcýlarý Tablosuna Veri Ekleme
INSERT INTO hizmetsaglayici (hizmetsaglayici_ad, hizmetkategorisi_id, hizmetsaglayici_email, hizmetsaglayici_tel, hizmetsaglayici_adres)
VALUES 
('Temizlik A.Þ.', 1, 'temizlik@ornek.com', '5551234567', 'Pamukkale/DENÝZLÝ'),
('Profesyonel Temizlik', 1, 'prof.temiz@example.com', '5557891234', 'Beyoðlu/ÝSTANBUL'),
('Bahçe Bakým Hizmetleri', 2, 'bahce@example.com', '5551112233', 'Meram/KONYA'),
('Bahçe Düzenleme', 2, 'bahceduzen@example.com', '5557778899', 'Þenkaya/ERZURUM'),
('Þehir Nakliyat', 3, 'nakliyat@example.com', '5554445576', 'Kaman/KIRÞEHÝR'),
('Þehirlerarasý Taþýma', 3, 'sehirlerarasi@example.com', '5554445466', 'Þabanözü/ÇANKIRI'),
('Kedi Oteli', 4, 'kedioteli@example.com', '5554445466', 'Çankaya/ANKARA'),
('Veterinerlik', 4, 'veterinerlik@example.com', '5554445411', 'Kaman/KIRÞEHÝR'),
('Mobilya Boya', 5, 'mobilyaboya@example.com', '5550112233', 'Meram/KONYA'),
('Ahþap Boya', 5, 'ahsapboya@example.com', '5550445566', 'Beyoðlu/ÝSTANBUL'),
('Diyetisyen', 6, 'diyetisyen@example.com', '5557775566', 'Atakum/SAMSUN'),
('Psikolog', 6, 'psikolog@example.com', '5557775544', 'Ceyhan/ADANA'),
('Tesisat Tadilat', 7, 'tesisattadilat@example.com', '5556663344', 'Selçuklu/KONYA'),
('Elektrik Tadilat', 7, 'elektriktadilat@example.com', '5556661122', 'Beyoðlu/ÝSTANBUL'),
('Düðün Organizasyon', 8, 'dugun@example.com', '5553331122', 'Þabanözü/ÇANKIRI'),
('Parti Organizasyon', 8, 'parti@example.com', '5553322111', 'Fethiye/Muðla'),
('Matematik Özel Ders', 9, 'matematik@example.com', '5552299775', 'Pamukkale/DENÝZLÝ'),
('Fizik Özel Ders', 9, 'fizik@example.com', '5551188225', 'Alaþehir/MANÝSA'),
('Bebek Bakýcýsý', 10, 'bebek@example.com', '5555544332', 'Atakum/SAMSUN'),
('Oyun Ablasý', 10, 'oyun@example.com', '5555544331', 'Bayat/Çorum'),
('Oto Servis', 11, 'otoservis@example.com', '5554433221', 'Çorlu/TEKÝRDAÐ'),
('Oto Yýkama', 11, 'otoyikama@example.com', '5554433220', 'Ceyhan/ADANA'),
('Fitness Eðitmeni', 12, 'fitness@example.com', '5552211220', 'Ceyhan/ADANA'),
('Yoga Eðitmeni', 12, 'yoga@example.com', '5552211221', 'Atakum/SAMSUN'),
('Gayrimenkul Danýþmaný', 13, 'gayrimenkul@example.com', '5559911221', 'Pamukkale/DENÝZLÝ'),
('Emlak Ofisi', 13, 'emlakofisi@example.com', '5559911222', 'Çorlu/TEKÝRDAÐ'),
('Düðün Fotoðrafçýsý', 14, 'dugunfoto@example.com', '5558899776', 'Beyoðlu/ÝSTANBUL'),
('Doðum Fotoðrafçýsý', 14, 'dogumfoto@example.com', '5558899777', 'Beyoðlu/ÝSTANBUL'),
('Araç Kiralama', 15, 'arackiralama@example.com', '5556677889', 'Fethiye/Muðla'),
('Lüks Araç Kiralama', 15, 'luksarackiralama@example.com', '5556677888', 'Pamukkale/DENÝZLÝ');

-- Hizmet Ücretleri Tablosuna Veri Ekleme
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
(2, 3, '2024-06-02', 'Selçuklu/KONYA'),
(3, 5, '2024-06-03', 'Beyoðlu/ÝSTANBUL'),
(4, 7, '2024-06-04', 'Çorlu/TEKÝRDAÐ'),
(5, 9, '2024-06-05', 'Çankaya/ANKARA'),
(6, 11, '2024-06-06', 'Kaman/KIRÞEHÝR'),
(7, 13, '2024-06-07', 'Meram/KONYA'),
(8, 15, '2024-06-08', 'Atakum/SAMSUN'),
(9, 17, '2024-06-09', 'Þenkaya/ERZURUM'),
(10, 19, '2024-06-10', 'Þabanözü/ÇANKIRI'),
(11, 21, '2024-06-11', 'Fethiye/MUÐLA'),
(12, 23, '2024-06-12', 'Bayat/ÇORUM'),
(13, 25, '2024-06-13', 'Alaþehir/MANÝSA'),
(14, 27, '2024-06-14', 'Pamukkale/DENÝZLÝ'),
(15, 29, '2024-06-15', 'Ceyhan/ADANA');


-- Deðerlendirme Tablosuna Veri Ekleme
INSERT INTO degerlendirme (kullanici_id, hizmetsaglayici_id, puan, yorum) VALUES
(1, 1, 5, 'Mükemmel hizmet!'),
(2, 3, 4, 'Çok iyi.'),
(3, 5, 3, 'Fena deðil.'),
(4, 7, 4, 'Güzeldi.'),
(5, 9, 5, 'Harika!'),
(6, 11, 2, 'Pek memnun kalmadým.'),
(7, 13, 5, 'Çok beðendim.'),
(8, 15, 4, 'Gayet iyi.'),
(9, 17, 3, 'Ortalama.'),
(10, 19, 5, 'Mükemmeldi.'),
(11, 21, 2, 'Daha iyi olabilir.'),
(12, 23, 4, 'Güzel hizmet.'),
(13, 25, 3, 'Ýdare eder.'),
(14, 27, 4, 'Baþarýlý.'),
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



	---Müþterilerin En Çok Yaptýðý Rezervasyon Türü:
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


	--Hizmet Saðlayýcýlarý ve Hizmet Kategorileri Ýle Birlikte Ücretleri Gösterme:
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

	--Belirli Bir Kullanýcýnýn Yaptýðý Rezervasyonlar ve Hizmet Saðlayýcýlarý:
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



	--belirlenen adresteki hizmet saðlayýcýlarý bulmak için SP:

	--CREATE PROCEDURE adres(@adres varchar(50))
	--AS
	--SELECT * FROM hizmetsaglayici WHERE hizmetsaglayici_adres=@adres

	--exec adres 'Ceyhan/ADANA'


	--Hizmet katagorisindeki hizmet saðlayýcýlarýn ortalama fiyatý:

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