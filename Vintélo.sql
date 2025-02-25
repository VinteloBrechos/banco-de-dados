CREATE DATABASE  IF NOT EXISTS `vintelo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vintelo`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: vintelo
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `artigos_blog`
--

DROP TABLE IF EXISTS `artigos_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artigos_blog` (
  `ID_ARTIGO` int NOT NULL AUTO_INCREMENT,
  `ID_AUTOR` int NOT NULL,
  `TITULO` varchar(255) NOT NULL,
  `CONTEUDO` text NOT NULL,
  `DATA_PUBLICACAO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_ARTIGO`),
  KEY `ID_AUTOR` (`ID_AUTOR`),
  CONSTRAINT `artigos_blog_ibfk_1` FOREIGN KEY (`ID_AUTOR`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigos_blog`
--

LOCK TABLES `artigos_blog` WRITE;
/*!40000 ALTER TABLE `artigos_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `artigos_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artigos_categorias`
--

DROP TABLE IF EXISTS `artigos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artigos_categorias` (
  `ID_ARTIGO` int NOT NULL,
  `ID_CATEGORIA` int NOT NULL,
  PRIMARY KEY (`ID_ARTIGO`,`ID_CATEGORIA`),
  KEY `ID_CATEGORIA` (`ID_CATEGORIA`),
  CONSTRAINT `artigos_categorias_ibfk_1` FOREIGN KEY (`ID_ARTIGO`) REFERENCES `artigos_blog` (`ID_ARTIGO`) ON DELETE CASCADE,
  CONSTRAINT `artigos_categorias_ibfk_2` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias_blog` (`ID_CATEGORIA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigos_categorias`
--

LOCK TABLES `artigos_categorias` WRITE;
/*!40000 ALTER TABLE `artigos_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `artigos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brechos`
--

DROP TABLE IF EXISTS `brechos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brechos` (
  `ID_BRECHO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `NOME_LOJA` varchar(100) NOT NULL,
  `DESCRICAO` text,
  `AVALIACAO` float DEFAULT '0',
  `SEGUIDORES` int DEFAULT '0',
  `SEGUINDO` int DEFAULT '0',
  PRIMARY KEY (`ID_BRECHO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `brechos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brechos`
--

LOCK TABLES `brechos` WRITE;
/*!40000 ALTER TABLE `brechos` DISABLE KEYS */;
/*!40000 ALTER TABLE `brechos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoes`
--

DROP TABLE IF EXISTS `cartoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartoes` (
  `ID_CARTAO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `NUMERO_CARTAO` varchar(16) NOT NULL,
  `NOME_TITULAR` varchar(100) NOT NULL,
  `VALIDADE` date NOT NULL,
  PRIMARY KEY (`ID_CARTAO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `cartoes_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoes`
--

LOCK TABLES `cartoes` WRITE;
/*!40000 ALTER TABLE `cartoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_blog`
--

DROP TABLE IF EXISTS `categorias_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_blog` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NOME_CATEGORIA` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_blog`
--

LOCK TABLES `categorias_blog` WRITE;
/*!40000 ALTER TABLE `categorias_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversas`
--

DROP TABLE IF EXISTS `conversas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversas` (
  `ID_CONVERSA` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `ID_BRECHO` int NOT NULL,
  `DATA_INICIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_CONVERSA`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_BRECHO` (`ID_BRECHO`),
  CONSTRAINT `conversas_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE,
  CONSTRAINT `conversas_ibfk_2` FOREIGN KEY (`ID_BRECHO`) REFERENCES `brechos` (`ID_BRECHO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversas`
--

LOCK TABLES `conversas` WRITE;
/*!40000 ALTER TABLE `conversas` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `ID_ENDERECO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `LOGRADOURO` varchar(255) NOT NULL,
  `NUMERO` varchar(10) DEFAULT NULL,
  `COMPLEMENTO` varchar(50) DEFAULT NULL,
  `BAIRRO` varchar(100) DEFAULT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `ESTADO` varchar(2) NOT NULL,
  `CEP` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_ENDERECO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatisticas_venda`
--

DROP TABLE IF EXISTS `estatisticas_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatisticas_venda` (
  `ID_ESTATISTICA` int NOT NULL AUTO_INCREMENT,
  `ID_BRECHO` int NOT NULL,
  `ID_PECA` int NOT NULL,
  `TOTAL_VENDIDO` int DEFAULT '0',
  `RECEITA_TOTAL` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`ID_ESTATISTICA`),
  KEY `ID_BRECHO` (`ID_BRECHO`),
  KEY `ID_PECA` (`ID_PECA`),
  CONSTRAINT `estatisticas_venda_ibfk_1` FOREIGN KEY (`ID_BRECHO`) REFERENCES `brechos` (`ID_BRECHO`) ON DELETE CASCADE,
  CONSTRAINT `estatisticas_venda_ibfk_2` FOREIGN KEY (`ID_PECA`) REFERENCES `pecas` (`ID_PECA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatisticas_venda`
--

LOCK TABLES `estatisticas_venda` WRITE;
/*!40000 ALTER TABLE `estatisticas_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatisticas_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagens` (
  `ID_MENSAGEM` int NOT NULL AUTO_INCREMENT,
  `ID_CONVERSA` int NOT NULL,
  `MENSAGEM` text NOT NULL,
  `AUTOR` enum('usuario','brecho') NOT NULL,
  `DATA_ENVIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_MENSAGEM`),
  KEY `ID_CONVERSA` (`ID_CONVERSA`),
  CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`ID_CONVERSA`) REFERENCES `conversas` (`ID_CONVERSA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagens`
--

LOCK TABLES `mensagens` WRITE;
/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `ID_PECA` int NOT NULL AUTO_INCREMENT,
  `ID_BRECHO` int NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `TIPO_PECA` varchar(50) DEFAULT NULL,
  `PRECO` decimal(10,2) NOT NULL,
  `PARCELAMENTO_MAXIMO` int DEFAULT '1',
  `TAMANHO` varchar(10) DEFAULT NULL,
  `DESCRICAO` text,
  `FOTO_URL` varchar(255) DEFAULT NULL,
  `QUANTIDADE` int DEFAULT '1',
  `DATA_ANUNCIO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_PECA`),
  KEY `ID_BRECHO` (`ID_BRECHO`),
  CONSTRAINT `pecas_ibfk_1` FOREIGN KEY (`ID_BRECHO`) REFERENCES `brechos` (`ID_BRECHO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas_favoritadas`
--

DROP TABLE IF EXISTS `pecas_favoritadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas_favoritadas` (
  `ID_USUARIO` int NOT NULL,
  `ID_PECA` int NOT NULL,
  `DATA_FAVORITADA` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_PECA` (`ID_PECA`),
  CONSTRAINT `pecas_favoritadas_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE,
  CONSTRAINT `pecas_favoritadas_ibfk_2` FOREIGN KEY (`ID_PECA`) REFERENCES `pecas` (`ID_PECA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas_favoritadas`
--

LOCK TABLES `pecas_favoritadas` WRITE;
/*!40000 ALTER TABLE `pecas_favoritadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pecas_favoritadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas_semelhantes`
--

DROP TABLE IF EXISTS `pecas_semelhantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas_semelhantes` (
  `ID_PECA` int NOT NULL,
  `ID_PECA_RELACIONADA` int NOT NULL,
  KEY `ID_PECA` (`ID_PECA`),
  KEY `ID_PECA_RELACIONADA` (`ID_PECA_RELACIONADA`),
  CONSTRAINT `pecas_semelhantes_ibfk_1` FOREIGN KEY (`ID_PECA`) REFERENCES `pecas` (`ID_PECA`) ON DELETE CASCADE,
  CONSTRAINT `pecas_semelhantes_ibfk_2` FOREIGN KEY (`ID_PECA_RELACIONADA`) REFERENCES `pecas` (`ID_PECA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas_semelhantes`
--

LOCK TABLES `pecas_semelhantes` WRITE;
/*!40000 ALTER TABLE `pecas_semelhantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pecas_semelhantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID_PEDIDO` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int NOT NULL,
  `ID_BRECHO` int NOT NULL,
  `ID_PECA` int NOT NULL,
  `QUANTIDADE` int NOT NULL,
  `PRECO_TOTAL` decimal(10,2) NOT NULL,
  `status` enum('pendente','enviado','entregue','cancelado') DEFAULT 'pendente',
  `DATA_PEDIDO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_PEDIDO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `ID_BRECHO` (`ID_BRECHO`),
  KEY `ID_PECA` (`ID_PECA`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`ID_BRECHO`) REFERENCES `brechos` (`ID_BRECHO`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`ID_PECA`) REFERENCES `pecas` (`ID_PECA`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rastreamentos`
--

DROP TABLE IF EXISTS `rastreamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rastreamentos` (
  `ID_RASTREAMENTO` int NOT NULL AUTO_INCREMENT,
  `ID_PEDIDO` int NOT NULL,
  `CODIGO_RASTREAMENTO` varchar(100) DEFAULT NULL,
  `STATUS_ENTREGA` enum('pendente','enviado','em_transito','entregue') DEFAULT 'pendente',
  `DATA_ATUALIZACAO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_RASTREAMENTO`),
  KEY `ID_PEDIDO` (`ID_PEDIDO`),
  CONSTRAINT `rastreamentos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rastreamentos`
--

LOCK TABLES `rastreamentos` WRITE;
/*!40000 ALTER TABLE `rastreamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `rastreamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SENHA` varchar(255) NOT NULL,
  `TIPO_USUARIO` enum('cliente','brecho') NOT NULL,
  `DATA_NASCIMENTO` date DEFAULT NULL,
  `DATA_CADASTRO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ASSINATURA_EXPIRA` date DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24 22:05:15
