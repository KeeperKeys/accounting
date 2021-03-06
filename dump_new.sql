-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: cw
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Адреса`
--

DROP TABLE IF EXISTS `Адреса`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Адреса` (
  `id_адреса` smallint(2) NOT NULL AUTO_INCREMENT,
  `адрес` varchar(200) NOT NULL,
  `id_типа_улицы` smallint(2) NOT NULL,
  PRIMARY KEY (`id_адреса`),
  KEY `fk_id_типа_улицы` (`id_типа_улицы`),
  CONSTRAINT `fk_id_типа_улицы` FOREIGN KEY (`id_типа_улицы`) REFERENCES `ТипыУлиц` (`id_типа_улицы`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Адреса`
--

LOCK TABLES `Адреса` WRITE;
/*!40000 ALTER TABLE `Адреса` DISABLE KEYS */;
INSERT INTO `Адреса` VALUES (1,'Украина, Харьков, Пушкинская, 79/1, 77',1),(2,'Украина, Харьков, Балашова, 12, 4',2),(3,'Украина, Харьков, Горича, 11,   ',1),(4,'Украина, Киев, Магилевская, 17, 7',1),(6,'Россия, Москва, Маршала Генералова, 14, 88',1),(8,'2, 2, 2, 2, 2',3);
/*!40000 ALTER TABLE `Адреса` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Характеристики`
--

DROP TABLE IF EXISTS `Характеристики`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Характеристики` (
  `id_характеристики` smallint(2) NOT NULL AUTO_INCREMENT,
  `id_еденицы_измерения` smallint(2) NOT NULL,
  `название` varchar(30) NOT NULL,
  PRIMARY KEY (`id_характеристики`),
  UNIQUE KEY `название_UNIQUE` (`название`),
  KEY `fk_id_еденицы_измерения` (`id_еденицы_измерения`),
  CONSTRAINT `fk_id_еденицы_измерения` FOREIGN KEY (`id_еденицы_измерения`) REFERENCES `ЕденицыИзмерения` (`id_еденицы_измерения`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Характеристики`
--

LOCK TABLES `Характеристики` WRITE;
/*!40000 ALTER TABLE `Характеристики` DISABLE KEYS */;
INSERT INTO `Характеристики` VALUES (1,8,'Высота'),(2,8,'Ширина'),(3,8,'Длина'),(4,10,'Емкость накопителя');
/*!40000 ALTER TABLE `Характеристики` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ХарактеристикиМодели`
--

DROP TABLE IF EXISTS `ХарактеристикиМодели`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ХарактеристикиМодели` (
  `id_характеристики` smallint(2) NOT NULL,
  `id_модели_техники` smallint(2) NOT NULL,
  `значение` decimal(10,2) NOT NULL,
  `id_характеристики_модели` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_характеристики`,`id_модели_техники`),
  UNIQUE KEY `id_характеристики_модели` (`id_характеристики_модели`),
  KEY `fk_id_модели_техники` (`id_модели_техники`),
  CONSTRAINT `fk_id_модели_техники` FOREIGN KEY (`id_модели_техники`) REFERENCES `МоделиТехники` (`id_модели_техники`),
  CONSTRAINT `fk_id_характеристики` FOREIGN KEY (`id_характеристики`) REFERENCES `Характеристики` (`id_характеристики`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ХарактеристикиМодели`
--

LOCK TABLES `ХарактеристикиМодели` WRITE;
/*!40000 ALTER TABLE `ХарактеристикиМодели` DISABLE KEYS */;
INSERT INTO `ХарактеристикиМодели` VALUES (1,1,40.00,1),(1,3,17.00,2),(2,2,20.00,3);
/*!40000 ALTER TABLE `ХарактеристикиМодели` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Должности`
--

DROP TABLE IF EXISTS `Должности`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Должности` (
  `id_должности` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(40) NOT NULL,
  PRIMARY KEY (`id_должности`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Должности`
--

LOCK TABLES `Должности` WRITE;
/*!40000 ALTER TABLE `Должности` DISABLE KEYS */;
INSERT INTO `Должности` VALUES (1,'Бухгалтер'),(4,'Грузчик'),(3,'Консультант'),(2,'Менеджер');
/*!40000 ALTER TABLE `Должности` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ЕденицыИзмерения`
--

DROP TABLE IF EXISTS `ЕденицыИзмерения`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ЕденицыИзмерения` (
  `id_еденицы_измерения` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(30) NOT NULL,
  `сокращенное_название` varchar(10) NOT NULL,
  PRIMARY KEY (`id_еденицы_измерения`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ЕденицыИзмерения`
--

LOCK TABLES `ЕденицыИзмерения` WRITE;
/*!40000 ALTER TABLE `ЕденицыИзмерения` DISABLE KEYS */;
INSERT INTO `ЕденицыИзмерения` VALUES (1,'Килограммы','кг'),(2,'Граммы','г'),(3,'Минуты','м'),(4,'Обороты в минуту','об/мин'),(5,'Мегагерцы','МГц'),(6,'Сантиметры','см'),(7,'Метры','м'),(8,'Милиметры','мм'),(9,'Мегабайты','Мб'),(10,'Гигабайты','Гб');
/*!40000 ALTER TABLE `ЕденицыИзмерения` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ЕденицыТехники`
--

DROP TABLE IF EXISTS `ЕденицыТехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ЕденицыТехники` (
  `id_еденицы_техники` int(3) NOT NULL AUTO_INCREMENT,
  `id_комплекта` smallint(2) NOT NULL,
  `id_названия_еденицы_техники` smallint(2) NOT NULL,
  PRIMARY KEY (`id_еденицы_техники`),
  KEY `fk_id_комплекта` (`id_комплекта`),
  KEY `fk_id_названия_еденицы_техники` (`id_названия_еденицы_техники`),
  CONSTRAINT `fk_id_комплекта` FOREIGN KEY (`id_комплекта`) REFERENCES `Комплекты` (`id_комплекта`),
  CONSTRAINT `fk_id_названия_еденицы_техники` FOREIGN KEY (`id_названия_еденицы_техники`) REFERENCES `НазванияЕденицыТехники` (`id_названия_еденицы_техники`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ЕденицыТехники`
--

LOCK TABLES `ЕденицыТехники` WRITE;
/*!40000 ALTER TABLE `ЕденицыТехники` DISABLE KEYS */;
INSERT INTO `ЕденицыТехники` VALUES (1,1,5),(2,1,4),(3,1,2),(4,1,1),(5,3,4);
/*!40000 ALTER TABLE `ЕденицыТехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ЭкземплярыТехники`
--

DROP TABLE IF EXISTS `ЭкземплярыТехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ЭкземплярыТехники` (
  `id_экземпляра_техники` int(3) NOT NULL AUTO_INCREMENT,
  `id_еденицы_техники` int(3) NOT NULL,
  `заводской_код` varchar(20) DEFAULT NULL,
  `инвентарный_номер` varchar(20) NOT NULL,
  `id_техники_по_накладной` int(4) NOT NULL,
  `дата_гарантии` date DEFAULT NULL,
  `id_списания` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id_экземпляра_техники`),
  KEY `fk_id_еденицы_техники` (`id_еденицы_техники`),
  KEY `fk_id_техники_по_накладной` (`id_техники_по_накладной`),
  KEY `fk_new_id_списания` (`id_списания`),
  CONSTRAINT `fk_id_еденицы_техники` FOREIGN KEY (`id_еденицы_техники`) REFERENCES `ЕденицыТехники` (`id_еденицы_техники`),
  CONSTRAINT `fk_id_техники_по_накладной` FOREIGN KEY (`id_техники_по_накладной`) REFERENCES `ТехникаПоНакладной` (`id_техники_по_накладной`),
  CONSTRAINT `fk_new_id_списания` FOREIGN KEY (`id_списания`) REFERENCES `Списания` (`id_списания`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ЭкземплярыТехники`
--

LOCK TABLES `ЭкземплярыТехники` WRITE;
/*!40000 ALTER TABLE `ЭкземплярыТехники` DISABLE KEYS */;
INSERT INTO `ЭкземплярыТехники` VALUES (1,3,'a3243sd','1111111',4,'2016-12-17',NULL),(2,3,'hfh3333','1111112',3,'2016-12-17',NULL),(3,3,'3252s11','1111113',2,'2017-12-17',NULL),(4,3,'123414f','1111114',1,'2016-12-17',3),(6,2,'','1111115',5,'2017-06-27',NULL);
/*!40000 ALTER TABLE `ЭкземплярыТехники` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ЭкземплярыТехники_BINS` BEFORE INSERT ON `ЭкземплярыТехники` FOR EACH ROW
begin
	set @count_postav = (select `ТехникаПоНакладной`.`количество` from `ТехникаПоНакладной` where `ТехникаПоНакладной`.`id_техники_по_накладной`=new.`id_техники_по_накладной`);
	set @count_ex = (SELECT count(`ЭкземплярыТехники`.`id_экземпляра_техники`) FROM `ЭкземплярыТехники` where `ЭкземплярыТехники`.`id_техники_по_накладной`=new.`id_техники_по_накладной`);
	if (@count_postav <= @count_ex) then
		insert into `ЭкземплярыТехники` (`id_экземпляра_техники`,`id_еденицы_техники`,`заводской_код`,`инвентарный_номер`, `id_техники_по_накладной`, `дата_гарантии`) values (new.`id_экземпляра_техники`,new.`id_еденицы_техники`,new.`заводской_код`,new.`инвентарный_номер`, new.`id_техники_по_накладной`, new.`дата_гарантии`);
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ЭкземплярыТехники_BUPD` BEFORE UPDATE ON `ЭкземплярыТехники` FOR EACH ROW
begin
	set @count_postav = (select `ТехникаПоНакладной`.`количество` from `ТехникаПоНакладной` where `ТехникаПоНакладной`.`id_техники_по_накладной`=new.`id_техники_по_накладной`);
	set @count_ex = (SELECT count(`ЭкземплярыТехники`.`id_экземпляра_техники`) FROM `ЭкземплярыТехники` where `ЭкземплярыТехники`.`id_техники_по_накладной`=new.`id_техники_по_накладной`);
	if (@count_postav <= @count_ex) then
		update `ЭкземплярыТехники` set `id_экземпляра_техники` = new.`id_экземпляра_техники`, `id_еденицы_техники` = new.`id_еденицы_техники`, `заводской_код` = new.`заводской_код`, `инвентарный_номер` = new.`инвентарный_номер`, `id_техники_по_накладной`=new.`id_техники_по_накладной`, `дата_гарантии`=new.`дата_гарантии` where `id_экземпляра_техники`=new.`id_экземпляра_техники`;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Комнаты`
--

DROP TABLE IF EXISTS `Комнаты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Комнаты` (
  `id_комнаты` smallint(2) NOT NULL AUTO_INCREMENT,
  `номер_комнаты` char(5) NOT NULL,
  PRIMARY KEY (`id_комнаты`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Комнаты`
--

LOCK TABLES `Комнаты` WRITE;
/*!40000 ALTER TABLE `Комнаты` DISABLE KEYS */;
INSERT INTO `Комнаты` VALUES (1,'1'),(2,'2'),(3,'2а');
/*!40000 ALTER TABLE `Комнаты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Комплекты`
--

DROP TABLE IF EXISTS `Комплекты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Комплекты` (
  `id_комплекта` smallint(2) NOT NULL AUTO_INCREMENT,
  `id_рабочего_места` smallint(2) NOT NULL,
  `id_названия_комплекта` smallint(2) NOT NULL,
  PRIMARY KEY (`id_комплекта`),
  KEY `fk_id_рабочего_места` (`id_рабочего_места`),
  KEY `fk_id_названия_комлекта` (`id_названия_комплекта`),
  CONSTRAINT `fk_id_названия_комлекта` FOREIGN KEY (`id_названия_комплекта`) REFERENCES `НазванияКомплекта` (`id_названия_комплекта`),
  CONSTRAINT `fk_id_рабочего_места` FOREIGN KEY (`id_рабочего_места`) REFERENCES `РабочиеМеста` (`id_рабочего_места`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Комплекты`
--

LOCK TABLES `Комплекты` WRITE;
/*!40000 ALTER TABLE `Комплекты` DISABLE KEYS */;
INSERT INTO `Комплекты` VALUES (1,1,1),(2,1,2),(3,2,4);
/*!40000 ALTER TABLE `Комплекты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `МоделиТехники`
--

DROP TABLE IF EXISTS `МоделиТехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `МоделиТехники` (
  `id_модели_техники` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(100) NOT NULL,
  `id_производителя` smallint(2) NOT NULL,
  `id_типа_техники` smallint(2) NOT NULL,
  PRIMARY KEY (`id_модели_техники`),
  KEY `fk_id_производителя` (`id_производителя`),
  KEY `fk_id_типа_техники` (`id_типа_техники`),
  CONSTRAINT `fk_id_производителя` FOREIGN KEY (`id_производителя`) REFERENCES `Производители` (`id_производителя`),
  CONSTRAINT `fk_id_типа_техники` FOREIGN KEY (`id_типа_техники`) REFERENCES `ТипыТехники` (`id_типа_техники`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `МоделиТехники`
--

LOCK TABLES `МоделиТехники` WRITE;
/*!40000 ALTER TABLE `МоделиТехники` DISABLE KEYS */;
INSERT INTO `МоделиТехники` VALUES (1,'Luft A7',1,5),(2,'Sun F1F',3,4),(3,'Lol 11',3,6),(4,'Kek 1337',3,7);
/*!40000 ALTER TABLE `МоделиТехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `НазванияЕденицыТехники`
--

DROP TABLE IF EXISTS `НазванияЕденицыТехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `НазванияЕденицыТехники` (
  `id_названия_еденицы_техники` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(40) NOT NULL,
  PRIMARY KEY (`id_названия_еденицы_техники`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `НазванияЕденицыТехники`
--

LOCK TABLES `НазванияЕденицыТехники` WRITE;
/*!40000 ALTER TABLE `НазванияЕденицыТехники` DISABLE KEYS */;
INSERT INTO `НазванияЕденицыТехники` VALUES (1,'Жесткий диск'),(5,'Клавиатура'),(4,'Монитор'),(3,'Персональный компьютер'),(2,'Системный блок');
/*!40000 ALTER TABLE `НазванияЕденицыТехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `НазванияКомплекта`
--

DROP TABLE IF EXISTS `НазванияКомплекта`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `НазванияКомплекта` (
  `id_названия_комплекта` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(40) NOT NULL,
  PRIMARY KEY (`id_названия_комплекта`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `НазванияКомплекта`
--

LOCK TABLES `НазванияКомплекта` WRITE;
/*!40000 ALTER TABLE `НазванияКомплекта` DISABLE KEYS */;
INSERT INTO `НазванияКомплекта` VALUES (4,'Один монитор'),(1,'Персональный компьютер'),(2,'Принтер'),(3,'Телефон');
/*!40000 ALTER TABLE `НазванияКомплекта` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Накладные`
--

DROP TABLE IF EXISTS `Накладные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Накладные` (
  `id_накладной` smallint(2) NOT NULL AUTO_INCREMENT,
  `дата_поставки` date NOT NULL,
  `id_поставщика` smallint(2) NOT NULL,
  `номер_накладной` char(20) NOT NULL,
  PRIMARY KEY (`id_накладной`),
  UNIQUE KEY `номер_накладной_UNIQUE` (`номер_накладной`),
  KEY `fk_id_поставщика` (`id_поставщика`),
  CONSTRAINT `fk_id_поставщика` FOREIGN KEY (`id_поставщика`) REFERENCES `Поставщики` (`id_поставщика`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Накладные`
--

LOCK TABLES `Накладные` WRITE;
/*!40000 ALTER TABLE `Накладные` DISABLE KEYS */;
INSERT INTO `Накладные` VALUES (1,'2015-12-17',1,'АГ123Н11'),(2,'2015-12-22',2,'АГ123Н12'),(3,'2016-09-28',1,'АГ123Н124');
/*!40000 ALTER TABLE `Накладные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ПППоНакладной`
--

DROP TABLE IF EXISTS `ПППоНакладной`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ПППоНакладной` (
  `id_накладной` smallint(2) NOT NULL,
  `id_ПП` smallint(2) NOT NULL,
  `цена_за_еденицу` decimal(6,2) DEFAULT NULL,
  `количество` smallint(2) NOT NULL,
  `id_ПП_по_накладной` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_ПП_по_накладной`),
  UNIQUE KEY `un_id_накладной_ПП` (`id_накладной`,`id_ПП`),
  KEY `fk_id_ПП1` (`id_ПП`),
  CONSTRAINT `fk_id_ПП1` FOREIGN KEY (`id_ПП`) REFERENCES `ПрограммныеПродукты` (`id_ПП`),
  CONSTRAINT `fk_id_накладной1` FOREIGN KEY (`id_накладной`) REFERENCES `Накладные` (`id_накладной`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ПППоНакладной`
--

LOCK TABLES `ПППоНакладной` WRITE;
/*!40000 ALTER TABLE `ПППоНакладной` DISABLE KEYS */;
INSERT INTO `ПППоНакладной` VALUES (2,1,1599.00,3,1),(2,2,699.00,3,2);
/*!40000 ALTER TABLE `ПППоНакладной` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Поставщики`
--

DROP TABLE IF EXISTS `Поставщики`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Поставщики` (
  `id_поставщика` smallint(2) NOT NULL AUTO_INCREMENT,
  `id_адреса` smallint(2) NOT NULL,
  `id_телефона` smallint(2) NOT NULL,
  `другие_контактные_данные` text,
  `комментарий` text,
  `название` varchar(100) NOT NULL,
  `id_типа_организации` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`id_поставщика`),
  UNIQUE KEY `название_UNIQUE` (`название`),
  KEY `fk_id_адреса2` (`id_адреса`),
  KEY `fk_id_телефоны2` (`id_телефона`),
  KEY `fk_id_типа_организации` (`id_типа_организации`),
  CONSTRAINT `fk_id_адреса2` FOREIGN KEY (`id_адреса`) REFERENCES `Адреса` (`id_адреса`),
  CONSTRAINT `fk_id_телефоны2` FOREIGN KEY (`id_телефона`) REFERENCES `Телефоны` (`id_телефона`),
  CONSTRAINT `fk_id_типа_организации` FOREIGN KEY (`id_типа_организации`) REFERENCES `ТипыОрганизаций` (`id_типа_организации`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Поставщики`
--

LOCK TABLES `Поставщики` WRITE;
/*!40000 ALTER TABLE `Поставщики` DISABLE KEYS */;
INSERT INTO `Поставщики` VALUES (1,3,3,'','не звонить ночью','Сюткин Валерий Миладович',2),(2,4,4,'','','ПостПКкудаУгодно',1);
/*!40000 ALTER TABLE `Поставщики` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ПрограммныеПродукты`
--

DROP TABLE IF EXISTS `ПрограммныеПродукты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ПрограммныеПродукты` (
  `id_ПП` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(100) NOT NULL,
  `id_типа_ПП` smallint(2) NOT NULL,
  PRIMARY KEY (`id_ПП`),
  KEY `fk_id_типа_ПП` (`id_типа_ПП`),
  CONSTRAINT `fk_id_типа_ПП` FOREIGN KEY (`id_типа_ПП`) REFERENCES `ТипыПП` (`id_типа_ПП`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ПрограммныеПродукты`
--

LOCK TABLES `ПрограммныеПродукты` WRITE;
/*!40000 ALTER TABLE `ПрограммныеПродукты` DISABLE KEYS */;
INSERT INTO `ПрограммныеПродукты` VALUES (1,'Microsoft Windows 10',1),(2,'Microsoft Office 365',2);
/*!40000 ALTER TABLE `ПрограммныеПродукты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Производители`
--

DROP TABLE IF EXISTS `Производители`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Производители` (
  `id_производителя` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(100) NOT NULL,
  PRIMARY KEY (`id_производителя`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Производители`
--

LOCK TABLES `Производители` WRITE;
/*!40000 ALTER TABLE `Производители` DISABLE KEYS */;
INSERT INTO `Производители` VALUES (1,'Seagate'),(2,'Barracuda'),(3,'Samsung');
/*!40000 ALTER TABLE `Производители` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `РабочиеМеста`
--

DROP TABLE IF EXISTS `РабочиеМеста`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `РабочиеМеста` (
  `id_рабочего_места` smallint(2) NOT NULL AUTO_INCREMENT,
  `id_комнаты` smallint(2) NOT NULL,
  `номер_рабочего_места` char(3) NOT NULL,
  PRIMARY KEY (`id_рабочего_места`),
  KEY `fk_id_комнаты` (`id_комнаты`),
  CONSTRAINT `fk_id_комнаты` FOREIGN KEY (`id_комнаты`) REFERENCES `Комнаты` (`id_комнаты`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `РабочиеМеста`
--

LOCK TABLES `РабочиеМеста` WRITE;
/*!40000 ALTER TABLE `РабочиеМеста` DISABLE KEYS */;
INSERT INTO `РабочиеМеста` VALUES (1,1,'1а'),(2,1,'1б'),(3,1,'2');
/*!40000 ALTER TABLE `РабочиеМеста` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Сотрудники`
--

DROP TABLE IF EXISTS `Сотрудники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Сотрудники` (
  `id_сотрудника` smallint(2) NOT NULL AUTO_INCREMENT,
  `фамилия` varchar(30) NOT NULL,
  `имя` varchar(30) NOT NULL,
  `отчество` varchar(20) NOT NULL,
  `дата_рождения` date NOT NULL,
  `id_должности` smallint(2) NOT NULL,
  `id_рабочего_места` smallint(2) NOT NULL,
  `пол` char(1) NOT NULL,
  `id_телефона` smallint(2) NOT NULL,
  `id_адреса` smallint(2) NOT NULL,
  PRIMARY KEY (`id_сотрудника`),
  KEY `fk_id_должности` (`id_должности`),
  KEY `fk_id_рабочего_места1` (`id_рабочего_места`),
  KEY `fk_id_адреса1` (`id_адреса`),
  KEY `fk_id_телефоны1` (`id_телефона`),
  CONSTRAINT `fk_id_адреса1` FOREIGN KEY (`id_адреса`) REFERENCES `Адреса` (`id_адреса`),
  CONSTRAINT `fk_id_должности` FOREIGN KEY (`id_должности`) REFERENCES `Должности` (`id_должности`),
  CONSTRAINT `fk_id_рабочего_места1` FOREIGN KEY (`id_рабочего_места`) REFERENCES `РабочиеМеста` (`id_рабочего_места`),
  CONSTRAINT `fk_id_телефоны1` FOREIGN KEY (`id_телефона`) REFERENCES `Телефоны` (`id_телефона`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Сотрудники`
--

LOCK TABLES `Сотрудники` WRITE;
/*!40000 ALTER TABLE `Сотрудники` DISABLE KEYS */;
INSERT INTO `Сотрудники` VALUES (1,'Янченко','Александр','Олегович','1995-02-11',4,1,'м',1,1),(2,'Абарахман','Абдул','Ниязович','1983-01-17',3,2,'м',2,2);
/*!40000 ALTER TABLE `Сотрудники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Списания`
--

DROP TABLE IF EXISTS `Списания`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Списания` (
  `id_списания` smallint(2) NOT NULL,
  `дата` date NOT NULL,
  `id_сотрудника` smallint(2) NOT NULL,
  `причина` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_списания`),
  KEY `fk_id_сотрудника` (`id_сотрудника`),
  CONSTRAINT `fk_id_сотрудника` FOREIGN KEY (`id_сотрудника`) REFERENCES `Сотрудники` (`id_сотрудника`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Списания`
--

LOCK TABLES `Списания` WRITE;
/*!40000 ALTER TABLE `Списания` DISABLE KEYS */;
INSERT INTO `Списания` VALUES (3,'2016-06-15',1,'Скачок напряжения в сети');
/*!40000 ALTER TABLE `Списания` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `СписаннаяТехника`
--

DROP TABLE IF EXISTS `СписаннаяТехника`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `СписаннаяТехника` (
  `id_экземпляра_техники` int(3) NOT NULL,
  `id_списания` smallint(2) NOT NULL,
  `причина` tinytext,
  `id_списанной_техники` int(3) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_экземпляра_техники`,`id_списания`),
  UNIQUE KEY `id_списанной_техники_UNIQUE` (`id_списанной_техники`),
  KEY `fk_id_списания` (`id_списания`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `СписаннаяТехника`
--

LOCK TABLES `СписаннаяТехника` WRITE;
/*!40000 ALTER TABLE `СписаннаяТехника` DISABLE KEYS */;
INSERT INTO `СписаннаяТехника` VALUES (3,3,'Сгорел',1);
/*!40000 ALTER TABLE `СписаннаяТехника` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ТехникаПоНакладной`
--

DROP TABLE IF EXISTS `ТехникаПоНакладной`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ТехникаПоНакладной` (
  `id_накладной` smallint(2) NOT NULL,
  `id_модели_техники` smallint(2) NOT NULL,
  `количество` smallint(2) NOT NULL,
  `цена_за_еденицу` decimal(6,2) DEFAULT NULL,
  `id_техники_по_накладной` int(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_техники_по_накладной`),
  UNIQUE KEY `un_накладной_модели_техники` (`id_накладной`,`id_модели_техники`),
  KEY `fk_id_модели_техники1` (`id_модели_техники`),
  CONSTRAINT `fk_id_модели_техники1` FOREIGN KEY (`id_модели_техники`) REFERENCES `МоделиТехники` (`id_модели_техники`),
  CONSTRAINT `fk_id_накладной` FOREIGN KEY (`id_накладной`) REFERENCES `Накладные` (`id_накладной`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ТехникаПоНакладной`
--

LOCK TABLES `ТехникаПоНакладной` WRITE;
/*!40000 ALTER TABLE `ТехникаПоНакладной` DISABLE KEYS */;
INSERT INTO `ТехникаПоНакладной` VALUES (1,1,3,7999.99,1),(1,2,3,1999.00,2),(1,3,3,199.00,3),(1,4,3,219.00,4),(2,2,1,999.00,5),(3,1,45,666.00,6);
/*!40000 ALTER TABLE `ТехникаПоНакладной` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Телефоны`
--

DROP TABLE IF EXISTS `Телефоны`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Телефоны` (
  `id_телефона` smallint(2) NOT NULL AUTO_INCREMENT,
  `телефон` varchar(100) NOT NULL,
  PRIMARY KEY (`id_телефона`),
  UNIQUE KEY `телефон_UNIQUE` (`телефон`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Телефоны`
--

LOCK TABLES `Телефоны` WRITE;
/*!40000 ALTER TABLE `Телефоны` DISABLE KEYS */;
INSERT INTO `Телефоны` VALUES (3,'+380(63)1234567'),(2,'+380(95)1052933'),(4,'+380(96)9875432'),(1,'+380(99)0646947'),(5,'+7(812)12312322');
/*!40000 ALTER TABLE `Телефоны` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ТипыОрганизаций`
--

DROP TABLE IF EXISTS `ТипыОрганизаций`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ТипыОрганизаций` (
  `id_типа_организации` smallint(2) NOT NULL AUTO_INCREMENT,
  `аббревиатура` char(5) NOT NULL,
  `название` varchar(70) NOT NULL,
  PRIMARY KEY (`id_типа_организации`),
  UNIQUE KEY `аббревиатура_UNIQUE` (`аббревиатура`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ТипыОрганизаций`
--

LOCK TABLES `ТипыОрганизаций` WRITE;
/*!40000 ALTER TABLE `ТипыОрганизаций` DISABLE KEYS */;
INSERT INTO `ТипыОрганизаций` VALUES (1,'ОАО','Открытое акционерное общество'),(2,'ЧП','Частный предприниматель');
/*!40000 ALTER TABLE `ТипыОрганизаций` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ТипыПП`
--

DROP TABLE IF EXISTS `ТипыПП`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ТипыПП` (
  `id_типа_ПП` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(80) NOT NULL,
  PRIMARY KEY (`id_типа_ПП`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ТипыПП`
--

LOCK TABLES `ТипыПП` WRITE;
/*!40000 ALTER TABLE `ТипыПП` DISABLE KEYS */;
INSERT INTO `ТипыПП` VALUES (1,'Операционная система'),(2,'Офисный пакет');
/*!40000 ALTER TABLE `ТипыПП` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ТипыТехники`
--

DROP TABLE IF EXISTS `ТипыТехники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ТипыТехники` (
  `id_типа_техники` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(60) NOT NULL,
  PRIMARY KEY (`id_типа_техники`),
  UNIQUE KEY `название_UNIQUE` (`название`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ТипыТехники`
--

LOCK TABLES `ТипыТехники` WRITE;
/*!40000 ALTER TABLE `ТипыТехники` DISABLE KEYS */;
INSERT INTO `ТипыТехники` VALUES (3,'Внешний жесткий диск'),(1,'Жесткий диск'),(7,'Клавиатура'),(4,'Монитор'),(6,'Мышь'),(2,'Оперативная память'),(5,'Системный блок');
/*!40000 ALTER TABLE `ТипыТехники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ТипыУлиц`
--

DROP TABLE IF EXISTS `ТипыУлиц`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ТипыУлиц` (
  `id_типа_улицы` smallint(2) NOT NULL AUTO_INCREMENT,
  `название` varchar(20) NOT NULL,
  `сокращенное_название` varchar(4) NOT NULL,
  PRIMARY KEY (`id_типа_улицы`),
  UNIQUE KEY `название_UNIQUE` (`название`),
  UNIQUE KEY `сокращенное_название_UNIQUE` (`сокращенное_название`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ТипыУлиц`
--

LOCK TABLES `ТипыУлиц` WRITE;
/*!40000 ALTER TABLE `ТипыУлиц` DISABLE KEYS */;
INSERT INTO `ТипыУлиц` VALUES (1,'Улица','ул'),(2,'Проспект','пр-т'),(3,'Бульвар','б-р');
/*!40000 ALTER TABLE `ТипыУлиц` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `УстановленныеПП`
--

DROP TABLE IF EXISTS `УстановленныеПП`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `УстановленныеПП` (
  `id_установленногоПП` smallint(2) NOT NULL AUTO_INCREMENT,
  `id_ПП_по_накладной` int(3) NOT NULL,
  `серийный_ключ` varchar(30) NOT NULL,
  `id_экземпляра_техники` int(3) NOT NULL,
  PRIMARY KEY (`id_установленногоПП`),
  KEY `fk_id_экземпляра_техники1` (`id_экземпляра_техники`),
  KEY `fk_id_ПП_по_накладной` (`id_ПП_по_накладной`),
  CONSTRAINT `fk_id_ПП_по_накладной` FOREIGN KEY (`id_ПП_по_накладной`) REFERENCES `ПППоНакладной` (`id_ПП_по_накладной`),
  CONSTRAINT `fk_id_экземпляра_техники1` FOREIGN KEY (`id_экземпляра_техники`) REFERENCES `ЭкземплярыТехники` (`id_экземпляра_техники`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `УстановленныеПП`
--

LOCK TABLES `УстановленныеПП` WRITE;
/*!40000 ALTER TABLE `УстановленныеПП` DISABLE KEYS */;
INSERT INTO `УстановленныеПП` VALUES (1,1,'4256374858',4),(2,2,'657970897',4),(3,1,'45365789',4),(10,1,'42',4);
/*!40000 ALTER TABLE `УстановленныеПП` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `УстановленныеПП_BINS` BEFORE INSERT ON `УстановленныеПП` FOR EACH ROW
begin
	set @count_postav = (select `ПППоНакладной`.`количество` from `ПППоНакладной` where `ПППоНакладной`.`id_пп_по_накладной`=new.`id_пп_по_накладной`);
	set @count_ex = (SELECT count(`УстановленныеПП`.`id_установленногоПП`) FROM `УстановленныеПП` where `УстановленныеПП`.`id_ПП_по_накладной`=new.`id_ПП_по_накладной`);
	if (@count_postav <= @count_ex) then
		insert into `УстановленныеПП` (`id_установленногоПП`,`id_ПП_по_накладной`,`серийный_ключ`,`id_экземпляра_техники`) values (new.`id_установленногоПП`,new.`id_ПП_по_накладной`,new.`серийный_ключ`,new.`id_экземпляра_техники`);
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `УстановленныеПП_BUPD` BEFORE UPDATE ON `УстановленныеПП` FOR EACH ROW
begin
	set @count_postav = (select `ПППоНакладной`.`количество` from `ПППоНакладной` where `ПППоНакладной`.`id_пп_по_накладной`=new.`id_пп_по_накладной`);
	set @count_ex = (SELECT count(`УстановленныеПП`.`id_установленногоПП`) FROM `УстановленныеПП` where `УстановленныеПП`.`id_ПП_по_накладной`=new.`id_ПП_по_накладной`);
	if (@count_postav <= @count_ex) then
		update `УстановленныеПП` set `id_установленногоПП` = new.`id_установленногоПП`, `id_ПП_по_накладной` = new.`id_ПП_по_накладной`, `серийный_ключ` = new.`серийный_ключ`, `id_экземпляра_техники` = new.`id_экземпляра_техники` where `id_установленногоПП`=new.`id_установленногоПП`;
		
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Администрация'),(1,'Пользователи');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_7ec55fe85fdabdb3_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_7ec55fe85fdabdb3_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_62f6da0501f0e530_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,19),(2,1,20),(3,1,31),(4,1,32),(5,1,34),(6,1,35),(7,1,37),(8,1,38),(9,1,40),(10,1,41),(11,1,43),(12,1,44),(13,1,46),(14,1,47),(15,1,49),(16,1,50),(17,1,52),(18,1,53),(19,1,55),(20,1,56),(21,1,58),(22,1,59),(23,1,61),(24,1,62),(25,1,64),(26,1,65),(27,1,67),(28,1,68),(29,1,70),(30,1,71),(31,1,73),(32,1,74),(33,1,76),(34,1,77),(35,1,79),(36,1,80),(37,1,82),(38,1,83),(39,1,85),(40,1,86),(41,1,88),(42,1,89),(43,1,91),(44,1,92),(45,1,94),(46,1,95),(47,1,97),(48,1,98),(49,1,100),(50,1,101),(51,1,103),(52,1,104),(53,1,106),(54,1,107),(55,1,109),(56,1,110),(57,2,19),(58,2,20),(59,2,21),(60,2,31),(61,2,32),(62,2,33),(63,2,34),(64,2,35),(65,2,36),(66,2,37),(67,2,38),(68,2,39),(69,2,40),(70,2,41),(71,2,42),(72,2,43),(73,2,44),(74,2,45),(75,2,46),(76,2,47),(77,2,48),(78,2,49),(79,2,50),(80,2,51),(81,2,52),(82,2,53),(83,2,54),(84,2,55),(85,2,56),(86,2,57),(87,2,58),(88,2,59),(89,2,60),(90,2,61),(91,2,62),(92,2,63),(93,2,64),(94,2,65),(95,2,66),(96,2,67),(97,2,68),(98,2,69),(99,2,70),(100,2,71),(101,2,72),(102,2,73),(103,2,74),(104,2,75),(105,2,76),(106,2,77),(107,2,78),(108,2,79),(109,2,80),(110,2,81),(111,2,82),(112,2,83),(113,2,84),(114,2,85),(115,2,86),(116,2,87),(117,2,88),(118,2,89),(119,2,90),(120,2,91),(121,2,92),(122,2,93),(123,2,94),(124,2,95),(125,2,96),(126,2,97),(127,2,98),(128,2,99),(129,2,100),(130,2,101),(131,2,102),(132,2,103),(133,2,104),(134,2,105),(135,2,106),(136,2,107),(137,2,108),(138,2,109),(139,2,110),(140,2,111);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_5a1aff728425a5c5_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add должности',7,'add_должности'),(20,'Can change должности',7,'change_должности'),(21,'Can delete должности',7,'delete_должности'),(22,'Can add bookmark',33,'add_bookmark'),(23,'Can change bookmark',33,'change_bookmark'),(24,'Can delete bookmark',33,'delete_bookmark'),(25,'Can add dashboard preferences',34,'add_dashboardpreferences'),(26,'Can change dashboard preferences',34,'change_dashboardpreferences'),(27,'Can delete dashboard preferences',34,'delete_dashboardpreferences'),(28,'Can add site',35,'add_site'),(29,'Can change site',35,'change_site'),(30,'Can delete site',35,'delete_site'),(31,'Can add адрес',8,'add_адреса'),(32,'Can change адрес',8,'change_адреса'),(33,'Can delete адрес',8,'delete_адреса'),(34,'Can add единица измерения',9,'add_еденицыизмерения'),(35,'Can change единица измерения',9,'change_еденицыизмерения'),(36,'Can delete единица измерения',9,'delete_еденицыизмерения'),(37,'Can add еденица техники',19,'add_еденицытехники'),(38,'Can change еденица техники',19,'change_еденицытехники'),(39,'Can delete еденица техники',19,'delete_еденицытехники'),(40,'Can add название единицы техники',20,'add_названияеденицытехники'),(41,'Can change название единицы техники',20,'change_названияеденицытехники'),(42,'Can delete название единицы техники',20,'delete_названияеденицытехники'),(43,'Can add комната',15,'add_комнаты'),(44,'Can change комната',15,'change_комнаты'),(45,'Can delete комната',15,'delete_комнаты'),(46,'Can add комплект',17,'add_комплекты'),(47,'Can change комплект',17,'change_комплекты'),(48,'Can delete комплект',17,'delete_комплекты'),(49,'Can add название комплекта',18,'add_названиякомплекта'),(50,'Can change название комплекта',18,'change_названиякомплекта'),(51,'Can delete название комплекта',18,'delete_названиякомплекта'),(52,'Can add модель техники',14,'add_моделитехники'),(53,'Can change модель техники',14,'change_моделитехники'),(54,'Can delete модель техники',14,'delete_моделитехники'),(55,'Can add накладная',27,'add_накладные'),(56,'Can change накладная',27,'change_накладные'),(57,'Can delete накладная',27,'delete_накладные'),(58,'Can add пограммный продукт по накладной',29,'add_пппонакладной'),(59,'Can change пограммный продукт по накладной',29,'change_пппонакладной'),(60,'Can delete пограммный продукт по накладной',29,'delete_пппонакладной'),(61,'Can add поставщик',24,'add_поставщики'),(62,'Can change поставщик',24,'change_поставщики'),(63,'Can delete поставщик',24,'delete_поставщики'),(64,'Can add программный продукт',36,'add_программныепродукты'),(65,'Can change программный продукт',36,'change_программныепродукты'),(66,'Can delete программный продукт',36,'delete_программныепродукты'),(67,'Can add производитель',10,'add_производители'),(68,'Can change производитель',10,'change_производители'),(69,'Can delete производитель',10,'delete_производители'),(70,'Can add рабочее место',16,'add_рабочиеместа'),(71,'Can change рабочее место',16,'change_рабочиеместа'),(72,'Can delete рабочее место',16,'delete_рабочиеместа'),(73,'Can add сотрудник',23,'add_сотрудники'),(74,'Can change сотрудник',23,'change_сотрудники'),(75,'Can delete сотрудник',23,'delete_сотрудники'),(76,'Can add списание',31,'add_списания'),(77,'Can change списание',31,'change_списания'),(78,'Can delete списание',31,'delete_списания'),(79,'Can add списанная техника',32,'add_списаннаятехника'),(80,'Can change списанная техника',32,'change_списаннаятехника'),(81,'Can delete списанная техника',32,'delete_списаннаятехника'),(82,'Can add телефон',22,'add_телефоны'),(83,'Can change телефон',22,'change_телефоны'),(84,'Can delete телефон',22,'delete_телефоны'),(85,'Can add техника по накладной',26,'add_техникапонакладной'),(86,'Can change техника по накладной',26,'change_техникапонакладной'),(87,'Can delete техника по накладной',26,'delete_техникапонакладной'),(88,'Can add тип организации',25,'add_типыорганизаций'),(89,'Can change тип организации',25,'change_типыорганизаций'),(90,'Can delete тип организации',25,'delete_типыорганизаций'),(91,'Can add тип программного продукта',37,'add_типыпп'),(92,'Can change тип программного продукта',37,'change_типыпп'),(93,'Can delete тип программного продукта',37,'delete_типыпп'),(94,'Can add тип техники',21,'add_типытехники'),(95,'Can change тип техники',21,'change_типытехники'),(96,'Can delete тип техники',21,'delete_типытехники'),(97,'Can add тип улицы',12,'add_типыулиц'),(98,'Can change тип улицы',12,'change_типыулиц'),(99,'Can delete тип улицы',12,'delete_типыулиц'),(100,'Can add установленный программный продукт',30,'add_установленныепп'),(101,'Can change установленный программный продукт',30,'change_установленныепп'),(102,'Can delete установленный программный продукт',30,'delete_установленныепп'),(103,'Can add характеристика',11,'add_характеристики'),(104,'Can change характеристика',11,'change_характеристики'),(105,'Can delete характеристика',11,'delete_характеристики'),(106,'Can add характеристика модели',13,'add_характеристикимодели'),(107,'Can change характеристика модели',13,'change_характеристикимодели'),(108,'Can delete характеристика модели',13,'delete_характеристикимодели'),(109,'Can add экземпляр техники',28,'add_экземплярытехники'),(110,'Can change экземпляр техники',28,'change_экземплярытехники'),(111,'Can delete экземпляр техники',28,'delete_экземплярытехники');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$24000$EqBcuuRt3Mgw$ocmdPzy+i9T4sw6bQ+x1OoUYjbmSSaP3OQ0tdlOwMI4=','2016-11-07 12:46:14',1,'keeper.keyss@gmail.com','','','keeper.keyss@gmail.com',1,1,'2016-05-02 12:37:21'),(3,'pbkdf2_sha256$24000$UGpGlRJapOKO$a9H7DQ3D4vfDCHSw7oRhNWWC1ASIbWcRxIO1t3AJboc=','2016-11-07 13:00:03',0,'user','','','',1,1,'2016-11-07 12:29:29'),(4,'pbkdf2_sha256$24000$rBEUICySZugT$dnNPyi5Mf7Mb2J7y46VJWuKxLr4c12ua0kB1gWAtg70=',NULL,0,'admin','','','',1,1,'2016-11-07 12:29:54');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_5dfe635b739ab936_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_5dfe635b739ab936_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_46953db10999ddae_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1),(2,4,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_2cc62fa3f018144d_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_2cc62fa3f018144d_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_777948f340e492b8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_content_type_id_66090c9b547d594_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_53302fd3989799a2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_53302fd3989799a2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_content_type_id_66090c9b547d594_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-02 12:38:40','1','admin',3,'',4,2),(2,'2016-05-02 12:51:04','436','Должности object',1,'',7,2),(3,'2016-05-02 12:54:38','0','Должности object',1,'',7,2),(4,'2016-05-02 13:01:13','0','Должности object',3,'',7,2),(5,'2016-05-02 13:01:48','5','Должности object',1,'',7,2),(6,'2016-05-02 13:15:35','5','собака',3,'',7,2),(7,'2016-05-04 19:43:30','5','вес',1,'',11,2),(8,'2016-05-04 19:55:45','5','хрен',2,'Изменен название.',11,2),(9,'2016-05-04 19:59:23','1214','2 (213)',1,'',12,2),(10,'2016-05-04 19:59:29','1214','2 (213)',3,'',12,2),(11,'2016-05-11 16:47:24','1','Адреса object',2,'Изменен apartment.',8,2),(12,'2016-05-11 16:47:39','1','Адреса object',2,'Изменен id_типа_улицы.',8,2),(13,'2016-05-11 16:47:45','1','Адреса object',2,'Изменен id_типа_улицы.',8,2),(14,'2016-05-11 16:48:03','1','Адреса object',2,'Ни одно поле не изменено.',8,2),(15,'2016-05-11 16:48:50','1','Адреса object',2,'Ни одно поле не изменено.',8,2),(16,'2016-05-11 16:50:00','1','Адреса object',2,'Ни одно поле не изменено.',8,2),(17,'2016-05-11 16:51:13','1','Адреса object',2,'Ни одно поле не изменено.',8,2),(18,'2016-05-11 16:51:47','1','Адреса object',2,'Ни одно поле не изменено.',8,2),(19,'2016-05-11 16:53:39','1','Адреса object',2,'Изменен apartment.',8,2),(20,'2016-05-11 17:01:22','1','Адреса object',2,'Изменен apartment.',8,2),(21,'2016-05-11 17:35:36','None','Россия,Москва,Маршала Генералова,14,88',1,'',8,2),(22,'2016-05-11 17:38:19','6','Россия,Москва,ул,Маршала Генералова,14,88',2,'Ни одно поле не изменено.',8,2),(23,'2016-05-11 17:38:37','6','Россия,Москва,ул,Маршала Генералова,14,88',2,'Ни одно поле не изменено.',8,2),(24,'2016-05-11 17:39:50','6','Россия,  Москва, ул,  Маршала Генералова,  14,  88',2,'Ни одно поле не изменено.',8,2),(25,'2016-05-20 19:36:08','1','Персональный компьютер',1,'',18,2),(26,'2016-05-20 19:36:16','2','Принтер',1,'',18,2),(27,'2016-05-20 19:36:34','3','Телефон',1,'',18,2),(28,'2016-05-20 19:36:44','2','Комната № 1, рабочее место № 1а, комплект \"Персональный компьютер\"',2,'Изменен id_названия_комплекта.',17,2),(29,'2016-05-20 19:36:49','1','Комната № 1, рабочее место № 1а, комплект \"Персональный компьютер\"',2,'Изменен id_названия_комплекта.',17,2),(30,'2016-05-20 19:52:48','1','Жесткий диск',1,'',20,2),(31,'2016-05-20 19:52:57','2','Системный блок',1,'',20,2),(32,'2016-05-20 19:53:02','3','Персональный компьютер',1,'',20,2),(33,'2016-05-20 19:53:52','4','Монитор',1,'',20,2),(34,'2016-05-20 19:53:58','5','Клавиатура',1,'',20,2),(35,'2016-05-20 19:54:21','6','Монитор',1,'',20,2),(36,'2016-05-20 19:54:42','6','Монитор',3,'',20,2),(37,'2016-05-20 20:25:08','3','Системный блок ',2,'Изменен id_названия_еденицы_техники.',19,2),(38,'2016-05-20 20:25:13','2','Монитор ',2,'Изменен id_названия_еденицы_техники.',19,2),(39,'2016-05-20 20:25:17','1','Клавиатура ',2,'Изменен id_названия_еденицы_техники.',19,2),(40,'2016-05-30 07:48:26','4','Телефоны object',2,'Изменен phone.',22,2),(41,'2016-05-30 07:52:26','3','+380(63)1234567',2,'Изменен phone.',22,2),(42,'2016-05-30 07:53:24','2','+380(95)1052933',2,'Изменен phone.',22,2),(43,'2016-05-30 07:53:30','1','+380(99)0646947',2,'Изменен phone.',22,2),(44,'2016-05-30 07:54:50','5','+7(812)12312322',1,'',22,2),(45,'2016-05-30 08:08:32','1','Сотрудники object',2,'Изменен пол.',23,2),(46,'2016-05-30 08:08:40','1','Сотрудники object',2,'Изменен пол.',23,2),(47,'2016-05-30 12:38:09','2','Абарахман А. Н.',2,'Изменен дата_рождения.',23,2),(48,'2016-06-14 10:53:23','1','ТипыОрганизаций object',1,'',25,2),(49,'2016-06-14 10:56:53','2','ОАО \"ПостПКкудаУгодно\"',2,'Изменен id_типа_организации.',24,2),(50,'2016-06-14 10:57:30','2','Частный предприниматель (ЧП)',1,'',25,2),(51,'2016-06-14 10:57:36','1','ЧП \"Сюткин Валерий Миладович\"',2,'Изменен id_типа_организации.',24,2),(52,'2016-06-14 10:58:08','2','\"ПостПКкудаУгодно',2,'Изменен название.',24,2),(53,'2016-06-14 10:58:18','1','Сюткин Валерий Миладович',2,'Изменен название.',24,2),(54,'2016-06-14 10:58:22','2','ПостПКкудаУгодно',2,'Изменен название.',24,2),(55,'2016-06-15 11:09:45','5','АГ123Н12 Sun F1F Samsung Монитор',1,'',26,2),(56,'2016-06-15 11:42:26','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 2016-12-17',2,'Изменен id_еденицы_техники.',28,2),(57,'2016-06-15 11:44:15','2','АГ123Н11 Luft A7 Seagate Системный блок 1111112 2016-12-17',2,'Изменен id_еденицы_техники.',28,2),(58,'2016-06-15 11:44:20','1','АГ123Н11 Luft A7 Seagate Системный блок 1111111 2016-12-17',2,'Изменен id_еденицы_техники.',28,2),(59,'2016-06-15 11:55:46','3','АГ123Н11 Sun F1F Samsung Монитор 1111113 2016-12-17',2,'Изменен id_техники_по_накладной.',28,2),(60,'2016-06-15 11:55:53','2','АГ123Н11 Lol 11 Samsung Мышь 1111112 2016-12-17',2,'Изменен id_техники_по_накладной.',28,2),(61,'2016-06-15 11:55:58','1','АГ123Н11 Kek 1337 Samsung Клавиатура 1111111 2016-12-17',2,'Изменен id_техники_по_накладной.',28,2),(62,'2016-06-15 15:37:25','1','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 2016-12-17 4256374858',1,'',30,2),(63,'2016-06-15 15:39:24','2','АГ123Н12 Офисный пакет Microsoft Office 365, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 2016-12-17 657970897',1,'',30,2),(64,'2016-06-15 16:09:59','3','Янченко А. О. 2016-06-15',1,'',31,2),(65,'2016-06-15 16:18:04','3','Янченко А. О. 2016-06-15',2,'Изменен заголовок.',31,2),(66,'2016-06-15 16:33:17','1','АГ123Н11 Sun F1F Samsung Монитор 1111113 2016-12-17 Янченко А. О. 2016-06-15',1,'',32,2),(67,'2016-06-15 16:34:19','5','АГ123Н12 Sun F1F Samsung Монитор 11122 2017-06-15',1,'',28,2),(68,'2016-06-15 16:36:36','5','АГ123Н12 Sun F1F Samsung Монитор 1111115 2017-06-15',2,'Изменен инвентарный_номер.',28,2),(69,'2016-06-26 18:47:33','2','км. № 1, раб. место № 1а, компл. \"Принтер\"',2,'Изменен id_названия_комплекта.',17,2),(70,'2016-06-27 14:13:49','3','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 45365789',1,'',30,2),(71,'2016-06-27 14:57:45','4','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 у3ц546у5786',1,'',30,2),(72,'2016-06-27 15:08:11','6','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 фывыфвыфв',1,'',30,2),(73,'2016-06-27 15:08:23','6','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 фывыфвыфв',3,'',30,2),(74,'2016-06-27 15:08:24','5','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3dsfdsf4',3,'',30,2),(75,'2016-06-27 15:08:24','4','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3434',3,'',30,2),(76,'2016-06-27 15:10:42','4','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3434',3,'',30,2),(77,'2016-06-27 15:11:49','5','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3434',3,'',30,2),(78,'2016-06-27 15:11:49','4','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3434',3,'',30,2),(79,'2016-06-27 15:27:08','4','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3434',3,'',30,2),(80,'2016-06-27 15:31:13','2','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 657970897',2,'Изменен id_пп_по_накладной.',30,2),(81,'2016-06-27 15:31:29','2','АГ123Н12 Офисный пакет Microsoft Office 365, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 657970897',2,'Изменен id_пп_по_накладной.',30,2),(82,'2016-06-27 15:39:27','7','АГ123Н12 Офисный пакет Microsoft Office 365, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 54675',1,'',30,2),(83,'2016-06-27 16:12:01','7','АГ123Н12 Офисный пакет Microsoft Office 365, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 54675',2,'Ни одно поле не изменено.',30,2),(84,'2016-06-27 16:12:12','7','АГ123Н12 Офисный пакет Microsoft Office 365, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 54675',3,'',30,2),(85,'2016-06-27 16:12:12','4','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 3434',3,'',30,2),(86,'2016-06-27 16:12:29','8','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 2145367',1,'',30,2),(87,'2016-06-27 16:13:02','8','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 2145367',3,'',30,2),(88,'2016-06-27 16:18:29','9','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 23546457',1,'',30,2),(89,'2016-06-27 16:20:46','9','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 23546457',3,'',30,2),(90,'2016-06-27 16:21:58','10','АГ123Н12 Операционная система Microsoft Windows 10, количество 3 АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016 42',1,'',30,2),(91,'2016-06-27 16:52:50','5','АГ123Н12 Sun F1F Samsung Монитор 1111115 15-06-2017',3,'',28,2),(92,'2016-06-27 16:53:10','6','АГ123Н12 Sun F1F Samsung Монитор 1111115 27-06-2017',1,'',28,2),(93,'2016-06-27 16:58:45','7','АГ123Н11 Sun F1F Samsung Монитор 222 27-06-2017',3,'',28,2),(94,'2016-06-27 17:25:14','3','Украина,   Харьков, ул,   Горича,   11, 11',2,'Изменен apartment.',8,2),(95,'2016-06-27 17:25:41','3','Украина,    Харьков, ул,    Горича,    11,  ',2,'Изменен apartment.',8,2),(96,'2016-06-27 17:25:50','3','Украина,     Харьков, ул,     Горича,     11,  ',2,'Изменен apartment.',8,2),(97,'2016-06-27 17:25:55','3','Украина,      Харьков, ул,      Горича,      11,  ',2,'Изменен apartment.',8,2),(98,'2016-06-27 17:26:09','3','Украина,  Харьков, ул,  Горича,  11,   ',2,'Изменен city, street и house.',8,2),(99,'2016-06-27 17:26:26','6','Россия,  Москва, ул,  Маршала Генералова,  14, 88',2,'Изменен city, street, house и apartment.',8,2),(100,'2016-06-27 17:38:32','2','Абарахман А. Н.',2,'Изменен id_рабочего_места.',23,2),(101,'2016-06-27 17:43:53','1','АГ123Н11 Luft A7 Seagate Системный блок, количество 3',2,'Изменен цена_за_еденицу.',26,2),(102,'2016-06-27 17:44:22','1','АГ123Н11 Luft A7 Seagate Системный блок, количество 3',2,'Изменен цена_за_еденицу.',26,2),(103,'2016-09-27 13:46:09','5','+7(812)12312322',2,'Ни одно поле не изменено.',22,2),(104,'2016-09-27 14:04:27','3','АГ123Н124 (ЧП \"Сюткин Валерий Миладович\") 28-09-2016',1,'Добавлено.',27,2),(105,'2016-09-27 14:08:10','6','АГ123Н124 Luft A7 Seagate Системный блок, количество 45',1,'Добавлено.',26,2),(106,'2016-09-30 19:50:55','5','летчик',1,'Добавлено.',7,2),(107,'2016-09-30 19:51:08','5','летчик',2,'Изменен название.',7,2),(108,'2016-09-30 19:55:32','5','летчик',3,'',7,2),(109,'2016-09-30 19:55:44','9','мегабайты (Мб)',2,'Изменен название.',9,2),(110,'2016-09-30 20:15:11','6','ЛЕТЧИ',1,'Добавлено.',7,2),(111,'2016-09-30 20:15:27','6','ЛЕТЧИ',3,'',7,2),(112,'2016-09-30 20:15:35','7','ЛЕТЧИ',1,'Добавлено.',7,2),(113,'2016-09-30 20:16:13','7','ЛЕТЧИ',3,'',7,2),(114,'2016-09-30 20:16:19','8','Летчи',1,'Добавлено.',7,2),(115,'2016-09-30 20:16:38','8','Летчи',3,'',7,2),(116,'2016-09-30 20:16:44','9','Летчик',1,'Добавлено.',7,2),(117,'2016-09-30 20:16:50','9','Летчик',3,'',7,2),(118,'2016-09-30 20:16:53','1','Бухгалтер',2,'Ни одно поле не изменено.',7,2),(119,'2016-09-30 20:16:56','4','Грузчик',2,'Ни одно поле не изменено.',7,2),(120,'2016-09-30 20:16:58','3','Консультант',2,'Ни одно поле не изменено.',7,2),(121,'2016-09-30 20:17:01','2','Менеджер',2,'Ни одно поле не изменено.',7,2),(122,'2016-09-30 20:17:58','10','Гигабайты (Гб)',2,'Ни одно поле не изменено.',9,2),(123,'2016-09-30 20:18:00','2','Граммы (г)',2,'Ни одно поле не изменено.',9,2),(124,'2016-09-30 20:18:03','1','Килограммы (кг)',2,'Ни одно поле не изменено.',9,2),(125,'2016-09-30 20:18:05','9','Мегабайты (Мб)',2,'Ни одно поле не изменено.',9,2),(126,'2016-09-30 20:18:08','5','Мегагерцы (МГц)',2,'Ни одно поле не изменено.',9,2),(127,'2016-09-30 20:18:11','7','Метры (м)',2,'Ни одно поле не изменено.',9,2),(128,'2016-09-30 20:18:13','8','Милиметры (мм)',2,'Ни одно поле не изменено.',9,2),(129,'2016-09-30 20:18:15','3','Минуты (м)',2,'Ни одно поле не изменено.',9,2),(130,'2016-09-30 20:18:17','4','Обороты в минуту (об/мин)',2,'Ни одно поле не изменено.',9,2),(131,'2016-09-30 20:18:20','6','Сантиметры (см)',2,'Ни одно поле не изменено.',9,2),(132,'2016-09-30 20:18:30','5','Клавиатура',2,'Ни одно поле не изменено.',20,2),(133,'2016-09-30 20:18:32','4','Монитор',2,'Ни одно поле не изменено.',20,2),(134,'2016-09-30 20:18:34','3','Персональный компьютер',2,'Ни одно поле не изменено.',20,2),(135,'2016-09-30 20:18:36','2','Системный блок',2,'Ни одно поле не изменено.',20,2),(136,'2016-09-30 20:18:38','1','Жесткий диск',2,'Ни одно поле не изменено.',20,2),(137,'2016-09-30 20:56:33','4','Летчик',1,'Добавлено.',18,2),(138,'2016-09-30 20:56:44','4','Летчик',3,'',18,2),(139,'2016-09-30 21:00:12','4','Kek 1337 Samsung Клавиатура',2,'Изменен название.',14,2),(140,'2016-09-30 21:14:36','4','01-10-2016 3242 (ЧП \"Сюткин Валерий Миладович\") ',1,'Добавлено.',27,2),(141,'2016-09-30 21:14:41','4','01-10-2016 3242 (ЧП \"Сюткин Валерий Миладович\") ',3,'',27,2),(142,'2016-09-30 21:22:19','5','01-10-2016 5y45 (ЧП \"Сюткин Валерий Миладович\") ',1,'Добавлено.',27,2),(143,'2016-09-30 21:28:11','5','01-10-2016 5y45 (ЧП \"Сюткин Валерий Миладович\") ',3,'',27,2),(144,'2016-09-30 21:28:19','6','02-10-2016 2ыва (ЧП \"Сюткин Валерий Миладович\") ',1,'Добавлено.',27,2),(145,'2016-09-30 21:28:57','6','02-10-2016 2ыва (ЧП \"Сюткин Валерий Миладович\") ',3,'',27,2),(146,'2016-09-30 21:32:22','7','02-10-1950 asd (ЧП \"Сюткин Валерий Миладович\") ',1,'Добавлено.',27,2),(147,'2016-09-30 21:32:53','7','02-10-1950 asd (ЧП \"Сюткин Валерий Миладович\") ',2,'Ни одно поле не изменено.',27,2),(148,'2016-09-30 21:33:22','7','02-10-1950 asd (ЧП \"Сюткин Валерий Миладович\") ',3,'',27,2),(149,'2016-10-02 09:51:32','3','asd a. s.',1,'Добавлено.',23,2),(150,'2016-10-02 09:52:43','4','asd a. s.',1,'Добавлено.',23,2),(151,'2016-10-02 09:53:08','5','asd a. s.',1,'Добавлено.',23,2),(152,'2016-10-02 09:54:05','5','asd a. s.',2,'Ни одно поле не изменено.',23,2),(153,'2016-10-02 09:54:27','5','asd a. s.',2,'Ни одно поле не изменено.',23,2),(154,'2016-10-02 09:55:24','4','asd a. s.',3,'',23,2),(155,'2016-10-02 09:55:24','3','asd a. s.',3,'',23,2),(156,'2016-10-02 09:55:28','5','asd a. s.',2,'Ни одно поле не изменено.',23,2),(157,'2016-10-02 09:56:07','5','asd a. s.',2,'Ни одно поле не изменено.',23,2),(158,'2016-10-02 09:59:44','5','asd a. s.',2,'Изменен дата_рождения.',23,2),(159,'2016-10-02 09:59:50','5','asd a. s.',2,'Изменен дата_рождения.',23,2),(160,'2016-10-02 10:00:53','5','asd a. s.',2,'Изменен дата_рождения.',23,2),(161,'2016-10-02 10:03:06','5','Asd A. S.',2,'Изменен дата_рождения.',23,2),(162,'2016-10-02 10:03:17','5','Asd A. S.',3,'',23,2),(163,'2016-10-02 10:05:11','2','ЧП',2,'Изменен название.',25,2),(164,'2016-10-02 10:07:23','2','ЧП',2,'Изменен аббревиатура.',25,2),(165,'2016-10-02 10:19:43','6','+380(99)0646940',1,'Добавлено.',22,2),(166,'2016-10-02 10:23:46','7','+380(99)099064694',1,'Добавлено.',22,2),(167,'2016-10-02 10:23:53','7','+380(99)099064694',3,'',22,2),(168,'2016-10-02 10:32:21','6','+380(99)0646940',3,'',22,2),(169,'2016-10-02 10:41:27','2','Офисный пакет',2,'Изменен название.',37,2),(170,'2016-10-02 10:59:45','6','Asd A. S.',1,'Добавлено.',23,2),(171,'2016-10-02 11:04:08','6','Asd A. S.',2,'Ни одно поле не изменено.',23,2),(172,'2016-10-02 11:14:40','6','Asd A. S.',2,'Ни одно поле не изменено.',23,2),(173,'2016-10-02 11:14:57','6','Asd A. S.',3,'',23,2),(174,'2016-10-02 11:16:44','3','ОАО \"asd\"',1,'Добавлено.',24,2),(175,'2016-10-02 11:16:52','3','ОАО \"asd\"',3,'',24,2),(176,'2016-10-02 11:20:20','3','Бульвар (б-р)',2,'Ни одно поле не изменено.',12,2),(177,'2016-10-02 11:20:23','2','Проспект (пр-т)',2,'Ни одно поле не изменено.',12,2),(178,'2016-10-02 11:20:25','1','Улица (ул)',2,'Ни одно поле не изменено.',12,2),(179,'2016-10-02 11:29:27','3','Sun F1F ширина 20.00',2,'Ни одно поле не изменено.',13,2),(180,'2016-10-02 11:29:55','2','Lol 11 высота 17.00',2,'Ни одно поле не изменено.',13,2),(181,'2016-10-02 11:30:00','1','Luft A7 высота 40.00',2,'Ни одно поле не изменено.',13,2),(182,'2016-10-02 11:31:40','3','Sun F1F ширина 20.01',2,'Изменен значение.',13,2),(183,'2016-10-02 11:31:47','3','Sun F1F ширина 20.0000',2,'Изменен значение.',13,2),(184,'2016-10-02 11:32:19','3','Sun F1F ширина 20.00',2,'Ни одно поле не изменено.',13,2),(185,'2016-10-02 11:33:07','1','Высота',2,'Ни одно поле не изменено.',11,2),(186,'2016-10-02 11:33:09','3','Длина',2,'Ни одно поле не изменено.',11,2),(187,'2016-10-02 11:33:10','4','Емкость накопителя',2,'Ни одно поле не изменено.',11,2),(188,'2016-10-02 11:33:18','5','хрен',3,'',11,2),(189,'2016-10-02 11:33:20','2','Ширина',2,'Ни одно поле не изменено.',11,2),(190,'2016-10-02 11:41:38','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2015',2,'Изменен дата_гарантии.',28,2),(191,'2016-10-02 11:42:15','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2015',2,'Ни одно поле не изменено.',28,2),(192,'2016-10-02 11:42:46','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2015',2,'Ни одно поле не изменено.',28,2),(193,'2016-10-02 11:43:18','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2015',2,'Ни одно поле не изменено.',28,2),(194,'2016-10-02 11:43:39','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016',2,'Изменен дата_гарантии.',28,2),(195,'2016-10-02 14:20:29','3','АГ123Н11 Sun F1F Samsung Монитор 1111113 17-12-2017',2,'Изменен дата_гарантии.',28,2),(196,'2016-11-07 11:44:49','4','АГ123Н11 Luft A7 Seagate Системный блок 1111114 17-12-2016',2,'Изменен id_списания.',28,2),(197,'2016-11-07 11:45:51','1','км. № 1, раб. место № 2, компл. \"Персональный компьютер\"',2,'Изменен id_рабочего_места.',17,2),(198,'2016-11-07 11:45:52','3','Системный блок, км. № 1, раб. место № 2, компл. \"Персональный компьютер\"',2,'Ни одно поле не изменено.',19,2),(199,'2016-11-07 11:46:36','1','км. № 1, раб. место № 1а, компл. \"Персональный компьютер\"',2,'Изменен id_рабочего_места.',17,2),(200,'2016-11-07 11:46:37','2','Монитор, км. № 1, раб. место № 1а, компл. \"Персональный компьютер\"',2,'Ни одно поле не изменено.',19,2),(201,'2016-11-07 11:48:14','4','Один монитор',1,'Добавлено.',18,2),(202,'2016-11-07 11:48:17','3','км. № 1, раб. место № 1б, компл. \"Один монитор\"',1,'Добавлено.',17,2),(203,'2016-11-07 11:48:33','5','Монитор, км. № 1, раб. место № 1б, компл. \"Один монитор\"',1,'Добавлено.',19,2),(204,'2016-11-07 12:28:45','1','Пользователь',1,'Добавлено.',3,2),(205,'2016-11-07 12:28:52','1','Пользователи',2,'Изменен name.',3,2),(206,'2016-11-07 12:29:18','2','Администрация',1,'Добавлено.',3,2),(207,'2016-11-07 12:29:29','3','user',1,'Добавлено.',4,2),(208,'2016-11-07 12:29:43','3','user',2,'Изменен groups.',4,2),(209,'2016-11-07 12:29:54','4','admin',1,'Добавлено.',4,2),(210,'2016-11-07 12:29:58','4','admin',2,'Изменен groups.',4,2),(211,'2016-11-07 12:32:13','5','lol',1,'Добавлено.',4,2),(212,'2016-11-07 12:32:17','5','lol',2,'Ни одно поле не изменено.',4,2),(213,'2016-11-07 12:32:51','5','lol',2,'Изменен email.',4,2),(214,'2016-11-07 12:46:24','5','lol',3,'',4,2),(215,'2016-11-07 12:46:31','4','admin',2,'Изменен is_staff.',4,2),(216,'2016-11-07 12:46:37','3','user',2,'Изменен is_staff.',4,2),(217,'2016-11-07 12:47:11','7','3,  3, б-р,  3,  3, 3',1,'Добавлено.',8,3),(218,'2016-11-07 12:47:49','7','3,  3, б-р,  3,  3, 3',3,'',8,2),(219,'2016-11-07 12:53:50','8','2,  2, б-р,  2,  2, 2',1,'Добавлено.',8,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_38618fe8f9cd7000_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'accounting','адреса'),(7,'accounting','должности'),(9,'accounting','еденицыизмерения'),(19,'accounting','еденицытехники'),(15,'accounting','комнаты'),(17,'accounting','комплекты'),(14,'accounting','моделитехники'),(20,'accounting','названияеденицытехники'),(18,'accounting','названиякомплекта'),(27,'accounting','накладные'),(24,'accounting','поставщики'),(29,'accounting','пппонакладной'),(36,'accounting','программныепродукты'),(10,'accounting','производители'),(16,'accounting','рабочиеместа'),(23,'accounting','сотрудники'),(31,'accounting','списания'),(32,'accounting','списаннаятехника'),(22,'accounting','телефоны'),(26,'accounting','техникапонакладной'),(25,'accounting','типыорганизаций'),(37,'accounting','типыпп'),(21,'accounting','типытехники'),(12,'accounting','типыулиц'),(30,'accounting','установленныепп'),(11,'accounting','характеристики'),(13,'accounting','характеристикимодели'),(28,'accounting','экземплярытехники'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(34,'dashboard','dashboardpreferences'),(33,'menu','bookmark'),(6,'sessions','session'),(35,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-04-24 19:14:00'),(2,'auth','0001_initial','2016-04-24 19:14:02'),(3,'admin','0001_initial','2016-04-24 19:14:02'),(4,'contenttypes','0002_remove_content_type_name','2016-04-24 19:14:03'),(5,'auth','0002_alter_permission_name_max_length','2016-04-24 19:14:03'),(6,'auth','0003_alter_user_email_max_length','2016-04-24 19:14:03'),(7,'auth','0004_alter_user_username_opts','2016-04-24 19:14:03'),(8,'auth','0005_alter_user_last_login_null','2016-04-24 19:14:04'),(9,'auth','0006_require_contenttypes_0002','2016-04-24 19:14:04'),(10,'sessions','0001_initial','2016-04-24 19:14:04'),(11,'dashboard','0001_initial','2016-06-20 22:32:35'),(12,'menu','0001_initial','2016-06-20 22:32:36'),(13,'sites','0001_initial','2016-06-20 22:32:36');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3cca4nxvetjws0d1qngc0pleehrwanmm','NjkyNjY5MTNkMTQxZDNlNGZhODE1MzBjZGM0ODU1MjdkYjgwOWZhMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWJjYjJiYmQxZDNkODE3YWEyNGRmNDZjMDA0MGVjYjYyYWY2MWZkMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-05-16 12:49:28'),('5tks63gyhmgh83el598kcl945oudhd18','NTE1NzIyNzM0ZTQ5MGMyZDQ3ZjFhNDYzYjRlNmZjZTJhZDY0NmQxYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDE0Y2UwMTE3MjVjNWJiNDMyNDJmYWZlODI2NzQzZWQ4NTRiOGY1YSIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-11-21 13:00:04'),('7f045jvs4shf0yk56xmi031b74tlxhxa','YjE2NDk0NmRhY2VlZTFmOGM1YmZjNmI1OWYzODgzMTI2NDZlYTA2NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZTBlOGQ0MGVjN2ZjYjgwMzA1MDU5NmIwODA3NTExYWU0NTI5NjljIn0=','2016-10-11 13:39:11'),('93up40tlnevcpqc1k38c5njvjuz5jnsy','YTViNmFmY2RhYzdjYzdmMzJkNjMzNmIzNDgwOWY1YTE1ZGMyNzVjMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiJlYmNiMmJiZDFkM2Q4MTdhYTI0ZGY0NmMwMDQwZWNiNjJhZjYxZmQwIn0=','2016-07-10 11:57:05'),('9yeb35gnznv5zkydmttt5cv390t24va1','ZDY3ZDUwZGI3ODZjYzUxZTliNmI5ZTU2OTBmZTdhYmZkOTM3NTNlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgyNzE4MmVjMmM3OWNhZTlhMjMzYjBhNTUwZjkxNWY4MjhiMGFjOTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-08 19:14:45'),('fpjzsizqxnamay2ubf6owltym1b5s84c','MWE4MTI2NmU0Yjc4YzcwMzI1Y2EyMTZkYzQ0MDI2MDNkNTY2NTA0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViY2IyYmJkMWQzZDgxN2FhMjRkZjQ2YzAwNDBlY2I2MmFmNjFmZDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-06-03 07:29:09'),('li3yb0o5v3abpg3m5l60gk7yk15vzorh','ZWMzZWE5YjQxMDUyNDE5NDQ0YmRlYWJiY2E4ZTRhZTU5MzA0N2NjNzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWUwZThkNDBlYzdmY2I4MDMwNTA1OTZiMDgwNzUxMWFlNDUyOTY5YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-11-21 12:46:14'),('lnw9dze2y0k42fyvzd0uqhv2ee5dddab','NTE1NzIyNzM0ZTQ5MGMyZDQ3ZjFhNDYzYjRlNmZjZTJhZDY0NmQxYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDE0Y2UwMTE3MjVjNWJiNDMyNDJmYWZlODI2NzQzZWQ4NTRiOGY1YSIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-11-21 12:53:40'),('teumu3c42vat4t5bj7q3jv0gi22yp51g','YjE2NDk0NmRhY2VlZTFmOGM1YmZjNmI1OWYzODgzMTI2NDZlYTA2NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZTBlOGQ0MGVjN2ZjYjgwMzA1MDU5NmIwODA3NTExYWU0NTI5NjljIn0=','2016-10-16 09:49:52'),('u30mllg68y4fl0ce4m8xog3h16jrrms8','NGFjMjk4Mzc0N2RkMzQ3ZmNiOGUxYjMyZGJmMzRhNjQ2NjIwY2NkNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZmFlZmQ4OGMwZDBkYzMwNGNhZWI2ZWY1NzhiYzBlNzBmNzU2YjZhIn0=','2016-10-01 15:34:35'),('u7m7bse9zbhf6xug1vhx460ykbacbly8','NTE1NzIyNzM0ZTQ5MGMyZDQ3ZjFhNDYzYjRlNmZjZTJhZDY0NmQxYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDE0Y2UwMTE3MjVjNWJiNDMyNDJmYWZlODI2NzQzZWQ4NTRiOGY1YSIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2016-11-21 12:46:59'),('ud2zn9hdkmq8p2vuvhlyluaophnuwzel','ZThjN2M0ZTczZjQ1ODg5Y2IyOTk2YzcyYWEwMWQ1ZTYwZDljNDE1Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWJjYjJiYmQxZDNkODE3YWEyNGRmNDZjMDA0MGVjYjYyYWY2MWZkMCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-05-16 12:37:33'),('yto0ozbex1sh35d0d7qvo1icam5oophm','MWE4MTI2NmU0Yjc4YzcwMzI1Y2EyMTZkYzQ0MDI2MDNkNTY2NTA0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImViY2IyYmJkMWQzZDgxN2FhMjRkZjQ2YzAwNDBlY2I2MmFmNjFmZDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2016-07-05 08:21:45');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-09 14:40:00
