-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinemalts
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `birth_day` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `view` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_movie`
--

DROP TABLE IF EXISTS `actor_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor_movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_movie` varchar(255) DEFAULT NULL,
  `movie_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `slug_movie` varchar(255) DEFAULT NULL,
  `actor_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ActorMovie_Actor` (`actor_id`),
  KEY `fk_ActorMovie_Movie` (`movie_id`),
  CONSTRAINT `fk_ActorMovie_Actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`),
  CONSTRAINT `fk_ActorMovie_Movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_movie`
--

LOCK TABLES `actor_movie` WRITE;
/*!40000 ALTER TABLE `actor_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `month` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `total_money` double NOT NULL,
  `trading_code` varchar(255) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `bill_status_id` int DEFAULT NULL,
  `promotion_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Bill_BillStatus` (`bill_status_id`),
  KEY `fk_Bill_Promotion` (`promotion_id`),
  KEY `fk_Bill_User` (`customer_id`),
  CONSTRAINT `fk_Bill_BillStatus` FOREIGN KEY (`bill_status_id`) REFERENCES `bill_status` (`id`),
  CONSTRAINT `fk_Bill_Promotion` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`),
  CONSTRAINT `fk_Bill_User` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2024-01-18 23:45:10.216859',_binary '',1,'Bill ofNam',50000000,'260171','2024-01-18 23:45:10.216859',2,NULL,3),(2,'2024-02-18 23:45:54.520129',_binary '',2,'Bill ofNam',60000000,'582897','2024-02-18 23:45:54.520129',2,NULL,3),(3,'2024-03-18 23:51:33.236239',_binary '',3,'Bill ofNam',45000000,'874603','2024-03-18 23:51:33.236239',2,NULL,3),(4,'2024-04-19 14:49:36.998329',_binary '',4,'Bill ofNam',70000000,'590502','2024-04-19 14:49:36.998329',2,NULL,3),(5,'2024-05-19 00:41:34.241570',_binary '',5,'Bill ofQuân',80000000,'192706','2024-05-19 00:41:34.241570',2,NULL,1),(6,'2024-05-19 22:18:39.225899',_binary '',5,'Bill ofVăn',0,'940095','2024-05-19 22:18:39.225899',3,NULL,2),(7,'2024-05-20 01:10:10.070876',_binary '',5,'Nguyễn Bảo Namđã thanh toán hóa đơn',147500,'296761','2024-05-20 01:10:10.070876',2,1,3),(8,'2024-05-20 01:32:18.742564',_binary '',5,'Bill ofNam',0,'457848','2024-05-20 01:32:18.742564',3,NULL,3);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_food`
--

DROP TABLE IF EXISTS `bill_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `bill_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BillFood_Bill` (`bill_id`),
  KEY `fk_BillFood_Food` (`food_id`),
  CONSTRAINT `fk_BillFood_Bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_BillFood_Food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_food`
--

LOCK TABLES `bill_food` WRITE;
/*!40000 ALTER TABLE `bill_food` DISABLE KEYS */;
INSERT INTO `bill_food` VALUES (7,1,7,4);
/*!40000 ALTER TABLE `bill_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_status`
--

DROP TABLE IF EXISTS `bill_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_status`
--

LOCK TABLES `bill_status` WRITE;
/*!40000 ALTER TABLE `bill_status` DISABLE KEYS */;
INSERT INTO `bill_status` VALUES (1,'đan tahnh toán'),(2,'đã thanh toán'),(3,'chưa thanh toán');
/*!40000 ALTER TABLE `bill_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_ticket`
--

DROP TABLE IF EXISTS `bill_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `bill_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BillTicket_Bill` (`bill_id`),
  KEY `fk_BillTicket_Ticket` (`ticket_id`),
  CONSTRAINT `fk_BillTicket_Bill` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_BillTicket_Ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_ticket`
--

LOCK TABLES `bill_ticket` WRITE;
/*!40000 ALTER TABLE `bill_ticket` DISABLE KEYS */;
INSERT INTO `bill_ticket` VALUES (53,0,4,476),(111,0,7,359);
/*!40000 ALTER TABLE `bill_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name_of_cinema` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Hà Nội','db','nho',_binary '','Space Mỹ Đình'),(2,'Hà Nội 1','TT','nho',_binary '','Space Thanh Xuân'),(3,'Hà Nội 2','DP','nho',_binary '','Space Đan Phượng'),(4,'Hà Nội 3','GP','nho',_binary '','Space Giải Phóng'),(5,'TP.Hồ Chí Minh','QT','nho',_binary '','Space Quang Trung'),(6,'TP.Hồ Chí Minh 1','QK','nho',_binary '','Space Quang Khải'),(7,'TP.Hồ Chí Minh 2','VK','nho',_binary '','Space Văn Khiêm'),(8,'Bắc Giang','BG','nho',_binary '','Space Bắc Giang'),(9,'Đồng Nai','BH','nho',_binary '','Space Biên Hòa'),(10,'Đồng Nai 1','LK','nho',_binary '','Space Long Khánh'),(11,'Khánh Hòa','NT','nho',_binary '','Space Nha Trang'),(12,'Thái Nguyên','TN','nho',_binary '','Space Thái Nguyên'),(13,'Thanh Hóa','TH','nho',_binary '','Space Thanh Hóa'),(14,'Bà Rịa-Vũng Tàu','PM','nho',_binary '','Space Phú Mỹ'),(15,'Bà Rịa-Vũng Tàu 1','HT1','nho',_binary '','Space Hồ Tràm'),(16,'Bình Dương','TU','nho',_binary '','Space Tân Uyên'),(17,'Lào Cai','LC','nho',_binary '','Space Lào cai'),(18,'Kiên Giang','PQ','nho',_binary '','Space Phú quốc');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirm_email`
--

DROP TABLE IF EXISTS `confirm_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirm_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `confirm_code` varchar(255) DEFAULT NULL,
  `email_user` varchar(255) DEFAULT NULL,
  `expired_time` datetime(6) DEFAULT NULL,
  `is_confirm` bit(1) NOT NULL,
  `required_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirm_email`
--

LOCK TABLES `confirm_email` WRITE;
/*!40000 ALTER TABLE `confirm_email` DISABLE KEYS */;
INSERT INTO `confirm_email` VALUES (1,'756012','trongquan202@gmail.com','2024-05-17 21:41:03.651593',_binary '','2024-05-17 21:40:03.651593'),(2,'448958','van@gmail.com','2024-05-17 21:43:05.064224',_binary '','2024-05-17 21:42:05.064224'),(3,'197764','nam@gmail.com','2024-05-17 21:44:37.527394',_binary '','2024-05-17 21:43:37.527394');
/*!40000 ALTER TABLE `confirm_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name_of_food` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'TIẾT KIỆM 28K!!! Gồm: 1 Bắp (69oz) + 1 Nước có gaz (22oz)','/img/combo-69-oz.png',_binary '','Space Combo 69oz',500000),(2,'TIẾT KIỆM 56K!!! Sỡ hữu ngay: 1 Ly Cầu Vồng kèm nước + 1 Bắp (69oz)','/img/combo-seeme.png',_binary '','Combo See Mê - Cầu Vồng',500000),(3,'TIẾT KIỆM 95K!!! Gồm: 2 Bắp (69oz) + 4 Nước có gaz (22oz) + 2 Snack Oishi (80g))','/img/combo-family.png',_binary '','Family Combo 69oz',100000),(4,'TIẾT KIỆM 46K!!! Gồm: 1 Bắp (69oz) + 2 Nước có gaz (22oz)','/img/combo-sweet-69.png',_binary '','Sweet Combo 69oz',100000),(5,'TIẾT KIỆM 56K!!! Sỡ hữu ngay: 1 Cup Pastel 700ml kèm nước + 1 Bắp (69oz))','/img/combo-seeMe-pastel.png',_binary '','Combo See Mê - Pastel',200000),(6,'TIẾT KIỆM 56K!!! Sỡ hữu ngay: 1 Ly Phi Hành Gia kèm nước + 1 Bắp (69oz)','/img/combo-phi-hanh-gia.png',_binary '','Combo See Mê - Phi Hành Gia',300000);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalsetting`
--

DROP TABLE IF EXISTS `generalsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generalsetting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `break_time` datetime(6) DEFAULT NULL,
  `business_hours` int NOT NULL,
  `close_time` datetime(6) DEFAULT NULL,
  `fixed_ticket_price` double NOT NULL,
  `percent_day` int NOT NULL,
  `percent_weekend` int NOT NULL,
  `time_begin_to_change` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalsetting`
--

LOCK TABLES `generalsetting` WRITE;
/*!40000 ALTER TABLE `generalsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `generalsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_actor`
--

DROP TABLE IF EXISTS `image_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_actor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_actor` varchar(255) DEFAULT NULL,
  `actor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ImageActor_Actor` (`actor_id`),
  CONSTRAINT `fk_ImageActor_Actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_actor`
--

LOCK TABLES `image_actor` WRITE;
/*!40000 ALTER TABLE `image_actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `herolmage` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `is_upcoming` bit(1) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `movie_duration` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `premiere_date` datetime(6) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `cinema_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Movie_Cinema` (`cinema_id`),
  CONSTRAINT `fk_Movie_Cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Fury Road, câu chuyện kể về thời trẻ của nữ chiến binh Furiosa khi cô bị tách ra khỏi nơi ẩn náu ở Green Place of Many Mothers và lần đầu tiên buộc phải đối mặt với sự điên rồ của thế giới bên ngoài.','George Miller','2024-06-25 21:49:00.000000','/img/hero-cau-chuyen-tu-max-dien.jpg','/img/cau-chuyen-tu-mã-dien.jpg',_binary '\0',_binary '\0','Mỹ',120,'Furiosa: Câu Chuyện Từ Max Điên','2024-06-15 21:49:00.000000','cau-chuyen-tu-mã-dien','https://www.youtube.com/embed/nVVungjjsfY?si=MmmTWDeDNaBBkfQl',1),(2,'Shoyo Hinata gia nhập đội bóng chuyên Trường trung hoc Karasuno cùng với Tobio Kageyama, Họ đã tiến vào vòng loại trực tiếp và chạm trán với đội Trường Nekoma. Đội nào sẽ giành chiến ?','George Miller','2024-06-25 21:49:00.000000','/img/hero-tran-chien-bai-phe-lieu.jpg','/img/tran-chien-bai-phe-lieu.jpg',_binary '\0',_binary '\0','Mỹ',120,'Haikyu!! Trận Chiến Bãi Phế Liệu','2024-06-15 21:49:00.000000','tran-chien-bai-phe-lieu','https://www.youtube.com/embed/OFB4mrupFX0?si=ybqKkD1JMwjfkzeq',1),(3,'Lấy bối cảnh nhiều đời sau sự ra đi của Vua Khỉ Caesar, hành tinh này là nơi loài khỉ thống trị, còn loài người dần lui về trong bóng tối','Wes Ball','2024-06-25 21:49:00.000000','/img/hero-hanh-tinh-khi-vuong-quoc-moi.jpg','/img/hanh-tinh-khi-vuong-quoc-moi.jpg',_binary '\0',_binary '\0','Mỹ',120,'Hành Tinh Khỉ Vương Quốc Mới','2024-06-15 21:49:00.000000','hanh-tinh-khi-vuong-quoc-moi.jpg','https://www.youtube.com/embed/Z0EL1PDgPS0',1),(4,'Qua những lát cắt đan xen, ẩn chứa nhiều nụ cười và cả nước mắt, Lật Mặt 7: Một Điều Ước là câu chuyện cảm động về đại gia đình bà Hai 73 tuổi - người mẹ đơn thân tự mình nuôi 5 người con khôn lớn','Lý Hải','2024-06-25 21:49:00.000000','/img/hero-lat-mat.jpg','/img/lat-mat.jpg',_binary '\0',_binary '\0','Mỹ',120,'Lật Mặt 7','2024-06-15 21:49:00.000000','lat-mat','https://www.youtube.com/embed/d1ZHdosjNX8?si=75ByDUrVtzpjqUgD',1),(5,'Một chú mèo được nuông chiều tới mức sinh ra ích kỷ, không trân trọng những may mắn mà mình đang tận hưởng khi được Rose - một cô sinh viên tốt bụng cứu giúp và yêu thương.','Lý Hải','2024-06-25 21:49:00.000000','/img/hero-meo-map-mang-muoi-mang.jpg','/img/meo-map-mang-muoi-mang.jpg',_binary '\0',_binary '\0','Mỹ',120,'Mèo mập mang mười mạng','2024-06-15 21:49:00.000000','meo-map-mang-muoi-mang','https://www.youtube.com/embed/MbInTVco5QY?si=eoXjtFLQfzYluwBC',1),(6,'Một cô gái trẻ trải qua một trải nghiệm khó khăn bắt đầu nhìn thấy những người bạn tưởng tượng của mọi người bị bỏ lại phía sau khi những người bạn ngoài đời thực của họ đã trưởng thành.','Lý Hải','2024-06-25 21:49:00.000000','/img/hero-nhung-nguoi-ban-tuong-tuong.jpg','/img/nhung-nguoi-ban-tuong-tuong.jpg',_binary '\0',_binary '\0','Mỹ',120,'Những Người Bạn Tưởng Tưởng','2024-06-15 21:49:00.000000','nhung-nguoi-ban-tuong-tuong.jpg','https://www.youtube.com/embed/DqRVx0wfOBQ?si=0OIVsjuqa0SQHNK_',1),(7,'Một cặp vợ chồng hạnh phúc đang bị mắc kẹt trong những tình huống và thử thách kinh hoàng. Một vụ án mạng nhưng hiện trường lại không có vết máu, tội ác lại càng không. Vậy chuyện gì đã thực sự diễn ra ở lầu 4?','Lý Hải','2024-06-25 21:49:00.000000','/img/hero-an-mang-lau-4.jpg','/img/an-mang-lau-4.jpg',_binary '\0',_binary '\0','Mỹ',120,'Án mạng lầu bốn','2024-06-15 21:49:00.000000','an-mang-lau-4','https://www.youtube.com/embed/agzckaoLRaY?si=vkB94htTHqlZ6j37',1),(8,'Siêu cớm Ma Seok-do tái xuất để đối đầu với những tội phạm tinh vi trong giới công nghệ. Nắm đấm trứ danh liệu có phát huy được sức mạnh trước liên minh tội phạm của thiên tài công nghệ và ông trùm nhà cái lớn nhất châu Á?','Lý Hải','2024-06-25 21:49:00.000000','/img/hero-vay-ham-ke-trung-phat.jpg','/img/vay-ham-ke-trung-phat.jpg',_binary '\0',_binary '\0','Mỹ',120,'Vây hãm kẻ trừng phạt','2024-06-15 21:49:00.000000','vay-ham-ke-trung-phat','https://www.youtube.com/embed/XTI1j_bgREY?si=o4Bgh7AX3kLLyg5E',1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_rate`
--

DROP TABLE IF EXISTS `movie_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `rate_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_MovieRate_Movie` (`movie_id`),
  KEY `fk_MovieRate_Rate` (`rate_id`),
  KEY `fk_MovieRate_User` (`user_id`),
  CONSTRAINT `fk_MovieRate_Movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `fk_MovieRate_Rate` FOREIGN KEY (`rate_id`) REFERENCES `rate` (`id`),
  CONSTRAINT `fk_MovieRate_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_rate`
--

LOCK TABLES `movie_rate` WRITE;
/*!40000 ALTER TABLE `movie_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_type`
--

DROP TABLE IF EXISTS `movie_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) NOT NULL,
  `movie_type_name` varchar(255) DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_MovieType_Movie` (`movie_id`),
  KEY `fk_MovieType_Type` (`type_id`),
  CONSTRAINT `fk_MovieType_Movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `fk_MovieType_Type` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_type`
--

LOCK TABLES `movie_type` WRITE;
/*!40000 ALTER TABLE `movie_type` DISABLE KEYS */;
INSERT INTO `movie_type` VALUES (1,_binary '',NULL,1,3),(2,_binary '',NULL,1,4);
/*!40000 ALTER TABLE `movie_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `percent` int NOT NULL,
  `quantity` int NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `rank_customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Promotion_RankCustomer` (`rank_customer_id`),
  CONSTRAINT `fk_Promotion_RankCustomer` FOREIGN KEY (`rank_customer_id`) REFERENCES `rank_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'giảm 5%','2024-10-29 00:00:00.000000',_binary '','ABCDFK',5,0,'2024-05-29 00:00:00.000000','thâp',1),(2,'giảm 10%','2024-05-29 00:00:00.000000',_binary '','DK12FD',10,10,'2024-05-29 00:00:00.000000','cao',1);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank_customer`
--

DROP TABLE IF EXISTS `rank_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rank_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank_customer`
--

LOCK TABLES `rank_customer` WRITE;
/*!40000 ALTER TABLE `rank_customer` DISABLE KEYS */;
INSERT INTO `rank_customer` VALUES (1,'cơ bản',_binary '','Tân binh',10000),(2,'trung bình',_binary '','Sơ cấp',50000),(3,'Cao',_binary '','Siêu cấp',200000);
/*!40000 ALTER TABLE `rank_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `star_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `time_expired_access` datetime(6) DEFAULT NULL,
  `time_expired_refresh` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RefreshToken_User` (`user_id`),
  CONSTRAINT `fk_RefreshToken_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES (1,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MDQzNDY4fQ.pO6qAI6H0pcJbnUAnhkMFx0rQ7mecDvCnabPEjjgXQs','f9d2c9f5-9794-4016-a64c-adcffc075514','2024-05-18 21:44:28.628385','2024-05-19 21:44:28.628385',2),(2,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MDQ5NTAzfQ.PfvU716Q2EzEWxJX13TOWHZLQOkbFtEf5bhRa3gZOmY','5e2f72b7-83ca-44cc-98fe-c78322cf8c4a','2024-05-18 23:25:03.483761','2024-05-19 23:25:03.485476',3),(3,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MDUxNzg2fQ.4-8Tgh3fjv-i8jWlUgSUbx01Sf2rXnhSVAawnSlKAnY','5773d465-f47e-4a9e-baf6-23a2704ffc32','2024-05-19 00:03:06.997270','2024-05-20 00:03:06.997270',2),(4,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MTA4MDE2fQ.VH4EDO-3D2swn4JFkRFQbkOFIjpXPmmwZCWhdkBIzK0','980208cb-76bc-4a0a-bcbc-2f2c68562c7f','2024-05-19 15:40:16.175371','2024-05-20 15:40:16.175371',2),(5,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MTIwMDk3fQ.CFUtPoqYGWSX7v9U2cnt1yRWwG85HB7KA064ug7Omo4','7d5ad7ba-726b-4a8a-aa2d-9c946202a731','2024-05-19 19:01:37.931078','2024-05-20 19:01:37.931078',2),(6,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MTM3MDQxfQ.TqR7jNbrBd-zatv7bbbWDsu5zKWHB-R3FdNqQlbunwU','2165b298-e287-49ea-b534-bf73110a5fd5','2024-05-19 23:44:01.295478','2024-05-20 23:44:01.295478',3),(7,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MTM4OTMxfQ.sPo5_2SBtX_zms96yNwsogjy_x0Ea1zcvlpWE3yCqEk','e40548a3-6ad1-44eb-8793-b5f377d7ce55','2024-05-20 00:15:31.108955','2024-05-21 00:15:31.108955',2),(8,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MTM5NTU4fQ.RcWX3KvmIplTFdi6Z3zHJt6Esj4CgSRmG1ONaqQC-2U','f5f64e0a-e34f-4c0a-b197-6834e5ab220f','2024-05-20 00:25:58.217676','2024-05-21 00:25:58.218676',3),(9,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InRyb25ncXVhbjIwMkBnbWFpbC5jb20iLCJzdWIiOiJ0cm9uZ3F1YW4yMDJAZ21haWwuY29tIiwiZXhwIjoxNzE2MTQwMTcxfQ.zOlgz1A0i8NRgh0VPtw8sMBcCbj6P8WD1xn7kMTZygE','90d496e2-dc5d-40fd-bc32-ecae2f42ed1a','2024-05-20 00:36:11.270376','2024-05-21 00:36:11.270376',1),(10,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MTQxNDQ0fQ.COeaE01Zqa3naeREHB5sbO_sL5jtsjmSTB8OLwc9MGw','846ff608-0172-41c6-a195-dc40ab2d9159','2024-05-20 00:57:24.393572','2024-05-21 00:57:24.393572',3),(11,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MTg3NzIwfQ.8Z9fQKNZDFXMsqmRX6ueYauToM3L2kCbiFg-zq6fq30','89e48fdc-8903-4922-9a86-dc70650be20f','2024-05-20 13:48:41.014390','2024-05-21 13:48:41.016958',3),(12,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MTkzMjgzfQ.BgbBGUIwyOoiP2Y6WTNPwi-Cj0H_UEddrTmpXMcW0AE','729bda89-8363-47dc-aa59-f06ad7c33727','2024-05-20 15:21:23.957143','2024-05-21 15:21:23.957143',3),(13,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MTkzMjkyfQ.hC2L-pSOAK9sXpSoergcaheumPL-QdA901t2vd6-KsM','79024230-4928-4d74-ac1a-c908f059058f','2024-05-20 15:21:32.868071','2024-05-21 15:21:32.868071',2),(14,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MTk2MzA0fQ.rs2u04kRW0ZQoah4-k-K9jY3EHH9knu24ZAq74zKEMc','20f182ef-93d1-4bc8-ae4a-f5904f05b30a','2024-05-20 16:11:44.487316','2024-05-21 16:11:44.489967',3),(15,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6InZhbkBnbWFpbC5jb20iLCJzdWIiOiJ2YW5AZ21haWwuY29tIiwiZXhwIjoxNzE2MTk2MzE0fQ.9Q5e_-L_jwW8L-e8bNNe98iRrNFOrFHopEFuq9kRy-o','5dbf1c85-8199-4c7d-a041-bf36c5828949','2024-05-20 16:11:54.037272','2024-05-21 16:11:54.037272',2),(16,'eyJhbGciOiJIUzI1NiJ9.eyJFbWFpbCI6Im5hbUBnbWFpbC5jb20iLCJzdWIiOiJuYW1AZ21haWwuY29tIiwiZXhwIjoxNzE2MjE4NjQ0fQ.9FsB-uJ0hoyZLgM7TqG78mTf5Xwhz_gaA0aFsRkhqqM','78c62c6e-8de4-4375-938c-9e53cc3970c0','2024-05-20 22:24:04.578614','2024-05-21 22:24:04.578614',3);
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'US','USER'),(2,'AD','ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `capacity` int NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int NOT NULL,
  `cinema_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Room_Cinema` (`cinema_id`),
  CONSTRAINT `fk_Room_Cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,100,'P101','nho',_binary '','PA101',2,1),(2,100,'P102','nho',_binary '','PA102',2,1),(3,100,'P103','nho',_binary '','PA103',2,1),(4,100,'P1','nho',_binary '','PB101',2,2),(5,100,'P2','nho',_binary '','PB102',2,2),(6,100,'P3','nho',_binary '','PB103',2,2),(7,100,'P4','nho',_binary '','PC101',2,3),(8,100,'P5','nho',_binary '','PC102',2,3),(9,100,'P6','nho',_binary '','PC103',2,3),(10,100,'P7','nho',_binary '','PD103',2,4),(11,100,'P8','nho',_binary '','PD102',2,4),(12,100,'P9','nho',_binary '','PD101',2,4),(13,100,'P10','nho',_binary '','PE101',2,5),(14,100,'P11','nho',_binary '','PE102',2,5),(15,100,'P12','nho',_binary '','PE103',2,5),(16,100,'P13','nho',_binary '','PF103',2,6),(17,100,'P14','nho',_binary '','PG103',2,7),(18,100,'P15','nho',_binary '','PH103',2,8),(19,100,'P16','nho',_binary '','PI103',2,9),(20,100,'P17','nho',_binary '','PK103',2,10),(21,100,'P18','nho',_binary '','PL103',2,11),(22,100,'P19','nho',_binary '','PM103',2,12),(23,100,'P20','nho',_binary '','PQ103',2,13),(24,100,'P21','nho',_binary '','PK103',2,14),(25,100,'P22','nho',_binary '','PH103',2,15),(26,100,'P23','nho',_binary '','PJ103',2,16),(27,100,'P24','nho',_binary '','PN103',2,17),(28,100,'P25','nho',_binary '','PM103',2,18);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `end_at` datetime(6) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `start_at` datetime(6) DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Schedule_Movie` (`movie_id`),
  KEY `fk_Schedule_Room` (`room_id`),
  CONSTRAINT `fk_Schedule_Movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `fk_Schedule_Room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (12,'aa','2024-05-20 02:00:00.000000',_binary '','aa',45000,'2024-05-20 01:00:00.000000',1,1),(13,'aa','2024-05-27 09:00:00.000000',_binary '','aa',45000,'2024-05-27 07:00:00.000000',1,2),(14,'aa','2024-05-21 09:00:00.000000',_binary '','aa',45000,'2024-05-21 07:00:00.000000',1,1),(15,'bb','2024-05-19 12:00:00.000000',_binary '','cc',45000,'2024-05-19 10:00:00.000000',1,2),(16,'bb','2024-05-19 15:00:00.000000',_binary '','cc',45000,'2024-05-19 13:00:00.000000',1,3),(17,'bb','2024-05-19 18:00:00.000000',_binary '','cc',45000,'2024-05-19 16:00:00.000000',1,4),(18,'bb','2024-05-21 18:00:00.000000',_binary '','cc',45000,'2024-05-21 16:00:00.000000',1,4),(19,'bb','2024-05-22 18:00:00.000000',_binary '','cc',45000,'2024-05-22 16:00:00.000000',1,4),(20,'bb','2024-05-23 18:00:00.000000',_binary '','cc',45000,'2024-05-23 16:00:00.000000',1,4),(21,'bb','2024-05-24 18:00:00.000000',_binary '','cc',45000,'2024-05-24 16:00:00.000000',1,4);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) NOT NULL,
  `line` varchar(255) DEFAULT NULL,
  `number` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `seat_type_id` int DEFAULT NULL,
  `seat_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Seat_Room` (`room_id`),
  KEY `fk_Seat_Schedule` (`schedule_id`),
  KEY `fk_Seat_SeatType` (`seat_type_id`),
  KEY `fk_Seat_SeatStatus` (`seat_status_id`),
  CONSTRAINT `fk_Seat_Room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `fk_Seat_Schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `fk_Seat_SeatStatus` FOREIGN KEY (`seat_status_id`) REFERENCES `seat_status` (`id`),
  CONSTRAINT `fk_Seat_SeatType` FOREIGN KEY (`seat_type_id`) REFERENCES `seat_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,_binary '','A',1,1,NULL,1,NULL),(2,_binary '','A',2,1,NULL,1,NULL),(3,_binary '','A',3,1,NULL,1,NULL),(4,_binary '','A',4,1,NULL,1,NULL),(5,_binary '','A',5,1,NULL,1,NULL),(6,_binary '','A',6,1,NULL,1,NULL),(7,_binary '','A',7,1,NULL,1,NULL),(8,_binary '','A',8,1,NULL,1,NULL),(9,_binary '','A',9,1,NULL,1,NULL),(10,_binary '','A',10,1,NULL,1,NULL),(11,_binary '','A',11,1,NULL,1,NULL),(12,_binary '','A',12,1,NULL,1,NULL),(13,_binary '','A',13,1,NULL,1,NULL),(14,_binary '','A',14,1,NULL,1,NULL),(15,_binary '','A',15,1,NULL,1,NULL),(16,_binary '','A',16,1,NULL,1,NULL),(17,_binary '','A',17,1,NULL,1,NULL),(18,_binary '','A',18,1,NULL,1,NULL),(19,_binary '','B',1,1,NULL,1,NULL),(20,_binary '','B',2,1,NULL,1,NULL),(21,_binary '','B',3,1,NULL,1,NULL),(22,_binary '','B',4,1,NULL,1,NULL),(23,_binary '','B',5,1,NULL,1,NULL),(24,_binary '','B',6,1,NULL,1,NULL),(25,_binary '','B',7,1,NULL,1,NULL),(26,_binary '','B',8,1,NULL,1,NULL),(27,_binary '','B',9,1,NULL,1,NULL),(28,_binary '','B',10,1,NULL,1,NULL),(29,_binary '','B',11,1,NULL,1,NULL),(30,_binary '','B',12,1,NULL,1,NULL),(31,_binary '','B',13,1,NULL,1,NULL),(32,_binary '','B',14,1,NULL,1,NULL),(33,_binary '','B',15,1,NULL,1,NULL),(34,_binary '','B',16,1,NULL,1,NULL),(35,_binary '','B',17,1,NULL,1,NULL),(36,_binary '','B',18,1,NULL,1,NULL),(37,_binary '','C',1,1,NULL,1,NULL),(38,_binary '','C',2,1,NULL,1,NULL),(39,_binary '','C',3,1,NULL,1,NULL),(40,_binary '','C',4,1,NULL,1,NULL),(41,_binary '','C',5,1,NULL,1,NULL),(42,_binary '','C',6,1,NULL,1,NULL),(43,_binary '','C',7,1,NULL,1,NULL),(44,_binary '','C',8,1,NULL,1,NULL),(45,_binary '','C',9,1,NULL,1,NULL),(46,_binary '','C',10,1,NULL,1,NULL),(47,_binary '','C',11,1,NULL,1,NULL),(48,_binary '','C',12,1,NULL,1,NULL),(49,_binary '','C',13,1,NULL,1,NULL),(50,_binary '','C',14,1,NULL,1,NULL),(51,_binary '','C',15,1,NULL,1,NULL),(52,_binary '','C',16,1,NULL,1,NULL),(53,_binary '','C',17,1,NULL,1,NULL),(54,_binary '','C',18,1,NULL,1,NULL),(55,_binary '','D',1,1,NULL,1,NULL),(56,_binary '','D',2,1,NULL,1,NULL),(57,_binary '','D',3,1,NULL,1,NULL),(58,_binary '','D',4,1,NULL,1,NULL),(59,_binary '','D',5,1,NULL,1,NULL),(60,_binary '','D',6,1,NULL,1,NULL),(61,_binary '','D',7,1,NULL,1,NULL),(62,_binary '','D',8,1,NULL,1,NULL),(63,_binary '','D',9,1,NULL,1,NULL),(64,_binary '','D',10,1,NULL,1,NULL),(65,_binary '','D',11,1,NULL,1,NULL),(66,_binary '','D',12,1,NULL,1,NULL),(67,_binary '','D',13,1,NULL,1,NULL),(68,_binary '','D',14,1,NULL,1,NULL),(69,_binary '','D',15,1,NULL,1,NULL),(70,_binary '','D',16,1,NULL,1,NULL),(71,_binary '','D',17,1,NULL,1,NULL),(72,_binary '','D',18,1,NULL,1,NULL),(73,_binary '','E',1,1,NULL,1,NULL),(74,_binary '','E',2,1,NULL,1,NULL),(75,_binary '','E',3,1,NULL,1,NULL),(76,_binary '','E',4,1,NULL,1,NULL),(77,_binary '','E',5,1,NULL,1,NULL),(78,_binary '','E',6,1,NULL,1,NULL),(79,_binary '','E',7,1,NULL,1,NULL),(80,_binary '','E',8,1,NULL,1,NULL),(81,_binary '','E',9,1,NULL,1,NULL),(82,_binary '','E',10,1,NULL,1,NULL),(83,_binary '','E',11,1,NULL,1,NULL),(84,_binary '','E',12,1,NULL,1,NULL),(85,_binary '','E',13,1,NULL,1,NULL),(86,_binary '','E',14,1,NULL,1,NULL),(87,_binary '','E',15,1,NULL,1,NULL),(88,_binary '','E',16,1,NULL,1,NULL),(89,_binary '','E',17,1,NULL,1,NULL),(90,_binary '','E',18,1,NULL,1,NULL),(91,_binary '','F',1,1,NULL,2,NULL),(92,_binary '','F',2,1,NULL,2,NULL),(93,_binary '','F',3,1,NULL,2,NULL),(94,_binary '','F',4,1,NULL,2,NULL),(95,_binary '','F',5,1,NULL,2,NULL),(96,_binary '','F',6,1,NULL,2,NULL),(97,_binary '','F',7,1,NULL,2,NULL),(98,_binary '','F',8,1,NULL,2,NULL),(99,_binary '','F',9,1,NULL,2,NULL),(100,_binary '','F',10,1,NULL,2,NULL),(101,_binary '','F',11,1,NULL,2,NULL),(102,_binary '','F',12,1,NULL,2,NULL),(103,_binary '','F',13,1,NULL,2,NULL),(104,_binary '','F',14,1,NULL,2,NULL),(105,_binary '','F',15,1,NULL,2,NULL),(106,_binary '','F',16,1,NULL,2,NULL),(107,_binary '','G',1,1,NULL,2,NULL),(108,_binary '','G',2,1,NULL,2,NULL),(109,_binary '','G',3,1,NULL,2,NULL),(110,_binary '','G',4,1,NULL,2,NULL),(111,_binary '','G',5,1,NULL,2,NULL),(112,_binary '','G',6,1,NULL,2,NULL),(113,_binary '','G',7,1,NULL,2,NULL),(114,_binary '','G',8,1,NULL,2,NULL),(115,_binary '','G',9,1,NULL,2,NULL),(116,_binary '','G',10,1,NULL,2,NULL),(117,_binary '','G',11,1,NULL,2,NULL),(118,_binary '','G',12,1,NULL,2,NULL),(119,_binary '','G',13,1,NULL,2,NULL),(120,_binary '','G',14,1,NULL,2,NULL),(121,_binary '','H',1,1,NULL,3,NULL),(122,_binary '','H',2,1,NULL,3,NULL),(123,_binary '','H',3,1,NULL,3,NULL),(124,_binary '','H',4,1,NULL,3,NULL),(125,_binary '','H',5,1,NULL,3,NULL),(126,_binary '','H',6,1,NULL,3,NULL),(127,_binary '','H',7,1,NULL,3,NULL),(128,_binary '','H',8,1,NULL,3,NULL),(129,_binary '','H',9,1,NULL,3,NULL),(130,_binary '','H',10,1,NULL,3,NULL),(131,_binary '','H',11,1,NULL,3,NULL),(132,_binary '','H',12,1,NULL,3,NULL),(133,_binary '','H',13,1,NULL,3,NULL),(134,_binary '','H',14,1,NULL,3,NULL),(135,_binary '','A',1,2,NULL,1,NULL),(136,_binary '','A',2,2,NULL,1,NULL),(137,_binary '','A',3,2,NULL,1,NULL),(138,_binary '','A',4,2,NULL,1,NULL),(139,_binary '','A',5,2,NULL,1,NULL),(140,_binary '','A',6,2,NULL,1,NULL),(141,_binary '','A',7,2,NULL,1,NULL),(142,_binary '','A',8,2,NULL,1,NULL),(143,_binary '','A',9,2,NULL,1,NULL),(144,_binary '','A',10,2,NULL,1,NULL),(145,_binary '','A',11,2,NULL,1,NULL),(146,_binary '','A',12,2,NULL,1,NULL),(147,_binary '','A',13,2,NULL,1,NULL),(148,_binary '','A',14,2,NULL,1,NULL),(149,_binary '','A',15,2,NULL,1,NULL),(150,_binary '','A',16,2,NULL,1,NULL),(151,_binary '','A',17,2,NULL,1,NULL),(152,_binary '','A',18,2,NULL,1,NULL),(153,_binary '','B',1,2,NULL,1,NULL),(154,_binary '','B',2,2,NULL,1,NULL),(155,_binary '','B',3,2,NULL,1,NULL),(156,_binary '','B',4,2,NULL,1,NULL),(157,_binary '','B',5,2,NULL,1,NULL),(158,_binary '','B',6,2,NULL,1,NULL),(159,_binary '','B',7,2,NULL,1,NULL),(160,_binary '','B',8,2,NULL,1,NULL),(161,_binary '','B',9,2,NULL,1,NULL),(162,_binary '','B',10,2,NULL,1,NULL),(163,_binary '','B',11,2,NULL,1,NULL),(164,_binary '','B',12,2,NULL,1,NULL),(165,_binary '','B',13,2,NULL,1,NULL),(166,_binary '','B',14,2,NULL,1,NULL),(167,_binary '','B',15,2,NULL,1,NULL),(168,_binary '','B',16,2,NULL,1,NULL),(169,_binary '','B',17,2,NULL,1,NULL),(170,_binary '','B',18,2,NULL,1,NULL),(171,_binary '','C',1,2,NULL,1,NULL),(172,_binary '','C',2,2,NULL,1,NULL),(173,_binary '','C',3,2,NULL,1,NULL),(174,_binary '','C',4,2,NULL,1,NULL),(175,_binary '','C',5,2,NULL,1,NULL),(176,_binary '','C',6,2,NULL,1,NULL),(177,_binary '','C',7,2,NULL,1,NULL),(178,_binary '','C',8,2,NULL,1,NULL),(179,_binary '','C',9,2,NULL,1,NULL),(180,_binary '','C',11,2,NULL,1,NULL),(181,_binary '','C',12,2,NULL,1,NULL),(182,_binary '','C',13,2,NULL,1,NULL),(183,_binary '','C',14,2,NULL,1,NULL),(184,_binary '','C',15,2,NULL,1,NULL),(185,_binary '','C',16,2,NULL,1,NULL),(186,_binary '','C',17,2,NULL,1,NULL),(187,_binary '','C',18,2,NULL,1,NULL),(188,_binary '','D',1,2,NULL,1,NULL),(189,_binary '','D',2,2,NULL,1,NULL),(190,_binary '','D',3,2,NULL,1,NULL),(191,_binary '','D',4,2,NULL,1,NULL),(192,_binary '','D',5,2,NULL,1,NULL),(193,_binary '','D',6,2,NULL,1,NULL),(194,_binary '','D',7,2,NULL,1,NULL),(195,_binary '','D',8,2,NULL,1,NULL),(196,_binary '','D',9,2,NULL,1,NULL),(197,_binary '','D',10,2,NULL,1,NULL),(198,_binary '','D',11,2,NULL,1,NULL),(199,_binary '','D',12,2,NULL,1,NULL),(200,_binary '','D',13,2,NULL,1,NULL),(201,_binary '','D',14,2,NULL,1,NULL),(202,_binary '','D',15,2,NULL,1,NULL),(203,_binary '','D',16,2,NULL,1,NULL),(204,_binary '','D',17,2,NULL,1,NULL),(205,_binary '','D',18,2,NULL,1,NULL),(206,_binary '','E',1,2,NULL,1,NULL),(207,_binary '','E',2,2,NULL,1,NULL),(208,_binary '','E',3,2,NULL,1,NULL),(209,_binary '','E',4,2,NULL,1,NULL),(210,_binary '','E',5,2,NULL,1,NULL),(211,_binary '','E',6,2,NULL,1,NULL),(212,_binary '','E',7,2,NULL,1,NULL),(213,_binary '','E',8,2,NULL,1,NULL),(214,_binary '','E',9,2,NULL,1,NULL),(215,_binary '','E',10,2,NULL,1,NULL),(216,_binary '','E',11,2,NULL,1,NULL),(217,_binary '','E',12,2,NULL,1,NULL),(218,_binary '','E',13,2,NULL,1,NULL),(219,_binary '','E',14,2,NULL,1,NULL),(220,_binary '','E',15,2,NULL,1,NULL),(221,_binary '','E',16,2,NULL,1,NULL),(222,_binary '','E',17,2,NULL,1,NULL),(223,_binary '','E',18,2,NULL,1,NULL),(224,_binary '','F',1,2,NULL,1,NULL),(225,_binary '','F',2,2,NULL,1,NULL),(226,_binary '','F',3,2,NULL,1,NULL),(227,_binary '','F',4,2,NULL,1,NULL),(228,_binary '','F',5,2,NULL,1,NULL),(229,_binary '','F',6,2,NULL,1,NULL),(230,_binary '','F',7,2,NULL,1,NULL),(231,_binary '','F',8,2,NULL,1,NULL),(232,_binary '','F',9,2,NULL,1,NULL),(233,_binary '','F',10,2,NULL,1,NULL),(234,_binary '','F',11,2,NULL,1,NULL),(235,_binary '','F',12,2,NULL,1,NULL),(236,_binary '','F',13,2,NULL,1,NULL),(237,_binary '','F',14,2,NULL,1,NULL),(238,_binary '','F',15,2,NULL,1,NULL),(239,_binary '','F',16,2,NULL,1,NULL),(240,_binary '','G',1,2,NULL,1,NULL),(241,_binary '','G',2,2,NULL,1,NULL),(242,_binary '','G',3,2,NULL,1,NULL),(243,_binary '','G',4,2,NULL,1,NULL),(244,_binary '','G',5,2,NULL,1,NULL),(245,_binary '','G',6,2,NULL,1,NULL),(246,_binary '','G',7,2,NULL,1,NULL),(247,_binary '','G',8,2,NULL,1,NULL),(248,_binary '','G',9,2,NULL,1,NULL),(249,_binary '','G',10,2,NULL,1,NULL),(250,_binary '','G',11,2,NULL,1,NULL),(251,_binary '','G',12,2,NULL,1,NULL),(252,_binary '','G',13,2,NULL,1,NULL),(253,_binary '','G',14,2,NULL,1,NULL),(254,_binary '','H',1,2,NULL,1,NULL),(255,_binary '','H',2,2,NULL,1,NULL),(256,_binary '','H',3,2,NULL,1,NULL),(257,_binary '','H',4,2,NULL,1,NULL),(258,_binary '','H',5,2,NULL,1,NULL),(259,_binary '','H',6,2,NULL,1,NULL),(260,_binary '','H',7,2,NULL,1,NULL),(261,_binary '','H',8,2,NULL,1,NULL),(262,_binary '','H',9,2,NULL,1,NULL),(263,_binary '','H',10,2,NULL,1,NULL),(264,_binary '','H',11,2,NULL,1,NULL),(265,_binary '','H',12,2,NULL,1,NULL),(266,_binary '','H',13,2,NULL,1,NULL),(267,_binary '','H',14,2,NULL,1,NULL),(268,_binary '','A',1,4,NULL,1,NULL),(269,_binary '','A',2,4,NULL,1,NULL),(270,_binary '','A',3,4,NULL,1,NULL),(271,_binary '','A',4,4,NULL,1,NULL),(272,_binary '','A',5,4,NULL,1,NULL),(273,_binary '','A',6,4,NULL,1,NULL),(274,_binary '','A',7,4,NULL,1,NULL),(275,_binary '','A',8,4,NULL,1,NULL),(276,_binary '','A',9,4,NULL,1,NULL),(277,_binary '','A',10,4,NULL,1,NULL),(278,_binary '','A',11,4,NULL,1,NULL),(279,_binary '','A',12,4,NULL,1,NULL),(280,_binary '','A',13,4,NULL,1,NULL),(281,_binary '','A',14,4,NULL,1,NULL),(282,_binary '','A',15,4,NULL,1,NULL),(283,_binary '','A',16,4,NULL,1,NULL),(284,_binary '','A',17,4,NULL,1,NULL),(285,_binary '','A',18,4,NULL,1,NULL),(286,_binary '','B',1,4,NULL,1,NULL),(287,_binary '','B',2,4,NULL,1,NULL),(288,_binary '','B',3,4,NULL,1,NULL),(289,_binary '','B',4,4,NULL,1,NULL),(290,_binary '','B',5,4,NULL,1,NULL),(291,_binary '','B',6,4,NULL,1,NULL),(292,_binary '','B',7,4,NULL,1,NULL),(293,_binary '','B',8,4,NULL,1,NULL),(294,_binary '','B',9,4,NULL,1,NULL),(295,_binary '','B',10,4,NULL,1,NULL),(296,_binary '','B',11,4,NULL,1,NULL),(297,_binary '','B',12,4,NULL,1,NULL),(298,_binary '','B',13,4,NULL,1,NULL),(299,_binary '','B',14,4,NULL,1,NULL),(300,_binary '','B',15,4,NULL,1,NULL),(301,_binary '','B',16,4,NULL,1,NULL),(302,_binary '','B',17,4,NULL,1,NULL),(303,_binary '','B',18,4,NULL,1,NULL),(304,_binary '','C',1,4,NULL,1,NULL),(305,_binary '','C',2,4,NULL,1,NULL),(306,_binary '','C',3,4,NULL,1,NULL),(307,_binary '','C',4,4,NULL,1,NULL),(308,_binary '','C',5,4,NULL,1,NULL),(309,_binary '','C',6,4,NULL,1,NULL),(310,_binary '','C',7,4,NULL,1,NULL),(311,_binary '','C',8,4,NULL,1,NULL),(312,_binary '','C',9,4,NULL,1,NULL),(313,_binary '','C',10,4,NULL,1,NULL),(314,_binary '','C',11,4,NULL,1,NULL),(315,_binary '','C',12,4,NULL,1,NULL),(316,_binary '','C',13,4,NULL,1,NULL),(317,_binary '','C',14,4,NULL,1,NULL),(318,_binary '','C',15,4,NULL,1,NULL),(319,_binary '','C',16,4,NULL,1,NULL),(320,_binary '','C',17,4,NULL,1,NULL),(321,_binary '','C',18,4,NULL,1,NULL),(322,_binary '','D',1,4,NULL,1,NULL),(323,_binary '','D',2,4,NULL,1,NULL),(324,_binary '','D',3,4,NULL,1,NULL),(325,_binary '','D',4,4,NULL,1,NULL),(326,_binary '','D',5,4,NULL,1,NULL),(327,_binary '','D',6,4,NULL,1,NULL),(328,_binary '','D',7,4,NULL,1,NULL),(329,_binary '','D',8,4,NULL,1,NULL),(330,_binary '','D',9,4,NULL,1,NULL),(331,_binary '','D',10,4,NULL,1,NULL),(332,_binary '','D',11,4,NULL,1,NULL),(333,_binary '','D',12,4,NULL,1,NULL),(334,_binary '','D',13,4,NULL,1,NULL),(335,_binary '','D',14,4,NULL,1,NULL),(336,_binary '','D',15,4,NULL,1,NULL),(337,_binary '','D',16,4,NULL,1,NULL),(338,_binary '','D',17,4,NULL,1,NULL),(339,_binary '','D',18,4,NULL,1,NULL),(340,_binary '','E',1,4,NULL,1,NULL),(341,_binary '','E',2,4,NULL,1,NULL),(342,_binary '','E',3,4,NULL,1,NULL),(343,_binary '','E',4,4,NULL,1,NULL),(344,_binary '','E',5,4,NULL,1,NULL),(345,_binary '','E',6,4,NULL,1,NULL),(346,_binary '','E',7,4,NULL,1,NULL),(347,_binary '','E',8,4,NULL,1,NULL),(348,_binary '','E',9,4,NULL,1,NULL),(349,_binary '','E',10,4,NULL,1,NULL),(350,_binary '','E',11,4,NULL,1,NULL),(351,_binary '','E',12,4,NULL,1,NULL),(352,_binary '','E',13,4,NULL,1,NULL),(353,_binary '','E',14,4,NULL,1,NULL),(354,_binary '','E',15,4,NULL,1,NULL),(355,_binary '','E',16,4,NULL,1,NULL),(356,_binary '','E',17,4,NULL,1,NULL),(357,_binary '','E',18,4,NULL,1,NULL),(358,_binary '','F',1,4,NULL,1,NULL),(359,_binary '','F',2,4,NULL,1,NULL),(360,_binary '','F',3,4,NULL,1,NULL),(361,_binary '','F',4,4,NULL,1,NULL),(362,_binary '','F',5,4,NULL,1,NULL),(363,_binary '','F',6,4,NULL,1,NULL),(364,_binary '','F',7,4,NULL,1,NULL),(365,_binary '','F',8,4,NULL,1,NULL),(366,_binary '','F',9,4,NULL,1,NULL),(367,_binary '','F',10,4,NULL,1,NULL),(368,_binary '','F',11,4,NULL,1,NULL),(369,_binary '','F',12,4,NULL,1,NULL),(370,_binary '','F',13,4,NULL,1,NULL),(371,_binary '','F',14,4,NULL,1,NULL),(372,_binary '','F',15,4,NULL,1,NULL),(373,_binary '','F',16,4,NULL,1,NULL),(374,_binary '','G',1,4,NULL,1,NULL),(375,_binary '','G',2,4,NULL,1,NULL),(376,_binary '','G',3,4,NULL,1,NULL),(377,_binary '','G',4,4,NULL,1,NULL),(378,_binary '','G',5,4,NULL,1,NULL),(379,_binary '','G',6,4,NULL,1,NULL),(380,_binary '','G',7,4,NULL,1,NULL),(381,_binary '','G',8,4,NULL,1,NULL),(382,_binary '','G',9,4,NULL,1,NULL),(383,_binary '','G',10,4,NULL,1,NULL),(384,_binary '','G',11,4,NULL,1,NULL),(385,_binary '','G',12,4,NULL,1,NULL),(386,_binary '','G',13,4,NULL,1,NULL),(387,_binary '','G',14,4,NULL,1,NULL),(388,_binary '','H',1,4,NULL,1,NULL),(389,_binary '','H',2,4,NULL,1,NULL),(390,_binary '','H',3,4,NULL,1,NULL),(391,_binary '','H',4,4,NULL,1,NULL),(392,_binary '','H',5,4,NULL,1,NULL),(393,_binary '','H',6,4,NULL,1,NULL),(394,_binary '','H',7,4,NULL,1,NULL),(395,_binary '','H',8,4,NULL,1,NULL),(396,_binary '','H',9,4,NULL,1,NULL),(397,_binary '','H',10,4,NULL,1,NULL),(398,_binary '','H',11,4,NULL,1,NULL),(399,_binary '','H',12,4,NULL,1,NULL),(400,_binary '','H',13,4,NULL,1,NULL),(401,_binary '','H',14,4,NULL,1,NULL),(402,_binary '','A',1,13,NULL,1,NULL),(403,_binary '','A',2,13,NULL,1,NULL),(404,_binary '','A',3,13,NULL,1,NULL),(405,_binary '','A',4,13,NULL,1,NULL),(406,_binary '','A',5,13,NULL,1,NULL),(407,_binary '','A',6,13,NULL,1,NULL),(408,_binary '','A',7,13,NULL,1,NULL),(409,_binary '','A',8,13,NULL,1,NULL),(410,_binary '','A',9,13,NULL,1,NULL),(411,_binary '','A',10,13,NULL,1,NULL),(412,_binary '','A',11,13,NULL,1,NULL),(413,_binary '','A',12,13,NULL,1,NULL),(414,_binary '','A',13,13,NULL,1,NULL),(415,_binary '','A',14,13,NULL,1,NULL),(416,_binary '','A',15,13,NULL,1,NULL),(417,_binary '','A',16,13,NULL,1,NULL),(418,_binary '','A',17,13,NULL,1,NULL),(419,_binary '','A',18,13,NULL,1,NULL),(420,_binary '','B',1,13,NULL,1,NULL),(421,_binary '','B',2,13,NULL,1,NULL),(422,_binary '','B',3,13,NULL,1,NULL),(423,_binary '','B',4,13,NULL,1,NULL),(424,_binary '','B',5,13,NULL,1,NULL),(425,_binary '','B',6,13,NULL,1,NULL),(426,_binary '','B',7,13,NULL,1,NULL),(427,_binary '','B',8,13,NULL,1,NULL),(428,_binary '','B',9,13,NULL,1,NULL),(429,_binary '','B',10,13,NULL,1,NULL),(430,_binary '','B',11,13,NULL,1,NULL),(431,_binary '','B',12,13,NULL,1,NULL),(432,_binary '','B',13,13,NULL,1,NULL),(433,_binary '','B',14,13,NULL,1,NULL),(434,_binary '','B',15,13,NULL,1,NULL),(435,_binary '','B',16,13,NULL,1,NULL),(436,_binary '','B',17,13,NULL,1,NULL),(437,_binary '','B',18,13,NULL,1,NULL),(438,_binary '','C',1,13,NULL,1,NULL),(439,_binary '','C',2,13,NULL,1,NULL),(440,_binary '','C',3,13,NULL,1,NULL),(441,_binary '','C',4,13,NULL,1,NULL),(442,_binary '','C',5,13,NULL,1,NULL),(443,_binary '','C',6,13,NULL,1,NULL),(444,_binary '','C',7,13,NULL,1,NULL),(445,_binary '','C',8,13,NULL,1,NULL),(446,_binary '','C',9,13,NULL,1,NULL),(447,_binary '','C',10,13,NULL,1,NULL),(448,_binary '','C',11,13,NULL,1,NULL),(449,_binary '','C',12,13,NULL,1,NULL),(450,_binary '','C',13,13,NULL,1,NULL),(451,_binary '','C',14,13,NULL,1,NULL),(452,_binary '','C',15,13,NULL,1,NULL),(453,_binary '','C',16,13,NULL,1,NULL),(454,_binary '','C',17,13,NULL,1,NULL),(455,_binary '','C',18,13,NULL,1,NULL),(456,_binary '','D',1,13,NULL,1,NULL),(457,_binary '','D',2,13,NULL,1,NULL),(458,_binary '','D',3,13,NULL,1,NULL),(459,_binary '','D',4,13,NULL,1,NULL),(460,_binary '','D',5,13,NULL,1,NULL),(461,_binary '','D',6,13,NULL,1,NULL),(462,_binary '','D',7,13,NULL,1,NULL),(463,_binary '','D',8,13,NULL,1,NULL),(464,_binary '','D',9,13,NULL,1,NULL),(465,_binary '','D',10,13,NULL,1,NULL),(466,_binary '','D',11,13,NULL,1,NULL),(467,_binary '','D',12,13,NULL,1,NULL),(468,_binary '','D',13,13,NULL,1,NULL),(469,_binary '','D',14,13,NULL,1,NULL),(470,_binary '','D',15,13,NULL,1,NULL),(471,_binary '','D',16,13,NULL,1,NULL),(472,_binary '','D',17,13,NULL,1,NULL),(473,_binary '','D',18,13,NULL,1,NULL),(474,_binary '','E',1,13,NULL,1,NULL),(475,_binary '','E',2,13,NULL,1,NULL),(476,_binary '','E',3,13,NULL,1,NULL),(477,_binary '','E',4,13,NULL,1,NULL),(478,_binary '','E',5,13,NULL,1,NULL),(479,_binary '','E',6,13,NULL,1,NULL),(480,_binary '','E',7,13,NULL,1,NULL),(481,_binary '','E',8,13,NULL,1,NULL),(482,_binary '','E',9,13,NULL,1,NULL),(483,_binary '','E',10,13,NULL,1,NULL),(484,_binary '','E',11,13,NULL,1,NULL),(485,_binary '','E',12,13,NULL,1,NULL),(486,_binary '','E',13,13,NULL,1,NULL),(487,_binary '','E',14,13,NULL,1,NULL),(488,_binary '','E',15,13,NULL,1,NULL),(489,_binary '','E',16,13,NULL,1,NULL),(490,_binary '','E',17,13,NULL,1,NULL),(491,_binary '','E',18,13,NULL,1,NULL),(492,_binary '','F',1,13,NULL,1,NULL),(493,_binary '','F',2,13,NULL,1,NULL),(494,_binary '','F',3,13,NULL,1,NULL),(495,_binary '','F',4,13,NULL,1,NULL),(496,_binary '','F',5,13,NULL,1,NULL),(497,_binary '','F',6,13,NULL,1,NULL),(498,_binary '','F',7,13,NULL,1,NULL),(499,_binary '','F',8,13,NULL,1,NULL),(500,_binary '','F',9,13,NULL,1,NULL),(501,_binary '','F',10,13,NULL,1,NULL),(502,_binary '','F',11,13,NULL,1,NULL),(503,_binary '','F',12,13,NULL,1,NULL),(504,_binary '','F',13,13,NULL,1,NULL),(505,_binary '','F',14,13,NULL,1,NULL),(506,_binary '','F',15,13,NULL,1,NULL),(507,_binary '','F',16,13,NULL,1,NULL),(508,_binary '','G',1,13,NULL,1,NULL),(509,_binary '','G',2,13,NULL,1,NULL),(510,_binary '','G',3,13,NULL,1,NULL),(511,_binary '','G',4,13,NULL,1,NULL),(512,_binary '','G',5,13,NULL,1,NULL),(513,_binary '','G',6,13,NULL,1,NULL),(514,_binary '','G',7,13,NULL,1,NULL),(515,_binary '','G',8,13,NULL,1,NULL),(516,_binary '','G',9,13,NULL,1,NULL),(517,_binary '','G',10,13,NULL,1,NULL),(518,_binary '','G',11,13,NULL,1,NULL),(519,_binary '','G',12,13,NULL,1,NULL),(520,_binary '','G',13,13,NULL,1,NULL),(521,_binary '','G',14,13,NULL,1,NULL),(522,_binary '','H',1,13,NULL,1,NULL),(523,_binary '','H',2,13,NULL,1,NULL),(524,_binary '','H',3,13,NULL,1,NULL),(525,_binary '','H',4,13,NULL,1,NULL),(526,_binary '','H',5,13,NULL,1,NULL),(527,_binary '','H',6,13,NULL,1,NULL),(528,_binary '','H',7,13,NULL,1,NULL),(529,_binary '','H',8,13,NULL,1,NULL),(530,_binary '','H',9,13,NULL,1,NULL),(531,_binary '','H',10,13,NULL,1,NULL),(532,_binary '','H',11,13,NULL,1,NULL),(533,_binary '','H',12,13,NULL,1,NULL),(534,_binary '','H',14,13,NULL,1,NULL);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_status`
--

DROP TABLE IF EXISTS `seat_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_status`
--

LOCK TABLES `seat_status` WRITE;
/*!40000 ALTER TABLE `seat_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_type`
--

DROP TABLE IF EXISTS `seat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_type` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_type`
--

LOCK TABLES `seat_type` WRITE;
/*!40000 ALTER TABLE `seat_type` DISABLE KEYS */;
INSERT INTO `seat_type` VALUES (1,'Ghế thường',1),(2,'Ghế Vip',1),(3,'Ghế đôi',1);
/*!40000 ALTER TABLE `seat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `price_ticket` double NOT NULL,
  `seat_status` int NOT NULL,
  `seat_type` int NOT NULL,
  `ticket_booking_time` datetime(6) DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Ticket_Schedule` (`schedule_id`),
  KEY `fk_Ticket_Seat` (`seat_id`),
  KEY `fk_Ticket_User` (`user_id`),
  CONSTRAINT `fk_Ticket_Schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `fk_Ticket_Seat` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`),
  CONSTRAINT `fk_Ticket_User` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (359,'143336',_binary '',50000,4,1,'2024-05-20 01:08:52.785204',12,1,3),(360,NULL,_binary '\0',0,1,1,NULL,12,2,NULL),(361,NULL,_binary '\0',0,1,1,NULL,12,3,NULL),(362,NULL,_binary '\0',0,1,1,NULL,12,4,NULL),(363,NULL,_binary '\0',0,1,1,NULL,12,5,NULL),(364,NULL,_binary '\0',0,1,1,NULL,12,6,NULL),(365,NULL,_binary '\0',0,1,1,NULL,12,7,NULL),(366,NULL,_binary '\0',0,1,1,NULL,12,8,NULL),(367,NULL,_binary '\0',0,1,1,NULL,12,9,NULL),(368,NULL,_binary '\0',0,1,1,NULL,12,10,NULL),(369,NULL,_binary '\0',0,1,1,NULL,12,11,NULL),(370,NULL,_binary '\0',0,1,1,NULL,12,12,NULL),(371,NULL,_binary '\0',0,1,1,NULL,12,13,NULL),(372,NULL,_binary '\0',0,1,1,NULL,12,14,NULL),(373,NULL,_binary '\0',0,1,1,NULL,12,15,NULL),(374,NULL,_binary '\0',0,1,1,NULL,12,16,NULL),(375,NULL,_binary '\0',0,1,1,NULL,12,17,NULL),(376,NULL,_binary '\0',0,1,1,NULL,12,18,NULL),(377,NULL,_binary '\0',0,1,1,NULL,12,19,NULL),(378,NULL,_binary '\0',0,1,1,NULL,12,20,NULL),(379,NULL,_binary '\0',0,1,1,NULL,12,21,NULL),(380,NULL,_binary '\0',0,1,1,NULL,12,22,NULL),(381,NULL,_binary '\0',0,1,1,NULL,12,23,NULL),(382,NULL,_binary '\0',0,1,1,NULL,12,24,NULL),(383,NULL,_binary '\0',0,1,1,NULL,12,25,NULL),(384,NULL,_binary '\0',0,1,1,NULL,12,26,NULL),(385,NULL,_binary '\0',0,1,1,NULL,12,27,NULL),(386,NULL,_binary '\0',0,1,1,NULL,12,28,NULL),(387,NULL,_binary '\0',0,1,1,NULL,12,29,NULL),(388,NULL,_binary '\0',0,1,1,NULL,12,30,NULL),(389,NULL,_binary '\0',0,1,1,NULL,12,31,NULL),(390,NULL,_binary '\0',0,1,1,NULL,12,32,NULL),(391,NULL,_binary '\0',0,1,1,NULL,12,33,NULL),(392,NULL,_binary '\0',0,1,1,NULL,12,34,NULL),(393,NULL,_binary '\0',0,1,1,NULL,12,35,NULL),(394,NULL,_binary '\0',0,1,1,NULL,12,36,NULL),(395,NULL,_binary '\0',0,1,1,NULL,12,37,NULL),(396,NULL,_binary '\0',0,1,1,NULL,12,38,NULL),(397,NULL,_binary '\0',0,1,1,NULL,12,39,NULL),(398,NULL,_binary '\0',0,1,1,NULL,12,40,NULL),(399,NULL,_binary '\0',0,1,1,NULL,12,41,NULL),(400,NULL,_binary '\0',0,1,1,NULL,12,42,NULL),(401,NULL,_binary '\0',0,1,1,NULL,12,43,NULL),(402,NULL,_binary '\0',0,1,1,NULL,12,44,NULL),(403,NULL,_binary '\0',0,1,1,NULL,12,45,NULL),(404,NULL,_binary '\0',0,1,1,NULL,12,46,NULL),(405,NULL,_binary '\0',0,1,1,NULL,12,47,NULL),(406,NULL,_binary '\0',0,1,1,NULL,12,48,NULL),(407,NULL,_binary '\0',0,1,1,NULL,12,49,NULL),(408,NULL,_binary '\0',0,1,1,NULL,12,50,NULL),(409,NULL,_binary '\0',0,1,1,NULL,12,51,NULL),(410,NULL,_binary '\0',0,1,1,NULL,12,52,NULL),(411,NULL,_binary '\0',0,1,1,NULL,12,53,NULL),(412,NULL,_binary '\0',0,1,1,NULL,12,54,NULL),(413,NULL,_binary '\0',0,1,1,NULL,12,55,NULL),(414,NULL,_binary '\0',0,1,1,NULL,12,56,NULL),(415,NULL,_binary '\0',0,1,1,NULL,12,57,NULL),(416,NULL,_binary '\0',0,1,1,NULL,12,58,NULL),(417,NULL,_binary '\0',0,1,1,NULL,12,59,NULL),(418,NULL,_binary '\0',0,1,1,NULL,12,60,NULL),(419,NULL,_binary '\0',0,1,1,NULL,12,61,NULL),(420,NULL,_binary '\0',0,1,1,NULL,12,62,NULL),(421,NULL,_binary '\0',0,1,1,NULL,12,63,NULL),(422,NULL,_binary '\0',0,1,1,NULL,12,64,NULL),(423,NULL,_binary '\0',0,1,1,NULL,12,65,NULL),(424,NULL,_binary '\0',0,1,1,NULL,12,66,NULL),(425,NULL,_binary '\0',0,1,1,NULL,12,67,NULL),(426,NULL,_binary '\0',0,1,1,NULL,12,68,NULL),(427,NULL,_binary '\0',0,1,1,NULL,12,69,NULL),(428,NULL,_binary '\0',0,1,1,NULL,12,70,NULL),(429,NULL,_binary '\0',0,1,1,NULL,12,71,NULL),(430,NULL,_binary '\0',0,1,1,NULL,12,72,NULL),(431,NULL,_binary '\0',0,1,1,NULL,12,73,NULL),(432,NULL,_binary '\0',0,1,1,NULL,12,74,NULL),(433,NULL,_binary '\0',0,1,1,NULL,12,75,NULL),(434,NULL,_binary '\0',0,1,1,NULL,12,76,NULL),(435,NULL,_binary '\0',0,1,1,NULL,12,77,NULL),(436,NULL,_binary '\0',0,1,1,NULL,12,78,NULL),(437,NULL,_binary '\0',0,1,1,NULL,12,79,NULL),(438,NULL,_binary '\0',0,1,1,NULL,12,80,NULL),(439,NULL,_binary '\0',0,1,1,NULL,12,81,NULL),(440,NULL,_binary '\0',0,1,1,NULL,12,82,NULL),(441,NULL,_binary '\0',0,1,1,NULL,12,83,NULL),(442,NULL,_binary '\0',0,1,1,NULL,12,84,NULL),(443,NULL,_binary '\0',0,1,1,NULL,12,85,NULL),(444,NULL,_binary '\0',0,1,1,NULL,12,86,NULL),(445,NULL,_binary '\0',0,1,1,NULL,12,87,NULL),(446,NULL,_binary '\0',0,1,1,NULL,12,88,NULL),(447,NULL,_binary '\0',0,1,1,NULL,12,89,NULL),(448,NULL,_binary '\0',0,1,1,NULL,12,90,NULL),(449,NULL,_binary '\0',0,1,2,NULL,12,91,NULL),(450,NULL,_binary '\0',0,1,2,NULL,12,92,NULL),(451,NULL,_binary '\0',0,1,2,NULL,12,93,NULL),(452,NULL,_binary '\0',0,1,2,NULL,12,94,NULL),(453,NULL,_binary '\0',0,1,2,NULL,12,95,NULL),(454,NULL,_binary '\0',0,1,2,NULL,12,96,NULL),(455,NULL,_binary '\0',0,1,2,NULL,12,97,NULL),(456,NULL,_binary '\0',0,1,2,NULL,12,98,NULL),(457,NULL,_binary '\0',0,1,2,NULL,12,99,NULL),(458,NULL,_binary '\0',0,1,2,NULL,12,100,NULL),(459,NULL,_binary '\0',0,1,2,NULL,12,101,NULL),(460,NULL,_binary '\0',0,1,2,NULL,12,102,NULL),(461,NULL,_binary '\0',0,1,2,NULL,12,103,NULL),(462,NULL,_binary '\0',0,1,2,NULL,12,104,NULL),(463,NULL,_binary '\0',0,1,2,NULL,12,105,NULL),(464,NULL,_binary '\0',0,1,2,NULL,12,106,NULL),(465,NULL,_binary '\0',0,1,2,NULL,12,107,NULL),(466,NULL,_binary '\0',0,1,2,NULL,12,108,NULL),(467,NULL,_binary '\0',0,1,2,NULL,12,109,NULL),(468,NULL,_binary '\0',0,1,2,NULL,12,110,NULL),(469,NULL,_binary '\0',0,1,2,NULL,12,111,NULL),(470,NULL,_binary '\0',0,1,2,NULL,12,112,NULL),(471,NULL,_binary '\0',0,1,2,NULL,12,113,NULL),(472,NULL,_binary '\0',0,1,2,NULL,12,114,NULL),(473,NULL,_binary '\0',0,1,2,NULL,12,115,NULL),(474,NULL,_binary '\0',0,1,2,NULL,12,116,NULL),(475,NULL,_binary '\0',0,1,2,NULL,12,117,NULL),(476,NULL,_binary '\0',0,1,2,NULL,12,118,NULL),(477,NULL,_binary '\0',0,1,2,NULL,12,119,NULL),(478,NULL,_binary '\0',0,1,2,NULL,12,120,NULL),(479,NULL,_binary '\0',0,1,3,NULL,12,121,NULL),(480,NULL,_binary '\0',0,1,3,NULL,12,122,NULL),(481,NULL,_binary '\0',0,1,3,NULL,12,123,NULL),(482,NULL,_binary '\0',0,1,3,NULL,12,124,NULL),(483,NULL,_binary '\0',0,1,3,NULL,12,125,NULL),(484,NULL,_binary '\0',0,1,3,NULL,12,126,NULL),(485,NULL,_binary '\0',0,1,3,NULL,12,127,NULL),(486,NULL,_binary '\0',0,1,3,NULL,12,128,NULL),(487,NULL,_binary '\0',0,1,3,NULL,12,129,NULL),(488,NULL,_binary '\0',0,1,3,NULL,12,130,NULL),(489,NULL,_binary '\0',0,1,3,NULL,12,131,NULL),(490,NULL,_binary '\0',0,1,3,NULL,12,132,NULL),(491,NULL,_binary '\0',0,1,3,NULL,12,133,NULL),(492,NULL,_binary '\0',0,1,3,NULL,12,134,NULL),(493,NULL,_binary '\0',0,1,1,NULL,13,135,NULL),(494,NULL,_binary '\0',0,1,1,NULL,13,136,NULL),(495,NULL,_binary '\0',0,1,1,NULL,13,137,NULL),(496,NULL,_binary '\0',0,1,1,NULL,13,138,NULL),(497,NULL,_binary '\0',0,1,1,NULL,13,139,NULL),(498,NULL,_binary '\0',0,1,1,NULL,13,140,NULL),(499,NULL,_binary '\0',0,1,1,NULL,13,141,NULL),(500,NULL,_binary '\0',0,1,1,NULL,13,142,NULL),(501,NULL,_binary '\0',0,1,1,NULL,13,143,NULL),(502,NULL,_binary '\0',0,1,1,NULL,13,144,NULL),(503,NULL,_binary '\0',0,1,1,NULL,13,145,NULL),(504,NULL,_binary '\0',0,1,1,NULL,13,146,NULL),(505,NULL,_binary '\0',0,1,1,NULL,13,147,NULL),(506,NULL,_binary '\0',0,1,1,NULL,13,148,NULL),(507,NULL,_binary '\0',0,1,1,NULL,13,149,NULL),(508,NULL,_binary '\0',0,1,1,NULL,13,150,NULL),(509,NULL,_binary '\0',0,1,1,NULL,13,151,NULL),(510,NULL,_binary '\0',0,1,1,NULL,13,152,NULL),(511,NULL,_binary '\0',0,1,1,NULL,13,153,NULL),(512,NULL,_binary '\0',0,1,1,NULL,13,154,NULL),(513,NULL,_binary '\0',0,1,1,NULL,13,155,NULL),(514,NULL,_binary '\0',0,1,1,NULL,13,156,NULL),(515,NULL,_binary '\0',0,1,1,NULL,13,157,NULL),(516,NULL,_binary '\0',0,1,1,NULL,13,158,NULL),(517,NULL,_binary '\0',0,1,1,NULL,13,159,NULL),(518,NULL,_binary '\0',0,1,1,NULL,13,160,NULL),(519,NULL,_binary '\0',0,1,1,NULL,13,161,NULL),(520,NULL,_binary '\0',0,1,1,NULL,13,162,NULL),(521,NULL,_binary '\0',0,1,1,NULL,13,163,NULL),(522,NULL,_binary '\0',0,1,1,NULL,13,164,NULL),(523,NULL,_binary '\0',0,1,1,NULL,13,165,NULL),(524,NULL,_binary '\0',0,1,1,NULL,13,166,NULL),(525,NULL,_binary '\0',0,1,1,NULL,13,167,NULL),(526,NULL,_binary '\0',0,1,1,NULL,13,168,NULL),(527,NULL,_binary '\0',0,1,1,NULL,13,169,NULL),(528,NULL,_binary '\0',0,1,1,NULL,13,170,NULL),(529,NULL,_binary '\0',0,1,1,NULL,13,171,NULL),(530,NULL,_binary '\0',0,1,1,NULL,13,172,NULL),(531,NULL,_binary '\0',0,1,1,NULL,13,173,NULL),(532,NULL,_binary '\0',0,1,1,NULL,13,174,NULL),(533,NULL,_binary '\0',0,1,1,NULL,13,175,NULL),(534,NULL,_binary '\0',0,1,1,NULL,13,176,NULL),(535,NULL,_binary '\0',0,1,1,NULL,13,177,NULL),(536,NULL,_binary '\0',0,1,1,NULL,13,178,NULL),(537,NULL,_binary '\0',0,1,1,NULL,13,179,NULL),(538,NULL,_binary '\0',0,1,1,NULL,13,180,NULL),(539,NULL,_binary '\0',0,1,1,NULL,13,181,NULL),(540,NULL,_binary '\0',0,1,1,NULL,13,182,NULL),(541,NULL,_binary '\0',0,1,1,NULL,13,183,NULL),(542,NULL,_binary '\0',0,1,1,NULL,13,184,NULL),(543,NULL,_binary '\0',0,1,1,NULL,13,185,NULL),(544,NULL,_binary '\0',0,1,1,NULL,13,186,NULL),(545,NULL,_binary '\0',0,1,1,NULL,13,187,NULL),(546,NULL,_binary '\0',0,1,1,NULL,13,188,NULL),(547,NULL,_binary '\0',0,1,1,NULL,13,189,NULL),(548,NULL,_binary '\0',0,1,1,NULL,13,190,NULL),(549,NULL,_binary '\0',0,1,1,NULL,13,191,NULL),(550,NULL,_binary '\0',0,1,1,NULL,13,192,NULL),(551,NULL,_binary '\0',0,1,1,NULL,13,193,NULL),(552,NULL,_binary '\0',0,1,1,NULL,13,194,NULL),(553,NULL,_binary '\0',0,1,1,NULL,13,195,NULL),(554,NULL,_binary '\0',0,1,1,NULL,13,196,NULL),(555,NULL,_binary '\0',0,1,1,NULL,13,197,NULL),(556,NULL,_binary '\0',0,1,1,NULL,13,198,NULL),(557,NULL,_binary '\0',0,1,1,NULL,13,199,NULL),(558,NULL,_binary '\0',0,1,1,NULL,13,200,NULL),(559,NULL,_binary '\0',0,1,1,NULL,13,201,NULL),(560,NULL,_binary '\0',0,1,1,NULL,13,202,NULL),(561,NULL,_binary '\0',0,1,1,NULL,13,203,NULL),(562,NULL,_binary '\0',0,1,1,NULL,13,204,NULL),(563,NULL,_binary '\0',0,1,1,NULL,13,205,NULL),(564,NULL,_binary '\0',0,1,1,NULL,13,206,NULL),(565,NULL,_binary '\0',0,1,1,NULL,13,207,NULL),(566,NULL,_binary '\0',0,1,1,NULL,13,208,NULL),(567,NULL,_binary '\0',0,1,1,NULL,13,209,NULL),(568,NULL,_binary '\0',0,1,1,NULL,13,210,NULL),(569,NULL,_binary '\0',0,1,1,NULL,13,211,NULL),(570,NULL,_binary '\0',0,1,1,NULL,13,212,NULL),(571,NULL,_binary '\0',0,1,1,NULL,13,213,NULL),(572,NULL,_binary '\0',0,1,1,NULL,13,214,NULL),(573,NULL,_binary '\0',0,1,1,NULL,13,215,NULL),(574,NULL,_binary '\0',0,1,1,NULL,13,216,NULL),(575,NULL,_binary '\0',0,1,1,NULL,13,217,NULL),(576,NULL,_binary '\0',0,1,1,NULL,13,218,NULL),(577,NULL,_binary '\0',0,1,1,NULL,13,219,NULL),(578,NULL,_binary '\0',0,1,1,NULL,13,220,NULL),(579,NULL,_binary '\0',0,1,1,NULL,13,221,NULL),(580,NULL,_binary '\0',0,1,1,NULL,13,222,NULL),(581,NULL,_binary '\0',0,1,1,NULL,13,223,NULL),(582,NULL,_binary '\0',0,1,1,NULL,13,224,NULL),(583,NULL,_binary '\0',0,1,1,NULL,13,225,NULL),(584,NULL,_binary '\0',0,1,1,NULL,13,226,NULL),(585,NULL,_binary '\0',0,1,1,NULL,13,227,NULL),(586,NULL,_binary '\0',0,1,1,NULL,13,228,NULL),(587,NULL,_binary '\0',0,1,1,NULL,13,229,NULL),(588,NULL,_binary '\0',0,1,1,NULL,13,230,NULL),(589,NULL,_binary '\0',0,1,1,NULL,13,231,NULL),(590,NULL,_binary '\0',0,1,1,NULL,13,232,NULL),(591,NULL,_binary '\0',0,1,1,NULL,13,233,NULL),(592,NULL,_binary '\0',0,1,1,NULL,13,234,NULL),(593,NULL,_binary '\0',0,1,1,NULL,13,235,NULL),(594,NULL,_binary '\0',0,1,1,NULL,13,236,NULL),(595,NULL,_binary '\0',0,1,1,NULL,13,237,NULL),(596,NULL,_binary '\0',0,1,1,NULL,13,238,NULL),(597,NULL,_binary '\0',0,1,1,NULL,13,239,NULL),(598,NULL,_binary '\0',0,1,1,NULL,13,240,NULL),(599,NULL,_binary '\0',0,1,1,NULL,13,241,NULL),(600,NULL,_binary '\0',0,1,1,NULL,13,242,NULL),(601,NULL,_binary '\0',0,1,1,NULL,13,243,NULL),(602,NULL,_binary '\0',0,1,1,NULL,13,244,NULL),(603,NULL,_binary '\0',0,1,1,NULL,13,245,NULL),(604,NULL,_binary '\0',0,1,1,NULL,13,246,NULL),(605,NULL,_binary '\0',0,1,1,NULL,13,247,NULL),(606,NULL,_binary '\0',0,1,1,NULL,13,248,NULL),(607,NULL,_binary '\0',0,1,1,NULL,13,249,NULL),(608,NULL,_binary '\0',0,1,1,NULL,13,250,NULL),(609,NULL,_binary '\0',0,1,1,NULL,13,251,NULL),(610,NULL,_binary '\0',0,1,1,NULL,13,252,NULL),(611,NULL,_binary '\0',0,1,1,NULL,13,253,NULL),(612,NULL,_binary '\0',0,1,1,NULL,13,254,NULL),(613,NULL,_binary '\0',0,1,1,NULL,13,255,NULL),(614,NULL,_binary '\0',0,1,1,NULL,13,256,NULL),(615,NULL,_binary '\0',0,1,1,NULL,13,257,NULL),(616,NULL,_binary '\0',0,1,1,NULL,13,258,NULL),(617,NULL,_binary '\0',0,1,1,NULL,13,259,NULL),(618,NULL,_binary '\0',0,1,1,NULL,13,260,NULL),(619,NULL,_binary '\0',0,1,1,NULL,13,261,NULL),(620,NULL,_binary '\0',0,1,1,NULL,13,262,NULL),(621,NULL,_binary '\0',0,1,1,NULL,13,263,NULL),(622,NULL,_binary '\0',0,1,1,NULL,13,264,NULL),(623,NULL,_binary '\0',0,1,1,NULL,13,265,NULL),(624,NULL,_binary '\0',0,1,1,NULL,13,266,NULL),(625,NULL,_binary '\0',0,1,1,NULL,13,267,NULL),(626,NULL,_binary '\0',0,1,1,NULL,14,1,NULL),(627,NULL,_binary '\0',0,1,1,NULL,14,2,NULL),(628,NULL,_binary '\0',0,1,1,NULL,14,3,NULL),(629,NULL,_binary '\0',0,1,1,NULL,14,4,NULL),(630,NULL,_binary '\0',0,1,1,NULL,14,5,NULL),(631,NULL,_binary '\0',0,1,1,NULL,14,6,NULL),(632,NULL,_binary '\0',0,1,1,NULL,14,7,NULL),(633,NULL,_binary '\0',0,1,1,NULL,14,8,NULL),(634,NULL,_binary '\0',0,1,1,NULL,14,9,NULL),(635,NULL,_binary '\0',0,1,1,NULL,14,10,NULL),(636,NULL,_binary '\0',0,1,1,NULL,14,11,NULL),(637,NULL,_binary '\0',0,1,1,NULL,14,12,NULL),(638,NULL,_binary '\0',0,1,1,NULL,14,13,NULL),(639,NULL,_binary '\0',0,1,1,NULL,14,14,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) NOT NULL,
  `movie_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (3,_binary '','Lãng mạn'),(4,_binary '','Hành động');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `point` int NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `rank_customer_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `user_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_User_RankCustomer` (`rank_customer_id`),
  KEY `fk_User_Role` (`role_id`),
  KEY `fk_User_UserStatus` (`user_status_id`),
  CONSTRAINT `fk_User_RankCustomer` FOREIGN KEY (`rank_customer_id`) REFERENCES `rank_customer` (`id`),
  CONSTRAINT `fk_User_Role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_User_UserStatus` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'trongquan202@gmail.com',_binary '','Quân','$2a$10$mDrnzB8xziA30JyxgDvSbOt7iGF2bgUHy8R16qJnRN075yisJCsUi','12345678',0,'Đoàn Trọng Quân',1,1,NULL),(2,'van@gmail.com',_binary '','Văn','$2a$10$PrtX4O7FpfkI2Hd9e2pukO94oFl5Kf7V26xL8g8Gw8EAF0b.gh.yy','12345678',0,'Nguyễn Trọng Văn',1,2,NULL),(3,'nam@gmail.com',_binary '','Nam','$2a$10$WNxg5vfd7KaSdg6/C1Qc5.LO.qRUuCilIDflDgih.9up7acDXViMe','12345678',0,'Nguyễn Bảo Nam',1,1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20  1:37:08
