-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: medicus_medicus24h
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_acomodacao`
--

DROP TABLE IF EXISTS `tb_acomodacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_acomodacao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_acomodacao`
--

LOCK TABLES `tb_acomodacao` WRITE;
/*!40000 ALTER TABLE `tb_acomodacao` DISABLE KEYS */;
INSERT INTO `tb_acomodacao` VALUES (1,'Outros','1'),(2,'Apartamento','1'),(3,'Enfermaria','1');
/*!40000 ALTER TABLE `tb_acomodacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_agenda`
--

DROP TABLE IF EXISTS `tb_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_medico` int(10) unsigned NOT NULL,
  `dia` tinyint(3) unsigned NOT NULL,
  `mes` tinyint(2) unsigned zerofill DEFAULT 00,
  `ano` tinyint(4) unsigned zerofill DEFAULT 0000,
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  `observacao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tb_agenda_id_medico` (`id_medico`),
  KEY `horario_atendimento_UNIQUE` (`dia`,`mes`,`ano`,`hora_inicial`,`hora_final`) USING BTREE,
  CONSTRAINT `fk_tb_agenda_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de dias de atendimentos da agenda médica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_agenda`
--

LOCK TABLES `tb_agenda` WRITE;
/*!40000 ALTER TABLE `tb_agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_atendimento`
--

DROP TABLE IF EXISTS `tb_atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_atendimento` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) unsigned NOT NULL COMMENT 'Pode ser uma primeira consulta ou um retorno, etc.',
  `id_medico` int(11) unsigned NOT NULL,
  `id_clinica` int(11) unsigned NOT NULL,
  `id_paciente` int(11) unsigned NOT NULL,
  `id_categoria` int(11) unsigned NOT NULL COMMENT 'Consulta, exame, procedimento, cirurgia etc.',
  `id_parent` int(11) unsigned DEFAULT 0,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `data` date NOT NULL DEFAULT '0000-00-00',
  `hora_agendada` time NOT NULL,
  `hora_inicial` time DEFAULT '00:00:00',
  `hora_final` time DEFAULT '00:00:00',
  `tempo_atendimento` time NOT NULL DEFAULT '00:00:00',
  `recorrencia` enum('on','off') NOT NULL DEFAULT 'off',
  `recorrencia_periodo` int(11) unsigned NOT NULL DEFAULT 0,
  `recorrencia_limite` date DEFAULT NULL,
  `cor` varchar(25) DEFAULT NULL,
  `criador` int(11) unsigned NOT NULL,
  `lembrete` enum('on','off') NOT NULL DEFAULT 'off',
  `tempo_lembrete` int(11) unsigned NOT NULL DEFAULT 0,
  `periodo_lembrete` int(11) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1','A','I','F','R','C') NOT NULL DEFAULT '1' COMMENT '''1'': ''Agendado'';\r\n''A'': ''Aguardando/Em Espera'';\r\n''I'': ''Iniciado'';\r\n''F'': ''Finalizado'';\r\n''R'': ''Remarcado'';\r\n''C'': ''Cancelado'';\r\n''0'': ''Não compareceu''.',
  PRIMARY KEY (`id`),
  KEY `fk_tb_agendamento_id_categoria` (`id_categoria`),
  KEY `fk_tb_agendamento_id_medico` (`id_medico`),
  KEY `fk_tb_agendamento_id_paciente` (`id_paciente`),
  KEY `fk_tb_agendamento_id_tipo` (`id_tipo`),
  KEY `fk_tb_agendamento_id_usuario` (`criador`),
  KEY `id_clinica` (`id_clinica`),
  CONSTRAINT `fk_tb_agendamento_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_agendamento_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_agendamento_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tb_atendimento_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_agendamento_id_usuario` FOREIGN KEY (`criador`) REFERENCES `medicus_sistema`.`tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_atendimento_id_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `tb_medico_clinica` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_atendimento_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico_clinica` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de agendamentos de eventos médicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_atendimento`
--

LOCK TABLES `tb_atendimento` WRITE;
/*!40000 ALTER TABLE `tb_atendimento` DISABLE KEYS */;
INSERT INTO `tb_atendimento` VALUES (1,1,12,17,2,1,NULL,NULL,NULL,'-','2023-05-25','21:00:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-05-26 00:37:08',NULL,'1'),(2,1,13,16,1,1,NULL,NULL,NULL,'-','2023-06-28','09:00:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-01 09:21:15','2023-07-01 09:45:05','C'),(3,1,13,16,1,1,NULL,NULL,NULL,'-','2023-06-30','09:59:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-01 09:22:23','2023-07-01 09:45:13','C'),(4,1,13,16,2,1,NULL,NULL,NULL,'-','2023-07-01','10:00:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-01 09:55:06',NULL,'1'),(5,1,13,16,5,4,NULL,NULL,NULL,NULL,'2023-07-02','14:00:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-02 16:05:18',NULL,'1'),(6,1,13,16,5,4,NULL,NULL,NULL,NULL,'2023-07-02','14:00:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-02 16:05:18',NULL,'1'),(7,1,13,16,1,2,NULL,NULL,NULL,'-','2023-07-02','00:30:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-02 16:06:52',NULL,'1'),(8,1,13,16,1,2,NULL,NULL,NULL,'-','2023-07-02','00:30:00',NULL,NULL,'00:00:00','off',0,NULL,NULL,1,'off',0,0,'2023-07-02 16:06:52',NULL,'1');
/*!40000 ALTER TABLE `tb_atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_atendimento_exame`
--

DROP TABLE IF EXISTS `tb_atendimento_exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_atendimento_exame` (
  `id_atendimento` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_tb_atendimento_exame_id_atendimento_id_paciente` (`id_atendimento`,`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_atendimento_exame`
--

LOCK TABLES `tb_atendimento_exame` WRITE;
/*!40000 ALTER TABLE `tb_atendimento_exame` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_atendimento_exame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_atendimento_notas`
--

DROP TABLE IF EXISTS `tb_atendimento_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_atendimento_notas` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_severidade` int(10) unsigned NOT NULL,
  `id_atendimento` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tb_atendimento_id_severidade` (`id_severidade`),
  KEY `fk_tb_atendimento_id_atendimento` (`id_atendimento`),
  KEY `fk_tb_atendimento_id_usuario` (`id_usuario`),
  CONSTRAINT `fk_tb_atendimento_id_atendimento` FOREIGN KEY (`id_atendimento`) REFERENCES `tb_atendimento` (`id`),
  CONSTRAINT `fk_tb_atendimento_id_severidade` FOREIGN KEY (`id_severidade`) REFERENCES `tb_severidade_nota` (`id`),
  CONSTRAINT `fk_tb_atendimento_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `medicus_sistema`.`tb_acl_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de notas em atendimentos realizados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_atendimento_notas`
--

LOCK TABLES `tb_atendimento_notas` WRITE;
/*!40000 ALTER TABLE `tb_atendimento_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_atendimento_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_atendimento_tipo`
--

DROP TABLE IF EXISTS `tb_atendimento_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_atendimento_tipo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro para tipos de atendimentos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_atendimento_tipo`
--

LOCK TABLES `tb_atendimento_tipo` WRITE;
/*!40000 ALTER TABLE `tb_atendimento_tipo` DISABLE KEYS */;
INSERT INTO `tb_atendimento_tipo` VALUES (1,'Primeira consulta','Quando o paciente visita pela primeira vez a clínica e solicita um atendimento.','2023-01-03 12:19:44',NULL,'1'),(2,'Retorno','O paciente já foi atendido uma vez, e agora precisa remarcar um novo exame','2023-01-03 12:19:44',NULL,'1');
/*!40000 ALTER TABLE `tb_atendimento_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_banner`
--

DROP TABLE IF EXISTS `tb_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Numero sequencial',
  `titulo` varchar(255) DEFAULT NULL COMMENT 'Título principal do banner.',
  `slug` varchar(255) DEFAULT NULL COMMENT 'Título sem caracteres especiais para identificar o banner.',
  `descricao` text DEFAULT NULL COMMENT 'Texto descritivo do banner',
  `autor` varchar(50) NOT NULL COMMENT 'Autor de criação do banner',
  `ordem` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `publish_up` date NOT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date NOT NULL COMMENT 'Data para parar exibição do banner',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data de criação do banner',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data de criação do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Situação de exibição do banner. 0 - Não exibir; 1 - Exibir.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_banner`
--

LOCK TABLES `tb_banner` WRITE;
/*!40000 ALTER TABLE `tb_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_banner_descricao`
--

DROP TABLE IF EXISTS `tb_banner_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_banner_descricao` (
  `id_banner` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`id_banner`,`id_idioma`),
  KEY `fk_tb_banner_descricao_tb_banner1_idx` (`id_banner`),
  KEY `fk_tb_banner_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_banner_descricao_tb_banner1` FOREIGN KEY (`id_banner`) REFERENCES `tb_banner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_banner_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_banner_descricao`
--

LOCK TABLES `tb_banner_descricao` WRITE;
/*!40000 ALTER TABLE `tb_banner_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_banner_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_banner_imagem`
--

DROP TABLE IF EXISTS `tb_banner_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_banner_imagem` (
  `id_banner` int(10) unsigned NOT NULL,
  `id_midia` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quantidade de clicks/visualizações do banner',
  `url` varchar(255) DEFAULT NULL COMMENT 'Link para artigo',
  `ordem` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `publish_up` date DEFAULT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date DEFAULT NULL COMMENT 'Data para parar exibição do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_banner`,`id_midia`),
  UNIQUE KEY `id_banner_UNIQUE` (`id_banner`),
  UNIQUE KEY `id_midia_UNIQUE` (`id_midia`),
  KEY `fk_tb_banner_imagem_tb_banner1_idx` (`id_banner`),
  KEY `fk_tb_banner_imagem_tb_midia1_idx` (`id_midia`),
  CONSTRAINT `fk_tb_banner_imagem_tb_banner1` FOREIGN KEY (`id_banner`) REFERENCES `tb_banner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_banner_imagem_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_banner_imagem`
--

LOCK TABLES `tb_banner_imagem` WRITE;
/*!40000 ALTER TABLE `tb_banner_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_banner_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_banner_imagem_descricao`
--

DROP TABLE IF EXISTS `tb_banner_imagem_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_banner_imagem_descricao` (
  `id_banner` int(10) unsigned NOT NULL,
  `id_midia` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`id_banner`,`id_midia`,`id_idioma`),
  KEY `fk_tb_banner_imagem_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  KEY `fk_tb_banner_imagem_descricao_tb_banner_imagem1_idx` (`id_banner`,`id_midia`),
  CONSTRAINT `fk_tb_banner_imagem_descricao_tb_banner_imagem1` FOREIGN KEY (`id_banner`, `id_midia`) REFERENCES `tb_banner_imagem` (`id_banner`, `id_midia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_banner_imagem_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_banner_imagem_descricao`
--

LOCK TABLES `tb_banner_imagem_descricao` WRITE;
/*!40000 ALTER TABLE `tb_banner_imagem_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_banner_imagem_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `imagem` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `ordem` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,0,NULL,'#81c784','#000000',0,'2022-11-18 03:02:55',NULL,'1'),(2,0,NULL,'#42a5f5','#000000',0,'2022-11-18 03:02:59',NULL,'1'),(3,0,NULL,'#fff176','#000000',0,'2022-11-18 03:03:04',NULL,'1'),(4,0,NULL,'#ef9a9a','#000000',0,'2022-11-18 03:03:05',NULL,'1'),(5,2,NULL,'#42a5f5',NULL,0,'2022-11-18 03:03:06',NULL,'1'),(6,2,NULL,'#42a5f5',NULL,0,'2022-11-18 03:03:07',NULL,'1'),(7,2,NULL,'#42a5f5',NULL,0,'2022-11-18 03:03:07',NULL,'1');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria_descricao`
--

DROP TABLE IF EXISTS `tb_categoria_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria_descricao` (
  `id_categoria` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`,`id_idioma`),
  UNIQUE KEY `titulo_UNIQUE` (`titulo`),
  KEY `fk_tb_categoria_descricao_tb_categoria1_idx` (`id_categoria`),
  KEY `fk_tb_categoria_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_categoria_descricao_tb_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_categoria_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria_descricao`
--

LOCK TABLES `tb_categoria_descricao` WRITE;
/*!40000 ALTER TABLE `tb_categoria_descricao` DISABLE KEYS */;
INSERT INTO `tb_categoria_descricao` VALUES (1,1,'Consulta','','','',''),(2,1,'Exame','','','',''),(3,1,'Procedimento','','','',''),(4,1,'Cirurgia','','','',''),(5,1,'Laboratório','','','',''),(6,1,'Imagem','','','',''),(7,1,'Outros','','','','');
/*!40000 ALTER TABLE `tb_categoria_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(3) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_email`
--

DROP TABLE IF EXISTS `tb_cliente_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente_email` (
  `id_cliente` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`,`email`),
  KEY `tb_cliente_email_id_cliente` (`id_cliente`),
  CONSTRAINT `tb_cliente_email_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_email`
--

LOCK TABLES `tb_cliente_email` WRITE;
/*!40000 ALTER TABLE `tb_cliente_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente_telefone`
--

DROP TABLE IF EXISTS `tb_cliente_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente_telefone` (
  `id_cliente` int(10) unsigned NOT NULL,
  `telefone` varchar(16) NOT NULL,
  PRIMARY KEY (`id_cliente`,`telefone`),
  KEY `tb_cliente_telefone_id_cliente` (`id_cliente`),
  CONSTRAINT `tb_cliente_telefone_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente_telefone`
--

LOCK TABLES `tb_cliente_telefone` WRITE;
/*!40000 ALTER TABLE `tb_cliente_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cliente_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentario`
--

DROP TABLE IF EXISTS `tb_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comentario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `autor` varchar(100) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `estrelas` int(11) NOT NULL DEFAULT 5,
  `texto` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data de criação do comentário',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data a última modificação do comentário',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentario`
--

LOCK TABLES `tb_comentario` WRITE;
/*!40000 ALTER TABLE `tb_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_convenio`
--

DROP TABLE IF EXISTS `tb_convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_convenio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `flag` varchar(500) NOT NULL,
  `status` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tb_convenio_id_parent` (`id_parent`),
  CONSTRAINT `fk_tb_convenio_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de convênios de pacientes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_convenio`
--

LOCK TABLES `tb_convenio` WRITE;
/*!40000 ALTER TABLE `tb_convenio` DISABLE KEYS */;
INSERT INTO `tb_convenio` VALUES (1,NULL,'Sem convênio','0','','1'),(2,NULL,'Médicus24h','2','','1');
/*!40000 ALTER TABLE `tb_convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_convenio_planos`
--

DROP TABLE IF EXISTS `tb_convenio_planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_convenio_planos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_convenio` int(11) unsigned NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `flag` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tb_convenio_planos_id_convenio` (`id_convenio`),
  CONSTRAINT `fk_tb_convenio_planos_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `tb_convenio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar pacotes de programas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_convenio_planos`
--

LOCK TABLES `tb_convenio_planos` WRITE;
/*!40000 ALTER TABLE `tb_convenio_planos` DISABLE KEYS */;
INSERT INTO `tb_convenio_planos` VALUES (1,2,'Plano Bronze','linear-gradient(to right, #e48425, #ff7f00);','2023-03-04 04:40:54',NULL,'1'),(2,2,'Plano Silver','linear-gradient(to right, #c0c0c0, #ebebeb);','2023-03-04 04:40:54',NULL,'1'),(3,2,'Plano Gold','linear-gradient(to right, #f5d421, #ffd700);','2023-03-04 04:40:54',NULL,'1'),(4,1,'Particular','linear-gradient(to right, #e48425, #ff7f00);','2023-03-04 04:40:54',NULL,'1');
/*!40000 ALTER TABLE `tb_convenio_planos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_convenio_planos_servicos`
--

DROP TABLE IF EXISTS `tb_convenio_planos_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_convenio_planos_servicos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_plano` int(11) unsigned NOT NULL,
  `id_servico` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tb_convenio_planos_servicos_id_plano` (`id_plano`),
  CONSTRAINT `fk_tb_convenio_planos_servicos_id_plano` FOREIGN KEY (`id_plano`) REFERENCES `tb_convenio_planos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar serviços';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_convenio_planos_servicos`
--

LOCK TABLES `tb_convenio_planos_servicos` WRITE;
/*!40000 ALTER TABLE `tb_convenio_planos_servicos` DISABLE KEYS */;
INSERT INTO `tb_convenio_planos_servicos` VALUES (1,1,1,'2023-03-04 04:43:09',NULL,'1'),(2,1,2,'2023-03-04 04:43:09',NULL,'1');
/*!40000 ALTER TABLE `tb_convenio_planos_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_departamento`
--

DROP TABLE IF EXISTS `tb_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para vincular médico a várias clínica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_departamento`
--

LOCK TABLES `tb_departamento` WRITE;
/*!40000 ALTER TABLE `tb_departamento` DISABLE KEYS */;
INSERT INTO `tb_departamento` VALUES (8,'Recepção',NULL,'2022-11-29 10:06:40','2023-07-03 02:17:57','1'),(9,'Pediatria',NULL,'2022-11-29 10:06:50','2022-12-15 11:55:44','1'),(10,'Bloco cirúrgico',NULL,'2022-11-29 10:07:07','2023-01-12 05:08:09','1'),(11,'Laboratório',NULL,'2023-05-16 10:17:29','2023-05-17 18:02:48','1'),(12,'Urgência e Emergência',NULL,'2023-05-16 10:17:57','2023-05-17 18:03:28','1'),(13,'Administração',NULL,'2023-05-16 10:18:07','2023-05-17 18:03:37','1'),(14,'Recursos Humanos',NULL,'2023-05-17 18:03:48',NULL,'1');
/*!40000 ALTER TABLE `tb_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_departamento_empresa`
--

DROP TABLE IF EXISTS `tb_departamento_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_departamento_empresa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_departamento` int(10) unsigned NOT NULL,
  `id_empresa` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_empresa_departamento` (`id_departamento`,`id_empresa`),
  KEY `fk_tb_departamento_id_empresa` (`id_empresa`),
  CONSTRAINT `fk_tb_departamento_id_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `tb_departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_departamento_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_departamento_empresa`
--

LOCK TABLES `tb_departamento_empresa` WRITE;
/*!40000 ALTER TABLE `tb_departamento_empresa` DISABLE KEYS */;
INSERT INTO `tb_departamento_empresa` VALUES (2,10,16,'1'),(3,11,16,'1'),(4,9,16,'1'),(5,8,16,'1'),(6,14,16,'1'),(7,12,16,'1'),(8,13,21,'1'),(9,10,21,'1'),(10,11,21,'1'),(11,9,21,'1'),(12,8,21,'1'),(13,14,21,'1'),(14,12,21,'1'),(22,13,22,'1'),(23,10,22,'1'),(24,11,22,'1'),(25,9,22,'1'),(26,8,22,'1'),(27,14,22,'1'),(28,12,22,'1'),(29,13,19,'1'),(30,10,19,'1'),(31,11,19,'1'),(32,9,19,'1'),(33,8,19,'1'),(34,14,19,'1'),(35,12,19,'1'),(36,13,18,'1'),(37,10,18,'1'),(38,11,18,'1'),(39,9,18,'1'),(40,8,18,'1'),(41,14,18,'1'),(42,12,18,'1'),(57,13,23,'1');
/*!40000 ALTER TABLE `tb_departamento_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_distribuidor`
--

DROP TABLE IF EXISTS `tb_distribuidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_distribuidor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(3) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distribuidor`
--

LOCK TABLES `tb_distribuidor` WRITE;
/*!40000 ALTER TABLE `tb_distribuidor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_distribuidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_distribuidor_email`
--

DROP TABLE IF EXISTS `tb_distribuidor_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_distribuidor_email` (
  `id_distribuidor` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id_distribuidor`,`email`),
  KEY `fk_tb_distribuidor_email_id_distribuidor` (`id_distribuidor`),
  CONSTRAINT `fk_tb_distribuidor_email_id_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distribuidor_email`
--

LOCK TABLES `tb_distribuidor_email` WRITE;
/*!40000 ALTER TABLE `tb_distribuidor_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_distribuidor_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_distribuidor_telefone`
--

DROP TABLE IF EXISTS `tb_distribuidor_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_distribuidor_telefone` (
  `id_distribuidor` int(10) unsigned NOT NULL,
  `telefone` varchar(16) NOT NULL,
  PRIMARY KEY (`id_distribuidor`,`telefone`),
  KEY `fk_tb_distribuidor_telefone_id_distribuidor` (`id_distribuidor`),
  CONSTRAINT `fk_tb_distribuidor_telefone_id_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_distribuidor_telefone`
--

LOCK TABLES `tb_distribuidor_telefone` WRITE;
/*!40000 ALTER TABLE `tb_distribuidor_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_distribuidor_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_email`
--

DROP TABLE IF EXISTS `tb_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_reply` int(10) unsigned NOT NULL DEFAULT 0,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_email`
--

LOCK TABLES `tb_email` WRITE;
/*!40000 ALTER TABLE `tb_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_empresa`
--

DROP TABLE IF EXISTS `tb_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_empresa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Chave primária da tabela.',
  `titulo` varchar(50) DEFAULT NULL,
  `nome_fantasia` varchar(200) DEFAULT NULL COMMENT 'Nome Fantasia da empresa.',
  `razao_social` varchar(200) NOT NULL COMMENT 'Razão Social da empresa',
  `cnpj` varchar(18) NOT NULL COMMENT 'CNPJ da empresa.',
  `inscricao_estadual` varchar(14) DEFAULT NULL COMMENT 'Inscrição Estadual da empresa',
  `inscricao_municipal` varchar(20) DEFAULT NULL COMMENT 'Inscrição Municipal da empresa.',
  `cep` varchar(9) NOT NULL COMMENT 'CEP do endereço da empresa',
  `logradouro` varchar(200) NOT NULL COMMENT 'Endereço da empresa',
  `numero` varchar(11) DEFAULT NULL COMMENT 'Número do endereço da empresa',
  `bairro` varchar(200) NOT NULL COMMENT 'Bairro do endereço da empresa',
  `complemento` varchar(200) DEFAULT NULL COMMENT 'Complemento do endereço da empresa',
  `cidade` varchar(200) NOT NULL COMMENT 'Cidade',
  `uf` varchar(3) NOT NULL COMMENT 'Estado',
  `pais` varchar(20) DEFAULT NULL,
  `quem_somos` text DEFAULT NULL COMMENT 'Descrição da empresa',
  `quem_somos_imagem` varchar(255) DEFAULT NULL,
  `distribuidor_imagem` varchar(255) DEFAULT NULL,
  `contato_imagem` varchar(255) DEFAULT NULL,
  `telefone` varchar(16) DEFAULT NULL COMMENT 'Número do telefone da empresa',
  `celular` varchar(16) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'E-mail da empresa',
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `gmaps` varchar(255) DEFAULT NULL,
  `aliquota_imposto` decimal(10,3) unsigned NOT NULL DEFAULT 0.000 COMMENT 'Alíquota de imposto da empresa',
  `tributacao` enum('SIMPLES NACIONAL','SN - EXCESSO DE SUB-LIMITE DA RECEITA','REGIME NORMAL') NOT NULL DEFAULT 'SIMPLES NACIONAL' COMMENT 'Tipo de tributação',
  `certificado` blob DEFAULT NULL COMMENT 'Localização do arquivo de certificado digital para emissão de notas fiscais',
  `senha_certificado` varchar(255) DEFAULT NULL COMMENT 'Senha do certificado digital',
  `ambiente` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Tipo do ambiente de emissão de notas fiscais. 0 - Homologação; 1 - Produção',
  `sequence_nfe` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Número da última nota fiscal eletrônica emitida.',
  `sequence_nfce` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Número da última nota fiscal de consumidor emitida.',
  `serie_nfe` int(2) unsigned zerofill NOT NULL DEFAULT 00 COMMENT 'Série da nota fiscal eletrônica.',
  `serie_nfce` int(2) unsigned zerofill NOT NULL DEFAULT 00 COMMENT 'Série da nota fiscal de consumidor.',
  `tokencsc` varchar(6) DEFAULT NULL COMMENT 'Token CSC',
  `csc` varchar(36) DEFAULT NULL COMMENT 'CSC',
  `matriz` enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'Identifica como loja Matriz ou Filial',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de lojas/empresas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_empresa`
--

LOCK TABLES `tb_empresa` WRITE;
/*!40000 ALTER TABLE `tb_empresa` DISABLE KEYS */;
INSERT INTO `tb_empresa` VALUES (16,'ODONTOLOGIA URGENCIA E EMERGENCIA 24H',NULL,'ALL SMILES INSTITUTO ODONTOLÓGICO LTDA','31.806.287/0001-75',NULL,NULL,'58040-750','RUA DOUTOR OSORIO ABATH','46','TORRE',NULL,'JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,NULL,'(83) 986 878 331','institutoallsmiles@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'','2023-03-29 23:46:25','2023-07-03 05:59:27','1'),(17,'ISOMED EXAMES DE IMAGEM',NULL,'INSTITUTO DE SAUDE OCUPACIONAL E MEDICINA','28.185.950/0001-57',NULL,NULL,'58013-360','AVENIDA CAMILO DE HOLANDA','478','CENTRO','SALA102','JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,'(83) 3506-1672','(83) 998 695 732','contato@isomedjp.com',NULL,NULL,NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'','2023-03-29 23:51:27','2023-05-30 16:38:57','1'),(18,'INSTITUTO CLINAM MULTIPROFISSIONAIS.',NULL,'INSTITUTO CLINAM LTDA','46.600.770/0001-76',NULL,NULL,'58013-342','R. Borja Peregrino','218','Centro',NULL,'JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,'(83) 2106-8202',NULL,NULL,NULL,'@CLINAMSAUDE',NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'N','2023-03-30 00:22:35','2023-05-17 18:05:17','1'),(19,'DELFIN- EXAMES DE IMAGEM',NULL,'ECOCLINICA LTDA','57.754.285/0001-73',NULL,NULL,'58013-240','AVENIDA CORALIO SOARES DA OLIVEIRA','305','CENTRO',NULL,'JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,'(83) 3049-4444',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'N','2023-03-30 01:31:08','2023-05-17 18:05:03','1'),(21,'PSICONEURO - SERVICOS DE PSICOLOGIA',NULL,'CM SERVICOS DE PSICOLOGIA LTDA','26.429.306/0001-51',NULL,NULL,'58013-430','AVENIDA COREMAS','478','CENTRO',NULL,'JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,'(83) 3506-0973',NULL,'psiconeuro.ltda@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'N','2023-03-30 23:23:35','2023-05-17 18:04:21','1'),(22,'POLICLINICA MED SAUDE',NULL,'DR MENDONCA SERVICOS MEDICOS LTDA','37.010.056/0001-37',NULL,NULL,'58040-440','AVENIDA DOM PEDRO II','1270','TORRE',NULL,'JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,'(83) 3508-4663','(83) 965 676 46','adm.medsaudejp@gmail.com',NULL,'@medsaudejp',NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'N','2023-03-30 23:29:37','2023-05-17 18:04:48','1'),(23,'Policlinica Emma',NULL,'Policlinica Emma Saude Medica LTDA','43.882.086/0001-36',NULL,NULL,'58056-010','Rua Elias Pereira de Araujo','66','Mangabeira',NULL,'JOAO PESSOA','PB','BRASIL',NULL,NULL,NULL,NULL,'(83) 3023-3333',NULL,'emma.policlinica@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,0.000,'SIMPLES NACIONAL',NULL,NULL,'0',0,0,00,00,NULL,NULL,'','2023-03-30 23:33:49','2023-05-23 19:37:16','1');
/*!40000 ALTER TABLE `tb_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_especialidade`
--

DROP TABLE IF EXISTS `tb_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_especialidade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `especialidade` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de especialidades médicas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_especialidade`
--

LOCK TABLES `tb_especialidade` WRITE;
/*!40000 ALTER TABLE `tb_especialidade` DISABLE KEYS */;
INSERT INTO `tb_especialidade` VALUES (1,'Otorrino','Médico especializado em tratamento de saúde de nariz, ouvido e garganta.','2022-11-16 09:29:01',NULL,'1'),(2,'Cardiologista','Médico que cuida do coração.','2022-11-16 09:29:01','2022-11-25 09:33:20','1'),(3,'Neurologista','Médico especializado em tratamento de saúde da cabeça e do sistema nervoso.','2022-11-16 09:29:01',NULL,'1'),(4,'Pneumulogista','Médico especializado em tratamento de saúde do sistema respiratório.','2022-11-16 09:29:01',NULL,'1'),(5,'Ortopedista','Médico especializado em problemas de ossos.','2022-11-16 10:06:05',NULL,'1'),(7,'Psicólogo',NULL,'2022-11-16 11:50:24',NULL,'1'),(8,'Endocrinologista','Médico que cuida da saúde dos rins.','2022-11-16 11:50:58',NULL,'1'),(9,'Dentista','Médico que cuida da saúde dos dentes.','2022-11-16 12:02:33',NULL,'1'),(10,'Clínica médica',NULL,'2022-11-16 12:55:12',NULL,'1'),(11,'Geriatria',NULL,'2022-11-16 12:55:53',NULL,'1'),(12,'Oftalmologia',NULL,'2022-11-16 12:57:57',NULL,'1'),(13,'Medicina do exercício e do esporte',NULL,'2022-11-16 12:58:52',NULL,'1'),(14,'Oncologia',NULL,'2022-11-16 13:00:11',NULL,'1'),(15,'Dermatologia',NULL,'2022-11-16 13:01:35',NULL,'1'),(16,'Urgência e emergência',NULL,'2022-11-16 13:02:19',NULL,'1'),(17,'Infectologia',NULL,'2022-11-16 13:02:36',NULL,'1'),(18,'Cirurgia',NULL,'2022-11-16 13:03:11','2023-01-11 19:49:35','1'),(19,'Neurocirurgia',NULL,'2022-11-16 13:03:20',NULL,'1'),(20,'Cirurgia geral',NULL,'2022-11-16 13:03:34','2023-01-11 19:49:31','1'),(21,'Cirurgia plástica',NULL,'2022-11-16 13:03:41','2023-01-11 19:49:26','1'),(22,'Angiologista',NULL,'2022-11-16 13:03:55','2023-07-02 18:49:04','1'),(23,'Anestesiologia','Médico responsável por aplicação de anestesias.','2022-11-16 13:04:01','2023-01-16 15:19:52','1'),(33,'Fisioterapia',NULL,'2023-01-04 13:06:58','2023-01-11 19:48:54','1'),(34,'Obstetrícia',NULL,'2023-01-04 13:07:15','2023-01-11 19:48:47','1');
/*!40000 ALTER TABLE `tb_especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado_civil`
--

DROP TABLE IF EXISTS `tb_estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estado_civil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado_civil`
--

LOCK TABLES `tb_estado_civil` WRITE;
/*!40000 ALTER TABLE `tb_estado_civil` DISABLE KEYS */;
INSERT INTO `tb_estado_civil` VALUES (1,'Solteiro'),(2,'Casado'),(3,'Separado'),(4,'Divorciado'),(5,'Viúvo');
/*!40000 ALTER TABLE `tb_estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_etnia`
--

DROP TABLE IF EXISTS `tb_etnia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_etnia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_etnia`
--

LOCK TABLES `tb_etnia` WRITE;
/*!40000 ALTER TABLE `tb_etnia` DISABLE KEYS */;
INSERT INTO `tb_etnia` VALUES (1,'Não informado'),(2,'Branca'),(3,'Preta'),(4,'Parda'),(5,'Amarela'),(6,'Indigena');
/*!40000 ALTER TABLE `tb_etnia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_exame`
--

DROP TABLE IF EXISTS `tb_exame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_exame` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(11,3) unsigned NOT NULL DEFAULT 0.000,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `titulo` (`titulo`),
  KEY `fk_tb_exame_id_categoria` (`id_categoria`),
  CONSTRAINT `fk_tb_exame_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_exame_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para cadastro de exames';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exame`
--

LOCK TABLES `tb_exame` WRITE;
/*!40000 ALTER TABLE `tb_exame` DISABLE KEYS */;
INSERT INTO `tb_exame` VALUES (1,1,'BHCG','Exame de teste de gravidez',100.000,'','','','2023-05-23 21:09:14',NULL,'1'),(3,1,'teste3','teste3',0.000,'','','','2023-07-01 08:02:37',NULL,'1'),(5,1,'teste4','teste4',0.000,'','','','2023-07-01 08:06:04',NULL,'1'),(6,1,'teste5','teste',0.000,'','','','2023-07-01 08:09:42',NULL,'1');
/*!40000 ALTER TABLE `tb_exame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_exame_categoria`
--

DROP TABLE IF EXISTS `tb_exame_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_exame_categoria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `classificacao` varchar(100) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `titulo` (`titulo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para cadastro de categorias de exames';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exame_categoria`
--

LOCK TABLES `tb_exame_categoria` WRITE;
/*!40000 ALTER TABLE `tb_exame_categoria` DISABLE KEYS */;
INSERT INTO `tb_exame_categoria` VALUES (1,'Não definido','Não definido','Padrão','Não definido','Não definido','Não definido','2023-04-20 02:00:35','2023-04-20 02:01:30','1');
/*!40000 ALTER TABLE `tb_exame_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcao`
--

DROP TABLE IF EXISTS `tb_funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int(10) unsigned NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de funções';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcao`
--

LOCK TABLES `tb_funcao` WRITE;
/*!40000 ALTER TABLE `tb_funcao` DISABLE KEYS */;
INSERT INTO `tb_funcao` VALUES (1,1,'Recepcionista','Recepcionista','2022-11-22 22:25:44',NULL,'1'),(2,2,'Médico','Médico','2022-11-22 22:25:44',NULL,'1');
/*!40000 ALTER TABLE `tb_funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcionario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_empresa` int(10) unsigned NOT NULL,
  `id_departamento` int(10) unsigned NOT NULL,
  `id_empresa_departamento` int(10) unsigned NOT NULL,
  `id_funcao` int(10) unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `rg` (`rg`),
  KEY `fk_tb_funcionario_id_empresa_departamento` (`id_empresa_departamento`),
  KEY `fk_tb_funcionario_id_funcao` (`id_funcao`),
  KEY `fk_tb_funcionario_tb_departamento1_idx` (`id_departamento`),
  KEY `fk_tb_funcionario_tb_empresa1_idx` (`id_empresa`),
  CONSTRAINT `fk_tb_funcionario_id_funcao` FOREIGN KEY (`id_funcao`) REFERENCES `tb_funcao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_funcionario_tb_departamento1` FOREIGN KEY (`id_departamento`) REFERENCES `tb_departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_funcionario_tb_empresa1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de funcionários';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
INSERT INTO `tb_funcionario` VALUES (12,17,9,0,2,'Teste','123.412.341-23','12341234','2023-05-24 05:27:28',NULL,'1'),(13,16,9,0,2,'Alisson','069.422.924-51','3177241','2023-07-01 08:34:28',NULL,'1'),(14,18,8,0,1,'Maria Guedes','069.293.421-23','384312','2023-07-01 08:37:03',NULL,'1');
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_galeria`
--

DROP TABLE IF EXISTS `tb_galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_galeria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) DEFAULT NULL,
  `publish_up` date NOT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date NOT NULL COMMENT 'Data para parar exibição do banner',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_galeria`
--

LOCK TABLES `tb_galeria` WRITE;
/*!40000 ALTER TABLE `tb_galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_galeria_descricao`
--

DROP TABLE IF EXISTS `tb_galeria_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_galeria_descricao` (
  `id_galeria` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`id_galeria`,`id_idioma`),
  KEY `fk_tb_galeria_descricao_tb_galeria1_idx` (`id_galeria`),
  KEY `fk_tb_galeria_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_galeria_descricao_tb_galeria1` FOREIGN KEY (`id_galeria`) REFERENCES `tb_galeria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_galeria_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_galeria_descricao`
--

LOCK TABLES `tb_galeria_descricao` WRITE;
/*!40000 ALTER TABLE `tb_galeria_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_galeria_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_galeria_imagem`
--

DROP TABLE IF EXISTS `tb_galeria_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_galeria_imagem` (
  `id_galeria` int(10) unsigned NOT NULL,
  `id_midia` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL DEFAULT 0,
  `url` varchar(255) DEFAULT NULL,
  `ordem` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `publish_up` date NOT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date NOT NULL COMMENT 'Data para parar exibição do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Situação de exibição do banner. 0 - Não exibir; 1 - Exibir.',
  PRIMARY KEY (`id_galeria`,`id_midia`),
  KEY `fk_tb_album_foto_id_album` (`id_galeria`),
  KEY `fk_tb_galeria_imagem_tb_midia1_idx` (`id_midia`),
  CONSTRAINT `fk_tb_album_foto_id_album` FOREIGN KEY (`id_galeria`) REFERENCES `tb_galeria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_galeria_imagem_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_galeria_imagem`
--

LOCK TABLES `tb_galeria_imagem` WRITE;
/*!40000 ALTER TABLE `tb_galeria_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_galeria_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_lead`
--

DROP TABLE IF EXISTS `tb_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_lead` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_produto` int(10) unsigned NOT NULL,
  `id_cliente` int(10) unsigned NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tb_lead_id_cliente` (`id_cliente`),
  KEY `tb_lead_id_produto` (`id_produto`),
  CONSTRAINT `tb_lead_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_lead_id_produto` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_lead`
--

LOCK TABLES `tb_lead` WRITE;
/*!40000 ALTER TABLE `tb_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link`
--

DROP TABLE IF EXISTS `tb_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target` varchar(6) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de adição de links rápidos do site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link`
--

LOCK TABLES `tb_link` WRITE;
/*!40000 ALTER TABLE `tb_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link_descricao`
--

DROP TABLE IF EXISTS `tb_link_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_link_descricao` (
  `id_link` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id_link`,`id_idioma`),
  KEY `fk_tb_link_descricao_tb_link1_idx` (`id_link`),
  KEY `fk_tb_link_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_link_descricao_tb_link1` FOREIGN KEY (`id_link`) REFERENCES `tb_link` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_link_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link_descricao`
--

LOCK TABLES `tb_link_descricao` WRITE;
/*!40000 ALTER TABLE `tb_link_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_link_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico`
--

DROP TABLE IF EXISTS `tb_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medico` (
  `id_funcionario` int(11) unsigned NOT NULL,
  `id_especialidade` int(10) unsigned NOT NULL,
  `crm` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_funcionario`,`crm`),
  UNIQUE KEY `crm` (`crm`),
  UNIQUE KEY `fk_tb_medico_id_funcionario_UNIQUE` (`id_funcionario`),
  KEY `fk_tb_medico_id_especialidade` (`id_especialidade`),
  CONSTRAINT `fk_tb_medico_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_funcionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de atendimentos realizados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico`
--

LOCK TABLES `tb_medico` WRITE;
/*!40000 ALTER TABLE `tb_medico` DISABLE KEYS */;
INSERT INTO `tb_medico` VALUES (12,0,'1234','2023-05-24 05:27:28',NULL,'1'),(13,0,'12345','2023-07-01 08:34:28',NULL,'1');
/*!40000 ALTER TABLE `tb_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico_agenda`
--

DROP TABLE IF EXISTS `tb_medico_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medico_agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_medico_clinica` int(10) unsigned NOT NULL,
  `dia` tinyint(3) unsigned NOT NULL COMMENT '0 - domingo,\r\n1 - segunda,\r\n2 - terça,\r\n3 - quarta,\r\n4 - quinta,\r\n5 - sexta,\r\n6 - sábado',
  `semana` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `mes` tinyint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `ano` tinyint(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `titulo` varchar(200) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `atende` enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'O médico pode determinar o campo como inativo durante este horário. Se ele atende ou não. Caso ele não atenda, ele pode definir como horário de almoço, por exemplo. Este campo é apenas um controle interno para o recepcionista visualizar.',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `horario_atendimento_UNIQUE` (`id_medico_clinica`,`semana`,`mes`,`ano`,`dia`) USING BTREE,
  CONSTRAINT `fk_tb_medico_agenda_id_medico_clinica` FOREIGN KEY (`id_medico_clinica`) REFERENCES `tb_medico_clinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de dias de atendimentos da agenda médica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico_agenda`
--

LOCK TABLES `tb_medico_agenda` WRITE;
/*!40000 ALTER TABLE `tb_medico_agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medico_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico_agenda_horario`
--

DROP TABLE IF EXISTS `tb_medico_agenda_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medico_agenda_horario` (
  `id_agenda` int(10) unsigned NOT NULL,
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_agenda`,`hora_inicial`,`hora_final`),
  CONSTRAINT `fk_tb_medico_agenda_horario_id_agenda` FOREIGN KEY (`id_agenda`) REFERENCES `tb_medico_agenda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de horários de atendimentos da agenda médica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico_agenda_horario`
--

LOCK TABLES `tb_medico_agenda_horario` WRITE;
/*!40000 ALTER TABLE `tb_medico_agenda_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medico_agenda_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico_clinica`
--

DROP TABLE IF EXISTS `tb_medico_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medico_clinica` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) unsigned NOT NULL,
  `id_empresa` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_medico_clinica` (`id_medico`,`id_empresa`) USING BTREE,
  KEY `fk_tb_medico_clinica_tb_empresa1_idx` (`id_empresa`),
  CONSTRAINT `fk_tb_medico_clinica_id_empresa1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_medico_clinica_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para vincular médico a várias clínica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico_clinica`
--

LOCK TABLES `tb_medico_clinica` WRITE;
/*!40000 ALTER TABLE `tb_medico_clinica` DISABLE KEYS */;
INSERT INTO `tb_medico_clinica` VALUES (8,12,17,'2023-05-24 05:27:28',NULL,'1'),(9,13,16,'2023-07-01 08:34:28',NULL,'1');
/*!40000 ALTER TABLE `tb_medico_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medico_especialidade`
--

DROP TABLE IF EXISTS `tb_medico_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medico_especialidade` (
  `id_funcionario` int(11) unsigned NOT NULL COMMENT 'chave primária referente à tabela `tb_medico`.`id_funcionario`',
  `id_especialidade` int(11) unsigned NOT NULL COMMENT 'chave primária referente à tabela `tb_especialidade`.`id`',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`,`id_especialidade`),
  KEY `fk_tb_medico_especialidade_id_especialidade` (`id_especialidade`),
  CONSTRAINT `fk_tb_medico_especialidade_id_especialidade` FOREIGN KEY (`id_especialidade`) REFERENCES `tb_especialidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_medico_especialidade_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_medico` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de atribuições de especialidades a médicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medico_especialidade`
--

LOCK TABLES `tb_medico_especialidade` WRITE;
/*!40000 ALTER TABLE `tb_medico_especialidade` DISABLE KEYS */;
INSERT INTO `tb_medico_especialidade` VALUES (12,18,'2023-05-24 05:27:28',NULL),(13,2,'2023-07-01 08:34:28',NULL);
/*!40000 ALTER TABLE `tb_medico_especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_midia`
--

DROP TABLE IF EXISTS `tb_midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_midia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Tamanho da imagem do banner',
  `mime_type` varchar(45) DEFAULT NULL,
  `path` varchar(255) NOT NULL COMMENT 'Data de criação do banner',
  `descricao` varchar(500) DEFAULT NULL,
  `clicks` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Quantidade de clicks/visualizações do banner',
  `url` varchar(255) DEFAULT NULL COMMENT 'Link para artigo',
  `ordem` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `autor` varchar(45) NOT NULL DEFAULT 'none',
  `publish_up` date DEFAULT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date DEFAULT NULL COMMENT 'Data para parar exibição do banner',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `tags` text DEFAULT NULL COMMENT 'Tags de pesquisa do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_midia`
--

LOCK TABLES `tb_midia` WRITE;
/*!40000 ALTER TABLE `tb_midia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_midia_descricao`
--

DROP TABLE IF EXISTS `tb_midia_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_midia_descricao` (
  `id_midia` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`id_midia`,`id_idioma`),
  KEY `fk_tb_midia_descricao_tb_midia1_idx` (`id_midia`),
  KEY `fk_tb_midia_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_midia_descricao_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_midia_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_midia_descricao`
--

LOCK TABLES `tb_midia_descricao` WRITE;
/*!40000 ALTER TABLE `tb_midia_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_midia_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente`
--

DROP TABLE IF EXISTS `tb_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `codigo` varchar(11) NOT NULL,
  `associado` enum('yes','no') NOT NULL DEFAULT 'no',
  `id_convenio` int(11) unsigned DEFAULT NULL,
  `id_tipo_convenio` int(11) unsigned DEFAULT NULL,
  `matricula` char(18) NOT NULL,
  `id_acomodacao` int(11) unsigned DEFAULT NULL,
  `validade` char(7) DEFAULT NULL,
  `id_estado_civil` int(10) unsigned NOT NULL,
  `id_etnia` int(10) unsigned NOT NULL DEFAULT 6,
  `sexo` enum('M','F') DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `rg` varchar(11) DEFAULT NULL,
  `cns` varchar(20) DEFAULT NULL,
  `mae` varchar(255) DEFAULT NULL,
  `pai` varchar(255) DEFAULT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `notas_gerais` text DEFAULT NULL,
  `notas_alergias` text DEFAULT NULL,
  `notas_clinicas` text DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `uf` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `celular` varchar(16) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `receber_sms` enum('on','off') NOT NULL DEFAULT 'off',
  `receber_email` enum('on','off') NOT NULL DEFAULT 'off',
  `receber_notificacoes` enum('on','off') NOT NULL DEFAULT 'off',
  `obito` enum('0','1') NOT NULL DEFAULT '0',
  `datahora_obito` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tb_paciente_id_estado_civil` (`id_estado_civil`),
  KEY `fk_tb_paciente_id_etnia` (`id_etnia`),
  KEY `fk_tb_paciente_id_acomodacao` (`id_acomodacao`),
  KEY `fk_tb_paciente_id_tipo_convenio` (`id_tipo_convenio`),
  KEY `fk_tb_paciente_id_convenio` (`id_convenio`),
  CONSTRAINT `fk_tb_paciente_id_acomodacao` FOREIGN KEY (`id_acomodacao`) REFERENCES `tb_acomodacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `tb_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_id_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `tb_estado_civil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_id_etnia` FOREIGN KEY (`id_etnia`) REFERENCES `tb_etnia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_id_tipo_convenio` FOREIGN KEY (`id_tipo_convenio`) REFERENCES `tb_convenio_planos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente`
--

LOCK TABLES `tb_paciente` WRITE;
/*!40000 ALTER TABLE `tb_paciente` DISABLE KEYS */;
INSERT INTO `tb_paciente` VALUES (1,'EMANUEL BRAZ DA COSTA ARAUJO',NULL,'','yes',2,3,'808 934 703436 190',1,'2024-03',1,1,'M','1953-05-17','095.622.904-25','247063',NULL,'SEBASTIANA DA COSTA ARAUJO','DIÔGO BRAZ DE ARAUJO',NULL,NULL,NULL,NULL,NULL,'AVENIDA INGÁ','955',NULL,'58038-251','JOÃO PESSOA','MANAIRA','PB','BRASIL','rosa_mara2012@gmail.com',NULL,'(83) 988 059 137','2023-03-07 23:44:27','2023-06-01 09:33:48','on','off','on','0',NULL,'1'),(2,'ISABEL CRISTINA MARTINS DANTAS',NULL,'','yes',2,3,'062 699 805357 823',1,'2024-03',1,2,'F','1998-11-30','062.653.333-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rua Violeta Formiga','SN',NULL,'58036-042','Joao Pessoa','Jardim Oceania','PB','Brasil','isabel_dantas02@hotmail.com',NULL,'(83) 982 021 998','2023-03-07 23:55:45','2023-03-10 00:30:29','on','on','on','0',NULL,'1'),(3,'ROSA MARIA ARAUJO GUEDES DE CARVALHO',NULL,'','yes',2,3,'963 504 831301 813',1,'2024-03',2,1,'F','1950-05-10','094.442.114-87','3032629',NULL,'SEBASTIANA DA COSTA ARAUJO','DIOGO BRAZ DE ARAUJO',NULL,NULL,NULL,NULL,NULL,'AVENIDA INGÁ','955',NULL,'58038-251','JOÃO PESSOA','MANAIRA','PB','BRASIL','rosa_mara2012@hotmail.com',NULL,'(83) 988 059 137','2023-03-09 20:50:33','2023-03-10 00:42:13','on','off','on','0',NULL,'1'),(4,'VAMBERTO AMARO GUEDES DE CARVALHO',NULL,'','yes',2,3,'740 879 558137 776',1,'2024-03',2,1,'M','1947-11-01','040.008.974-20','115045',NULL,'VANDA FREIRE GUEDES DE CARVALHO','ROBERTO LIMA DE CARVALHO',NULL,NULL,NULL,NULL,NULL,'AVENIDA INGÁ','955',NULL,'58038-251','JOÃO PESSOA','MANAIRA','PB','BRASIL','rosa_mara2012@hotmail.com',NULL,'(83) 988 059 137','2023-03-09 20:58:12','2023-04-18 22:06:17','on','off','on','1','2023-04-16 16:05:00','0'),(5,'MICKAELLA RIBEIRO DE SOUZA',NULL,'','yes',2,1,'411 346 549747 715',1,'2024-03',1,1,'F','2009-08-01','175.085.027-36','3810367',NULL,'JOSIANE RIBEIRO MACHADO ASTROGILDO DE SOUZA','ERNANI MARTINS DE SOUZA',NULL,NULL,NULL,NULL,NULL,'RUA ANTONIO TIRONE','47',NULL,'29164-622','SERRA','GUARACIABA','ES','BRASIL','josizigui@hotmail.com',NULL,'(27) 998 925 152','2023-03-09 21:31:04','2023-03-10 00:43:08','on','off','on','0',NULL,'1');
/*!40000 ALTER TABLE `tb_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente_convenio`
--

DROP TABLE IF EXISTS `tb_paciente_convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente_convenio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) unsigned NOT NULL,
  `id_convenio` int(11) unsigned NOT NULL,
  `id_tipo` int(11) unsigned NOT NULL,
  `id_acomodacao` int(11) unsigned NOT NULL,
  `matricula` char(18) NOT NULL,
  `validade_ano` int(4) unsigned zerofill NOT NULL,
  `validade_mes` int(2) unsigned zerofill NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tb_paciente_convenio_id_acomodacao` (`id_acomodacao`),
  KEY `fk_tb_paciente_convenio_id_convenio` (`id_convenio`),
  KEY `fk_tb_paciente_convenio_id_paciente` (`id_paciente`),
  CONSTRAINT `fk_tb_paciente_convenio_id_acomodacao` FOREIGN KEY (`id_acomodacao`) REFERENCES `tb_acomodacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_convenio_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `tb_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_convenio_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_convenio`
--

LOCK TABLES `tb_paciente_convenio` WRITE;
/*!40000 ALTER TABLE `tb_paciente_convenio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente_convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente_homecare`
--

DROP TABLE IF EXISTS `tb_paciente_homecare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente_homecare` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_tb_paciente_homecare_id_paciente_UNIQUE` (`id_paciente`),
  CONSTRAINT `fk_tb_paciente_homecare_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_homecare`
--

LOCK TABLES `tb_paciente_homecare` WRITE;
/*!40000 ALTER TABLE `tb_paciente_homecare` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente_homecare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente_nota`
--

DROP TABLE IF EXISTS `tb_paciente_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente_nota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` int(10) unsigned NOT NULL,
  `id_severidade` int(10) unsigned NOT NULL,
  `descricao` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tb_paciente_nota` (`id_paciente`),
  KEY `fk_tb_paciente_nota_id_severidade` (`id_severidade`),
  CONSTRAINT `fk_tb_paciente_nota` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_paciente_nota_id_severidade` FOREIGN KEY (`id_severidade`) REFERENCES `tb_severidade_nota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_nota`
--

LOCK TABLES `tb_paciente_nota` WRITE;
/*!40000 ALTER TABLE `tb_paciente_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente_nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente_programa`
--

DROP TABLE IF EXISTS `tb_paciente_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente_programa` (
  `id_paciente` int(11) unsigned NOT NULL,
  `id_programa` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data de inserção do paciente no programa',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data de saída do paciente do programa',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 - Zero quando o paciente for excluído do programa',
  PRIMARY KEY (`id_paciente`,`id_programa`),
  KEY `fk_tb_paciente_programa_id_programa` (`id_programa`),
  CONSTRAINT `fk_tb_paciente_programa_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`),
  CONSTRAINT `fk_tb_paciente_programa_id_programa` FOREIGN KEY (`id_programa`) REFERENCES `tb_programas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para vincular paciente a um programa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_programa`
--

LOCK TABLES `tb_paciente_programa` WRITE;
/*!40000 ALTER TABLE `tb_paciente_programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente_tarefas`
--

DROP TABLE IF EXISTS `tb_paciente_tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente_tarefas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) unsigned NOT NULL COMMENT 'Chave estrangeira referente à tabela `tb_paciente_homecare`, coluna ID.',
  `titulo` varchar(1000) NOT NULL,
  `descricao` text NOT NULL,
  `agendamento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_responsavel` int(11) unsigned NOT NULL,
  `datahora_notificacao` timestamp NULL DEFAULT NULL,
  `recorrencia` enum('on','off') NOT NULL DEFAULT 'off',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `finalizada` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_tarefas`
--

LOCK TABLES `tb_paciente_tarefas` WRITE;
/*!40000 ALTER TABLE `tb_paciente_tarefas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente_tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente_tarefas_anotacoes`
--

DROP TABLE IF EXISTS `tb_paciente_tarefas_anotacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente_tarefas_anotacoes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_responsavel` int(11) unsigned NOT NULL COMMENT 'Chave estrangeira da tabela referente à tabela de profissional responsável pelo atendimento.',
  `id_tarefa` int(11) unsigned NOT NULL COMMENT 'Chave estrangeira da tabela referente à tabela tb_paciente_homecare_tarefa, coluna ID.',
  `descricao` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente_tarefas_anotacoes`
--

LOCK TABLES `tb_paciente_tarefas_anotacoes` WRITE;
/*!40000 ALTER TABLE `tb_paciente_tarefas_anotacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente_tarefas_anotacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post`
--

DROP TABLE IF EXISTS `tb_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_controller` int(10) unsigned NOT NULL,
  `id_parent` int(10) unsigned DEFAULT 0,
  `permissao` smallint(5) unsigned NOT NULL DEFAULT 1111,
  `tipo` varchar(20) NOT NULL DEFAULT 'post' COMMENT 'Informa o tipo de página: Página simples ou galeria de fotos',
  `autor` varchar(45) DEFAULT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tb_post_tb_acl_modulo_id_controller` (`id_controller`),
  CONSTRAINT `fk_tb_post_tb_acl_modulo_classe1` FOREIGN KEY (`id_controller`) REFERENCES `medicus_sistema`.`tb_acl_modulo_controller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post`
--

LOCK TABLES `tb_post` WRITE;
/*!40000 ALTER TABLE `tb_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post_descricao`
--

DROP TABLE IF EXISTS `tb_post_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_post_descricao` (
  `id_post` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `subtitulo` varchar(45) DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `meta_description` varchar(45) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `meta_title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_post`,`id_idioma`),
  KEY `fk_tb_pagina_descricao_tb_pagina1_idx` (`id_post`),
  KEY `fk_tb_pagina_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_pagina_descricao_tb_post` FOREIGN KEY (`id_post`) REFERENCES `tb_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_pagina_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post_descricao`
--

LOCK TABLES `tb_post_descricao` WRITE;
/*!40000 ALTER TABLE `tb_post_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_post_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post_link`
--

DROP TABLE IF EXISTS `tb_post_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_post_link` (
  `id_post` int(10) unsigned NOT NULL,
  `id_link` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_post`,`id_link`),
  KEY `fk_tb_link_pagina_id_link` (`id_link`),
  KEY `fk_tb_link_pagina_id_pagina` (`id_post`),
  CONSTRAINT `fk_tb_link_pagina_id_link` FOREIGN KEY (`id_link`) REFERENCES `tb_link` (`id`),
  CONSTRAINT `fk_tb_link_pagina_id_post` FOREIGN KEY (`id_post`) REFERENCES `tb_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para vincluar um link a uma página';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post_link`
--

LOCK TABLES `tb_post_link` WRITE;
/*!40000 ALTER TABLE `tb_post_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_post_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post_midia`
--

DROP TABLE IF EXISTS `tb_post_midia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_post_midia` (
  `id_pagina` int(10) unsigned NOT NULL,
  `id_midia` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pagina`,`id_midia`),
  UNIQUE KEY `id_pagina_UNIQUE` (`id_pagina`,`id_midia`),
  UNIQUE KEY `id_midia_UNIQUE` (`id_midia`,`id_pagina`),
  KEY `fk_tb_pagina_midia_tb_pagina1_idx` (`id_pagina`),
  KEY `fk_tb_pagina_midia_tb_midia1_idx` (`id_midia`),
  CONSTRAINT `fk_tb_pagina_midia_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_pagina_midia_tb_pagina1` FOREIGN KEY (`id_pagina`) REFERENCES `tb_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post_midia`
--

LOCK TABLES `tb_post_midia` WRITE;
/*!40000 ALTER TABLE `tb_post_midia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_post_midia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_distribuidor` int(10) unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `modo_uso` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `valor` decimal(10,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_tb_produto_distribuidor_id_distribuidor` (`id_distribuidor`),
  CONSTRAINT `fk_tb_produto_distribuidor_id_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto_categoria`
--

DROP TABLE IF EXISTS `tb_produto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto_categoria` (
  `id_produto` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_produto`,`id_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`),
  UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  KEY `fk_tb_produto_categoria_tb_produto1_idx` (`id_produto`,`id_categoria`),
  CONSTRAINT `fk_tb_produto_categoria_tb_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_produto_categoria_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto_categoria`
--

LOCK TABLES `tb_produto_categoria` WRITE;
/*!40000 ALTER TABLE `tb_produto_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto_descricao`
--

DROP TABLE IF EXISTS `tb_produto_descricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto_descricao` (
  `id_produto` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL,
  PRIMARY KEY (`id_idioma`,`id_produto`),
  KEY `fk_tb_produto_descricao_tb_produto1_idx` (`id_produto`),
  KEY `fk_tb_produto_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  CONSTRAINT `fk_tb_produto_descricao_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_produto_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `medicus_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto_descricao`
--

LOCK TABLES `tb_produto_descricao` WRITE;
/*!40000 ALTER TABLE `tb_produto_descricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto_descricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto_imagem`
--

DROP TABLE IF EXISTS `tb_produto_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_produto_imagem` (
  `id_produto` int(10) unsigned NOT NULL,
  `id_midia` int(10) unsigned NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_produto`,`id_midia`),
  UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  UNIQUE KEY `id_midia_UNIQUE` (`id_midia`),
  KEY `fk_tb_produto_imagem_tb_produto1_idx` (`id_produto`,`id_midia`),
  CONSTRAINT `fk_tb_produto_imagem_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tb_produto_imagem_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto_imagem`
--

LOCK TABLES `tb_produto_imagem` WRITE;
/*!40000 ALTER TABLE `tb_produto_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_produto_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_programas`
--

DROP TABLE IF EXISTS `tb_programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_programas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `publico` enum('A','H','M') NOT NULL DEFAULT 'A' COMMENT 'Público alvo para quem é destinado o programa. H: Homens; M: Mulheres; A: Ambos (a todos)',
  `idade_min` int(11) unsigned zerofill NOT NULL DEFAULT 00000000000 COMMENT 'Faixa etária para limitar a idade dos beneficiados. 000: Sem restrição',
  `idade_max` int(11) unsigned zerofill NOT NULL DEFAULT 00000000999 COMMENT 'Faixa etária para limitar a idade dos beneficiados. 999: Sem restrição',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar programas médicos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_programas`
--

LOCK TABLES `tb_programas` WRITE;
/*!40000 ALTER TABLE `tb_programas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_servicos`
--

DROP TABLE IF EXISTS `tb_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_servicos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `descricao` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao` (`descricao`),
  KEY `fk_tb_servicos_id_parent` (`id_parent`),
  CONSTRAINT `fk_tb_servicos_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_servicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar serviços';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_servicos`
--

LOCK TABLES `tb_servicos` WRITE;
/*!40000 ALTER TABLE `tb_servicos` DISABLE KEYS */;
INSERT INTO `tb_servicos` VALUES (1,NULL,'Assistência telemedicina 24h','2023-03-04 04:49:09',NULL,'1'),(2,NULL,'Descontos em parceiros (farmácias, clínicas de estética, óticas)','2023-03-04 04:49:09',NULL,'1'),(3,NULL,'Descontos em consultório e clinicas credenciadas','2023-03-04 04:50:07',NULL,'1'),(4,NULL,'Atendimento odontológico 24h','2023-03-04 04:50:07',NULL,'1'),(5,NULL,'Duas remoções ao ano','2023-03-04 04:50:20',NULL,'1'),(6,NULL,'Urgência e Emergência em Traumatologia com (consulta + raio-x + imobilização) tudo incluso anualmente','2023-03-04 04:52:50',NULL,'1'),(7,NULL,'Consultas na clínica Médicus e urgência com ponto de atendimento','2023-03-04 04:52:50',NULL,'1'),(8,NULL,'Atendimento de urgência e emergência odontológico 24h','2023-03-04 04:53:00',NULL,'1'),(9,NULL,'Assistência domiciliar 24h com a equipe de enfermagem e médico inclusos','2023-03-04 04:53:16',NULL,'1'),(10,NULL,'Descontos em consultório e clinicas credenciadas\r\n','2023-03-04 04:53:25',NULL,'1'),(12,NULL,'Exames Cardiológicos','2023-03-04 04:57:56',NULL,'1'),(13,12,'Eletrocardiograma','2023-03-04 04:58:45',NULL,'1'),(17,12,'Mapa','2023-03-04 04:59:50',NULL,'1'),(18,12,'Holter','2023-03-04 04:59:50',NULL,'1'),(19,12,'Troponina','2023-03-04 04:59:50',NULL,'1');
/*!40000 ALTER TABLE `tb_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_severidade_nota`
--

DROP TABLE IF EXISTS `tb_severidade_nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_severidade_nota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `color` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_severidade_nota`
--

LOCK TABLES `tb_severidade_nota` WRITE;
/*!40000 ALTER TABLE `tb_severidade_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_severidade_nota` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-07 11:43:31
