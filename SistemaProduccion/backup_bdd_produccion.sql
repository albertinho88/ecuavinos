CREATE DATABASE  IF NOT EXISTS `sys_prod_ecuavinos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sys_prod_ecuavinos`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sys_prod_ecuavinos
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

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
-- Table structure for table `historial_produccion`
--

DROP TABLE IF EXISTS `historial_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_produccion` (
  `codigo_producto` varchar(10) NOT NULL COMMENT 'código del producto',
  `anio` varchar(4) NOT NULL COMMENT 'año de producción',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'descripción del producto',
  `volumen_produccion` int(11) DEFAULT NULL COMMENT 'volumen de producción',
  `costo_docena` decimal(10,2) DEFAULT NULL COMMENT 'costo por docena',
  PRIMARY KEY (`codigo_producto`,`anio`),
  CONSTRAINT `productos_historial_produccion_fk` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_produccion`
--

LOCK TABLES `historial_produccion` WRITE;
/*!40000 ALTER TABLE `historial_produccion` DISABLE KEYS */;
INSERT INTO `historial_produccion` VALUES ('12765','2011','McDonell Pinot Noir',510,90.00),('12765','2012','McDonell Pinot Noir',580,110.00),('12765','2013','McDonell Pinot Noir',600,120.00),('12766','2012','Mornington Pinot Noir',550,90.00),('12766','2013','Mornington Pinot Noir',500,110.00),('12767','2012','Downunder Pinot Noir',690,85.00),('12767','2013','Downunder Pinot Noir',780,80.00),('14821','2012','Downunder Merlot',400,100.00),('14821','2013','Downunder Merlot',550,100.00),('14823','2012','Mornington Pinot Grigio',250,65.00),('14823','2013','Mornington Pinot Grigio',400,70.00),('14827','2013','Downunder Pinot Grigio',440,70.00);
/*!40000 ALTER TABLE `historial_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `codigo_producto` varchar(10) NOT NULL COMMENT 'código de producto',
  `cod_tipo_producto` varchar(1) DEFAULT NULL COMMENT 'Código de tipo de producto',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'descripción',
  PRIMARY KEY (`codigo_producto`),
  KEY `tipos_producto_productos_fk` (`cod_tipo_producto`),
  CONSTRAINT `tipos_producto_productos_fk` FOREIGN KEY (`cod_tipo_producto`) REFERENCES `tipos_producto` (`cod_tipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('12765','R','McDonell Pinot Noir'),('12766','R','Mornington Pinot Noir'),('12767','R','Downunder Pinot Noir'),('12821','R','Mornington Merlot'),('14821','R','Downunder Merlot'),('14823','W','Mornington Pinot Grigio'),('14827','W','Downunder Pinot Grigio');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_producto`
--

DROP TABLE IF EXISTS `tipos_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_producto` (
  `cod_tipo_producto` varchar(1) NOT NULL COMMENT 'Código de tipo de producto',
  `descripcion` varchar(255) DEFAULT NULL COMMENT 'descripción del tipo de producto',
  PRIMARY KEY (`cod_tipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_producto`
--

LOCK TABLES `tipos_producto` WRITE;
/*!40000 ALTER TABLE `tipos_producto` DISABLE KEYS */;
INSERT INTO `tipos_producto` VALUES ('R','Red'),('W','White');
/*!40000 ALTER TABLE `tipos_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08  3:25:37
