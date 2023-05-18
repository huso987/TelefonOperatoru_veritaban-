IF DB_ID ('TelOperatoruSistemi') IS NOT NULL
    BEGIN
	   ALTER DATABASE [TelOperatoruSistemi] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	   USE master
	   DROP DATABASE TelOperatoruSistemi 
    END
GO

CREATE DATABASE TelOperatoruSistemi
    ON PRIMARY(
	            NAME = 'TelOperatoruSistemidb',
				FILENAME ='D:\uygulamalar\vts\MSSQL16.MSSQLSERVER\MSSQL\DATA\TelOperatoruSistemi_db.mdf',
				SIZE = 5MB,
				MAXSIZE = 100MB,
				FILEGROWTH = 5MB

	           )
     LOG ON    ( 
	             NAME = 'TelOperatoruSistemidb_log',
				 FILENAME = 'D:\uygulamalar\vts\MSSQL16.MSSQLSERVER\MSSQL\DATA\TelOperatoruSistemi_log.ldf',
				 SIZE = 2MB,
				 MAXSIZE = 50MB,
				 FILEGROWTH = 1MB

			   )
GO

USE TelOperatoruSistemi

CREATE TABLE tblMeslek
(
     Meslek_Id Int Identity(1,1) Primary key,
	 Isim Varchar(20) NOT NUll 
)

GO

CREATE TABLE tblAbone
(
     Tc Char(11) Primary key,
	 Ad Varchar(15) NOT NULL,
	 Ikinci_Ad Varchar(15) ,
	 Soyad Varchar(20) NOT NULL,
	 Dogum_Tarihi Date Not NULL,
	 Yas AS DATEDIFF(yy , Dogum_Tarihi, GETDATE()),
	 Meslek_Id Int Foreign Key References tblMeslek(Meslek_Id) Not Null
	 
)

GO

CREATE TABLE tblTelefon
(
     Tel_Id Int Identity(1,1) Primary Key,
	 Telefon_Numarasi Char(10) NOT NULL Constraint Chck_tel Check (Telefon_Numarasi LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	 Durum Smallint Default 1 , --0 kullanýlmýyor 1 kullanýlýyor 
	 Tc Char(11) Foreign Key References tblAbone(Tc) 
)

GO

CREATE TABLE tblAbonelikSozlesmesi
(
     Sozlesme_Id Int Identity(1,1) Primary Key,
	 Cayma_Bedeli money NOT NULL,
	 Baslangýc_Tarih Date NOT NULL,
	 Bitis_Tarihi Date,
	 Tc Char(11) Foreign Key References tblAbone(Tc) Not Null, 
	 Tel_Id Int Foreign Key References tblTelefon(Tel_Id) Not Null
	 
)

GO
CREATE TABLE tblSimKart
(
     Serino Char(9) Primary Key ,
	 Pin_Kodu Char(6) NOT NULL Constraint Chck_pin Check (Pin_Kodu LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	 Puk_Kodu Char(6) NOT NULL Constraint Chck_puk Check (Puk_Kodu LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	 Aktiflik Smallint Default 1 NOT NULL , --0 Pasif  1 Aktif
	 Sozlesme_Id Int Foreign Key References tblAbonelikSozlesmesi(Sozlesme_Id) Not Null

)

GO

CREATE TABLE tblFatura
(
   Fatura_Id Int Identity(1,1) primary Key,
   FaturaTutar Money Not Null,
   FaturaSonÖ_Tarihi  Date Not Null,
   ÖdendiðiT Date ,
   Sozlesme_Id Int Foreign Key References tblAbonelikSozlesmesi(Sozlesme_Id)  Not Null
)

GO

CREATE TABLE tblPaketTuru
(
 PaketId int Identity(1,1) primary key,
 PaketTürüAd varChar(20) NOT NUll
)
GO
CREATE TABLE tblBasvuruTuru
(
    Basvuru_Id Int Identity(1,1) Primary Key,
	Basvuru_Tipi Varchar(20) NOT NULL
)

GO 

CREATE TABLE tblPaketler
(
    Paket_Id Int Identity(1,1) Primary Key,
	Paket_Ad Nvarchar(30) NOT NULL,
	Baslangic_Tarihi Date NOT NULL,
	Bitis_Tarihi Date NOT NULL,
	Eski_Abone_YILLIK_Fiyat Smallmoney ,
	Eski_Abone_AYLIK_Fiyat Smallmoney ,
	Dk Int NOT NULL , 
	Sms Int NOT NULL , 
	Internet Int NOT NULL , 
    Yeni_Abone_YILLIK_Fiyat money NOT NULL ,
	Yeni_Abone_AYLIK_Fiyat money NOT NULL,
	En_Az_Basvuru_Yasi Tinyint NOT NULL,
	Aciklama Nvarchar(200) ,
	PaketID Int Foreign Key References tblPaketTuru(PaketId)  NOT NULL
	

)
GO

CREATE TABLE tblSozlesmePaketi
(
     Sozlesme_Paket_Id Int Identity(1,1) Primary Key,
	 Bas_Tarihi Date NOT NULL,
	 Bitis_Tarihi Date NOT NULL,
	 Fiyat money NOT NULL,
	 Total_Dk Int NOT NULL,
	 Total_Sms Int NOT NULL,
	 Total_Internet Int NOT NULL,
	 Kullanilan_Dk Int Default 0 NOT NULL,
	 Kullanilan_Sms Int Default 0 NOT NULL,
	 Kullanilan_Internet Int Default 0 NOT NULL,
	 Kalan_Dk as Total_Dk - Kullanilan_Dk ,
	 Kalan_Sms as Total_Sms - Kullanilan_Sms ,
	 Kalan_Internet as Total_Internet - Kullanilan_Internet ,
	 Sozlesme_Id Int Foreign Key References tblAbonelikSozlesmesi(Sozlesme_Id) NOT NULL,
	 Basvuru_Id  Int Foreign Key References  tblBasvuruTuru(Basvuru_Id) NOT NULL,
	 Paket_Id Int Foreign Key References tblPaketler(Paket_Id) NOT NULL,
	 

)
GO

CREATE TABLE tblSms
(
    Sms_Id Int Identity(1,1) Primary Key,
	Alinma_Tarihi Datetime ,
	Gonderme_Tarihi Datetime NOT NULL,
	Kullanilan_SMS Smallint NOT NULL,
	Mesaj_icerigi Nvarchar(200) NOT NULL,
	Tel_Id_Alici Int Foreign Key References tblTelefon(Tel_Id) NOT NULL ,
    Tel_Id_Gonderici Int Foreign Key References tblTelefon(Tel_Id) NOT NULL,
	Sozlesme_Paket_Id Int Foreign Key References tblSozlesmePaketi( Sozlesme_Paket_Id) NOT NULL
	
)

GO 


CREATE TABLE tblDk
(
     Dk_Id Int Identity(1,1) Primary Key,
	 Baslangic_Tarih Datetime NOT NULL,
	 Bitis_Tarihi Datetime ,
	 Konusma_Suresi as Baslangic_Tarih - Bitis_Tarihi , 
	 Tel_Id_Arama Int Foreign Key References tblTelefon(Tel_Id) NOT NULL,	 
	 Tel_Id_Aranma Int Foreign Key References tblTelefon(Tel_Id) NOT NULL,
	 Sozlesme_Paket_Id Int Foreign Key References tblSozlesmePaketi(Sozlesme_Paket_Id) NOT NULL

)

GO


CREATE TABLE tblPaketBasvuruTuru
(
    Id Int Identity(1,1) Primary Key,
    Basvuru_Id Int Foreign Key References tblBasvuruTuru(Basvuru_Id) NOT NULL,
	
	Paket_Id Int Foreign Key References tblPaketler(Paket_Id) NOT NULL
	
)

GO

CREATE TABLE tblInternet
(
    Internet_Id Int Identity(1,1) Primary Key ,
	Baslangic_Tarihi Datetime NOT NULL, 
	Bitis_Tarihi Datetime ,
	Kullanýlan_Byte int,
	Sozlesme_Paket_Id Int Foreign Key References tblSozlesmePaketi( Sozlesme_Paket_Id) NOT NULL
	
)



