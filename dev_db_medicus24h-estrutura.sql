-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 23/05/2023 às 15:15
-- Versão do servidor: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Versão do PHP: 8.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dev_db_medicus24h`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acomodacao`
--

CREATE TABLE `tb_acomodacao` (
  `id` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_acomodacao`
--

INSERT INTO `tb_acomodacao` (`id`, `descricao`, `status`) VALUES
(1, 'Outros', '1'),
(2, 'Apartamento', '1'),
(3, 'Enfermaria', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_agenda`
--

CREATE TABLE `tb_agenda` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_medico` int(10) UNSIGNED NOT NULL,
  `dia` tinyint(3) UNSIGNED NOT NULL,
  `mes` tinyint(2) UNSIGNED ZEROFILL DEFAULT 00,
  `ano` tinyint(4) UNSIGNED ZEROFILL DEFAULT 0000,
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  `observacao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de dias de atendimentos da agenda médica';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_atendimento`
--

CREATE TABLE `tb_atendimento` (
  `id` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `id_parent` int(11) UNSIGNED DEFAULT 0,
  `id_tipo` int(11) UNSIGNED NOT NULL COMMENT 'Pode ser uma primeira consulta ou um retorno, etc.',
  `id_medico` int(11) UNSIGNED NOT NULL,
  `id_clinica` int(11) UNSIGNED NOT NULL,
  `id_paciente` int(11) UNSIGNED NOT NULL,
  `id_categoria` int(11) UNSIGNED NOT NULL COMMENT 'Consulta, exame, procedimento, cirurgia etc.',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `hora_agendada` time NOT NULL,
  `hora_inicial` time DEFAULT '00:00:00',
  `hora_final` time DEFAULT '00:00:00',
  `tempo_atendimento` time NOT NULL DEFAULT '00:00:00',
  `recorrencia` enum('on','off') NOT NULL DEFAULT 'off',
  `recorrencia_periodo` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `recorrencia_limite` date DEFAULT NULL,
  `cor` varchar(25) DEFAULT NULL,
  `criador` int(11) UNSIGNED NOT NULL,
  `lembrete` enum('on','off') NOT NULL DEFAULT 'off',
  `tempo_lembrete` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `periodo_lembrete` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1','A','I','F','R','C') NOT NULL DEFAULT '1' COMMENT '''1'': ''Agendado'';\r\n''A'': ''Aguardando/Em Espera'';\r\n''I'': ''Iniciado'';\r\n''F'': ''Finalizado'';\r\n''R'': ''Remarcado'';\r\n''C'': ''Cancelado'';\r\n''0'': ''Não compareceu''.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de agendamentos de eventos médicos';

--
-- Despejando dados para a tabela `tb_atendimento`
--

INSERT INTO `tb_atendimento` (`id`, `titulo`, `descricao`, `observacao`, `id_parent`, `id_tipo`, `id_medico`, `id_clinica`, `id_paciente`, `id_categoria`, `data`, `hora_agendada`, `hora_inicial`, `hora_final`, `tempo_atendimento`, `recorrencia`, `recorrencia_periodo`, `recorrencia_limite`, `cor`, `criador`, `lembrete`, `tempo_lembrete`, `periodo_lembrete`, `created_at`, `updated_at`, `status`) VALUES
(80, NULL, NULL, '-', NULL, 1, 26, 16, 60, 1, '2023-05-17', '09:00:00', NULL, NULL, '00:00:00', 'off', 0, NULL, NULL, 1, 'off', 0, 0, '2023-05-17 20:45:42', NULL, '1'),
(81, NULL, NULL, '-', NULL, 1, 26, 12, 62, 1, '2023-05-17', '09:00:00', NULL, NULL, '00:00:00', 'off', 0, NULL, NULL, 1, 'off', 0, 0, '2023-05-20 03:06:31', '2023-05-20 03:51:30', 'R');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_atendimento_notas`
--

CREATE TABLE `tb_atendimento_notas` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `id_severidade` int(10) UNSIGNED NOT NULL,
  `id_atendimento` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de notas em atendimentos realizados.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_atendimento_tipo`
--

CREATE TABLE `tb_atendimento_tipo` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro para tipos de atendimentos';

--
-- Despejando dados para a tabela `tb_atendimento_tipo`
--

INSERT INTO `tb_atendimento_tipo` (`id`, `tipo`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Primeira consulta', 'Quando o paciente visita pela primeira vez a clínica e solicita um atendimento.', '2023-01-03 09:19:44', NULL, '1'),
(2, 'Retorno', 'O paciente já foi atendido uma vez, e agora precisa remarcar um novo exame', '2023-01-03 09:19:44', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_banner`
--

CREATE TABLE `tb_banner` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Numero sequencial',
  `titulo` varchar(255) DEFAULT NULL COMMENT 'Título principal do banner.',
  `slug` varchar(255) DEFAULT NULL COMMENT 'Título sem caracteres especiais para identificar o banner.',
  `descricao` text DEFAULT NULL COMMENT 'Texto descritivo do banner',
  `autor` varchar(50) NOT NULL COMMENT 'Autor de criação do banner',
  `ordem` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `publish_up` date NOT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date NOT NULL COMMENT 'Data para parar exibição do banner',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data de criação do banner',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data de criação do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Situação de exibição do banner. 0 - Não exibir; 1 - Exibir.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_banner_descricao`
--

CREATE TABLE `tb_banner_descricao` (
  `id_banner` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_banner_imagem`
--

CREATE TABLE `tb_banner_imagem` (
  `id_banner` int(10) UNSIGNED NOT NULL,
  `id_midia` int(10) UNSIGNED NOT NULL,
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quantidade de clicks/visualizações do banner',
  `url` varchar(255) DEFAULT NULL COMMENT 'Link para artigo',
  `ordem` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `publish_up` date DEFAULT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date DEFAULT NULL COMMENT 'Data para parar exibição do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_banner_imagem_descricao`
--

CREATE TABLE `tb_banner_imagem_descricao` (
  `id_banner` int(10) UNSIGNED NOT NULL,
  `id_midia` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `imagem` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `ordem` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`id`, `id_parent`, `imagem`, `color`, `text_color`, `ordem`, `created_at`, `updated_at`, `status`) VALUES
(1, 0, NULL, '#81c784', '#000000', 0, '2022-11-18 00:02:55', NULL, '1'),
(2, 0, NULL, '#42a5f5', '#000000', 0, '2022-11-18 00:02:59', NULL, '1'),
(3, 0, NULL, '#fff176', '#000000', 0, '2022-11-18 00:03:04', NULL, '1'),
(4, 0, NULL, '#ef9a9a', '#000000', 0, '2022-11-18 00:03:05', NULL, '1'),
(5, 2, NULL, '#42a5f5', NULL, 0, '2022-11-18 00:03:06', NULL, '1'),
(6, 2, NULL, '#42a5f5', NULL, 0, '2022-11-18 00:03:07', NULL, '1'),
(7, 2, NULL, '#42a5f5', NULL, 0, '2022-11-18 00:03:07', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_categoria_descricao`
--

CREATE TABLE `tb_categoria_descricao` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_categoria_descricao`
--

INSERT INTO `tb_categoria_descricao` (`id_categoria`, `id_idioma`, `titulo`, `descricao`, `meta_description`, `meta_title`, `meta_keywords`) VALUES
(1, 1, 'Consulta', '', '', '', ''),
(2, 1, 'Exame', '', '', '', ''),
(3, 1, 'Procedimento', '', '', '', ''),
(4, 1, 'Cirurgia', '', '', '', ''),
(5, 1, 'Laboratório', '', '', '', ''),
(6, 1, 'Imagem', '', '', '', ''),
(7, 1, 'Outros', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(3) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente_email`
--

CREATE TABLE `tb_cliente_email` (
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cliente_telefone`
--

CREATE TABLE `tb_cliente_telefone` (
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `telefone` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_comentario`
--

CREATE TABLE `tb_comentario` (
  `id` int(10) UNSIGNED NOT NULL,
  `autor` varchar(100) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `estrelas` int(11) NOT NULL DEFAULT 5,
  `texto` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data de criação do comentário',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data a última modificação do comentário',
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_convenio`
--

CREATE TABLE `tb_convenio` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_parent` int(11) UNSIGNED DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `flag` varchar(500) NOT NULL,
  `status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de convênios de pacientes.';

--
-- Despejando dados para a tabela `tb_convenio`
--

INSERT INTO `tb_convenio` (`id`, `id_parent`, `descricao`, `codigo`, `flag`, `status`) VALUES
(1, NULL, 'Sem convênio', '0', '', '1'),
(2, NULL, 'Médicus24h', '2', '', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_convenio_planos`
--

CREATE TABLE `tb_convenio_planos` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_convenio` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `flag` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar pacotes de programas';

--
-- Despejando dados para a tabela `tb_convenio_planos`
--

INSERT INTO `tb_convenio_planos` (`id`, `id_convenio`, `descricao`, `flag`, `created_at`, `updated_at`, `status`) VALUES
(1, 2, 'Plano Bronze', 'linear-gradient(to right, #e48425, #ff7f00);', '2023-03-04 01:40:54', NULL, '1'),
(2, 2, 'Plano Silver', 'linear-gradient(to right, #c0c0c0, #ebebeb);', '2023-03-04 01:40:54', NULL, '1'),
(3, 2, 'Plano Gold', 'linear-gradient(to right, #f5d421, #ffd700);', '2023-03-04 01:40:54', NULL, '1'),
(4, 1, 'Particular', 'linear-gradient(to right, #e48425, #ff7f00);', '2023-03-04 01:40:54', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_convenio_planos_servicos`
--

CREATE TABLE `tb_convenio_planos_servicos` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_plano` int(11) UNSIGNED NOT NULL,
  `id_servico` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar serviços';

--
-- Despejando dados para a tabela `tb_convenio_planos_servicos`
--

INSERT INTO `tb_convenio_planos_servicos` (`id`, `id_plano`, `id_servico`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 1, '2023-03-04 01:43:09', NULL, '1'),
(2, 1, 2, '2023-03-04 01:43:09', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_departamento`
--

CREATE TABLE `tb_departamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para vincular médico a várias clínica';

--
-- Despejando dados para a tabela `tb_departamento`
--

INSERT INTO `tb_departamento` (`id`, `titulo`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(8, 'Recepção', NULL, '2022-11-29 07:06:40', NULL, '1'),
(9, 'Pediatria', NULL, '2022-11-29 07:06:50', '2022-12-15 08:55:44', '1'),
(10, 'Bloco cirúrgico', NULL, '2022-11-29 07:07:07', '2023-01-12 02:08:09', '1'),
(11, 'Teste', NULL, '2023-05-16 07:17:29', NULL, '1'),
(12, 'Teste2', NULL, '2023-05-16 07:17:57', NULL, '1'),
(13, 'teste34', NULL, '2023-05-16 07:18:07', '2023-05-16 07:18:18', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_departamento_empresa`
--

CREATE TABLE `tb_departamento_empresa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_departamento_empresa`
--

INSERT INTO `tb_departamento_empresa` (`id`, `id_departamento`, `id_empresa`, `status`) VALUES
(99, 8, 12, '1'),
(100, 10, 13, '1'),
(104, 8, 14, '1'),
(113, 8, 16, '1'),
(114, 10, 17, '1'),
(115, 9, 17, '1'),
(116, 8, 17, '1'),
(120, 10, 16, '1'),
(121, 9, 16, '1'),
(122, 11, 16, '1'),
(123, 12, 16, '1'),
(124, 13, 16, '1'),
(125, 10, 12, '1'),
(126, 9, 12, '1'),
(127, 11, 12, '1'),
(128, 12, 12, '1'),
(129, 13, 12, '1'),
(130, 9, 15, '1'),
(131, 8, 15, '1'),
(132, 11, 15, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidor`
--

CREATE TABLE `tb_distribuidor` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidor_email`
--

CREATE TABLE `tb_distribuidor_email` (
  `id_distribuidor` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_distribuidor_telefone`
--

CREATE TABLE `tb_distribuidor_telefone` (
  `id_distribuidor` int(10) UNSIGNED NOT NULL,
  `telefone` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_email`
--

CREATE TABLE `tb_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_reply` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_empresa`
--

CREATE TABLE `tb_empresa` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Chave primária da tabela.',
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
  `aliquota_imposto` decimal(10,3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT 'Alíquota de imposto da empresa',
  `tributacao` enum('SIMPLES NACIONAL','SN - EXCESSO DE SUB-LIMITE DA RECEITA','REGIME NORMAL') NOT NULL DEFAULT 'SIMPLES NACIONAL' COMMENT 'Tipo de tributação',
  `certificado` blob DEFAULT NULL COMMENT 'Localização do arquivo de certificado digital para emissão de notas fiscais',
  `senha_certificado` varchar(255) DEFAULT NULL COMMENT 'Senha do certificado digital',
  `ambiente` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Tipo do ambiente de emissão de notas fiscais. 0 - Homologação; 1 - Produção',
  `sequence_nfe` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Número da última nota fiscal eletrônica emitida.',
  `sequence_nfce` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Número da última nota fiscal de consumidor emitida.',
  `serie_nfe` int(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 00 COMMENT 'Série da nota fiscal eletrônica.',
  `serie_nfce` int(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 00 COMMENT 'Série da nota fiscal de consumidor.',
  `tokencsc` varchar(6) DEFAULT NULL COMMENT 'Token CSC',
  `csc` varchar(36) DEFAULT NULL COMMENT 'CSC',
  `matriz` enum('S','N') NOT NULL DEFAULT 'N' COMMENT 'Identifica como loja Matriz ou Filial',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de lojas/empresas';

--
-- Despejando dados para a tabela `tb_empresa`
--

INSERT INTO `tb_empresa` (`id`, `titulo`, `nome_fantasia`, `razao_social`, `cnpj`, `inscricao_estadual`, `inscricao_municipal`, `cep`, `logradouro`, `numero`, `bairro`, `complemento`, `cidade`, `uf`, `pais`, `quem_somos`, `quem_somos_imagem`, `distribuidor_imagem`, `contato_imagem`, `telefone`, `celular`, `email`, `facebook`, `instagram`, `youtube`, `linkedin`, `github`, `gmaps`, `aliquota_imposto`, `tributacao`, `certificado`, `senha_certificado`, `ambiente`, `sequence_nfe`, `sequence_nfce`, `serie_nfe`, `serie_nfce`, `tokencsc`, `csc`, `matriz`, `created_at`, `updated_at`, `status`) VALUES
(12, 'Sede', NULL, 'Medicus24h', '06.054.321/0001-07', '123', '1123', '58432-581', 'Rua Corretor José Carlos Fonseca de Oliveira', '100', 'Malvinas', NULL, 'Campina Grande', 'PB', NULL, NULL, 'assets/clinica/img/empresas/0d2129db422147a40316a52c91771d0bd8e66ac4.png', 'assets/clinica/img/empresas/0d2129db422147a40316a52c91771d0bd8e66ac4.png', 'assets/clinica/img/empresas/0d2129db422147a40316a52c91771d0bd8e66ac4.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, '', '2022-11-29 07:06:04', '2023-05-17 17:16:09', '1'),
(13, 'Unidade Bessa', NULL, 'Medicus24h', '12.393.828/1230-12', '19138', '2831', '58432-581', 'Rua Corretor José Carlos Fonseca de Oliveira', '405', 'Malvinas', NULL, 'Campina Grande', 'PB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, '', '2022-12-03 13:27:49', '2023-05-17 17:06:35', '1'),
(14, 'Unidade Manaíra', NULL, 'Medicus24h', '23.434.343/4343-32', '9192', '1921', '58432-581', 'Rua Corretor José Carlos Fonseca de Oliveira', NULL, 'Malvinas', NULL, 'Campina Grande', 'PB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, '', '2022-12-05 08:43:22', '2023-05-17 17:06:43', '1'),
(15, 'Unidade Valentina', NULL, 'Medicus24h', '42.345.612/3445-32', NULL, NULL, '58076-100', 'Rua Ex-Combatente Assis Luís', '100', 'João Paulo II', NULL, 'João Pessoa', 'PB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, '', '2022-12-15 20:43:20', '2023-05-17 19:25:02', '1'),
(16, 'Consultório Particular', NULL, 'Consultório Particular', '00.000.000/0000-00', NULL, NULL, '58000-000', 'Genérico', '00', 'Centro', 'Genérico', 'João Pessoa', 'PB', 'Brasil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, '', '2023-03-30 16:22:15', '2023-05-17 17:15:57', '1'),
(17, '12341', NULL, 'teste1', '12.341.234/1234-00', '999', '999', '58432-581', 'Rua José Carlos Fonseca de Oliveira', '405', '1Malvinas', NULL, 'Campina Grande', 'PB', 'Brasil', NULL, NULL, NULL, NULL, '(99) 9 9999.9999', '(99) 999 999 999', 'alissonguedes87@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '0.000', 'SIMPLES NACIONAL', NULL, NULL, '0', 0, 0, 00, 00, NULL, NULL, '', '2023-05-16 04:35:47', '2023-05-17 17:07:03', '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_especialidade`
--

CREATE TABLE `tb_especialidade` (
  `id` int(10) UNSIGNED NOT NULL,
  `especialidade` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de especialidades médicas';

--
-- Despejando dados para a tabela `tb_especialidade`
--

INSERT INTO `tb_especialidade` (`id`, `especialidade`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Otorrino', 'Médico especializado em tratamento de saúde de nariz, ouvido e garganta.', '2022-11-16 06:29:01', NULL, '1'),
(2, 'Cardiologista', 'Médico que cuida do coração.', '2022-11-16 06:29:01', '2022-11-25 06:33:20', '1'),
(3, 'Neurologista', 'Médico especializado em tratamento de saúde da cabeça e do sistema nervoso.', '2022-11-16 06:29:01', NULL, '1'),
(4, 'Pneumulogista', 'Médico especializado em tratamento de saúde do sistema respiratório.', '2022-11-16 06:29:01', NULL, '1'),
(5, 'Ortopedista', 'Médico especializado em problemas de ossos.', '2022-11-16 07:06:05', NULL, '1'),
(7, 'Psicólogo', NULL, '2022-11-16 08:50:24', NULL, '1'),
(8, 'Endocrinologista', 'Médico que cuida da saúde dos rins.', '2022-11-16 08:50:58', NULL, '1'),
(9, 'Dentista', 'Médico que cuida da saúde dos dentes.', '2022-11-16 09:02:33', NULL, '1'),
(10, 'Clínica médica', NULL, '2022-11-16 09:55:12', NULL, '1'),
(11, 'Geriatria', NULL, '2022-11-16 09:55:53', NULL, '1'),
(12, 'Oftalmologia', NULL, '2022-11-16 09:57:57', NULL, '1'),
(13, 'Medicina do exercício e do esporte', NULL, '2022-11-16 09:58:52', NULL, '1'),
(14, 'Oncologia', NULL, '2022-11-16 10:00:11', NULL, '1'),
(15, 'Dermatologia', NULL, '2022-11-16 10:01:35', NULL, '1'),
(16, 'Urgência e emergência', NULL, '2022-11-16 10:02:19', NULL, '1'),
(17, 'Infectologia', NULL, '2022-11-16 10:02:36', NULL, '1'),
(18, 'Cirurgia', NULL, '2022-11-16 10:03:11', '2023-01-11 16:49:35', '1'),
(19, 'Neurocirurgia', NULL, '2022-11-16 10:03:20', NULL, '1'),
(20, 'Cirurgia geral', NULL, '2022-11-16 10:03:34', '2023-01-11 16:49:31', '1'),
(21, 'Cirurgia plástica', NULL, '2022-11-16 10:03:41', '2023-01-11 16:49:26', '1'),
(22, 'Ortopedia', NULL, '2022-11-16 10:03:55', NULL, '1'),
(23, 'Anestesiologia', 'Médico responsável por aplicação de anestesias.', '2022-11-16 10:04:01', '2023-01-16 12:19:52', '1'),
(33, 'Fisioterapia', NULL, '2023-01-04 10:06:58', '2023-01-11 16:48:54', '1'),
(34, 'Obstetrícia', NULL, '2023-01-04 10:07:15', '2023-01-11 16:48:47', '1'),
(35, 'teste2', NULL, '2023-05-16 07:18:43', '2023-05-16 07:18:49', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_estado_civil`
--

CREATE TABLE `tb_estado_civil` (
  `id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_estado_civil`
--

INSERT INTO `tb_estado_civil` (`id`, `descricao`) VALUES
(1, 'Solteiro'),
(2, 'Casado'),
(3, 'Separado'),
(4, 'Divorciado'),
(5, 'Viúvo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_etnia`
--

CREATE TABLE `tb_etnia` (
  `id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_etnia`
--

INSERT INTO `tb_etnia` (`id`, `descricao`) VALUES
(1, 'Não informado'),
(2, 'Branca'),
(3, 'Preta'),
(4, 'Parda'),
(5, 'Amarela'),
(6, 'Indigena');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_exame`
--

CREATE TABLE `tb_exame` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_categoria` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(11,3) UNSIGNED NOT NULL DEFAULT 0.000,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para cadastro de exames';

--
-- Despejando dados para a tabela `tb_exame`
--

INSERT INTO `tb_exame` (`id`, `id_categoria`, `titulo`, `descricao`, `valor`, `meta_description`, `meta_title`, `meta_keywords`, `created_at`, `updated_at`, `status`) VALUES
(17, 1, 'Nome do exame', 'teste', '100.000', '', '', '', '2023-04-24 21:15:47', '2023-05-16 03:17:53', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_exame_categoria`
--

CREATE TABLE `tb_exame_categoria` (
  `id` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `classificacao` varchar(100) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para cadastro de categorias de exames';

--
-- Despejando dados para a tabela `tb_exame_categoria`
--

INSERT INTO `tb_exame_categoria` (`id`, `titulo`, `descricao`, `classificacao`, `meta_description`, `meta_title`, `meta_keywords`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Não definido', 'Não definido', 'Padrão', 'Não definido', 'Não definido', 'Não definido', '2023-04-19 23:00:35', '2023-04-19 23:01:30', '1'),
(3, 'Novo tipo', 'Teste', 'teste', '', '', '', '2023-05-13 19:11:08', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcao`
--

CREATE TABLE `tb_funcao` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` int(10) UNSIGNED NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de funções';

--
-- Despejando dados para a tabela `tb_funcao`
--

INSERT INTO `tb_funcao` (`id`, `codigo`, `funcao`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Recepcionista', 'Recepcionista', '2022-11-22 19:25:44', NULL, '1'),
(2, 2, 'Médico', 'Médico', '2022-11-22 19:25:44', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

CREATE TABLE `tb_funcionario` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_empresa` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL,
  `id_empresa_departamento` int(10) UNSIGNED NOT NULL,
  `id_funcao` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de funcionários';

--
-- Despejando dados para a tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`id`, `id_empresa`, `id_departamento`, `id_empresa_departamento`, `id_funcao`, `nome`, `cpf`, `rg`, `created_at`, `updated_at`, `status`) VALUES
(20, 12, 8, 99, 1, 'Tito', '393.838.283-23', '338383', '2022-11-29 07:08:22', '2023-05-17 20:11:35', '1'),
(21, 14, 9, 100, 2, 'Efésios', '456.456.999-99', '312341', '2022-12-06 21:15:44', '2023-05-17 20:10:56', '1'),
(22, 13, 10, 122, 1, 'Filipenses', '938.382.838-28', '918141', '2022-12-06 21:18:03', '2023-05-17 20:11:02', '1'),
(25, 13, 10, 100, 2, 'João', '888.888.888-88', '87877', '2022-12-06 21:38:14', '2023-05-17 20:11:21', '1'),
(26, 15, 8, 113, 2, 'Alisson Guedes Pereira1', '555.555.555-55', '3177241', '2022-12-10 17:58:12', '2023-05-17 20:10:40', '1'),
(30, 13, 10, 122, 2, 'Jó', '982.838.344-12', '31438841', '2023-05-17 18:59:56', '2023-05-17 20:11:08', '1'),
(31, 16, 10, 0, 2, 'Rute', '069.429.248-12', '13948141', '2023-05-17 19:21:16', '2023-05-17 20:11:30', '1'),
(32, 13, 10, 0, 2, 'Maria', '1', '2', '2023-05-17 19:53:05', '2023-05-17 20:10:33', '1'),
(33, 13, 10, 0, 2, 'Marta', '2', '1', '2023-05-17 19:55:29', '2023-05-17 20:10:16', '1'),
(34, 13, 10, 0, 2, 'Paulo', '3', '3', '2023-05-17 19:56:15', '2023-05-17 20:10:47', '1'),
(35, 16, 10, 0, 2, 'Teste', '123.4', '1234', '2023-05-17 20:29:54', NULL, '1'),
(36, 16, 10, 0, 2, 'Teste', '123.43', '12343', '2023-05-17 20:32:29', '2023-05-17 20:32:39', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_galeria`
--

CREATE TABLE `tb_galeria` (
  `id` int(10) UNSIGNED NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `publish_up` date NOT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date NOT NULL COMMENT 'Data para parar exibição do banner',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_galeria_descricao`
--

CREATE TABLE `tb_galeria_descricao` (
  `id_galeria` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_galeria_imagem`
--

CREATE TABLE `tb_galeria_imagem` (
  `id_galeria` int(10) UNSIGNED NOT NULL,
  `id_midia` int(10) UNSIGNED NOT NULL,
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `url` varchar(255) DEFAULT NULL,
  `ordem` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `publish_up` date NOT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date NOT NULL COMMENT 'Data para parar exibição do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT 'Situação de exibição do banner. 0 - Não exibir; 1 - Exibir.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_lead`
--

CREATE TABLE `tb_lead` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_produto` int(10) UNSIGNED NOT NULL,
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_link`
--

CREATE TABLE `tb_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target` varchar(6) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de adição de links rápidos do site';

--
-- Despejando dados para a tabela `tb_link`
--

INSERT INTO `tb_link` (`id`, `titulo`, `descricao`, `slug`, `link`, `target`, `imagem`, `created_at`, `updated_at`, `status`) VALUES
(1, '4', '', '', NULL, NULL, NULL, '2022-07-01 11:27:42', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_link_descricao`
--

CREATE TABLE `tb_link_descricao` (
  `id_link` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_medico`
--

CREATE TABLE `tb_medico` (
  `id_funcionario` int(11) UNSIGNED NOT NULL,
  `id_especialidade` int(10) UNSIGNED NOT NULL,
  `crm` varchar(14) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de atendimentos realizados.';

--
-- Despejando dados para a tabela `tb_medico`
--

INSERT INTO `tb_medico` (`id_funcionario`, `id_especialidade`, `crm`, `created_at`, `updated_at`, `status`) VALUES
(21, 18, '123', '2023-05-17 17:07:55', '2023-05-17 21:02:23', '1'),
(25, 2, '5456654644', '2022-12-21 05:26:55', '2023-05-17 20:11:21', '1'),
(26, 2, '1', '2022-12-16 00:24:01', '2023-05-19 18:39:42', '1'),
(30, 20, '551556', '2023-05-17 19:08:51', '2023-05-17 20:11:08', '1'),
(31, 18, '455455', '2023-05-17 19:21:16', '2023-05-17 20:11:30', '1'),
(32, 0, '4', '2023-05-17 20:09:29', '2023-05-17 20:10:33', '1'),
(33, 2, '3', '2023-05-17 19:55:29', '2023-05-17 20:10:16', '1'),
(34, 23, '2', '2023-05-17 19:56:15', '2023-05-17 20:10:47', '1'),
(36, 0, '1234', '2023-05-17 20:32:29', '2023-05-17 20:32:39', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_medico_agenda`
--

CREATE TABLE `tb_medico_agenda` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_medico_clinica` int(10) UNSIGNED NOT NULL,
  `dia` tinyint(3) UNSIGNED NOT NULL COMMENT '0 - domingo,\r\n1 - segunda,\r\n2 - terça,\r\n3 - quarta,\r\n4 - quinta,\r\n5 - sexta,\r\n6 - sábado',
  `semana` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `mes` tinyint(2) UNSIGNED ZEROFILL NOT NULL DEFAULT 00,
  `ano` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000,
  `titulo` varchar(200) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `atende` enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'O médico pode determinar o campo como inativo durante este horário. Se ele atende ou não. Caso ele não atenda, ele pode definir como horário de almoço, por exemplo. Este campo é apenas um controle interno para o recepcionista visualizar.',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de dias de atendimentos da agenda médica';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_medico_agenda_horario`
--

CREATE TABLE `tb_medico_agenda_horario` (
  `id_agenda` int(10) UNSIGNED NOT NULL,
  `hora_inicial` time NOT NULL DEFAULT '00:00:00',
  `hora_final` time NOT NULL DEFAULT '00:00:00',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de cadastro de horários de atendimentos da agenda médica';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_medico_clinica`
--

CREATE TABLE `tb_medico_clinica` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_medico` int(11) UNSIGNED NOT NULL,
  `id_empresa` int(11) UNSIGNED NOT NULL,
  `id_empresa_departamento` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para vincular médico a várias clínica';

--
-- Despejando dados para a tabela `tb_medico_clinica`
--

INSERT INTO `tb_medico_clinica` (`id`, `id_medico`, `id_empresa`, `id_empresa_departamento`, `created_at`, `updated_at`, `status`) VALUES
(85, 26, 16, 0, '2023-05-17 20:26:52', NULL, '1'),
(86, 21, 13, 0, '2023-05-17 20:55:04', NULL, '1'),
(87, 26, 12, 0, '2023-05-19 18:39:42', NULL, '1'),
(88, 26, 14, 0, '2023-05-19 18:39:42', NULL, '1'),
(89, 26, 15, 0, '2023-05-19 18:39:42', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_medico_especialidade`
--

CREATE TABLE `tb_medico_especialidade` (
  `id_funcionario` int(11) UNSIGNED NOT NULL COMMENT 'chave primária referente à tabela `tb_medico`.`id_funcionario`',
  `id_especialidade` int(11) UNSIGNED NOT NULL COMMENT 'chave primária referente à tabela `tb_especialidade`.`id`',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de atribuições de especialidades a médicos';

--
-- Despejando dados para a tabela `tb_medico_especialidade`
--

INSERT INTO `tb_medico_especialidade` (`id_funcionario`, `id_especialidade`, `created_at`, `updated_at`) VALUES
(21, 2, '2023-05-17 20:10:56', NULL),
(25, 2, '2023-05-17 20:11:14', '2023-05-17 20:11:21'),
(26, 14, '2023-05-17 20:10:40', NULL),
(30, 20, '2023-05-17 20:11:08', NULL),
(31, 18, '2023-05-17 20:11:30', NULL),
(32, 23, '2023-05-17 20:10:33', NULL),
(33, 2, '2023-05-17 20:10:16', NULL),
(34, 23, '2023-05-17 20:10:47', NULL),
(36, 8, '2023-05-17 20:32:29', '2023-05-17 20:32:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_midia`
--

CREATE TABLE `tb_midia` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tamanho da imagem do banner',
  `mime_type` varchar(45) DEFAULT NULL,
  `path` varchar(255) NOT NULL COMMENT 'Data de criação do banner',
  `descricao` varchar(500) DEFAULT NULL,
  `clicks` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Quantidade de clicks/visualizações do banner',
  `url` varchar(255) DEFAULT NULL COMMENT 'Link para artigo',
  `ordem` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Ordem para listagem do banner',
  `autor` varchar(45) NOT NULL DEFAULT 'none',
  `publish_up` date DEFAULT NULL COMMENT 'Data para exibição do banner',
  `publish_down` date DEFAULT NULL COMMENT 'Data para parar exibição do banner',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `tags` text DEFAULT NULL COMMENT 'Tags de pesquisa do banner',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_midia_descricao`
--

CREATE TABLE `tb_midia_descricao` (
  `id_midia` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente`
--

CREATE TABLE `tb_paciente` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `codigo` varchar(11) NOT NULL,
  `associado` enum('yes','no') NOT NULL DEFAULT 'no',
  `id_convenio` int(11) UNSIGNED DEFAULT NULL,
  `id_tipo_convenio` int(11) UNSIGNED DEFAULT NULL,
  `matricula` char(18) NOT NULL,
  `id_acomodacao` int(11) UNSIGNED DEFAULT NULL,
  `validade` char(7) DEFAULT NULL,
  `id_estado_civil` int(10) UNSIGNED NOT NULL,
  `id_etnia` int(10) UNSIGNED NOT NULL DEFAULT 6,
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
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_paciente`
--

INSERT INTO `tb_paciente` (`id`, `nome`, `imagem`, `codigo`, `associado`, `id_convenio`, `id_tipo_convenio`, `matricula`, `id_acomodacao`, `validade`, `id_estado_civil`, `id_etnia`, `sexo`, `data_nascimento`, `cpf`, `rg`, `cns`, `mae`, `pai`, `profissao`, `observacoes`, `notas_gerais`, `notas_alergias`, `notas_clinicas`, `logradouro`, `numero`, `complemento`, `cep`, `cidade`, `bairro`, `uf`, `pais`, `email`, `telefone`, `celular`, `created_at`, `updated_at`, `receber_sms`, `receber_email`, `receber_notificacoes`, `obito`, `datahora_obito`, `status`) VALUES
(18, 'Benjamin', NULL, 'P-165885', 'no', NULL, NULL, '0', NULL, NULL, 2, 2, 'M', '2022-05-06', '123', '1234', '1234', 'teste', 'teste', NULL, NULL, NULL, NULL, 'teste', '1234', '100', 'asdf', '58076-100', 'asdf', 'asdf', 'asdf', 'asdf', NULL, '(12) 3412.3412', '(12) 3 4123.4123', '2022-11-13 00:08:25', '2022-11-15 04:20:05', 'off', 'off', 'off', '0', NULL, '0'),
(19, 'Alisson Guedes Pereira', NULL, 'P-598909', 'no', NULL, NULL, '0', NULL, NULL, 2, 2, 'M', '1987-01-18', '069.422.924-51', '12341234', '1234123412', 'Terezinha de Fátima Guedes Pereira', 'Alexandre Pereira Clementino', NULL, NULL, NULL, NULL, 'Teste', 'Rua Ex-Combatente Assis Luis', '100', 'AP 401 F', '58076-100', 'João Pessoa', 'Geisel', 'PB', 'Brasil', 'alissonguedes87@gmail.com', '(83) 3339.4800', '(83) 9 8811.2444', '2022-11-13 00:22:00', '2023-01-13 10:06:40', 'off', 'off', 'off', '0', NULL, '0'),
(20, 'Alisson Guedes Pereira', NULL, 'P-233594', 'no', NULL, NULL, '0', NULL, NULL, 1, 2, 'M', '1987-01-18', '069.422.924-51', '12341234', '1234123412', 'Terezinha de Fátima Guedes Pereira', 'Alexandre Pereira Clementino', NULL, NULL, NULL, NULL, 'Teste', 'Rua Ex-Combatente Assis Luis', '100', 'AP 401 F', '58076-100', 'João Pessoa', 'Geisel', 'PB', 'Brasil', 'alissonguedes87@gmail.com', '(83) 3339.4801', '(83) 9 8811.2444', '2022-11-13 00:23:18', '2022-11-13 12:24:16', 'off', 'off', 'off', '0', NULL, '1'),
(21, 'Alisson Guedes Pereira', NULL, 'P-921710', 'no', NULL, NULL, '0', NULL, NULL, 1, 2, NULL, '1987-01-18', '069.422.924-51', '12341234', '1234123412', 'Terezinha de Fátima Guedes Pereira', 'Alexandre Pereira Clementino', NULL, NULL, NULL, NULL, 'Teste', 'Rua Ex-Combatente Assis Luis', '100', 'AP 401 F', '58076-100', 'João Pessoa', 'Geisel', 'PB', 'Brasil', 'alissonguedes87@gmail.com', '(83) 3339.4802', '(83) 9 8811.2444', '2022-11-13 00:24:23', '2022-11-13 12:15:19', 'off', 'off', 'off', '0', NULL, '1'),
(26, 'alisson', NULL, 'P-924140', 'no', 2, NULL, '0', NULL, NULL, 2, 3, 'M', '1987-01-18', '123.412.341-23', '1234123', '1234123421', 'teste', 'teste', NULL, NULL, NULL, NULL, 'teste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(83) 9881.1124', '(12) 341 234 123', '2022-11-13 11:52:45', '2023-03-07 18:58:23', 'off', 'off', 'off', '0', NULL, '1'),
(27, 'teste1234', NULL, 'P-803633', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', '2022-11-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 11:55:35', NULL, 'off', 'off', 'off', '0', NULL, '0'),
(28, 'Chris', NULL, 'P-312079', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'F', '1988-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 11:56:21', '2022-11-14 16:01:45', 'off', 'off', 'off', '0', NULL, '1'),
(29, 'teste', NULL, 'P-984646', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, '2022-11-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 12:03:39', '2022-12-29 17:34:20', 'off', 'off', 'off', '0', NULL, '1'),
(30, 'Teste 1', NULL, 'P-733972', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 12:04:34', '2022-11-14 16:02:46', 'off', 'off', 'off', '0', NULL, '1'),
(31, 'Alane Guedes Pereira', NULL, '0000000', 'yes', 2, 1, '0000000', 2, '2024-01', 1, 2, 'F', '1983-11-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(83) 9 8811.2145', NULL, '2022-11-13 12:05:47', '2023-03-07 23:28:43', 'off', 'off', 'off', '0', NULL, '1'),
(32, 'teste', 'assets/clinica/img/pacientes/0f21269a0d97473fc20baca1b1611859297e94e1.png', 'P-937843', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 12:20:54', '2023-01-13 11:00:35', 'off', 'off', 'off', '1', NULL, '0'),
(33, 'Benjamin Leite Pereira', 'assets/clinica/img/pacientes/53f80ff7e7f9cec85406d4605912c3f94367be9b.jpg', 'P-991190', 'no', NULL, NULL, '0', NULL, NULL, 1, 2, 'M', '2022-05-06', '181.486.154-89', '12341234', '1234123412341234', 'Chrislaine Barboza Leite', 'Alisson Guedes Pereira', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(83) 9 8811.2444', '(83) 988 112 444', '2022-11-13 12:23:40', '2023-01-15 10:09:22', 'off', 'off', 'off', '0', NULL, '1'),
(34, 'teste', NULL, 'P-779749', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 03:22:28', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(35, 'Novo cliente', NULL, 'P-421395', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 04:41:52', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(36, 'Teste 2', NULL, 'P-910774', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 09:58:55', '2022-11-14 15:04:03', 'off', 'off', 'off', '0', NULL, '1'),
(37, 'Aline', NULL, 'P-946492', 'yes', NULL, NULL, '348 762 125080 552', NULL, '2030-03', 1, 1, 'F', NULL, NULL, '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Rua Corretor José Carlos Fonseca de Oliveira', '123', NULL, '58432-581', 'Campina Grande', 'Malvinas', 'PB', NULL, NULL, NULL, NULL, '2022-11-14 11:54:37', '2023-02-08 21:41:03', 'off', 'off', 'off', '0', NULL, '1'),
(38, 'Maria da Penha', NULL, 'P-733005', 'no', NULL, NULL, '0', NULL, NULL, 2, 1, 'F', '1969-11-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-15 05:29:07', '2022-11-15 08:29:25', 'off', 'off', 'off', '0', NULL, '1'),
(39, 'Antônio Pereira da Costa', 'assets/clinica/img/pacientes/ca5cd22af6ef13b27da8d7efef3382003b90acf4.png', 'P-181855', 'no', NULL, NULL, '0', NULL, NULL, 2, 2, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-20 22:22:36', '2022-12-22 03:55:10', 'off', 'off', 'off', '0', NULL, '1'),
(40, 'teste', NULL, 'P-516317', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-26 20:51:44', '2022-12-26 23:52:12', 'off', 'off', 'off', '0', NULL, '1'),
(41, 'Ednilton Lucio de Souza Lordes', NULL, 'P-251041', 'no', NULL, NULL, '0', NULL, NULL, 2, 5, 'M', '1974-09-21', '07173919738', '1207293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '228', NULL, '58043070', 'Joao Pessoa', 'Miramar', 'PB', 'bRASIL', 'ednilton.souza@hotmail.com', '11979643692', '11979643692', '2023-01-05 00:40:02', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(42, 'Alisson Guedes Pereira', 'assets/clinica/img/pacientes/e81034601d4f9f23d2bf4a1b879ec00efa1f5928.png', 'P-338789', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-13 00:44:17', '2023-01-13 10:06:54', 'off', 'off', 'off', '0', NULL, '0'),
(43, 'Zefinha', NULL, 'P-396842', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ze@ze.com', '(83) 9 8811.2444', '(83) 988', '2023-01-13 00:52:30', '2023-01-24 07:56:06', 'off', 'off', 'off', '1', '2023-01-20 01:55:00', '0'),
(44, 'bruno', NULL, 'P-913302', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', NULL, NULL, '2023-01-13 00:53:49', '2023-01-21 03:12:43', 'off', 'off', 'off', '1', '2023-01-18 09:00:00', '0'),
(45, 'Carlos', NULL, 'P-586960', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', NULL, '123', '2023-01-13 00:55:36', '2023-01-13 10:07:23', 'off', 'off', 'off', '1', NULL, '0'),
(46, 'alisson', NULL, 'P-390743', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '83988112444', NULL, '2023-01-13 00:56:37', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(47, 'alisson', NULL, 'P-874552', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '83988112444', NULL, '2023-01-13 00:56:48', '2023-01-13 10:05:43', 'off', 'off', 'off', '0', NULL, '0'),
(48, 'alisson', NULL, 'P-620412', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', NULL, '1234', '2023-01-13 00:57:03', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(49, 'alisson', NULL, 'P-725576', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', NULL, '1234', '2023-01-13 00:57:22', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(50, 'alisson', NULL, 'P-158802', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', NULL, '(12) 341 231 231', '2023-01-13 00:58:23', '2023-01-15 09:41:35', 'off', 'off', 'off', '0', NULL, '1'),
(51, 'Cristiana', NULL, 'P-306125', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '83988112444', NULL, '2023-01-13 00:59:00', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(52, 'Terezinha de fatima guedes pereira', NULL, 'P-706083', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(83) 9 8811.2444', NULL, '2023-01-13 00:59:44', '2023-01-21 05:07:04', 'off', 'off', 'off', '0', NULL, '1'),
(53, 'Alisson Guedes Pereira', NULL, 'P-799103', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '83988112444', NULL, '2023-01-13 01:00:00', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(54, 'Alexandre Pereira Clementino', NULL, 'P-463405', 'yes', NULL, NULL, '712 734 667722 436', NULL, '2039-03', 1, 1, NULL, '2023-02-02', '121.341.234-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58432-581', '2022-01-01', NULL, NULL, NULL, 'alexandre@gmail.com', '(83) 9 8811.2444', '(83) 988 112 444', '2023-01-13 01:02:17', '2023-02-08 10:29:00', 'off', 'off', 'off', '0', NULL, '0'),
(55, 'ANA MARIA ALVES DE SOUZA', NULL, 'P-258021', 'no', NULL, NULL, '0', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'am69529@gmail.com', NULL, '1', '2023-01-13 02:44:08', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(60, 'Alane G. Pereira', NULL, '', 'yes', 2, 3, '394 469 490254 480', 2, '2026-04', 1, 2, 'F', '1983-11-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(12) 3 1231.2312', NULL, '2023-02-28 16:36:17', '2023-05-16 07:45:38', 'off', 'off', 'off', '0', NULL, '1'),
(61, 'Alane', NULL, '655 559 588', 'yes', 2, 1, '', 2, '2026-02', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(12) 3 4123.4123', NULL, '2023-02-28 16:36:59', '2023-03-07 19:07:25', 'off', 'off', 'off', '0', NULL, '1'),
(62, 'Alane', NULL, '', 'no', 2, NULL, '', NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 16:37:21', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(63, 'Alane', NULL, '', 'no', 2, NULL, '', NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-28 16:38:19', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(64, 'asdfasdfasdfasdfasdf', NULL, '', 'no', 2, NULL, '918 498 994737 515', NULL, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdfasdfasdf@gmail', '(12) 3 1231.2312', NULL, '2023-03-02 06:38:49', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(65, 'ffffff', NULL, '', 'no', 2, NULL, '342 162 303489 913', NULL, NULL, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(12) 3', NULL, '2023-03-02 06:40:06', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(66, 'teste', NULL, '', 'yes', 2, 3, '541 654 000147 678', 2, '2026-02', 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(12) 3 1231.2312', NULL, '2023-03-02 06:40:26', '2023-03-07 03:11:38', 'off', 'off', 'off', '0', NULL, '1'),
(67, 'Miquéias', NULL, '', 'no', 2, NULL, '', NULL, NULL, 1, 2, 'M', NULL, '383.838.383-83', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(83) 9 8888.8888', NULL, '2023-03-06 17:39:04', '2023-03-06 17:49:37', 'off', 'off', 'off', '0', NULL, '1'),
(68, 'Data de nascimento', NULL, '', 'no', 2, NULL, '211 661 270846 516', NULL, NULL, 2, 2, 'M', '1969-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(12) 3 1231.2312', NULL, '2023-03-07 18:59:22', NULL, 'off', 'off', 'off', '0', NULL, '1'),
(69, 'Data de nascimento 2', NULL, 'P-470473', 'no', 2, NULL, '746 366 386856 185', NULL, NULL, 3, 3, NULL, '2023-03-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alissonguedes87@gmail.com', '(12) 3 1231.2312', NULL, '2023-03-07 19:01:27', '2023-03-07 19:04:31', 'off', 'off', 'off', '0', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente_convenio`
--

CREATE TABLE `tb_paciente_convenio` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_paciente` int(11) UNSIGNED NOT NULL,
  `id_convenio` int(11) UNSIGNED NOT NULL,
  `id_tipo` int(11) UNSIGNED NOT NULL,
  `id_acomodacao` int(11) UNSIGNED NOT NULL,
  `matricula` char(18) NOT NULL,
  `validade_ano` int(4) UNSIGNED ZEROFILL NOT NULL,
  `validade_mes` int(2) UNSIGNED ZEROFILL NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_paciente_convenio`
--

INSERT INTO `tb_paciente_convenio` (`id`, `id_paciente`, `id_convenio`, `id_tipo`, `id_acomodacao`, `matricula`, `validade_ano`, `validade_mes`, `created_at`, `updated_at`, `status`) VALUES
(57, 31, 1, 4, 3, '455 710 689001 737', 2024, 01, '2023-02-17 09:01:03', '2023-02-17 09:05:47', '1'),
(59, 31, 1, 4, 1, '881 591 586490 015', 2025, 06, '2023-02-17 22:16:12', NULL, '1'),
(60, 60, 1, 4, 2, '123', 2026, 04, '2023-02-28 16:54:04', NULL, '0'),
(61, 67, 1, 4, 2, '12838841', 2026, 04, '2023-03-06 17:47:51', NULL, '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente_homecare`
--

CREATE TABLE `tb_paciente_homecare` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_paciente` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_paciente_homecare`
--

INSERT INTO `tb_paciente_homecare` (`id`, `id_paciente`, `created_at`, `updated_at`, `status`) VALUES
(1, 31, '2023-02-28 21:14:37', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente_nota`
--

CREATE TABLE `tb_paciente_nota` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_paciente` int(10) UNSIGNED NOT NULL,
  `id_severidade` int(10) UNSIGNED NOT NULL,
  `descricao` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente_programa`
--

CREATE TABLE `tb_paciente_programa` (
  `id_paciente` int(11) UNSIGNED NOT NULL,
  `id_programa` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Data de inserção do paciente no programa',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Data de saída do paciente do programa',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 - Zero quando o paciente for excluído do programa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para vincular paciente a um programa';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente_tarefas`
--

CREATE TABLE `tb_paciente_tarefas` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_paciente` int(11) UNSIGNED NOT NULL COMMENT 'Chave estrangeira referente à tabela `tb_paciente_homecare`, coluna ID.',
  `titulo` varchar(1000) NOT NULL,
  `descricao` text NOT NULL,
  `agendamento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_responsavel` int(11) UNSIGNED NOT NULL,
  `datahora_notificacao` timestamp NULL DEFAULT NULL,
  `recorrencia` enum('on','off') NOT NULL DEFAULT 'off',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `finalizada` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_paciente_tarefas_anotacoes`
--

CREATE TABLE `tb_paciente_tarefas_anotacoes` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_responsavel` int(11) UNSIGNED NOT NULL COMMENT 'Chave estrangeira da tabela referente à tabela de profissional responsável pelo atendimento.',
  `id_tarefa` int(11) UNSIGNED NOT NULL COMMENT 'Chave estrangeira da tabela referente à tabela tb_paciente_homecare_tarefa, coluna ID.',
  `descricao` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_post`
--

CREATE TABLE `tb_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_controller` int(10) UNSIGNED NOT NULL,
  `id_parent` int(10) UNSIGNED DEFAULT 0,
  `permissao` smallint(5) UNSIGNED NOT NULL DEFAULT 1111,
  `tipo` varchar(20) NOT NULL DEFAULT 'post' COMMENT 'Informa o tipo de página: Página simples ou galeria de fotos',
  `autor` varchar(45) DEFAULT NULL,
  `arquivo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_post`
--

INSERT INTO `tb_post` (`id`, `id_controller`, `id_parent`, `permissao`, `tipo`, `autor`, `arquivo`, `imagem`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 0, 1111, 'post', NULL, NULL, NULL, '2022-07-01 11:28:05', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_post_descricao`
--

CREATE TABLE `tb_post_descricao` (
  `id_post` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `subtitulo` varchar(45) DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `meta_description` varchar(45) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `meta_title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_post_link`
--

CREATE TABLE `tb_post_link` (
  `id_post` int(10) UNSIGNED NOT NULL,
  `id_link` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para vincluar um link a uma página';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_post_midia`
--

CREATE TABLE `tb_post_midia` (
  `id_pagina` int(10) UNSIGNED NOT NULL,
  `id_midia` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_distribuidor` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `modo_uso` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `valor` decimal(10,3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto_categoria`
--

CREATE TABLE `tb_produto_categoria` (
  `id_produto` int(10) UNSIGNED NOT NULL,
  `id_categoria` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto_descricao`
--

CREATE TABLE `tb_produto_descricao` (
  `id_produto` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produto_imagem`
--

CREATE TABLE `tb_produto_imagem` (
  `id_produto` int(10) UNSIGNED NOT NULL,
  `id_midia` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_programas`
--

CREATE TABLE `tb_programas` (
  `id` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `publico` enum('A','H','M') NOT NULL DEFAULT 'A' COMMENT 'Público alvo para quem é destinado o programa. H: Homens; M: Mulheres; A: Ambos (a todos)',
  `idade_min` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT 'Faixa etária para limitar a idade dos beneficiados. 000: Sem restrição',
  `idade_max` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000999 COMMENT 'Faixa etária para limitar a idade dos beneficiados. 999: Sem restrição',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar programas médicos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_servicos`
--

CREATE TABLE `tb_servicos` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_parent` int(11) UNSIGNED DEFAULT NULL,
  `descricao` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela para adicionar serviços';

--
-- Despejando dados para a tabela `tb_servicos`
--

INSERT INTO `tb_servicos` (`id`, `id_parent`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, NULL, 'Assistência telemedicina 24h', '2023-03-04 01:49:09', NULL, '1'),
(2, NULL, 'Descontos em parceiros (farmácias, clínicas de estética, óticas)', '2023-03-04 01:49:09', NULL, '1'),
(3, NULL, 'Descontos em consultório e clinicas credenciadas', '2023-03-04 01:50:07', NULL, '1'),
(4, NULL, 'Atendimento odontológico 24h', '2023-03-04 01:50:07', NULL, '1'),
(5, NULL, 'Duas remoções ao ano', '2023-03-04 01:50:20', NULL, '1'),
(6, NULL, 'Urgência e Emergência em Traumatologia com (consulta + raio-x + imobilização) tudo incluso anualmente', '2023-03-04 01:52:50', NULL, '1'),
(7, NULL, 'Consultas na clínica Médicus e urgência com ponto de atendimento', '2023-03-04 01:52:50', NULL, '1'),
(8, NULL, 'Atendimento de urgência e emergência odontológico 24h', '2023-03-04 01:53:00', NULL, '1'),
(9, NULL, 'Assistência domiciliar 24h com a equipe de enfermagem e médico inclusos', '2023-03-04 01:53:16', NULL, '1'),
(10, NULL, 'Descontos em consultório e clinicas credenciadas\r\n', '2023-03-04 01:53:25', NULL, '1'),
(12, NULL, 'Exames Cardiológicos', '2023-03-04 01:57:56', NULL, '1'),
(13, 12, 'Eletrocardiograma', '2023-03-04 01:58:45', NULL, '1'),
(17, 12, 'Mapa', '2023-03-04 01:59:50', NULL, '1'),
(18, 12, 'Holter', '2023-03-04 01:59:50', NULL, '1'),
(19, 12, 'Troponina', '2023-03-04 01:59:50', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_severidade_nota`
--

CREATE TABLE `tb_severidade_nota` (
  `id` int(10) UNSIGNED NOT NULL,
  `descricao` text NOT NULL,
  `color` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_acomodacao`
--
ALTER TABLE `tb_acomodacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_agenda`
--
ALTER TABLE `tb_agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_agenda_id_medico` (`id_medico`),
  ADD KEY `horario_atendimento_UNIQUE` (`dia`,`mes`,`ano`,`hora_inicial`,`hora_final`) USING BTREE;

--
-- Índices de tabela `tb_atendimento`
--
ALTER TABLE `tb_atendimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_agendamento_id_categoria` (`id_categoria`),
  ADD KEY `fk_tb_agendamento_id_medico` (`id_medico`),
  ADD KEY `fk_tb_agendamento_id_paciente` (`id_paciente`),
  ADD KEY `fk_tb_agendamento_id_tipo` (`id_tipo`),
  ADD KEY `fk_tb_agendamento_id_usuario` (`criador`),
  ADD KEY `id_clinica` (`id_clinica`);

--
-- Índices de tabela `tb_atendimento_notas`
--
ALTER TABLE `tb_atendimento_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_atendimento_id_severidade` (`id_severidade`),
  ADD KEY `fk_tb_atendimento_id_atendimento` (`id_atendimento`),
  ADD KEY `fk_tb_atendimento_id_usuario` (`id_usuario`);

--
-- Índices de tabela `tb_atendimento_tipo`
--
ALTER TABLE `tb_atendimento_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_banner`
--
ALTER TABLE `tb_banner`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_banner_descricao`
--
ALTER TABLE `tb_banner_descricao`
  ADD PRIMARY KEY (`id_banner`,`id_idioma`),
  ADD KEY `fk_tb_banner_descricao_tb_banner1_idx` (`id_banner`),
  ADD KEY `fk_tb_banner_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_banner_imagem`
--
ALTER TABLE `tb_banner_imagem`
  ADD PRIMARY KEY (`id_banner`,`id_midia`),
  ADD UNIQUE KEY `id_banner_UNIQUE` (`id_banner`),
  ADD UNIQUE KEY `id_midia_UNIQUE` (`id_midia`),
  ADD KEY `fk_tb_banner_imagem_tb_banner1_idx` (`id_banner`),
  ADD KEY `fk_tb_banner_imagem_tb_midia1_idx` (`id_midia`);

--
-- Índices de tabela `tb_banner_imagem_descricao`
--
ALTER TABLE `tb_banner_imagem_descricao`
  ADD PRIMARY KEY (`id_banner`,`id_midia`,`id_idioma`),
  ADD KEY `fk_tb_banner_imagem_descricao_tb_sys_idioma1_idx` (`id_idioma`),
  ADD KEY `fk_tb_banner_imagem_descricao_tb_banner_imagem1_idx` (`id_banner`,`id_midia`);

--
-- Índices de tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_categoria_descricao`
--
ALTER TABLE `tb_categoria_descricao`
  ADD PRIMARY KEY (`id_categoria`,`id_idioma`),
  ADD UNIQUE KEY `titulo_UNIQUE` (`titulo`),
  ADD KEY `fk_tb_categoria_descricao_tb_categoria1_idx` (`id_categoria`),
  ADD KEY `fk_tb_categoria_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_cliente_email`
--
ALTER TABLE `tb_cliente_email`
  ADD PRIMARY KEY (`id_cliente`,`email`),
  ADD KEY `tb_cliente_email_id_cliente` (`id_cliente`);

--
-- Índices de tabela `tb_cliente_telefone`
--
ALTER TABLE `tb_cliente_telefone`
  ADD PRIMARY KEY (`id_cliente`,`telefone`),
  ADD KEY `tb_cliente_telefone_id_cliente` (`id_cliente`);

--
-- Índices de tabela `tb_comentario`
--
ALTER TABLE `tb_comentario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_convenio_id_parent` (`id_parent`);

--
-- Índices de tabela `tb_convenio_planos`
--
ALTER TABLE `tb_convenio_planos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_convenio_planos_id_convenio` (`id_convenio`);

--
-- Índices de tabela `tb_convenio_planos_servicos`
--
ALTER TABLE `tb_convenio_planos_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_convenio_planos_servicos_id_plano` (`id_plano`);

--
-- Índices de tabela `tb_departamento`
--
ALTER TABLE `tb_departamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_departamento_empresa`
--
ALTER TABLE `tb_departamento_empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_empresa_departamento` (`id_departamento`,`id_empresa`),
  ADD KEY `fk_tb_departamento_id_empresa` (`id_empresa`);

--
-- Índices de tabela `tb_distribuidor`
--
ALTER TABLE `tb_distribuidor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_distribuidor_email`
--
ALTER TABLE `tb_distribuidor_email`
  ADD PRIMARY KEY (`id_distribuidor`,`email`),
  ADD KEY `fk_tb_distribuidor_email_id_distribuidor` (`id_distribuidor`);

--
-- Índices de tabela `tb_distribuidor_telefone`
--
ALTER TABLE `tb_distribuidor_telefone`
  ADD PRIMARY KEY (`id_distribuidor`,`telefone`),
  ADD KEY `fk_tb_distribuidor_telefone_id_distribuidor` (`id_distribuidor`);

--
-- Índices de tabela `tb_email`
--
ALTER TABLE `tb_email`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `tb_especialidade`
--
ALTER TABLE `tb_especialidade`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_estado_civil`
--
ALTER TABLE `tb_estado_civil`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_etnia`
--
ALTER TABLE `tb_etnia`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_exame`
--
ALTER TABLE `tb_exame`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo` (`titulo`),
  ADD KEY `fk_tb_exame_id_categoria` (`id_categoria`);

--
-- Índices de tabela `tb_exame_categoria`
--
ALTER TABLE `tb_exame_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo` (`titulo`);

--
-- Índices de tabela `tb_funcao`
--
ALTER TABLE `tb_funcao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD KEY `fk_tb_funcionario_id_empresa_departamento` (`id_empresa_departamento`),
  ADD KEY `fk_tb_funcionario_id_funcao` (`id_funcao`),
  ADD KEY `fk_tb_funcionario_tb_departamento1_idx` (`id_departamento`),
  ADD KEY `fk_tb_funcionario_tb_empresa1_idx` (`id_empresa`);

--
-- Índices de tabela `tb_galeria`
--
ALTER TABLE `tb_galeria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_galeria_descricao`
--
ALTER TABLE `tb_galeria_descricao`
  ADD PRIMARY KEY (`id_galeria`,`id_idioma`),
  ADD KEY `fk_tb_galeria_descricao_tb_galeria1_idx` (`id_galeria`),
  ADD KEY `fk_tb_galeria_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_galeria_imagem`
--
ALTER TABLE `tb_galeria_imagem`
  ADD PRIMARY KEY (`id_galeria`,`id_midia`),
  ADD KEY `fk_tb_album_foto_id_album` (`id_galeria`),
  ADD KEY `fk_tb_galeria_imagem_tb_midia1_idx` (`id_midia`);

--
-- Índices de tabela `tb_lead`
--
ALTER TABLE `tb_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_lead_id_cliente` (`id_cliente`),
  ADD KEY `tb_lead_id_produto` (`id_produto`);

--
-- Índices de tabela `tb_link`
--
ALTER TABLE `tb_link`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_link_descricao`
--
ALTER TABLE `tb_link_descricao`
  ADD PRIMARY KEY (`id_link`,`id_idioma`),
  ADD KEY `fk_tb_link_descricao_tb_link1_idx` (`id_link`),
  ADD KEY `fk_tb_link_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_medico`
--
ALTER TABLE `tb_medico`
  ADD PRIMARY KEY (`id_funcionario`,`crm`),
  ADD UNIQUE KEY `crm` (`crm`),
  ADD UNIQUE KEY `fk_tb_medico_id_funcionario_UNIQUE` (`id_funcionario`),
  ADD KEY `fk_tb_medico_id_especialidade` (`id_especialidade`);

--
-- Índices de tabela `tb_medico_agenda`
--
ALTER TABLE `tb_medico_agenda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `horario_atendimento_UNIQUE` (`id_medico_clinica`,`semana`,`mes`,`ano`,`dia`) USING BTREE;

--
-- Índices de tabela `tb_medico_agenda_horario`
--
ALTER TABLE `tb_medico_agenda_horario`
  ADD PRIMARY KEY (`id_agenda`,`hora_inicial`,`hora_final`);

--
-- Índices de tabela `tb_medico_clinica`
--
ALTER TABLE `tb_medico_clinica`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_medico_clinica` (`id_medico`,`id_empresa`) USING BTREE,
  ADD KEY `fk_tb_medico_clinica_id_empresa_departamento` (`id_empresa_departamento`),
  ADD KEY `fk_tb_medico_clinica_tb_empresa1_idx` (`id_empresa`);

--
-- Índices de tabela `tb_medico_especialidade`
--
ALTER TABLE `tb_medico_especialidade`
  ADD PRIMARY KEY (`id_funcionario`,`id_especialidade`),
  ADD KEY `fk_tb_medico_especialidade_id_especialidade` (`id_especialidade`);

--
-- Índices de tabela `tb_midia`
--
ALTER TABLE `tb_midia`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_midia_descricao`
--
ALTER TABLE `tb_midia_descricao`
  ADD PRIMARY KEY (`id_midia`,`id_idioma`),
  ADD KEY `fk_tb_midia_descricao_tb_midia1_idx` (`id_midia`),
  ADD KEY `fk_tb_midia_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_tb_paciente_id_estado_civil` (`id_estado_civil`),
  ADD KEY `fk_tb_paciente_id_etnia` (`id_etnia`),
  ADD KEY `fk_tb_paciente_id_acomodacao` (`id_acomodacao`),
  ADD KEY `fk_tb_paciente_id_tipo_convenio` (`id_tipo_convenio`),
  ADD KEY `fk_tb_paciente_id_convenio` (`id_convenio`);

--
-- Índices de tabela `tb_paciente_convenio`
--
ALTER TABLE `tb_paciente_convenio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_paciente_convenio_id_acomodacao` (`id_acomodacao`),
  ADD KEY `fk_tb_paciente_convenio_id_convenio` (`id_convenio`),
  ADD KEY `fk_tb_paciente_convenio_id_paciente` (`id_paciente`);

--
-- Índices de tabela `tb_paciente_homecare`
--
ALTER TABLE `tb_paciente_homecare`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_tb_paciente_homecare_id_paciente_UNIQUE` (`id_paciente`);

--
-- Índices de tabela `tb_paciente_nota`
--
ALTER TABLE `tb_paciente_nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_paciente_nota` (`id_paciente`),
  ADD KEY `fk_tb_paciente_nota_id_severidade` (`id_severidade`);

--
-- Índices de tabela `tb_paciente_programa`
--
ALTER TABLE `tb_paciente_programa`
  ADD PRIMARY KEY (`id_paciente`,`id_programa`),
  ADD KEY `fk_tb_paciente_programa_id_programa` (`id_programa`);

--
-- Índices de tabela `tb_paciente_tarefas`
--
ALTER TABLE `tb_paciente_tarefas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Índices de tabela `tb_paciente_tarefas_anotacoes`
--
ALTER TABLE `tb_paciente_tarefas_anotacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_post`
--
ALTER TABLE `tb_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_post_tb_acl_modulo_id_controller` (`id_controller`);

--
-- Índices de tabela `tb_post_descricao`
--
ALTER TABLE `tb_post_descricao`
  ADD PRIMARY KEY (`id_post`,`id_idioma`),
  ADD KEY `fk_tb_pagina_descricao_tb_pagina1_idx` (`id_post`),
  ADD KEY `fk_tb_pagina_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_post_link`
--
ALTER TABLE `tb_post_link`
  ADD PRIMARY KEY (`id_post`,`id_link`),
  ADD KEY `fk_tb_link_pagina_id_link` (`id_link`),
  ADD KEY `fk_tb_link_pagina_id_pagina` (`id_post`);

--
-- Índices de tabela `tb_post_midia`
--
ALTER TABLE `tb_post_midia`
  ADD PRIMARY KEY (`id_pagina`,`id_midia`),
  ADD UNIQUE KEY `id_pagina_UNIQUE` (`id_pagina`,`id_midia`),
  ADD UNIQUE KEY `id_midia_UNIQUE` (`id_midia`,`id_pagina`),
  ADD KEY `fk_tb_pagina_midia_tb_pagina1_idx` (`id_pagina`),
  ADD KEY `fk_tb_pagina_midia_tb_midia1_idx` (`id_midia`);

--
-- Índices de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_produto_distribuidor_id_distribuidor` (`id_distribuidor`);

--
-- Índices de tabela `tb_produto_categoria`
--
ALTER TABLE `tb_produto_categoria`
  ADD PRIMARY KEY (`id_produto`,`id_categoria`),
  ADD UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`),
  ADD UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  ADD KEY `fk_tb_produto_categoria_tb_produto1_idx` (`id_produto`,`id_categoria`);

--
-- Índices de tabela `tb_produto_descricao`
--
ALTER TABLE `tb_produto_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_produto`),
  ADD KEY `fk_tb_produto_descricao_tb_produto1_idx` (`id_produto`),
  ADD KEY `fk_tb_produto_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_produto_imagem`
--
ALTER TABLE `tb_produto_imagem`
  ADD PRIMARY KEY (`id_produto`,`id_midia`),
  ADD UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  ADD UNIQUE KEY `id_midia_UNIQUE` (`id_midia`),
  ADD KEY `fk_tb_produto_imagem_tb_produto1_idx` (`id_produto`,`id_midia`);

--
-- Índices de tabela `tb_programas`
--
ALTER TABLE `tb_programas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descricao` (`descricao`),
  ADD KEY `fk_tb_servicos_id_parent` (`id_parent`);

--
-- Índices de tabela `tb_severidade_nota`
--
ALTER TABLE `tb_severidade_nota`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_acomodacao`
--
ALTER TABLE `tb_acomodacao`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_agenda`
--
ALTER TABLE `tb_agenda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_atendimento`
--
ALTER TABLE `tb_atendimento`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de tabela `tb_atendimento_notas`
--
ALTER TABLE `tb_atendimento_notas`
  MODIFY `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_atendimento_tipo`
--
ALTER TABLE `tb_atendimento_tipo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_banner`
--
ALTER TABLE `tb_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Numero sequencial';

--
-- AUTO_INCREMENT de tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_comentario`
--
ALTER TABLE `tb_comentario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_convenio_planos`
--
ALTER TABLE `tb_convenio_planos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_convenio_planos_servicos`
--
ALTER TABLE `tb_convenio_planos_servicos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_departamento`
--
ALTER TABLE `tb_departamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tb_departamento_empresa`
--
ALTER TABLE `tb_departamento_empresa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de tabela `tb_distribuidor`
--
ALTER TABLE `tb_distribuidor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_email`
--
ALTER TABLE `tb_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Chave primária da tabela.', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `tb_especialidade`
--
ALTER TABLE `tb_especialidade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `tb_estado_civil`
--
ALTER TABLE `tb_estado_civil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_etnia`
--
ALTER TABLE `tb_etnia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_exame`
--
ALTER TABLE `tb_exame`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_exame_categoria`
--
ALTER TABLE `tb_exame_categoria`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_funcao`
--
ALTER TABLE `tb_funcao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `tb_galeria`
--
ALTER TABLE `tb_galeria`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_lead`
--
ALTER TABLE `tb_lead`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_link`
--
ALTER TABLE `tb_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_medico_agenda`
--
ALTER TABLE `tb_medico_agenda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_medico_clinica`
--
ALTER TABLE `tb_medico_clinica`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de tabela `tb_midia`
--
ALTER TABLE `tb_midia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de tabela `tb_paciente_convenio`
--
ALTER TABLE `tb_paciente_convenio`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `tb_paciente_homecare`
--
ALTER TABLE `tb_paciente_homecare`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_paciente_nota`
--
ALTER TABLE `tb_paciente_nota`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_paciente_tarefas`
--
ALTER TABLE `tb_paciente_tarefas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_paciente_tarefas_anotacoes`
--
ALTER TABLE `tb_paciente_tarefas_anotacoes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_post`
--
ALTER TABLE `tb_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_programas`
--
ALTER TABLE `tb_programas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tb_severidade_nota`
--
ALTER TABLE `tb_severidade_nota`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_agenda`
--
ALTER TABLE `tb_agenda`
  ADD CONSTRAINT `fk_tb_agenda_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_atendimento`
--
ALTER TABLE `tb_atendimento`
  ADD CONSTRAINT `fk_tb_agendamento_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_agendamento_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_agendamento_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tb_atendimento_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_agendamento_id_usuario` FOREIGN KEY (`criador`) REFERENCES `dev_db_sistema`.`tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_atendimento_id_clinica` FOREIGN KEY (`id_clinica`) REFERENCES `tb_medico_clinica` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_atendimento_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico_clinica` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_atendimento_notas`
--
ALTER TABLE `tb_atendimento_notas`
  ADD CONSTRAINT `fk_tb_atendimento_id_atendimento` FOREIGN KEY (`id_atendimento`) REFERENCES `tb_atendimento` (`id`),
  ADD CONSTRAINT `fk_tb_atendimento_id_severidade` FOREIGN KEY (`id_severidade`) REFERENCES `tb_severidade_nota` (`id`),
  ADD CONSTRAINT `fk_tb_atendimento_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `dev_db_sistema`.`tb_acl_usuario` (`id`);

--
-- Restrições para tabelas `tb_banner_descricao`
--
ALTER TABLE `tb_banner_descricao`
  ADD CONSTRAINT `fk_tb_banner_descricao_tb_banner1` FOREIGN KEY (`id_banner`) REFERENCES `tb_banner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_banner_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_banner_imagem`
--
ALTER TABLE `tb_banner_imagem`
  ADD CONSTRAINT `fk_tb_banner_imagem_tb_banner1` FOREIGN KEY (`id_banner`) REFERENCES `tb_banner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_banner_imagem_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_banner_imagem_descricao`
--
ALTER TABLE `tb_banner_imagem_descricao`
  ADD CONSTRAINT `fk_tb_banner_imagem_descricao_tb_banner_imagem1` FOREIGN KEY (`id_banner`,`id_midia`) REFERENCES `tb_banner_imagem` (`id_banner`, `id_midia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_banner_imagem_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_categoria_descricao`
--
ALTER TABLE `tb_categoria_descricao`
  ADD CONSTRAINT `fk_tb_categoria_descricao_tb_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_categoria_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_cliente_email`
--
ALTER TABLE `tb_cliente_email`
  ADD CONSTRAINT `tb_cliente_email_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_cliente_telefone`
--
ALTER TABLE `tb_cliente_telefone`
  ADD CONSTRAINT `tb_cliente_telefone_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_convenio`
--
ALTER TABLE `tb_convenio`
  ADD CONSTRAINT `fk_tb_convenio_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_convenio_planos`
--
ALTER TABLE `tb_convenio_planos`
  ADD CONSTRAINT `fk_tb_convenio_planos_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `tb_convenio` (`id`);

--
-- Restrições para tabelas `tb_convenio_planos_servicos`
--
ALTER TABLE `tb_convenio_planos_servicos`
  ADD CONSTRAINT `fk_tb_convenio_planos_servicos_id_plano` FOREIGN KEY (`id_plano`) REFERENCES `tb_convenio_planos` (`id`);

--
-- Restrições para tabelas `tb_departamento_empresa`
--
ALTER TABLE `tb_departamento_empresa`
  ADD CONSTRAINT `fk_tb_departamento_id_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `tb_departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_departamento_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_distribuidor_email`
--
ALTER TABLE `tb_distribuidor_email`
  ADD CONSTRAINT `fk_tb_distribuidor_email_id_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_distribuidor_telefone`
--
ALTER TABLE `tb_distribuidor_telefone`
  ADD CONSTRAINT `fk_tb_distribuidor_telefone_id_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_exame`
--
ALTER TABLE `tb_exame`
  ADD CONSTRAINT `fk_tb_exame_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tb_exame_categoria` (`id`);

--
-- Restrições para tabelas `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD CONSTRAINT `fk_tb_funcionario_id_funcao` FOREIGN KEY (`id_funcao`) REFERENCES `tb_funcao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_funcionario_tb_departamento1` FOREIGN KEY (`id_departamento`) REFERENCES `tb_departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_funcionario_tb_empresa1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_galeria_descricao`
--
ALTER TABLE `tb_galeria_descricao`
  ADD CONSTRAINT `fk_tb_galeria_descricao_tb_galeria1` FOREIGN KEY (`id_galeria`) REFERENCES `tb_galeria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_galeria_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_galeria_imagem`
--
ALTER TABLE `tb_galeria_imagem`
  ADD CONSTRAINT `fk_tb_album_foto_id_album` FOREIGN KEY (`id_galeria`) REFERENCES `tb_galeria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_galeria_imagem_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_lead`
--
ALTER TABLE `tb_lead`
  ADD CONSTRAINT `tb_lead_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lead_id_produto` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_link_descricao`
--
ALTER TABLE `tb_link_descricao`
  ADD CONSTRAINT `fk_tb_link_descricao_tb_link1` FOREIGN KEY (`id_link`) REFERENCES `tb_link` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_link_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_medico`
--
ALTER TABLE `tb_medico`
  ADD CONSTRAINT `fk_tb_medico_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_funcionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_medico_agenda`
--
ALTER TABLE `tb_medico_agenda`
  ADD CONSTRAINT `fk_tb_medico_agenda_id_medico_clinica` FOREIGN KEY (`id_medico_clinica`) REFERENCES `tb_medico_clinica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_medico_agenda_horario`
--
ALTER TABLE `tb_medico_agenda_horario`
  ADD CONSTRAINT `fk_tb_medico_agenda_horario_id_agenda` FOREIGN KEY (`id_agenda`) REFERENCES `tb_medico_agenda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_medico_clinica`
--
ALTER TABLE `tb_medico_clinica`
  ADD CONSTRAINT `fk_tb_medico_clinica_id_empresa1` FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_medico_clinica_id_medico` FOREIGN KEY (`id_medico`) REFERENCES `tb_medico` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_medico_especialidade`
--
ALTER TABLE `tb_medico_especialidade`
  ADD CONSTRAINT `fk_tb_medico_especialidade_id_especialidade` FOREIGN KEY (`id_especialidade`) REFERENCES `tb_especialidade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_medico_especialidade_id_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tb_medico` (`id_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_midia_descricao`
--
ALTER TABLE `tb_midia_descricao`
  ADD CONSTRAINT `fk_tb_midia_descricao_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_midia_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD CONSTRAINT `fk_tb_paciente_id_acomodacao` FOREIGN KEY (`id_acomodacao`) REFERENCES `tb_acomodacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `tb_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_id_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `tb_estado_civil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_id_etnia` FOREIGN KEY (`id_etnia`) REFERENCES `tb_etnia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_id_tipo_convenio` FOREIGN KEY (`id_tipo_convenio`) REFERENCES `tb_convenio_planos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_paciente_convenio`
--
ALTER TABLE `tb_paciente_convenio`
  ADD CONSTRAINT `fk_tb_paciente_convenio_id_acomodacao` FOREIGN KEY (`id_acomodacao`) REFERENCES `tb_acomodacao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_convenio_id_convenio` FOREIGN KEY (`id_convenio`) REFERENCES `tb_convenio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_convenio_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_paciente_homecare`
--
ALTER TABLE `tb_paciente_homecare`
  ADD CONSTRAINT `fk_tb_paciente_homecare_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_paciente_nota`
--
ALTER TABLE `tb_paciente_nota`
  ADD CONSTRAINT `fk_tb_paciente_nota` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_paciente_nota_id_severidade` FOREIGN KEY (`id_severidade`) REFERENCES `tb_severidade_nota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_paciente_programa`
--
ALTER TABLE `tb_paciente_programa`
  ADD CONSTRAINT `fk_tb_paciente_programa_id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `tb_paciente` (`id`),
  ADD CONSTRAINT `fk_tb_paciente_programa_id_programa` FOREIGN KEY (`id_programa`) REFERENCES `tb_programas` (`id`);

--
-- Restrições para tabelas `tb_post`
--
ALTER TABLE `tb_post`
  ADD CONSTRAINT `fk_tb_post_tb_acl_modulo_classe1` FOREIGN KEY (`id_controller`) REFERENCES `dev_db_sistema`.`tb_acl_modulo_controller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_post_descricao`
--
ALTER TABLE `tb_post_descricao`
  ADD CONSTRAINT `fk_tb_pagina_descricao_tb_post` FOREIGN KEY (`id_post`) REFERENCES `tb_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_pagina_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_post_link`
--
ALTER TABLE `tb_post_link`
  ADD CONSTRAINT `fk_tb_link_pagina_id_link` FOREIGN KEY (`id_link`) REFERENCES `tb_link` (`id`),
  ADD CONSTRAINT `fk_tb_link_pagina_id_post` FOREIGN KEY (`id_post`) REFERENCES `tb_post` (`id`);

--
-- Restrições para tabelas `tb_post_midia`
--
ALTER TABLE `tb_post_midia`
  ADD CONSTRAINT `fk_tb_pagina_midia_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_pagina_midia_tb_pagina1` FOREIGN KEY (`id_pagina`) REFERENCES `tb_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `fk_tb_produto_distribuidor_id_distribuidor` FOREIGN KEY (`id_distribuidor`) REFERENCES `tb_distribuidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_produto_categoria`
--
ALTER TABLE `tb_produto_categoria`
  ADD CONSTRAINT `fk_tb_produto_categoria_tb_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_produto_categoria_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_produto_descricao`
--
ALTER TABLE `tb_produto_descricao`
  ADD CONSTRAINT `fk_tb_produto_descricao_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_produto_descricao_tb_sys_idioma1` FOREIGN KEY (`id_idioma`) REFERENCES `dev_db_sistema`.`tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_produto_imagem`
--
ALTER TABLE `tb_produto_imagem`
  ADD CONSTRAINT `fk_tb_produto_imagem_tb_midia1` FOREIGN KEY (`id_midia`) REFERENCES `tb_midia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_produto_imagem_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_servicos`
--
ALTER TABLE `tb_servicos`
  ADD CONSTRAINT `fk_tb_servicos_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_servicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
