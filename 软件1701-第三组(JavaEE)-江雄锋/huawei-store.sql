/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - huawei-store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`huawei-store` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `huawei-store`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `receive_name` varchar(20) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `three_address` varchar(20) NOT NULL,
  `other_address` varchar(50) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`user_id`,`receive_name`,`tel`,`three_address`,`other_address`) values (7,11,'斯蒂芬','13026871475','湖北省武汉市江夏区','光谷大道武汉软件工程职业学院'),(9,14,'豆腐干','15478787885','湖北省武汉市江夏区','光谷大道武汉软件工程职业学院'),(8,15,'阿斯达','15405454785','湖北省武汉市江夏区','光谷大道武汉软件工程职业学院');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`uname`,`password`) values (1,'xieyang','123456'),(2,'admin','admin'),(4,'管理员','admin');

/*Table structure for table `commodity` */

DROP TABLE IF EXISTS `commodity`;

CREATE TABLE `commodity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `commodity` */

insert  into `commodity`(`id`,`type`,`name`,`price`,`img`) values (1,'HUAWEI Mate','HUAWEI Mate 9',3099,'img\\1.jpg'),(2,'HUAWEI麦芒','华为麦芒8',1899,'img\\2.png'),(3,'HUAWEI麦芒','HUAWEI麦芒8',1899,'img\\3.png'),(4,'荣耀','荣耀20 PRO',3199,'img\\4.png'),(5,'HUAWEI Mate','HUAWEI Mate 10',3399,'img\\5.jpg'),(6,'荣耀','荣耀20',2699,'img\\6.png'),(7,'荣耀','荣耀8X',1199,'img\\7.png'),(8,'荣耀','荣耀V20',2399,'img\\8.png'),(9,'荣耀','荣耀20i',1599,'img\\9.jpg'),(10,'HUAWEI P','HUAWEI P30',3988,'img\\10.png'),(11,'HUAWEI P','HUAWEI P30 Pro',5488,'img\\11.png'),(12,'HUAWEI Mate','HUAWEI Mate 20X',4499,'img\\12.png'),(13,'HUAWEI Mate','HUAWEI Mate 20 Pro',5499,'img\\13.png'),(14,'HUAWEI Mate','HUAWEI Mate 20',3499,'img\\14.png'),(15,'HUAWEI nova','HUAWEI nova 4e',1799,'img\\15.png'),(16,'HUAWEI nova','HUAWEI nova 4',2799,'img\\16.png'),(17,'华为畅享','华为畅享 9S',1599,'img\\17.png'),(18,'HUAWEI Mate','HUAWEI Mate 20 RS 保时捷',12999,'img\\18.png'),(19,'华为畅享','华为畅享 9',999,'img\\19.png'),(20,'HUAWEI P','HUAWEI P30',3988,'img\\20.png'),(21,'HUAWEI P','HUAWEI P30 Pro',5488,'img\\21.png'),(22,'荣耀畅玩','荣耀畅玩8A',799,'img\\22.png'),(23,'移动4G+','荣耀Magic2 移动4G+',4299,'img\\23.png'),(24,'移动4G+','荣耀8X 移动4G+',1899,'img\\24.png'),(25,'华为畅享','华为畅享9',799,'img\\25.png'),(26,'荣耀','荣耀10 青春版',1099,'img\\26.png'),(27,'移动4G+','荣耀畅玩 8C 移动4G+',1399,'img\\27.png'),(28,'荣耀','荣耀Magic2',2699,'img\\28.png'),(29,'荣耀畅玩','荣耀畅玩8C',899,'img\\29.png'),(30,'华为畅享','华为畅享 MAX',1699,'img\\30.png'),(31,'华为畅享','华为畅享9 Plus',1399,'img\\31.png'),(32,'HUAWEI麦芒','HUAWEI麦芒7',2199,'img\\32.png'),(33,'荣耀','荣耀8X Max',1699,'img\\33.png'),(34,'荣耀','荣耀 Note10',1899,'img\\34.png'),(35,'HUAWEI nova','HUAWEI nova 3i',2199,'img\\35.png'),(36,'移动4G+','荣耀畅玩7 移动4G+',599,'img\\36.png'),(37,'HUAWEI nova','HUAWEI nova 3',2799,'img\\37.png'),(38,'荣耀','荣耀Play',1999,'img\\38.png'),(39,'华为畅享','华为畅享 8e 青春',799,'img\\39.png'),(40,'移动4G+','荣耀10 移动4G+',2999,'img\\40.jpg'),(41,'荣耀畅玩','荣耀畅玩7',599,'img\\41.png'),(42,'荣耀','荣耀10',1799,'img\\42.png'),(43,'HUAWEI P','HUAWEI P20 Pro',4488,'img\\43.png'),(44,'HUAWEI P','HUAWEI P20',3388,'img\\44.png'),(45,'移动4G+','荣耀V10 移动4G+',2399,'img\\45.png'),(46,'荣耀','荣耀V10',1999,'img\\46.png'),(47,'HUAWEI Mate','HUAWEI Mate 10 Pro',3999,'img\\47.png');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`uname`,`password`,`sex`,`email`,`tel`) values (11,'xieyang','123456','男','565310442@qq.com','13026396793'),(12,'user','user','男','564564564@qq.com','13054954987'),(13,'aaa','aaa','女','564654478@qq.com','15544564565'),(14,'bbb','bbb','男','909487987@qq.com','15765465465'),(15,'用户','user','男','544879878@qq.com','15454545865');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
