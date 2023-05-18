USE TelOperatoruSistemi

--DELETE FROM SOZLESME_PAKETI --(VER� S�LME)
--DBCC CHECKIDENT ('SOZLESME_PAKETI', RESEED,0)  --(IDENTITY SIFIRLAMA)

--MESLEKLER TABLOSUNUN VER�LER�
INSERT  INTO tblMeslek VALUES ('��retmen'),('Polis'),('��renci'),('��siz'),('M�hendis'),('Doktor'),('Hem�ire'),('Asker'),('Taksici'),('Esnaf'),('B�t�n meslekler')

--ABONE TABLOSUNUN VER�LER�

INSERT INTO tblAbone VALUES ('75178105126','Hacer' ,NULL ,'Duz','2000-01-05',5),
('46598217235','H�seyin','Ufuk','Do�du','1992-06-20',8),
('64251891745','Melike','G�l�ah','U�urlu','1999-12-08',1)
,('31178162741','Merve',NULL,'Yavuz','2001-02-19',6),
('12585474165','Umut','Furkan','Y�ld�r�m','1996-04-14',3),
('12165498352','Ay�e',NULL,'�evik','1988-03-03',7),
('51246823145','Tayyip','Emre','Tereya�','1965-11-10',10),
('12145386215','Ufuk',NULL,'Batt�','1998-07-13',4),
('13645278156','Sare','Nur','B�y�kcivelek','1994-01-10',2),
('32564421831','Ali','R�za','�etiner','1974-08-23',9)



--TELEFON TABLOSUNUN VER�LER�

INSERT INTO tblTelefon VALUES ('5457869521',DEFAULT,'12585474165'),
('5427218451',DEFAULT,'51246823145'),
('5071659421',DEFAULT,'75178105126'),
('5437809141',DEFAULT,'13645278156'),
('5517604512',DEFAULT,'32564421831'),
('5347212016',DEFAULT,'31178162741'),
('5051712018',DEFAULT,'12165498352'),
('5272134561',DEFAULT,'64251891745'),
('5417582132',DEFAULT,'46598217235'),
('5176910402',DEFAULT,'12145386215'),
('5077659821',0,'75178105126'),
('5347912216',0,'31178162741')

--ABONEL�K S�ZLE�MES� TABLOSUNUN VER�LER�

INSERT INTO tblAbonelikSozlesmesi VALUES (300 ,'2017-08-08','2025-10-08','12585474165',5),
(250,'2019-04-24','2027-10-15','31178162741',4),
(315,'2017-06-13','2025-12-14','13645278156',2),
(400,'2015-09-21','2021-11-12','12165498352',5),
(375,'2016-01-19','2031-02-07','12145386215',4),
(275,'2016-10-01','2023-01-18','32564421831',9),
(305,'2018-02-25','2023-05-21','51246823145',1),
(450,'2018-08-13','2027-04-19','46598217235',7),
(425,'2017-11-23','2033-05-03','64251891745',6),
(410,'2011-03-11','2026-10-14','75178105126',9)



--SIMKART TABLOSUNUN VER�LER�

INSERT INTO tblSimKart VALUES ('123406789','456879','123456',DEFAULT,10),
('456315023','562413','102341',DEFAULT,9),
('785453126','150263',208640,DEFAULT,8),
('142512610','208649','102451',DEFAULT,7),
('231659248','124115','452871',DEFAULT,5),
('123845621','562312','872153',DEFAULT,4),
('154620245','231479','113621',0,1),
('752842953','326514','254891',DEFAULT,2),
('623500347','326259','426513',0,6),
('154752146','154263','203051',DEFAULT,3)

--tblFatura tablosunun verileri

INSERT INTO tblFatura VALUES (250,'2020-03-21',NULL,2),
(230,'2020-02-21','2020-02-23',2),
(350,'2022-06-17','2022-07-01',2),
(330,'2021-05-13','2021-05-20',2),
(400,'2022-07-24','2022-09-01',2),
(150,'2023-04-01','2023-04-02',2),
(250,'2021-04-05','2021-04-12',2),
(850,'2022-08-23','2022-08-27',2)

-- tblPaketTuru verileri

INSERT INTO tblPaketTuru  VALUES ('Gen�'),
('Emekli'),
('Yeniyil'),
('Asker'),
('Doktor'),
('Polis'),
('HerkezAlabilir'),
('Ekpaket')

INSERT INTO tblBasvuruTuru VALUES ('Yenileme'),
('YeniS�zle�me')


--PAKETLER TABLOSUNUN VER�LER�

INSERT INTO tblPaketler VALUES ('Yenilenen 7GB','2019-08-01','2022-08-01',384,32,500,250,7,324,27,18,'Her ay tekrar eder . ','7'),
('Yeni Y�l 5GB','2018-12-15 ','2021-01-15 ',45 ,45 ,30 ,30 ,5 , 100, 30, 18,'Tekrar etmez. Yeni y�la �zel','3'), 
('Konu�tukca Kazan','2018-01-01','2023-01-01',420,35,1000,250,3,360,30,18,'Her ay tekrar eder. �ki y�l boyunca sabit fiyatla kullan�l�r.','7'),
('Konu�turan 100 DK','2017-12-20','2020-12-20',240,20,100,9,1,240,20,18,'Yurt i�i her y�ne konu�ma paketi.','7'),
('Emekliye 500 DK','2018-05-01','2021-05-01',240,20,500,45,1,204,17,50,'Emekliye �zel her y�ne 500 DK. Faturas�z paket.','2'),
('Asker Mini','2020-01-01','2023-01-01',228,19,1000,1000,2,228,19,18,'Askerlere �zel. Yurt i�i her y�ne.','4'),
('EGM 12GB','2021-06-01','2024-06-01',720,60,1000,100,12,696,58,18,'Polislere �zeldir. Yurt i�i her y�ne.','6'),
('SGK Tarifesi','2020-09-01','2023-09-01',600,50,3000,1000,10,480,40,25,'Doktorlara �zel bir pakettir.','5'),
('Kolay Paket ','2017-01-01','2019-01-01',264,22,500,250,2,228,19,18,'Tekrar etmez. Tarifenize ek pakettir.','8'),
('Konu�turan Paket','2017-01-01','2020-01-01',300,25,750,500,1,240,20,18,'Her ay tekrar eder. Faturas�z tarifedir.','7')


--Burada kald�k
--SOZLESME_PAKETININ VER�LER�

INSERT INTO tblSozlesmePaketi VALUES ('2019-09-15','2021-06-21',45,500,250,7168,24,50,2048,'1','2','1'),
('2021-05-01','2022-05-01',65,3000,1000,10240,1005,425,3072,'4','1','4'),
('2021-08-15','2024-05-15',75,1000,0,12288,336,0,2088,'8','1','5'),
('2017-05-01','2017-06-01',80,500,250,2048,123,42,552,'6','1','3'),
('2020-12-15','2023-06-21',50,0,0,5120,0,0,3151,'9','1','1'),
('2018-10-01','2021-05-01',90,500,0,0,222,0,0,'7','2','2'),
('2018-01-15','2022-05-15',85,1000,250,3072,453,198,978,'5','2','5'),
('2020-03-20','2022-12-20',55,1000,1000,2048,314,136,1000,'2','1','7'),
('2019-02-20','2020-01-01',70,750,500,1024,417,213,257,'1','1','1'),
('2018-04-15','2022-05-17',65,100,0,0,39,0,0,'3','2','1')

--SMS TABLOSUNUN VER�LER� 

INSERT INTO tblSms VALUES ('2021-12-21 13:10:15 ','2021-12-21 13:16:05',1,'10 dakika i�erisinde arayaca��m.','5','1','3'),
('2021-05-14 12:18:31','2021-05-14 12:19:05',1,'Yemek yemeye nereye gidelim','4','1','4'),
('2018-09-23 23:45:19','2018-09-23 23:52:07',1,'Yar�n bulu�acak m�y�z?','9','2','3'), 
('2020-12-12 06:09:27','2020-12-12 07:28:12',1,'Bunu bana s�ylememi�tin.','7','6','5'),
('2021-03-17 10:20:42','2021-03-17 10:23:12',2,'G�nayd�n bu g�n beraber istanbula gidecektik ya �nce emin�n�ne sonra da kar��ya ge�sek ak�ama do�ru moda da oluruz sana da uyar dimi? Ha sabah 10.45 de feribot unutma :)). ','1','3','7'),
('2021-01-19 18:35:23','2021-01-19 18:39:33',1,'Toplant�y� ne zaman yapaca��z?','7','4','8'),
('2019-05-27 16:23:52','2019-05-27 16:25:11',1,'-Kanka Melikeyide al hadi kahve i�meye gidelim ','2','5','6'),
('2022-03-09 20:15:12','2022-03-13',1,'Sonunda telefonum geldi yuppiii :)))','1','7','5'),
('2019-01-15 11:36:48','2019-01-15 11:37:59',1,'M�sait de�ilim arayaca��m birazdan','3','8','8'),
('2021-02-26 14:47:39','2021-02-26 14:53:17',1,'Discorda gel oyun oynuyoruz.','8','9','9')





--DK TABLOSUNUN VER�LER�

INSERT INTO tblDk VALUES ('2021-12-08 12:25:13','2021-12-08 14:41:28','7','5','3'),
('2022-01-14 13:37:40','2022-01-14 16:45:42','8','2','4'),
('2018-05-17 18:30:24','2018-05-17 18:42:31','1','4','5'),
('2021-04-11 10:01:22','2021-04-11 10:50:38','5','3','6'),
('2018-01-18 11:02:13','2018-01-18 11:15:17','2','7','7'),
('2019-02-03 20:14:16','2019-02-03 20:15:17','6','9','8'),
('2021-03-20 23:42:56','2021-03-21 00:32:59','4','1','9'),
('2020-04-05 09:52:18','2020-04-05 12:01:48','3','8','10'),
('2021-01-25 17:15:40','2021-01-25 18:15:50','9','2','4'),
('2018-05-08 21:10:12','2018-05-08 21:43:26','1','5','5')





--VARDIR TABLOSUNUN VER�LER� 
INSERT INTO tblPaketBasvuruTuru VALUES (2,2),(1,1),(1,3),(1,4),(2,5),(2,6),(2,7),(1,8),(2,9),(1,10)

--INTERNET TABLOSUNUN VER�LER�

INSERT INTO tblInternet VALUES ('2019-03-17 14:52:31','2019-03-17 15:52:12',579,'3'),
('2021-02-14 13:08:12','2021-02-14 13:29:42',150,'7'),
('2017-05-22 10:19:42','2017-05-22 11:48:20',658,'10'),
('2020-10-09 18:25:36','2020-10-09 19:12:23',492,'4'),
('2018-03-16 12:01:54','2018-03-16 12:52:16',507,'3'),
('2021-06-25 14:18:33','2021-06-25 14:25:21',70,'6'),
('2019-04-06 20:12:42','2019-04-06 22:07:21',1248,'5'),
('2021-08-07 15:16:05','2021-08-07 15:46:57',212,'7'),
('2019-09-15 10:17:20','2019-09-15 10:55:22',372,'8'),
('2021-05-18 13:32:42','2021-05-18 15:21:17',832,'9')

