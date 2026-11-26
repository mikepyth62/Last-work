-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `ID_Agent` int NOT NULL,
  `First_n` varchar(45) NOT NULL,
  `Last_n` varchar(45) NOT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `Address` varchar(250) NOT NULL,
  `Phone_num` varchar(100) NOT NULL,
  `Date_Birth` date NOT NULL,
  `Filial_ID_filial` int NOT NULL,
  `Obrazovanie` varchar(250) NOT NULL,
  `Date_priem` date NOT NULL,
  `Date_uvolnenie` date DEFAULT NULL,
  PRIMARY KEY (`ID_Agent`),
  KEY `fk_Agent_Filial1_idx` (`Filial_ID_filial`),
  CONSTRAINT `fk_Agent_Filial1` FOREIGN KEY (`Filial_ID_filial`) REFERENCES `filial` (`ID_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Анна','Владимировна','Ковалева','ул. Тверская, д. 15, кв. 42, Барнаул','+7 (495) 123-45-67','1988-05-20',1,'Высшее экономическое','2015-03-10',NULL),(2,'Сергей','Игоревич','Новиков','пр. Гагарина, д. 28, кв. 17, Барнаул','+7 (812) 234-56-78','1990-11-15',2,'Высшее юридическое','2018-07-22',NULL),(3,'Ольга','Александровна','Медведева','ул. Морская, д. 8, кв. 5, Барнаул','+7 (862) 345-67-89','1993-02-28',3,'Среднее специальное','2020-01-15',NULL),(4,'Дмитрий','Сергеевич','Воробьев','ул. Кирова, д. 33, кв. 21, Барнаул','+7 (343) 456-78-90','1985-09-10',4,'Высшее финансовое','2012-11-05',NULL),(5,'Елена','Павловна','Тихонова','ул. Балтийская, д. 12, кв. 9, Барнаул','+7 (401) 567-89-01','1995-07-03',5,'Неоконченное высшее','2021-09-18',NULL);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agreement`
--

DROP TABLE IF EXISTS `agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agreement` (
  `ID_Agreement` int NOT NULL,
  `Date_make_agr` date NOT NULL,
  `Sum_insured` int NOT NULL,
  `Tariff_rate` int NOT NULL,
  `Deadline_agr` date NOT NULL,
  `ID_filial` int NOT NULL,
  `ID_Client` int NOT NULL,
  `ID_Agent` int NOT NULL,
  `ID_Insurance` int NOT NULL,
  PRIMARY KEY (`ID_Agreement`),
  KEY `fk_Agreement_Filial_idx` (`ID_filial`),
  KEY `fk_Agreement_Client1_idx` (`ID_Client`),
  KEY `fk_Agreement_Agent1_idx` (`ID_Agent`),
  KEY `fk_Agreement_Insurance1_idx` (`ID_Insurance`),
  CONSTRAINT `fk_Agreement_Agent1` FOREIGN KEY (`ID_Agent`) REFERENCES `agent` (`ID_Agent`),
  CONSTRAINT `fk_Agreement_Client1` FOREIGN KEY (`ID_Client`) REFERENCES `client` (`ID_Client`),
  CONSTRAINT `fk_Agreement_Filial` FOREIGN KEY (`ID_filial`) REFERENCES `filial` (`ID_filial`),
  CONSTRAINT `fk_Agreement_Insurance1` FOREIGN KEY (`ID_Insurance`) REFERENCES `insurance` (`ID_Insurance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agreement`
--

LOCK TABLES `agreement` WRITE;
/*!40000 ALTER TABLE `agreement` DISABLE KEYS */;
INSERT INTO `agreement` VALUES (1,'2024-01-15',1500000,5,'2025-01-15',1,1,1,1),(2,'2024-01-20',500000,1,'2025-01-20',2,2,2,2),(3,'2024-02-01',3000000,1,'2025-02-01',3,3,3,3),(4,'2024-02-10',100000,2,'2024-08-10',4,4,4,4),(5,'2024-02-15',800000,5,'2025-02-15',5,5,5,5),(6,'2024-03-01',1200000,5,'2025-03-01',1,6,1,1),(7,'2024-03-05',450000,1,'2025-03-05',2,7,2,2),(8,'2024-03-10',2500000,1,'2025-03-10',3,8,3,6),(9,'2024-03-15',150000,2,'2024-09-15',4,9,4,7),(10,'2024-03-20',950000,3,'2025-03-20',5,10,5,8),(11,'2024-04-01',1800000,2,'2025-04-01',1,11,1,9),(12,'2024-04-05',600000,5,'2025-04-05',2,12,2,10),(13,'2024-04-10',75000,1,'2024-10-10',3,13,3,11),(14,'2024-04-15',1200000,3,'2025-04-15',4,14,4,12),(15,'2024-04-20',2000000,4,'2025-04-20',5,15,5,13),(16,'2024-05-01',3500000,2,'2025-05-01',1,16,1,14),(17,'2024-05-05',550000,1,'2025-05-05',2,17,2,15),(18,'2024-05-10',2800000,3,'2025-05-10',3,18,3,16),(19,'2024-05-15',1500000,3,'2025-05-15',4,19,4,17),(20,'2024-05-20',4200000,2,'2025-05-20',5,20,5,18),(21,'2024-06-01',8500000,5,'2025-06-01',1,21,1,19),(22,'2024-06-05',750000,3,'2025-06-05',2,22,2,20),(23,'2024-06-10',3200000,4,'2025-06-10',3,23,3,21),(24,'2024-06-15',500000,2,'2024-12-15',4,24,4,22),(25,'2024-06-20',950000,1,'2025-06-20',5,25,5,23),(26,'2024-07-01',1500000,3,'2025-07-01',1,26,1,24),(27,'2024-07-05',12000000,7,'2025-07-05',2,27,2,25),(28,'2024-07-10',650000,2,'2025-07-10',3,28,3,26),(29,'2024-07-15',2800000,3,'2025-07-15',4,29,4,27),(30,'2024-07-20',5500000,5,'2025-07-20',5,30,5,30),(31,'2024-03-10',150000,2,'2025-03-10',1,1,1,1),(32,'2024-03-11',200000,1,'2025-03-11',1,2,1,2),(33,'2024-03-12',180000,1,'2025-03-12',1,3,1,3),(34,'2024-03-13',90000,2,'2024-09-13',1,4,2,4),(35,'2024-03-14',120000,2,'2024-12-14',1,5,2,5),(36,'2024-03-15',250000,1,'2025-03-15',1,1,1,1),(37,'2024-03-16',110000,2,'2025-03-16',1,2,1,2),(38,'2024-03-17',95000,2,'2024-09-17',1,3,2,3),(39,'2024-03-18',140000,2,'2025-03-18',2,4,3,4),(40,'2024-03-19',80000,2,'2024-09-19',2,5,3,5),(41,'2024-03-20',170000,1,'2025-03-20',2,1,4,1),(42,'2024-03-21',130000,2,'2024-12-21',2,2,4,2),(43,'2024-03-22',100000,2,'2024-09-22',2,3,3,3),(44,'2024-03-23',160000,1,'2025-03-23',3,4,5,4),(45,'2024-03-24',85000,2,'2024-09-24',3,5,5,5),(46,'2024-03-25',220000,1,'2025-03-25',3,1,5,1),(47,'2024-03-26',95000,2,'2024-09-26',4,2,1,2),(48,'2024-03-27',180000,1,'2025-03-27',4,3,2,3),(49,'2024-03-28',110000,2,'2025-03-28',5,4,3,4),(50,'2024-03-29',300000,1,'2025-09-29',1,6,1,1),(51,'2024-03-30',120000,2,'2024-12-30',2,6,2,2),(52,'2024-03-31',90000,2,'2024-06-30',3,6,3,3),(53,'2024-04-01',140000,2,'2025-04-01',4,7,4,4);
/*!40000 ALTER TABLE `agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ID_Client` int NOT NULL,
  `First_n` varchar(45) NOT NULL,
  `Last_n` varchar(45) NOT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `Passport` varchar(100) NOT NULL,
  `Date_Birth` date NOT NULL,
  PRIMARY KEY (`ID_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Иван','Иванович','Иванов','4501 123456','1985-03-15'),(2,'Мария','Петровна','Сидорова','4602 234567','1990-07-22'),(3,'Алексей','Сергеевич','Кузнецов','4703 345678','1978-11-30'),(4,'Екатерина','Андреевна','Смирнова','4804 456789','1995-02-10'),(5,'Дмитрий','Владимирович','Попов','4905 567890','1982-09-05'),(6,'Андрей','Борисович','Фёдоров','5411 112233','1991-05-12'),(7,'Татьяна','Сергеевна','Волкова','5512 223344','1986-08-19'),(8,'Максим','Анатольевич','Алексеев','5613 334455','1979-03-25'),(9,'Юлия','Владимировна','Лебедева','5714 445566','1994-11-07'),(10,'Артём','Геннадьевич','Семёнов','5815 556677','1983-02-14'),(11,'Елена','Михайловна','Егорова','5916 667788','1976-09-30'),(12,'Владимир','Павлович','Павлов','6017 778899','1968-07-22'),(13,'Светлана','Ивановна','Козлова','6118 889900','1990-04-18'),(14,'Георгий','Олегович','Степанов','6219 990011','1987-12-03'),(15,'Людмила','Алексеевна','Николаева','6320 001122','1972-06-27'),(16,'Станислав','Викторович','Орлов','6421 112244','1989-10-15'),(17,'Валентина','Фёдоровна','Андреева','6522 223355','1965-01-29'),(18,'Роман','Эдуардович','Макаров','6623 334466','1996-03-08'),(19,'Галина','Петровна','Никитина','6724 445577','1974-11-23'),(20,'Игорь','Станиславович','Захаров','6825 556688','1981-08-04'),(21,'Надежда','Григорьевна','Зайцева','6926 667799','1969-02-16'),(22,'Василий','Дмитриевич','Соловьёв','7027 778811','1984-07-11'),(23,'Алла','Васильевна','Борисова','7128 889922','1997-05-26'),(24,'Константин','Аркадьевич','Яковлев','7229 990033','1978-09-09'),(25,'Вера','Николаевна','Григорьева','7330 001144','1980-12-31'),(26,'Никита','Юрьевич','Романов','7431 112255','1993-04-05'),(27,'Лариса','Валерьевна','Воробьёва','7532 223366','1986-06-20'),(28,'Борис','Леонидович','Сергеев','7633 334477','1971-03-14'),(29,'Зоя','Анатольевна','Кузьмина','7734 445588','1992-10-28'),(30,'Виктор','Семёнович','Фролов','7835 556699','1967-08-17'),(31,'Алексей','Петров','Сергеевич','4511 123456','1990-08-14'),(32,'Мария','Сидорова','Ивановна','4522 654321','1985-11-20');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filial` (
  `ID_filial` int NOT NULL,
  `Name_filial` varchar(45) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `Phone_number` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,'Центральный офис','ул. Пушкина, д. 10, Барнаул','+74951112233'),(2,'Филиал Северный','пр. Ленина, д. 45, Барнаул','+78122223344'),(3,'Филиал Южный','ул. Садовая, д. 25, Барнаул','+78623334455'),(4,'Филиал Восточный','ул. Советская, д. 15, Барнаул','+73434445566'),(5,'Филиал Западный','пр. Победы, д. 30, Барнаул','+74015556677');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `ID_Insurance` int NOT NULL,
  `Name_ins` varchar(250) NOT NULL,
  `Tariff_rate` int NOT NULL,
  PRIMARY KEY (`ID_Insurance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'КАСКО для нового авто',5),(2,'ОСАГО (базовый тариф)',1),(3,'Комплексная защита жилья',1),(4,'Страхование от несчастных случаев',2),(5,'Добровольное медицинское страхование',5),(6,'Страхование ответственности владельцев жилья',1),(7,'Страхование грузов при перевозке',2),(8,'Страхование финансовых рисков',3),(9,'Страхование сельхозтехники',2),(10,'Страхование водного транспорта',5),(11,'Страхование домашних животных',1),(12,'Коллективное страхование сотрудников',3),(13,'Страхование инвестиций',4),(14,'Страхование гражданской ответственности врачей',2),(15,'Страхование недвижимости от стихийных бедствий',1),(16,'Страхование специальной техники',3),(17,'Страхование экспортных контрактов',3),(18,'Страхование строительно-монтажных работ',2),(19,'Страхование произведений искусства',5),(20,'Страхование от киберрисков',3),(21,'Страхование яхт и катеров',4),(22,'Страхование ответственности туроператоров',2),(23,'Страхование арендованного имущества',1),(24,'Страхование коммерческой тайны',3),(25,'Страхование винтажных автомобилей',7),(26,'Страхование электронного оборудования',2),(27,'Страхование от перерывов в производстве',3),(28,'Страхование профессиональной ответственности нотариусов',2),(29,'Страхование спортивных мероприятий',3),(30,'Страхование коллекций и антиквариата',5);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12 20:26:54
