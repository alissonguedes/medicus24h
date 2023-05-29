-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 29/05/2023 às 14:05
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
-- Banco de dados: `medicus_sistema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_grupo`
--

CREATE TABLE `tb_acl_grupo` (
  `id` int(11) UNSIGNED NOT NULL,
  `grupo` varchar(25) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de grupos de usuários.';

--
-- Despejando dados para a tabela `tb_acl_grupo`
--

INSERT INTO `tb_acl_grupo` (`id`, `grupo`, `descricao`, `permissao`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Administrador', 'Grupo de usuários sem restrição de privilégios.', 1111, '2022-06-24 02:42:45', NULL, '1'),
(2, 'Administrador', 'Grupo de usuários com restrição de privilégios.', 0111, '2022-06-24 02:42:45', NULL, '1'),
(3, 'Médicos', 'Grupo de usuários com restrição de privilégios.', 0111, '2022-06-24 02:42:45', NULL, '1'),
(4, 'Recepcionistas', 'Grupo de usuários com restrição de privilégios.', 0111, '2022-06-24 02:42:45', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu`
--

CREATE TABLE `tb_acl_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `editavel` enum('0','1') NOT NULL DEFAULT '1',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de grupos de menus';

--
-- Despejando dados para a tabela `tb_acl_menu`
--

INSERT INTO `tb_acl_menu` (`id`, `id_grupo`, `created_at`, `updated_at`, `editavel`, `status`) VALUES
(1, 1, '2022-08-21 08:09:34', '2022-08-21 08:57:31', '1', '1'),
(2, 1, '2022-08-21 08:56:50', '2022-11-12 02:16:17', '1', '1'),
(3, 2, '2022-08-21 08:56:50', '2022-08-21 08:57:29', '1', '1'),
(4, 3, '2022-11-09 01:38:24', NULL, '1', '1'),
(5, 4, '2022-08-21 08:56:50', '2022-11-12 02:16:17', '1', '1'),
(15, 0, '2023-04-27 17:43:40', NULL, '1', '1'),
(16, 0, '2023-05-26 04:35:45', NULL, '1', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_descricao`
--

CREATE TABLE `tb_acl_menu_descricao` (
  `id_menu` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_menu_descricao`
--

INSERT INTO `tb_acl_menu_descricao` (`id_menu`, `id_idioma`, `titulo`, `descricao`, `meta_description`, `meta_title`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'Menu administrativo', 'menu-principal', NULL, NULL, NULL, '2023-04-25 18:46:34', '2023-04-25 19:08:05'),
(2, 1, 'Super Administrador', 'clinica', NULL, NULL, NULL, '2023-04-25 18:46:34', '2023-04-25 19:06:50'),
(3, 1, 'Administrador', 'clinica-3', NULL, NULL, NULL, '2023-04-25 18:46:34', '2023-04-25 19:07:11'),
(4, 1, 'Médico', 'clinica-4', NULL, NULL, NULL, '2023-04-25 18:46:34', '2023-04-25 19:07:19'),
(5, 1, 'Clínica Admin5', 'clinica', NULL, NULL, NULL, '2023-04-25 18:46:34', '2023-04-25 19:06:23'),
(15, 1, 'Estoque', 'estoque', NULL, NULL, NULL, '2023-04-27 17:43:40', NULL),
(16, 1, 'Tickets', 'tickets', NULL, NULL, NULL, '2023-05-26 04:35:45', NULL),
(1, 2, 'Main menu', 'main-menu', NULL, NULL, NULL, '2023-04-25 18:46:34', NULL),
(3, 2, '5', '5', NULL, NULL, NULL, '2023-04-25 18:46:34', NULL),
(5, 2, 'Clinic', 'clinic', NULL, NULL, NULL, '2023-04-25 18:46:34', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_grupo`
--

CREATE TABLE `tb_acl_menu_grupo` (
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `id_menu` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para atribuir menus a grupos de usuários';

--
-- Despejando dados para a tabela `tb_acl_menu_grupo`
--

INSERT INTO `tb_acl_menu_grupo` (`id_grupo`, `id_menu`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_item`
--

CREATE TABLE `tb_acl_menu_item` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_controller` int(11) UNSIGNED NOT NULL COMMENT 'Referencia a tabela (tb_acl_modulo_controller ou tb_acl_modulo_post) para a qual aponta o menu',
  `id_parent` int(11) UNSIGNED DEFAULT NULL COMMENT 'Campo para hierarquia do menu',
  `id_route` int(11) NOT NULL DEFAULT 0,
  `descricao` varchar(50) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL COMMENT 'É o nome da tabela referenciada. Seria a tb_acl_modulo_controller (controller) ou tb_acl_modulo_post (post)',
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `target` varchar(20) DEFAULT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `divider` tinyint(1) NOT NULL DEFAULT 0,
  `editavel` enum('0','1') NOT NULL DEFAULT '1',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de itens do menus';

--
-- Despejando dados para a tabela `tb_acl_menu_item`
--

INSERT INTO `tb_acl_menu_item` (`id`, `id_controller`, `id_parent`, `id_route`, `descricao`, `item_type`, `link`, `icon`, `target`, `ordem`, `permissao`, `created_at`, `updated_at`, `divider`, `editavel`, `status`) VALUES
(1, 3, NULL, 0, 'Admin Dashboard', 'Menu Principal', NULL, 'dashboard', NULL, 1, 0001, '2022-08-21 08:14:27', NULL, 0, '1', '1'),
(2, 4, NULL, 0, 'Admin Menus', NULL, NULL, 'list', NULL, 3, 0001, '2022-08-21 08:14:55', NULL, 0, '1', '1'),
(3, 4, 2, 0, 'Admin Menus', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-08-21 08:14:27', NULL, 0, '1', '1'),
(4, 12, NULL, 0, 'Clinica Home', 'ClinicCloud', NULL, 'cloud', '_blank', 1, 0001, '2022-08-21 08:14:27', NULL, 0, '1', '1'),
(5, 12, NULL, 0, 'Clinica Dashboard', 'Menu Principal', NULL, 'dashboard', NULL, 2, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(6, 27, NULL, 0, 'Clinica >> Agendamentos', NULL, NULL, 'calendar_month', NULL, 6, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(7, 27, 6, 0, 'Clinica >> Agendamentos >> Consultas', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(8, 27, 6, 0, 'Clinica >> Agendamentos >> Exames', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(9, 27, 6, 0, 'Clinica >> Agendamentos >> Procedimentos', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(10, 27, 6, 0, 'Clinica >> Agendamentos >>', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(11, 27, 6, 0, 'Clinica >> Agendamentos >>', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(12, 31, NULL, 0, 'Clinica >> HomeCare', NULL, NULL, 'real_estate_agent', NULL, 4, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(13, 12, 12, 0, 'Página inicial do módulo ClinicCloud', NULL, NULL, 'biotech', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(14, 12, 12, 0, 'Página inicial do módulo ClinicCloud', NULL, NULL, 'monitor_heart', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(15, 12, 12, 0, 'Página inicial do módulo ClinicCloud', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(16, 12, NULL, 0, 'Recursos Médicos', NULL, NULL, 'medical_services', NULL, 5, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(17, 28, 16, 0, 'Atendimentos', NULL, NULL, 'fa-clipboard-user', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(18, 19, NULL, 0, 'Página de pacientes', NULL, NULL, 'group', NULL, 2, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(19, 21, 22, 0, 'Página de médicos', NULL, NULL, NULL, NULL, 5, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(20, 22, 25, 0, 'Página de especialidades', NULL, NULL, 'favorite_border', NULL, 3, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(21, 12, NULL, 0, 'Gerenciamento', 'Sistema', NULL, 'construction', NULL, 20, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '0'),
(22, 12, NULL, 0, 'Cadastros', 'Gerenciar', NULL, 'construction', NULL, 20, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(23, 23, 22, 0, 'Empresas', NULL, NULL, 'local_convenience_store', NULL, 2, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(24, 25, 25, 0, 'Departamentos', NULL, NULL, 'account_tree', NULL, 2, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(25, 12, NULL, 0, 'Tabelas', NULL, NULL, 'view_column', NULL, 20, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(26, 26, 22, 0, 'Funcionários', NULL, NULL, 'supervisor_account', NULL, 4, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(27, 29, NULL, 0, 'Menu de usuários', 'Sistema', NULL, NULL, NULL, 100, 1111, '2023-01-15 23:40:06', NULL, 0, '1', '1'),
(28, 29, 27, 0, 'Grupo de usuários', NULL, NULL, NULL, NULL, 100, 1111, '2023-01-15 23:40:06', NULL, 0, '1', '1'),
(29, 30, 27, 0, 'Usuários', NULL, NULL, NULL, NULL, 100, 1111, '2023-01-15 23:40:06', NULL, 0, '1', '1'),
(30, 39, NULL, 0, 'Rota para o controller Módulos', NULL, NULL, 'view_module', NULL, 2, 1111, '2023-03-11 10:25:18', NULL, 0, '1', '1'),
(31, 37, 22, 0, 'Exames', NULL, NULL, 'stethoscope_check', NULL, 2, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(32, 37, 31, 0, 'Exames', NULL, NULL, NULL, NULL, 2, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(33, 40, 31, 0, 'Tipos de exames', NULL, NULL, '·', NULL, 1, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1'),
(34, 43, 2, 0, 'Admin Itens de Menus ', NULL, NULL, 'radio_button_unchecked', NULL, 0, 0001, '2022-08-21 08:14:27', NULL, 0, '1', '1'),
(35, 45, 16, 0, 'Agenda Médica', NULL, NULL, 'edit_calendar', NULL, 0, 0001, '2022-11-08 23:07:03', NULL, 0, '1', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_item_descricao`
--

CREATE TABLE `tb_acl_menu_item_descricao` (
  `id_item` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_menu_item_descricao`
--

INSERT INTO `tb_acl_menu_item_descricao` (`id_item`, `id_idioma`, `titulo`, `descricao`, `meta_description`, `meta_title`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', '2023-04-25 18:41:22', NULL),
(2, 1, 'Menus', 'Menus', 'Menus', 'Menus', 'Menus', '2023-04-25 18:41:22', NULL),
(3, 1, 'Grupos de menus', 'Grupos de menus', 'Grupos de menus', 'Grupos de menus', 'Grupos de menus', '2023-04-25 18:41:22', NULL),
(4, 1, 'Painel ClinicCloud', 'Painel ClinicCloud', 'Painel ClinicCloud', 'Painel ClinicCloud', 'Painel ClinicCloud', '2023-04-25 18:41:22', NULL),
(5, 1, 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', '2023-04-25 18:41:22', NULL),
(6, 1, 'Agendamentos', 'Agendamentos', 'Agendamentos', 'Agendamentos', 'Agendamentos', '2023-04-25 18:41:22', NULL),
(7, 1, 'Consultas', 'Consultas', 'Consultas', 'Consultas', 'Outro menu', '2023-04-25 18:41:22', NULL),
(8, 1, 'Exames', 'Exames', 'Exames', 'Exames', 'Exames', '2023-04-25 18:41:22', NULL),
(9, 1, 'Procedimentos', 'Procedimentos', 'Procedimentos', 'Procedimentos', 'Exames', '2023-04-25 18:41:22', NULL),
(10, 1, 'Cirurgias', 'Cirurgias', 'Cirurgias', 'Cirurgias', 'Exames', '2023-04-25 18:41:22', NULL),
(11, 1, 'Lembretes', 'Lembretes', 'Lembretes', 'Lembretes', 'Lembretes', '2023-04-25 18:41:22', NULL),
(12, 1, 'HomeCare', 'HomeCare', 'HomeCare', 'HomeCare', 'HomeCare', '2023-04-25 18:41:22', NULL),
(13, 1, 'Laboratoriais', 'Laboratoriais', 'Laboratoriais', 'Laboratoriais', 'Laboratoriais', '2023-04-25 18:41:22', NULL),
(14, 1, 'Imagens', 'Imagens', 'Imagens', 'Imagens', 'Imagens', '2023-04-25 18:41:22', NULL),
(15, 1, 'Outros', 'Outros', 'Outros', 'Outros', 'Outros', '2023-04-25 18:41:22', NULL),
(16, 1, 'Recursos médicos', 'Recursos médicos', 'Recursos médicos', 'Recursos médicos', 'Recursos médicos', '2023-04-25 18:41:22', NULL),
(17, 1, 'Atendimentos', 'Atendimentos', 'Atendimentos', 'Atendimentos', 'Atendimentos', '2023-04-25 18:41:22', NULL),
(18, 1, 'Pacientes', 'Pacientes', 'Pacientes', 'Pacientes', 'Pacientes', '2023-04-25 18:41:22', NULL),
(19, 1, 'Médicos', 'Médicos', 'Médicos', 'Médicos', 'Médicos', '2023-04-25 18:41:22', NULL),
(20, 1, 'Especialidades', 'Especialidades', 'Especialidades', 'Especialidades', 'Especialidades', '2023-04-25 18:41:22', NULL),
(21, 1, 'Gerenciar', 'Gerenciar', 'Gerenciar', 'Gerenciar', 'Gerenciar', '2023-04-25 18:41:22', NULL),
(22, 1, 'Cadastros', 'Cadastros', 'Cadastros', 'Cadastros', 'Cadastros', '2023-04-25 18:41:22', NULL),
(23, 1, 'Clínicas', 'Clínicas', 'Clínicas', 'Clínicas', 'Clínicas', '2023-04-25 18:41:22', NULL),
(24, 1, 'Departamentos', 'Departamentos', 'Departamentos', 'Departamentos', 'Departamentos', '2023-04-25 18:41:22', NULL),
(25, 1, 'Tabelas', 'Tabelas', 'Tabelas', 'Tabelas', 'Tabelas', '2023-04-25 18:41:22', NULL),
(26, 1, 'Funcionários', 'Funcionários', 'Funcionários', 'Funcionários', 'Funcionários', '2023-04-25 18:41:22', NULL),
(27, 1, 'Usuários', 'Usuários', 'Usuários', 'Usuários', 'Usuários', '2023-04-25 18:41:22', NULL),
(28, 1, 'Grupos', 'Grupo de usuários', 'Grupo de usuários', 'Grupo de usuários', 'Grupo de usuários', '2023-04-25 18:41:22', NULL),
(29, 1, 'Usuários', 'Usuários', 'Usuários', 'Usuários', 'Usuários', '2023-04-25 18:41:22', NULL),
(30, 1, 'Módulos', 'Módulos do sistema', 'Módulos do sistema', 'Módulos do sistema', 'Módulos do sistema', '2023-04-25 18:41:22', NULL),
(31, 1, 'Exames', 'Exames', 'Exames', 'Exames', 'Exames', '2023-04-25 18:41:22', NULL),
(32, 1, 'Exames', 'Exames', 'Exames', 'Exames', 'Exames', '2023-04-25 18:41:22', NULL),
(33, 1, 'Tipos', 'Tipos de Exames', 'Tipos de Exames', 'Tipos de Exames', 'Exames', '2023-04-25 18:41:22', NULL),
(34, 1, 'Itens Menus', 'Itens de Menus', 'Itens de Menus', 'Itens de Menus', 'Itens de Menus', '2023-04-25 18:41:22', NULL),
(35, 1, 'Agenda Médica', 'Agenda Médica', 'Agenda Médica', 'Agenda Médica', 'Agenda Médica', '2023-04-25 18:41:22', NULL),
(1, 2, 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', '2023-04-25 18:41:22', NULL),
(2, 2, 'Menus', 'Menus', 'Menus', 'Menus', 'Menus', '2023-04-25 18:41:22', NULL),
(5, 2, 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'Dashboard', '2023-04-25 18:41:22', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_item_menu`
--

CREATE TABLE `tb_acl_menu_item_menu` (
  `id_menu` int(11) UNSIGNED NOT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_menu_item_menu`
--

INSERT INTO `tb_acl_menu_item_menu` (`id_menu`, `id_item`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, '2023-03-11 10:20:03', NULL, '1'),
(1, 2, '2023-03-11 10:20:03', NULL, '1'),
(1, 3, '2023-03-11 10:20:26', NULL, '1'),
(2, 5, '2023-02-13 21:56:10', NULL, '1'),
(3, 5, '2023-02-13 22:00:37', NULL, '1'),
(4, 5, '2023-03-04 21:14:08', NULL, '1'),
(2, 6, '2023-02-13 22:07:59', NULL, '1'),
(3, 6, '2023-03-04 20:26:47', NULL, '1'),
(4, 6, '2023-03-04 21:14:08', NULL, '1'),
(2, 7, '2023-02-13 21:56:10', NULL, '1'),
(3, 7, '2023-03-04 20:26:47', NULL, '1'),
(4, 7, '2023-03-04 21:14:08', NULL, '1'),
(2, 8, '2023-02-13 22:08:29', NULL, '1'),
(3, 8, '2023-03-04 20:26:47', NULL, '1'),
(4, 8, '2023-03-04 21:14:08', NULL, '1'),
(2, 12, '2023-02-14 04:51:09', NULL, '1'),
(3, 12, '2023-03-04 20:26:47', NULL, '1'),
(4, 12, '2023-03-04 21:14:08', NULL, '0'),
(2, 16, '2023-02-13 23:19:03', NULL, '1'),
(3, 16, '2023-03-04 20:26:47', NULL, '1'),
(4, 16, '2023-03-04 21:14:08', NULL, '1'),
(2, 17, '2023-02-13 23:21:39', NULL, '1'),
(3, 17, '2023-03-04 20:26:47', NULL, '1'),
(4, 17, '2023-03-04 21:14:08', NULL, '1'),
(2, 18, '2023-02-13 21:56:10', NULL, '1'),
(3, 18, '2023-03-04 20:26:47', NULL, '1'),
(4, 18, '2023-03-04 21:14:08', NULL, '0'),
(2, 19, '2023-02-14 04:52:45', NULL, '1'),
(3, 19, '2023-03-04 20:26:47', NULL, '1'),
(4, 19, '2023-03-04 21:14:08', NULL, '1'),
(1, 20, '2023-03-30 18:29:20', NULL, '1'),
(2, 20, '2023-03-30 18:29:41', NULL, '1'),
(2, 21, '2023-02-14 04:51:09', NULL, '1'),
(3, 21, '2023-03-04 20:26:47', NULL, '1'),
(4, 21, '2023-03-04 21:14:08', NULL, '0'),
(2, 22, '2023-02-14 04:51:46', NULL, '1'),
(3, 22, '2023-03-04 20:26:47', NULL, '1'),
(4, 22, '2023-03-04 21:14:08', NULL, '1'),
(2, 23, '2023-02-14 04:51:46', NULL, '1'),
(3, 23, '2023-03-04 20:26:47', NULL, '1'),
(4, 23, '2023-03-04 21:14:08', NULL, '1'),
(1, 24, '2023-03-30 18:29:20', NULL, '1'),
(2, 24, '2023-03-30 18:29:41', NULL, '1'),
(1, 25, '2023-03-30 18:21:41', NULL, '1'),
(2, 25, '2023-03-30 18:21:41', NULL, '1'),
(2, 26, '2023-02-14 04:52:17', NULL, '1'),
(3, 26, '2023-03-04 20:26:47', NULL, '1'),
(4, 26, '2023-03-04 21:14:08', NULL, '1'),
(2, 27, '2023-02-14 04:53:45', NULL, '1'),
(3, 27, '2023-03-04 20:26:47', NULL, '0'),
(4, 27, '2023-03-04 21:14:08', NULL, '0'),
(2, 28, '2023-02-14 04:53:05', NULL, '1'),
(3, 28, '2023-03-04 20:26:47', NULL, '1'),
(4, 28, '2023-03-04 21:14:08', NULL, '1'),
(1, 29, '2023-03-11 10:29:40', NULL, '1'),
(2, 29, '2023-02-14 04:53:23', NULL, '1'),
(3, 29, '2023-03-04 20:26:47', NULL, '1'),
(4, 29, '2023-03-04 21:14:08', NULL, '1'),
(1, 30, '2023-03-11 10:25:48', NULL, '1'),
(2, 31, '2023-02-14 04:51:46', NULL, '1'),
(2, 32, '2023-02-14 04:51:46', NULL, '1'),
(2, 33, '2023-02-14 04:51:46', NULL, '1'),
(1, 34, '2023-03-11 10:20:03', NULL, '1'),
(1, 35, '2023-03-11 10:20:03', NULL, '1'),
(2, 35, '2023-02-13 23:21:39', NULL, '1'),
(3, 35, '2023-03-11 10:20:03', NULL, '1'),
(4, 35, '2023-03-04 21:14:08', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_menu_secao`
--

CREATE TABLE `tb_acl_menu_secao` (
  `id` int(11) UNSIGNED NOT NULL,
  `secao` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de seções de menus. Seções correspondem ao local onde o menu se localizará: sidebar, header, footer, etc...';

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo`
--

CREATE TABLE `tb_acl_modulo` (
  `id` int(11) UNSIGNED NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `descricao` varchar(200) DEFAULT NULL,
  `homepage` int(11) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `restrict` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de módulos. Módulos correspondem aos diretórios da aplicação: main, admin, etc...';

--
-- Despejando dados para a tabela `tb_acl_modulo`
--

INSERT INTO `tb_acl_modulo` (`id`, `modulo`, `path`, `namespace`, `permissao`, `descricao`, `homepage`, `created_at`, `updated_at`, `restrict`, `status`) VALUES
(1, 'Site básico', '/', 'App\\Http\\Controllers\\Main\\', 1111, 'Diretório público do site', NULL, '2022-06-24 03:16:39', NULL, 'no', '1'),
(2, 'Sistema de administração de site', '/admin', 'App\\Http\\Controllers\\Admin\\', 1111, 'Diretório de administração do sistema', NULL, '2022-06-24 03:16:39', '2023-05-28 06:24:37', 'yes', '1'),
(3, 'teste', '/teste', 'App\\Http\\Controllers\\Teste\\', 1111, NULL, NULL, '2022-06-24 08:22:18', NULL, 'no', '1'),
(4, 'Sistema de Autenticação de usuários', '/auth', 'App\\Http\\Controllers\\', 1111, 'AuthController', NULL, '2022-06-24 03:16:39', NULL, 'no', '1'),
(5, 'Sistema de Clínicas', '/clinica', 'App\\Http\\Controllers\\Clinica\\', 1111, 'Módulo para Clínicias', NULL, '2022-11-08 22:56:55', '2023-04-25 04:44:56', 'yes', '1'),
(6, 'Controle de Estoque', '/estoque', 'App\\Http\\Controllers\\Estoque\\', 1111, 'Módulo para Controle de Estoque', NULL, '2022-11-08 22:56:55', NULL, 'yes', '1'),
(7, 'Sistema de e-mails', '/mail', 'App\\Http\\Controllers\\Mail\\', 1111, 'Módulo para E-mails', NULL, '2023-03-11 05:58:06', NULL, 'yes', '1'),
(8, 'OS Ticket', '/tickets', 'App\\Http\\Controllers\\Tickets\\', 1111, NULL, NULL, '2023-05-26 04:34:21', '2023-05-28 06:26:40', 'yes', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_controller`
--

CREATE TABLE `tb_acl_modulo_controller` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `use_as` varchar(100) DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `restrict` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_modulo_controller`
--

INSERT INTO `tb_acl_modulo_controller` (`id`, `id_modulo`, `descricao`, `controller`, `use_as`, `permissao`, `restrict`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Main Home', 'HomeController', NULL, 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(2, 1, 'Main Galeria', 'GaleriaController', 'PageController', 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(3, 2, 'Admin Home', 'HomeController', 'Dashboard', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(4, 2, 'Admin Menus', 'MenusController', 'MenusController', 0111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(5, 4, 'Auth Controller', 'AuthController', 'Auth', 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(6, 3, 'Teste da página Home do módulo Teste', 'HomeController', 'TesteController', 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(7, 1, 'API Main', 'ApiController', 'API', 0001, 'no', '2023-05-28 04:59:16', NULL, '1'),
(8, 2, 'API Admin', 'ApiController', 'API_Admin', 0001, 'no', '2023-05-28 04:59:16', NULL, '1'),
(9, 2, 'Admin Config', 'ConfigController', 'Config', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(10, 1, 'Main Sobre Nós', 'AboutController', 'AboutController', 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(11, 2, 'Admin usuários', 'UserController', 'UserController', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(12, 5, 'ClinicCloud - Home', 'HomeController', 'Cl_Dashboard', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(16, 5, 'API Clinica', 'ApiController', 'API_Clinica', 0001, 'no', '2023-05-28 04:59:16', NULL, '1'),
(18, 5, 'Clinica Config', 'ConfigController', 'C_Config', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(19, 5, 'Pacientes', 'PacientesController', 'C_Pacientes', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(20, 5, 'Prontuários de pacientes', 'ProntuariosController', 'C_Prontuarios', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(21, 5, 'Médicos', 'MedicosController', 'C_Medicos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(22, 5, 'Especialidades', 'EspecialidadesController', 'C_Especialidades', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(23, 5, 'Empresas', 'EmpresasController', 'C_Empresas', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(24, 1, 'Main Serviços', 'ServicesController', 'ServicesController', 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(25, 5, 'Departamentos', 'DepartamentosController', 'C_Departamentos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(26, 5, 'Funcionários', 'FuncionariosController', 'C_Funcionarios', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(27, 5, 'Agendamentos', 'AgendamentosController', 'C_Agendamentos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(28, 5, 'Atendimentos', 'AtendimentosController', 'C_Atendimentos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(29, 5, 'Grupos', 'GruposController', 'C_Grupos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(30, 5, 'Usuários', 'UsuariosController', 'C_Usuarios', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(31, 5, 'HomeCare', 'HomeCareController', 'C_HomeCare', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(32, 5, 'Planosdesaude', 'PlanosdesaudeController', 'C_Planosdesaude', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(33, 5, 'Convenios', 'ConveniosController', 'C_Convenios', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(34, 7, 'E-mails - Home', 'HomeController', 'Cl_Mailbox', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(35, 2, 'Admin Controllers', 'ModuloController', 'Controllers', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(36, 2, 'Admin Rotas', 'RoutesController', 'Routes', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(37, 5, 'Exames', 'ExamesController', 'C_Exames', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(38, 1, 'UsuarioController', 'UsuarioController', 'M_UsuarioController', 1111, 'no', '2023-05-28 04:59:16', NULL, '1'),
(39, 2, 'Admin Módulos', 'ModulosController', 'Modulos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(40, 5, 'Tipos de Exames', 'ExamesTiposController', 'C_ExamesTipo', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(43, 2, 'Admin Menus Itens', 'MenuitensController', 'A_MenusController', 0111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(44, 5, 'Recursos Médicos', 'RecursosMedicosController', 'Recursos_Medicos', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1'),
(45, 5, 'Agenda Médica', 'AgendaController', 'Agenda', 1111, 'yes', '2023-05-28 04:59:16', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_controller_descricao`
--

CREATE TABLE `tb_acl_modulo_controller_descricao` (
  `id_controller` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_grupo`
--

CREATE TABLE `tb_acl_modulo_grupo` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para atribuições de menus a grupos de usuários.';

--
-- Despejando dados para a tabela `tb_acl_modulo_grupo`
--

INSERT INTO `tb_acl_modulo_grupo` (`id`, `id_grupo`, `id_modulo`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 5),
(9, 1, 6),
(4, 1, 7),
(5, 2, 5),
(6, 3, 5),
(7, 4, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_grupo_menu`
--

CREATE TABLE `tb_acl_modulo_grupo_menu` (
  `id_modulo_grupo` int(11) UNSIGNED NOT NULL,
  `id_menu` int(11) UNSIGNED NOT NULL,
  `status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tb_acl_modulo_grupo_menu`
--

INSERT INTO `tb_acl_modulo_grupo_menu` (`id_modulo_grupo`, `id_menu`, `status`) VALUES
(2, 1, '1'),
(3, 2, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_modulo_routes`
--

CREATE TABLE `tb_acl_modulo_routes` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `id_controller` int(11) UNSIGNED NOT NULL,
  `id_parent` int(11) UNSIGNED DEFAULT NULL,
  `type` enum('any','get','post','put','head','options','delete','patch','match','resource','map','group') NOT NULL DEFAULT 'get',
  `route` varchar(255) NOT NULL,
  `action` varchar(100) NOT NULL,
  `filter` longtext DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `restrict` enum('yes','no','inherit') NOT NULL DEFAULT 'inherit',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de rotas de menus.';

--
-- Despejando dados para a tabela `tb_acl_modulo_routes`
--

INSERT INTO `tb_acl_modulo_routes` (`id`, `name`, `id_controller`, `id_parent`, `type`, `route`, `action`, `filter`, `permissao`, `restrict`, `status`) VALUES
(1, 'main.home', 1, NULL, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(2, 'main.home', 1, NULL, 'get', '/home', 'index', NULL, 1111, 'inherit', '1'),
(3, 'main.home', 1, NULL, 'get', '/inicio', 'index', NULL, 1111, 'inherit', '0'),
(4, 'main.page.embaixada', 2, NULL, 'get', '/embaixada', 'index', NULL, 1111, 'inherit', '1'),
(5, 'main.page.embaixada', 2, 4, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(6, 'main.page.embaixada.show_page', 2, 4, 'get', '/{page?}', 'show', NULL, 1111, 'inherit', '1'),
(8, 'account.auth.login', 5, NULL, 'any', '/login', 'index', NULL, 1111, 'inherit', '1'),
(9, 'admin.index', 3, NULL, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(10, 'admin.login', 3, NULL, 'any', '/login', 'index', NULL, 1111, 'inherit', '1'),
(11, 'admin.menus', 4, NULL, 'any', '/menus/grupos', 'index', NULL, 1111, 'inherit', '1'),
(12, 'admin.menus', 4, 11, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(13, 'admin.menus.add', 4, 11, 'get', '/add', 'form', NULL, 1111, 'inherit', '1'),
(14, 'teste.index', 6, NULL, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(15, 'admin.menus.patch', 4, 11, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(17, 'account.auth.login', 5, NULL, 'post', '/login', 'login_validate', NULL, 1111, 'inherit', '1'),
(18, 'logout', 5, NULL, 'any', '/logout', 'logout', NULL, 1111, 'inherit', '1'),
(19, 'admin.dashboard', 3, NULL, 'any', '/dashboard', 'index', NULL, 1111, 'inherit', '1'),
(20, 'admin.database', 3, NULL, 'any', '/database', 'index', NULL, 1111, 'inherit', '1'),
(21, 'main.api.token', 7, NULL, 'get', '/api/token', 'token', NULL, 1111, 'inherit', '1'),
(22, 'admin.api.token', 8, NULL, 'get', '/api/token', 'token', NULL, 1111, 'inherit', '1'),
(23, 'admin.menus.delete', 4, 11, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(24, 'main.api.translate', 7, NULL, 'get', '/api/translate/{lang}', 'translate', NULL, 0001, 'inherit', '1'),
(25, 'admin.api.translate', 8, NULL, 'get', '/api/translate/{lang}', 'translate', NULL, 0001, 'inherit', '1'),
(26, 'admin.menus.edit', 4, 11, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(27, 'admin.menus.put', 4, 11, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(28, 'admin.menus.post', 4, 11, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(30, 'admin.config.patch', 9, NULL, 'patch', '/config', 'patch', NULL, 1111, 'inherit', '1'),
(31, 'main.galeria', 2, NULL, 'any', '/galeria', 'index', NULL, 1111, 'inherit', '1'),
(32, 'main.contact', 1, NULL, 'any', '/contact', 'contato', NULL, 1111, 'inherit', '1'),
(33, 'main.about', 10, NULL, 'get', '/about-us', 'index', NULL, 1111, 'inherit', '1'),
(34, 'main.services.index', 24, NULL, 'any', '/services', 'index', NULL, 1111, 'inherit', '1'),
(35, 'main.health', 10, NULL, 'any', '/health', 'health', NULL, 1111, 'inherit', '1'),
(36, 'admin.users', 11, NULL, 'any', '/users', 'index', NULL, 1111, 'inherit', '1'),
(37, 'clinica.index', 12, NULL, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(38, 'clinica.api.token', 16, NULL, 'get', '/api/token', 'token', NULL, 1111, 'inherit', '1'),
(39, 'clinica.config.patch', 18, NULL, 'patch', '/config', 'patch', NULL, 1111, 'inherit', '1'),
(40, 'clinica.pacientes.index', 19, NULL, 'any', '/pacientes', 'index', NULL, 1111, 'inherit', '1'),
(41, 'clinica.pacientes.index', 19, 40, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(42, 'clinica.pacientes.post', 19, 40, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(43, 'clinica.pacientes.edit', 19, 40, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(44, 'clinica.pacientes.add', 19, 40, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(45, 'clinica.pacientes.patch', 19, 40, 'patch', '/id/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(46, 'clinica.pacientes.delete', 19, 40, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(47, 'clinica.pacientes.post', 19, 40, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(48, 'clinica.pacientes.{id_paciente}.prontuarios', 20, 40, 'any', '/{id_paciente}/prontuario', 'index', NULL, 1111, 'inherit', '1'),
(49, 'clinica.pacientes.{id_paciente}.prontuarios', 20, 48, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(50, 'clinica.pacientes.{id_paciente}.prontuarios.post', 20, 48, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(51, 'clinica.pacientes.{id_paciente}.prontuarios.{id_prontuario}', 20, 48, 'get', '/{id_prontuario}', 'form', NULL, 1111, 'inherit', '1'),
(52, 'clinica.pacientes.{id_paciente}.prontuarios.add', 20, 48, 'any', '/pacientes/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(53, 'clinica.pacientes.{id_paciente}.prontuarios.patch', 20, 48, 'patch', '/', 'patch', NULL, 1111, 'inherit', '1'),
(54, 'clinica.pacientes.{id_paciente}.prontuarios.delete', 20, 48, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(55, 'clinica.pacientes.{id_paciente}.prontuarios.put', 20, 48, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(56, 'clinica.funcionarios.index', 26, NULL, 'any', '/funcionarios', 'index', NULL, 1111, 'inherit', '1'),
(57, 'clinica.funcionarios.index', 26, 56, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(58, 'clinica.funcionarios.add', 26, 56, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(59, 'clinica.funcionarios.post', 26, 56, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(60, 'clinica.funcionarios.edit', 26, 56, 'get', '/{id}', 'form', NULL, 1111, 'inherit', '1'),
(61, 'clinica.funcionarios.patch', 26, 56, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(62, 'clinica.funcionarios.delete', 26, 56, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(63, 'clinica.funcionarios.put', 26, 56, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(64, 'clinica.especialidades.index', 22, NULL, 'any', '/especialidades', 'index', NULL, 1111, 'inherit', '1'),
(65, 'clinica.especialidades.index', 22, 64, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(66, 'clinica.especialidades.add', 22, 64, 'get', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(67, 'clinica.especialidades.post', 22, 64, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(68, 'clinica.especialidades.edit', 22, 64, 'get', '/{id}', 'form', NULL, 1111, 'inherit', '1'),
(69, 'clinica.especialidades.patch', 22, 64, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(70, 'clinica.especialidades.delete', 22, 64, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(71, 'clinica.especialidades.put', 22, 64, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(72, 'clinica.clinicas.index', 23, NULL, 'any', '/unidades', 'index', NULL, 1111, 'inherit', '1'),
(73, 'clinica.clinicas.index', 23, 72, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(74, 'clinica.clinicas.post', 23, 72, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(75, 'clinica.clinicas.edit', 23, 72, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(76, 'clinica.clinicas.add', 23, 72, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(77, 'clinica.clinicas.patch', 23, 72, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(78, 'clinica.clinicas.delete', 23, 72, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(79, 'clinica.clinicas.put', 23, 72, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(80, 'main.api.cep', 7, NULL, 'get', '/api/cep/{cep}', 'getCep', NULL, 1111, 'inherit', '1'),
(81, 'main.services.index', 24, 34, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(82, 'main.services.medicos', 24, 34, 'any', '/medicals', 'medicos', NULL, 1111, 'inherit', '1'),
(83, 'main.services.comercial', 24, 34, 'any', '/commercial', 'comercial', NULL, 1111, 'inherit', '1'),
(84, 'main.services.remocao', 24, 34, 'any', '/removal', 'remocao', NULL, 1111, 'inherit', '1'),
(85, 'main.services.area_protegida', 24, 34, 'any', '/protected-area', 'area_protegida', NULL, 1111, 'inherit', '1'),
(86, 'main.contact', 1, NULL, 'post', '/contact', 'send_mail', NULL, 1111, 'inherit', '1'),
(87, 'clinica.departamentos.index', 25, NULL, 'any', '/departamentos', 'index', NULL, 1111, 'inherit', '1'),
(88, 'clinica.departamentos.index', 25, 87, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(89, 'clinica.departamentos.add', 25, 87, 'get', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(90, 'clinica.departamentos.post', 25, 87, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(91, 'clinica.departamentos.edit', 25, 87, 'get', '/{id}', 'form', NULL, 1111, 'inherit', '1'),
(92, 'clinica.departamentos.patch', 25, 87, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(93, 'clinica.departamentos.delete', 25, 87, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(94, 'clinica.departamentos.put', 25, 87, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(95, 'clinica.clinicas.departamentos', 23, 72, 'get', '/departamentos', 'getDepartamentos', NULL, 1111, 'inherit', '1'),
(96, 'clinica.agendamentos.index', 27, NULL, 'any', '/agendamentos', 'index', NULL, 1111, 'inherit', '1'),
(97, 'clinica.agendamentos.index', 27, 96, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(98, 'clinica.agendamentos.add', 27, 96, 'get', '/new', 'form', NULL, 1111, 'inherit', '1'),
(99, 'clinica.agendamentos.post', 27, 96, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(100, 'clinica.agendamentos.edit', 27, 96, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(101, 'clinica.agendamentos.patch', 27, 96, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(102, 'clinica.agendamentos.delete', 27, 96, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(103, 'clinica.agendamentos.put', 27, 96, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(104, 'clinica.agendamentos.consultas', 27, 96, 'get', '/consultas', 'get_eventos', NULL, 1111, 'inherit', '1'),
(105, 'clinica.agendamentos.{agendamento}.paciente.{paciente}', 27, 96, 'get', '{agendamento}/paciente/{paciente}', 'form', NULL, 1111, 'inherit', '1'),
(106, 'clinica.clinicas.autocomplete', 23, 72, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(107, 'clinica.pacientes.autocomplete', 19, 40, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(108, 'clinica.medicos.index', 21, NULL, 'any', '/medicos', 'index', NULL, 1111, 'inherit', '1'),
(109, 'clinica.medicos.index', 21, 108, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(110, 'clinica.medicos.add', 21, 108, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(111, 'clinica.medicos.post', 21, 108, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(112, 'clinica.medicos.edit', 21, 108, 'get', '/{id}', 'form', NULL, 1111, 'inherit', '1'),
(113, 'clinica.medicos.patch', 21, 108, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(114, 'clinica.medicos.delete', 21, 108, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(115, 'clinica.medicos.put', 21, 108, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(116, 'clinica.especialidades.autocomplete', 22, 64, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(117, 'clinica.medicos.autocomplete', 21, 108, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(118, 'main.api.include_js', 7, NULL, 'get', '/api/js', 'include_js_app', NULL, 1111, 'no', '1'),
(120, 'clinica.api.include_js', 16, NULL, 'get', '/api/js', 'include_js_app', NULL, 1111, 'no', '1'),
(121, 'clinica.pacientes.{id_paciente}.prontuarios', 20, 48, 'any', '/', 'paciente', NULL, 1111, 'inherit', '0'),
(122, 'clinica.atendimentos.autocomplete', 28, 151, 'get', '/atendimentos/{tipos}/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(123, 'clinica.atendimentos.autocomplete', 28, 151, 'get', '/atendimentos/{tipo}/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(124, 'clinica.agendamentos.get_eventos', 27, 96, 'get', '/eventos', 'get_eventos', NULL, 1111, 'inherit', '1'),
(125, 'clinica.pacientes.get', 19, 40, 'get', '/{id}/dados', 'get', NULL, 1111, 'inherit', '1'),
(126, 'clinica.usuarios.index', 30, NULL, 'any', '/usuarios', 'index', NULL, 1111, 'inherit', '1'),
(127, 'clinica.usuarios.index', 30, 126, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(128, 'clinica.usuarios.add', 30, 126, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(129, 'clinica.usuarios.get', 30, 126, 'get', '/{id}/dados', 'get', NULL, 1111, 'inherit', '1'),
(130, 'clinica.usuarios.edit', 30, 126, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(131, 'clinica.usuarios.patch', 30, 126, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(132, 'clinica.usuarios.post', 30, 126, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(133, 'clinica.usuarios.put', 30, 126, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(134, 'clinica.usuarios.delete', 30, 126, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(135, 'clinica.usuarios.autocomplete', 30, 126, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(136, 'clinica.grupos.usuarios.put', 29, 140, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(137, 'clinica.grupos.usuarios.post', 29, 140, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(138, 'clinica.grupos.usuarios.patch', 29, 140, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(139, 'clinica.grupos.usuarios.index', 29, 140, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(140, 'clinica.grupos.usuarios.index', 29, NULL, 'any', '/grupos', 'index', NULL, 1111, 'inherit', '1'),
(141, 'clinica.grupos.usuarios.get', 29, 140, 'get', '/{id}/dados', 'get', NULL, 1111, 'inherit', '1'),
(142, 'clinica.grupos.usuarios.edit', 29, 140, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(143, 'clinica.grupos.usuarios.delete', 29, 140, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(144, 'clinica.grupos.usuarios.autocomplete', 29, 140, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(145, 'clinica.grupos.usuarios.add', 29, 140, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(146, 'clinica.atendimentos.add', 28, 151, 'get', '/new', 'form', NULL, 1111, 'inherit', '1'),
(147, 'clinica.atendimentos.consultas', 28, 151, 'get', '/consultas', 'get_eventos', NULL, 1111, 'inherit', '1'),
(148, 'clinica.atendimentos.delete', 28, 151, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(149, 'clinica.atendimentos.edit', 28, 151, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(150, 'clinica.atendimentos.get_eventos', 28, 151, 'get', '/eventos', 'get_eventos', NULL, 1111, 'inherit', '1'),
(151, 'clinica.atendimentos.index', 28, NULL, 'any', '/atendimentos', 'index', NULL, 1111, 'inherit', '1'),
(152, 'clinica.atendimentos.index', 28, 151, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(153, 'clinica.atendimentos.patch', 28, 151, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(154, 'clinica.atendimentos.post', 28, 151, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(155, 'clinica.atendimentos.put', 28, 151, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(156, 'clinica.api.clock', 16, NULL, 'get', '/api/clock', 'getDateTime', NULL, 1111, 'no', '1'),
(158, 'main.api.clock', 7, NULL, 'get', '/api/clock', 'getDateTime', NULL, 1111, 'no', '1'),
(159, 'clinica.atendimentos.detalhes', 28, 151, 'get', '/details/{id}', 'datelhes_atendimento', NULL, 1111, 'inherit', '1'),
(160, 'clinica.homecare.index', 31, NULL, 'any', '/homecare', 'index', NULL, 1111, 'inherit', '1'),
(161, 'clinica.homecare.index', 31, 160, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(162, 'clinica.homecare.add', 31, 160, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(163, 'clinica.homecare.post', 31, 160, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(164, 'clinica.homecare.edit', 31, 160, 'get', '/{id}', 'form', NULL, 1111, 'inherit', '1'),
(165, 'clinica.homecare.patch', 31, 160, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(166, 'clinica.homecare.delete', 31, 160, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(167, 'clinica.homecare.put', 31, 160, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(168, 'clinica.planosdesaude.index', 32, NULL, 'any', '/planosdesaude', 'index', NULL, 1111, 'inherit', '1'),
(169, 'clinica.planosdesaude.index', 32, 168, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(170, 'clinica.planosdesaude.add', 32, 168, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(171, 'clinica.planosdesaude.post', 32, 168, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(172, 'clinica.planosdesaude.edit', 32, 168, 'get', '/{id}', 'form', NULL, 1111, 'inherit', '1'),
(173, 'clinica.planosdesaude.patch', 32, 168, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(174, 'clinica.planosdesaude.delete', 32, 168, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(175, 'clinica.planosdesaude.put', 32, 160, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(176, 'clinica.pacientes.editplano', 19, 40, 'get', '/plano/id/{id?}', 'form_plano', NULL, 1111, 'inherit', '1'),
(177, 'clinica.pacientes.addplano', 19, 40, 'get', '/plano/{id?}', 'form_plano', NULL, 1111, 'inherit', '1'),
(178, 'clinica.pacientes.addplano', 19, 40, 'post', '/plano', 'add_plano', NULL, 1111, 'inherit', '1'),
(179, 'clinica.pacientes.addplano', 19, 40, 'put', '/plano', 'add_plano', NULL, 1111, 'inherit', '1'),
(180, 'clinica.convenios.index', 33, NULL, 'any', '/convenios', 'index', NULL, 1111, 'inherit', '1'),
(181, 'clinica.convenios.index', 33, 180, 'get', '/', 'index', NULL, 1111, 'inherit', '1'),
(182, 'clinica.convenios.autocomplete', 33, 180, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(185, 'main.cadastro.paciente', 1, NULL, 'get', '/cadastro/paciente', 'get_consulta_cadastro_paciente', NULL, 1111, 'inherit', '1'),
(186, 'main.cadastro.paciente', 1, NULL, 'post', '/cadastro/paciente', 'post_consulta_cadastro_paciente', NULL, 1111, 'inherit', '1'),
(187, 'mail.mails.index', 34, NULL, 'any', '/inbox', 'index', NULL, 1111, 'inherit', '1'),
(188, 'mail.mails.index', 34, 187, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(189, 'mail.mails.post', 34, 187, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(190, 'mail.mails.edit', 34, 187, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(191, 'mail.mails.add', 34, 187, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(192, 'mail.mails.patch', 34, 187, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(193, 'mail.mails.delete', 34, 187, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(194, 'mail.mails.put', 34, 187, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(195, 'mail.mails', 34, NULL, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(205, 'clinica.exames.index', 37, NULL, 'any', '/exames', 'index', NULL, 1111, 'inherit', '1'),
(206, 'clinica.exames.index', 37, 205, 'get', '/', 'index', NULL, 1111, 'inherit', '1'),
(207, 'clinica.exames.post', 37, 205, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(208, 'clinica.exames.edit', 37, 205, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(209, 'clinica.exames.add', 37, 205, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(210, 'clinica.exames.patch', 37, 205, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(211, 'clinica.exames.delete', 37, 205, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(212, 'clinica.exames.put', 37, 205, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(214, 'clinica.usuarios.{id}.redefinir', 30, 126, 'post', '/{id}/sendpassword', 'send_password', NULL, 1111, 'inherit', '1'),
(215, 'main.password.reset', 38, NULL, 'get', '/password/reset/{token?}', 'password_reset', NULL, 1111, 'inherit', '1'),
(216, 'admin.modulos.index', 39, NULL, 'any', '/modulos', 'index', NULL, 1111, 'inherit', '1'),
(217, 'admin.modulos.index', 39, 216, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(218, 'admin.modulos.post', 39, 216, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(219, 'admin.modulos.edit', 39, 216, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(220, 'admin.modulos.add', 39, 216, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(221, 'admin.modulos.patch', 39, 216, 'patch', '/id/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(222, 'admin.modulos.delete', 39, 216, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(223, 'admin.modulos.post', 39, 216, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(224, 'admin.modulos.get', 39, 216, 'get', '/{id}/dados', 'get', NULL, 1111, 'inherit', '1'),
(225, 'clinica.categorias.exames.index', 40, NULL, 'any', '/categorias/exames', 'index', NULL, 1111, 'inherit', '1'),
(226, 'clinica.categorias.exames.index', 40, 225, 'get', '/', 'index', NULL, 1111, 'inherit', '1'),
(227, 'clinica.categorias.exames.post', 40, 225, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(228, 'clinica.categorias.exames.edit', 40, 225, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(229, 'clinica.categorias.exames.add', 40, 225, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(230, 'clinica.categorias.exames.patch', 40, 225, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(231, 'clinica.categorias.exames.delete', 40, 225, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(232, 'clinica.categorias.exames.post', 40, 225, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(233, 'admin.menus.itens.get', 43, 241, 'get', '/{id}/dados', 'get', NULL, 1111, 'inherit', '1'),
(234, 'admin.menus.itens.post', 43, 241, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(235, 'admin.menus.itens.delete', 43, 241, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(236, 'admin.menus.itens.patch', 43, 241, 'patch', '/id/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(237, 'admin.menus.itens.add', 43, 241, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(238, 'admin.menus.itens.edit', 43, 241, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(239, 'admin.menus.itens.post', 43, 241, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(240, 'admin.menus.itens.index', 43, 241, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(241, 'admin.menus.itens.index', 43, NULL, 'any', '/menus/itens', 'index', NULL, 1111, 'inherit', '1'),
(242, 'clinica.recursosmedicos.agenda.index', 45, NULL, 'any', '/agenda', 'index', NULL, 1111, 'inherit', '1'),
(243, 'clinica.recursosmedicos.agenda.index', 45, 242, 'any', '/', 'index', NULL, 1111, 'inherit', '1'),
(244, 'clinica.recursosmedicos.agenda.add', 45, 242, 'any', '/cadastro', 'form', NULL, 1111, 'inherit', '1'),
(245, 'clinica.recursosmedicos.agenda.get', 45, 242, 'get', '/{id}/dados', 'get', NULL, 1111, 'inherit', '1'),
(246, 'clinica.recursosmedicos.agenda.edit', 45, 242, 'get', '/id/{id}', 'form', NULL, 1111, 'inherit', '1'),
(247, 'clinica.recursosmedicos.agenda.patch', 45, 242, 'patch', '/{id}', 'patch', NULL, 1111, 'inherit', '1'),
(248, 'clinica.recursosmedicos.agenda.post', 45, 242, 'post', '/', 'create', NULL, 1111, 'inherit', '1'),
(249, 'clinica.recursosmedicos.agenda.put', 45, 242, 'put', '/', 'edit', NULL, 1111, 'inherit', '1'),
(250, 'clinica.recursosmedicos.agenda.delete', 45, 242, 'delete', '/', 'delete', NULL, 1111, 'inherit', '1'),
(251, 'clinica.recursosmedicos.agenda.autocomplete', 45, 242, 'get', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(253, 'clinica.departamentos.autocomplete', 25, NULL, 'any', '/json/autocomplete', 'autocomplete', NULL, 1111, 'inherit', '1'),
(254, 'clinica.recursosmedicos.agenda.calendario', 45, NULL, 'any', '/calendario', 'calendario', NULL, 1111, 'inherit', '1'),
(255, 'clinica.funcionario.autocomplete_clinica', 26, 56, 'get', '/json/clinicas', 'autocomplete_clinica', NULL, 1111, 'inherit', '1'),
(256, 'admin.modulos.estrutura', 39, 216, 'post', '/{id}/estrutura', 'criar_estrutura', NULL, 1111, 'inherit', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_pacote`
--

CREATE TABLE `tb_acl_pacote` (
  `id` int(11) UNSIGNED NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_pacote`
--

INSERT INTO `tb_acl_pacote` (`id`, `titulo`, `descricao`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Básico', 'Pacote sem módulo financeiro', '2023-01-13 23:03:53', NULL, '1'),
(2, 'Avançado', 'Pacote com módulo financeiro', '2023-01-13 23:03:53', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_pacote_modulo`
--

CREATE TABLE `tb_acl_pacote_modulo` (
  `id_pacote` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_pacote_modulo`
--

INSERT INTO `tb_acl_pacote_modulo` (`id_pacote`, `id_modulo`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, '2023-01-13 23:04:29', NULL, '1'),
(1, 2, '2023-01-13 23:04:29', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario`
--

CREATE TABLE `tb_acl_usuario` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_grupo` int(11) UNSIGNED NOT NULL,
  `id_funcionario` int(11) UNSIGNED DEFAULT NULL,
  `id_gestor` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `permissao` smallint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 1111,
  `ultimo_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela para cadastro de usuários';

--
-- Despejando dados para a tabela `tb_acl_usuario`
--

INSERT INTO `tb_acl_usuario` (`id`, `id_grupo`, `id_funcionario`, `id_gestor`, `nome`, `email`, `login`, `senha`, `salt`, `token`, `permissao`, `ultimo_login`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, NULL, 0, 'Alisson Guedes', 'alissonguedes87@gmail.com', 'alisson', '6b2a792a47f194d7574a86218ca5f082446d9b4198c658e66d2ec98c5f034905788848e5b38a7', NULL, 'eyJ0aW1lc3RhbXAiOjE2ODAxMjUyNDgsImV4cGlyZXMiOjE2ODAxMzI0NDgsIm1vZHVsbyI6Nn0=', 1111, '2023-05-28 00:09:26', '2022-06-24 02:43:09', '2023-03-30 00:27:28', '1'),
(2, 4, NULL, 0, 'Teste', 'teste', 'teste', '3c702e76fdd1a5c46f902ccd2287e2eabaea8f673497350ea105511d27573b3bf199433c3037d', NULL, NULL, 1111, '2023-05-16 18:58:35', '2023-01-28 16:12:58', '2023-03-29 08:29:43', '1'),
(3, 2, NULL, 0, 'Teste 2', 'teste2', 'teste2', '3c702e76fdd1a5c46f902ccd2287e2eabaea8f673497350ea105511d27573b3bf199433c3037d', NULL, NULL, 1111, '2023-05-16 18:58:47', '2023-01-28 16:52:08', '2023-03-29 08:29:43', '1'),
(4, 3, NULL, 0, 'teste3', 'teste3', 'teste3', '3c702e76fdd1a5c46f902ccd2287e2eabaea8f673497350ea105511d27573b3bf199433c3037d', NULL, NULL, 1111, '2023-05-16 18:58:57', '2023-01-28 16:52:39', '2023-03-29 08:29:43', '1'),
(5, 4, NULL, 0, 'teste4', 'teste4', 'teste4', '3c702e76fdd1a5c46f902ccd2287e2eabaea8f673497350ea105511d27573b3bf199433c3037d', NULL, 'eyJ0aW1lc3RhbXAiOjE2ODQzMDM5NDIsImV4cGlyZXMiOjE2ODQzMTExNDIsIm1vZHVsbyI6NX0=', 1111, '2023-05-16 18:59:07', '2023-01-28 17:36:31', '2023-05-17 09:12:22', '1'),
(6, 2, NULL, 0, 'Edinilton', 'edinilton@medicus24.com.br', 'edinilton', '3c702e76fdd1a5c46f902ccd2287e2eabaea8f673497350ea105511d27573b3bf199433c3037d', NULL, NULL, 1111, '2023-03-04 14:19:51', '2023-03-04 20:19:06', '2023-03-29 08:29:43', '1'),
(10, 2, NULL, 0, 'Teste', 'desenvolvimentowebmin@gmail.com', 'phpmyadmin', '2778c3f104a859d523a6fe2c2041fd7c18fab34dabdd4e8454bfd5f1970d657ea4ccf3a7220f1', NULL, NULL, 1111, NULL, '2023-03-28 17:31:56', '2023-03-29 08:29:43', '1'),
(11, 2, NULL, 0, 'teste', 'asdf', 'adf', '2778c3f104a859d523a6fe2c2041fd7c18fab34dabdd4e8454bfd5f1970d657ea4ccf3a7220f1', NULL, NULL, 1111, NULL, '2023-04-24 11:05:48', NULL, '1'),
(12, 2, NULL, 0, 'teste', 'asdf@asdf.com', 'asdf', '2778c3f104a859d523a6fe2c2041fd7c18fab34dabdd4e8454bfd5f1970d657ea4ccf3a7220f1', NULL, NULL, 1111, NULL, '2023-04-24 11:06:04', NULL, '1'),
(13, 1, NULL, 0, 'Teste', 'testeteste', 'testeteste', '2778c3f104a859d523a6fe2c2041fd7c18fab34dabdd4e8454bfd5f1970d657ea4ccf3a7220f1', NULL, NULL, 1111, NULL, '2023-05-16 10:21:16', NULL, '0'),
(14, 1, NULL, 0, 'Teste', 'testeteste1', 'testeteste1', '2778c3f104a859d523a6fe2c2041fd7c18fab34dabdd4e8454bfd5f1970d657ea4ccf3a7220f1', NULL, NULL, 1111, NULL, '2023-05-16 10:21:37', NULL, '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario_config`
--

CREATE TABLE `tb_acl_usuario_config` (
  `id_usuario` int(11) UNSIGNED NOT NULL COMMENT 'Número sequencial da tabela.',
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `id_config` int(11) UNSIGNED NOT NULL,
  `value` longtext DEFAULT NULL COMMENT 'Endereço do website',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de configurações do site';

--
-- Despejando dados para a tabela `tb_acl_usuario_config`
--

INSERT INTO `tb_acl_usuario_config` (`id_usuario`, `id_modulo`, `id_config`, `value`, `created_at`, `updated_at`) VALUES
(1, 5, 6, 'expanded', '2023-02-13 19:48:21', '2023-05-27 21:51:00'),
(5, 5, 6, 'expanded', '2023-04-02 04:21:51', '2023-04-02 04:22:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario_imagem`
--

CREATE TABLE `tb_acl_usuario_imagem` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `privada` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_acl_usuario_session`
--

CREATE TABLE `tb_acl_usuario_session` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `ip` varchar(39) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_acl_usuario_session`
--

INSERT INTO `tb_acl_usuario_session` (`id`, `id_usuario`, `id_modulo`, `token`, `ip`, `user_agent`, `started_at`, `expired_at`) VALUES
(1, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 19:47:38', '2023-02-13 20:15:03'),
(2, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 20:15:04', '2023-02-13 20:17:21'),
(3, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 20:17:23', '2023-02-13 21:08:04'),
(4, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:08:12', '2023-02-13 21:08:30'),
(5, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:08:34', '2023-02-13 21:13:54'),
(6, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:13:59', '2023-02-13 21:14:51'),
(7, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:14:53', '2023-02-13 21:15:04'),
(8, 5, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:15:51', '2023-02-13 21:17:11'),
(9, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:17:14', '2023-02-13 21:25:58'),
(10, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 21:26:01', '2023-02-13 22:04:10'),
(11, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:04:12', '2023-02-13 22:04:17'),
(12, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:04:22', '2023-02-13 22:04:35'),
(13, 5, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:04:38', '2023-02-13 22:05:36'),
(14, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:05:41', '2023-02-13 22:06:57'),
(15, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:06:59', '2023-02-13 22:24:29'),
(16, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:24:30', '2023-02-13 22:24:37'),
(17, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:24:40', '2023-02-13 22:24:44'),
(18, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:24:47', '2023-02-13 22:24:51'),
(19, 5, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:24:54', '2023-02-13 22:25:04'),
(20, 2, 4, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-01 21:13:49', '2023-04-01 21:16:31'),
(21, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:25:11', '2023-02-13 22:27:15'),
(22, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 22:27:16', '2023-02-13 23:05:33'),
(23, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 23:05:37', '2023-02-13 23:16:43'),
(24, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-13 23:16:45', '2023-02-14 02:31:10'),
(25, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-14 02:31:13', '2023-02-14 04:53:59'),
(26, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-14 04:54:02', '2023-02-14 04:54:09'),
(27, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-14 04:54:12', '2023-02-14 04:54:18'),
(28, 5, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-02-14 04:54:21', '2023-02-14 04:54:29'),
(29, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-03-04 19:59:53', '2023-03-04 20:19:44'),
(30, 1, 5, NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-13 19:23:11', '2023-05-13 19:25:42'),
(31, 6, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-03-04 20:19:48', '2023-03-04 21:11:01'),
(32, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-03-04 21:11:06', '2023-03-04 21:17:50'),
(33, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-01 18:18:12', '2023-04-01 21:13:31'),
(34, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-01 21:13:34', '2023-04-01 21:13:46'),
(35, 1, 4, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-01 21:16:33', '2023-04-01 21:26:11'),
(36, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-01 21:26:19', '2023-04-01 21:26:53'),
(37, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 01:46:04', '2023-04-02 04:01:13'),
(38, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 01:24:12', '2023-04-02 01:44:27'),
(39, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 01:44:31', '2023-04-02 01:46:01'),
(40, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 04:01:15', '2023-04-02 04:11:35'),
(41, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 04:11:39', '2023-04-02 04:18:07'),
(42, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 04:18:11', '2023-04-02 04:18:23'),
(43, 5, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 04:18:26', '2023-04-02 04:23:18'),
(44, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 21:20:42', '2023-04-02 23:06:11'),
(45, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 23:25:47', '2023-04-02 23:26:36'),
(46, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 23:06:35', '2023-04-02 23:19:29'),
(47, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 23:19:31', '2023-04-02 23:24:45'),
(48, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-02 23:24:48', '2023-04-02 23:25:46'),
(49, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 04:39:32', '2023-04-24 04:39:43'),
(50, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-03 02:47:27', '2023-04-03 02:47:37'),
(51, 2, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-03 02:50:59', '2023-04-03 02:51:28'),
(52, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 04:39:02', '2023-04-24 04:39:29'),
(53, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-17 02:42:14', '2023-04-17 02:42:57'),
(54, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-19 15:34:13', '2023-04-19 18:48:54'),
(55, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 03:06:23', '2023-04-24 04:38:50'),
(56, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 04:39:46', '2023-04-24 04:39:57'),
(57, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 08:33:32', '2023-04-24 10:27:52'),
(58, 1, 2, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-25 02:45:19', '2023-04-25 04:18:07'),
(59, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-17 00:28:42', '2023-05-17 00:58:29'),
(60, 1, 2, NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-28 03:02:38', '2023-05-28 03:09:04'),
(61, 2, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-17 00:58:33', '2023-05-17 00:58:41'),
(62, 3, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-17 00:58:45', '2023-05-17 00:58:53'),
(63, 4, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-17 00:58:55', '2023-05-17 00:59:02'),
(64, 5, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-17 00:59:05', '2023-05-17 00:59:13'),
(65, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-24 03:29:40', '2023-05-24 05:32:02'),
(66, 1, 5, '7eb65b30d60fe1a8b2fe11839c3d504e6467a86edf947', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2023-05-19 19:48:46', NULL),
(67, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-26 00:20:56', '2023-05-26 00:21:08'),
(68, 1, 5, NULL, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-26 00:21:26', '2023-05-26 00:21:56'),
(69, 1, 5, '500bac86684373d14134d11a6c56748c646ffd5956e71', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-26 00:29:13', NULL),
(70, 1, 2, 'b90883059eccb11ae5235f12dadbe9e46472c5e41d65c', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-05-28 03:09:24', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_config`
--

CREATE TABLE `tb_sys_config` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Número sequencial da tabela.',
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `config` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL COMMENT 'Endereço do website',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Tabela de configurações do site';

--
-- Despejando dados para a tabela `tb_sys_config`
--

INSERT INTO `tb_sys_config` (`id`, `id_modulo`, `config`, `value`, `created_at`, `updated_at`) VALUES
(1, 2, 'main-menu', '1', '2022-08-19 09:16:07', NULL),
(2, 2, 'language', 'pt_br', '2022-08-19 09:16:07', NULL),
(3, 2, 'main-menu-type', 'expanded', '2022-08-19 09:16:07', '2022-08-24 21:19:16'),
(4, 5, 'main-menu', '2', '2022-08-19 09:16:07', NULL),
(5, 5, 'language', 'pt_br', '2022-08-19 09:16:07', NULL),
(6, 5, 'main-menu-type', 'expanded', '2022-08-19 09:16:07', '2022-08-24 21:19:16'),
(7, 1, 'main-menu', '1', '2022-08-19 09:16:07', NULL),
(8, 1, 'language', 'pt_br', '2022-08-19 09:16:07', NULL),
(9, 1, 'main-menu-type', 'expanded', '2022-08-19 09:16:07', '2022-08-24 21:19:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_dicionario`
--

CREATE TABLE `tb_sys_dicionario` (
  `id` int(11) UNSIGNED NOT NULL,
  `palavra` text NOT NULL,
  `definicao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_idioma`
--

CREATE TABLE `tb_sys_idioma` (
  `id` int(11) UNSIGNED NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `sigla` varchar(7) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_sys_idioma`
--

INSERT INTO `tb_sys_idioma` (`id`, `descricao`, `sigla`, `label`, `imagem`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Português', 'pt_br', 'portugues', NULL, '2022-07-01 14:26:39', NULL, '1'),
(2, 'Inglês', 'en', 'ingles', NULL, '2022-07-01 14:26:39', NULL, '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_sys_idioma_dicionario`
--

CREATE TABLE `tb_sys_idioma_dicionario` (
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `id_palavra` int(11) UNSIGNED NOT NULL,
  `traducao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_acl_grupo`
--
ALTER TABLE `tb_acl_grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grupo` (`grupo`);

--
-- Índices de tabela `tb_acl_menu`
--
ALTER TABLE `tb_acl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_acl_menu_descricao`
--
ALTER TABLE `tb_acl_menu_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_menu`),
  ADD KEY `fk_tb_produto_descricao_tb_produto1_idx` (`id_menu`),
  ADD KEY `fk_tb_produto_descricao_tb_sys_idioma1_idx` (`id_idioma`);

--
-- Índices de tabela `tb_acl_menu_grupo`
--
ALTER TABLE `tb_acl_menu_grupo`
  ADD PRIMARY KEY (`id_grupo`,`id_menu`),
  ADD KEY `fk_tb_acl_menu_grupo_tb_acl_menu_id_menu` (`id_menu`);

--
-- Índices de tabela `tb_acl_menu_item`
--
ALTER TABLE `tb_acl_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_menu_item_id_item_post` (`id_controller`),
  ADD KEY `fk_tb_acl_menu_item_id_parent` (`id_parent`);

--
-- Índices de tabela `tb_acl_menu_item_descricao`
--
ALTER TABLE `tb_acl_menu_item_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_item`),
  ADD KEY `fk_tb_menu_item_descricao_id_item` (`id_item`),
  ADD KEY `fk_tb_menu_item_descricao_id_idioma` (`id_idioma`);

--
-- Índices de tabela `tb_acl_menu_item_menu`
--
ALTER TABLE `tb_acl_menu_item_menu`
  ADD PRIMARY KEY (`id_item`,`id_menu`),
  ADD KEY `fk_tb_acl_menu_item_menu_id_menu` (`id_menu`);

--
-- Índices de tabela `tb_acl_menu_secao`
--
ALTER TABLE `tb_acl_menu_secao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_acl_modulo`
--
ALTER TABLE `tb_acl_modulo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modulo` (`modulo`),
  ADD UNIQUE KEY `diretorio` (`path`),
  ADD KEY `fk_tb_acl_modulo_homepage` (`homepage`);

--
-- Índices de tabela `tb_acl_modulo_controller`
--
ALTER TABLE `tb_acl_modulo_controller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id_modulo_controller` (`controller`,`id_modulo`),
  ADD UNIQUE KEY `use_as` (`use_as`),
  ADD KEY `fk_tb_acl_modulo_classe_tb_acl_modulo1_idx` (`id_modulo`);

--
-- Índices de tabela `tb_acl_modulo_controller_descricao`
--
ALTER TABLE `tb_acl_modulo_controller_descricao`
  ADD PRIMARY KEY (`id_idioma`,`id_controller`),
  ADD KEY `fk_tb_acl_modulo_controller_descricao_id_controller_id_item` (`id_controller`,`id_idioma`);

--
-- Índices de tabela `tb_acl_modulo_grupo`
--
ALTER TABLE `tb_acl_modulo_grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_acl_modulo_grupo_id_grupo_id_modulo_UNIQUE` (`id_grupo`,`id_modulo`) USING BTREE,
  ADD KEY `fk_tb_acl_modulo_grupo_id_grupo` (`id_grupo`),
  ADD KEY `fk_tb_acl_modulo_grupo_tb_acl_modulo1_idx` (`id_modulo`);

--
-- Índices de tabela `tb_acl_modulo_grupo_menu`
--
ALTER TABLE `tb_acl_modulo_grupo_menu`
  ADD PRIMARY KEY (`id_menu`,`id_modulo_grupo`) USING BTREE,
  ADD KEY `tb_acl_modulo_menu_id_menu_id_modulo_UNIQUE` (`id_menu`,`id_modulo_grupo`),
  ADD KEY `fk_tb_acl_modulo_menu_id_modulo_idx` (`id_modulo_grupo`);

--
-- Índices de tabela `tb_acl_modulo_routes`
--
ALTER TABLE `tb_acl_modulo_routes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `route_controller_action_name_UNIQUE` (`type`,`route`,`action`,`name`) USING BTREE,
  ADD KEY `fk_tb_acl_rotas_tb_acl_modulo_classe1_idx` (`id_controller`),
  ADD KEY `fk_tb_acl_modulo_routes_id_parent` (`id_parent`);

--
-- Índices de tabela `tb_acl_pacote`
--
ALTER TABLE `tb_acl_pacote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo` (`titulo`);

--
-- Índices de tabela `tb_acl_pacote_modulo`
--
ALTER TABLE `tb_acl_pacote_modulo`
  ADD PRIMARY KEY (`id_pacote`,`id_modulo`),
  ADD KEY `fk_tb_pacote_modulo_id_modulo` (`id_modulo`),
  ADD KEY `fk_tb_acl_pacote_modulo_id_pacote` (`id_pacote`) USING BTREE;

--
-- Índices de tabela `tb_acl_usuario`
--
ALTER TABLE `tb_acl_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `fk_tb_acl_usuario_id_grupo` (`id_grupo`),
  ADD KEY `fk_tb_acl_usuario_id_funcionario` (`id_funcionario`);

--
-- Índices de tabela `tb_acl_usuario_config`
--
ALTER TABLE `tb_acl_usuario_config`
  ADD PRIMARY KEY (`id_usuario`,`id_config`),
  ADD KEY `fk_tb_acl_usuario_config_id_config` (`id_config`),
  ADD KEY `fk_tb_acl_usuario_config_id_modulo` (`id_modulo`);

--
-- Índices de tabela `tb_acl_usuario_imagem`
--
ALTER TABLE `tb_acl_usuario_imagem`
  ADD PRIMARY KEY (`id`,`id_usuario`),
  ADD KEY `tb_acl_usuario_imagem_id_usuario` (`id_usuario`);

--
-- Índices de tabela `tb_acl_usuario_session`
--
ALTER TABLE `tb_acl_usuario_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tb_acl_usuario_session_id_usuario` (`id_usuario`),
  ADD KEY `fk_tb_acl_usuario_session_id_modulo` (`id_modulo`);

--
-- Índices de tabela `tb_sys_config`
--
ALTER TABLE `tb_sys_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`config`),
  ADD KEY `fk_tb_sys_config_id_modulo` (`id_modulo`);

--
-- Índices de tabela `tb_sys_dicionario`
--
ALTER TABLE `tb_sys_dicionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_sys_idioma`
--
ALTER TABLE `tb_sys_idioma`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sigla` (`sigla`);

--
-- Índices de tabela `tb_sys_idioma_dicionario`
--
ALTER TABLE `tb_sys_idioma_dicionario`
  ADD PRIMARY KEY (`id_idioma`,`id_palavra`),
  ADD KEY `fk_tb_sys_idioma_id_palavra` (`id_palavra`),
  ADD KEY `fk_tb_sys_idioma_id_idioma` (`id_idioma`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_acl_grupo`
--
ALTER TABLE `tb_acl_grupo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_acl_menu`
--
ALTER TABLE `tb_acl_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tb_acl_menu_item`
--
ALTER TABLE `tb_acl_menu_item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `tb_acl_menu_secao`
--
ALTER TABLE `tb_acl_menu_secao`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo`
--
ALTER TABLE `tb_acl_modulo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo_controller`
--
ALTER TABLE `tb_acl_modulo_controller`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo_grupo`
--
ALTER TABLE `tb_acl_modulo_grupo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_acl_modulo_routes`
--
ALTER TABLE `tb_acl_modulo_routes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario`
--
ALTER TABLE `tb_acl_usuario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario_config`
--
ALTER TABLE `tb_acl_usuario_config`
  MODIFY `id_usuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Número sequencial da tabela.', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario_imagem`
--
ALTER TABLE `tb_acl_usuario_imagem`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_acl_usuario_session`
--
ALTER TABLE `tb_acl_usuario_session`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de tabela `tb_sys_config`
--
ALTER TABLE `tb_sys_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Número sequencial da tabela.', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_sys_dicionario`
--
ALTER TABLE `tb_sys_dicionario`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_sys_idioma`
--
ALTER TABLE `tb_sys_idioma`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_acl_menu_descricao`
--
ALTER TABLE `tb_acl_menu_descricao`
  ADD CONSTRAINT `tb_acl_menu_descricao_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_acl_menu_descricao_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_menu_grupo`
--
ALTER TABLE `tb_acl_menu_grupo`
  ADD CONSTRAINT `fk_tb_acl_menu_grupo_tb_acl_grupo_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tb_acl_grupo` (`id`),
  ADD CONSTRAINT `fk_tb_acl_menu_grupo_tb_acl_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`);

--
-- Restrições para tabelas `tb_acl_menu_item`
--
ALTER TABLE `tb_acl_menu_item`
  ADD CONSTRAINT `fk_tb_acl_menu_item_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_acl_menu_item` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tb_menu_item_id_controller` FOREIGN KEY (`id_controller`) REFERENCES `tb_acl_modulo_controller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_menu_item_descricao`
--
ALTER TABLE `tb_acl_menu_item_descricao`
  ADD CONSTRAINT `tb_acl_menu_item_descricao_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_acl_menu_item_descricao_id_item` FOREIGN KEY (`id_item`) REFERENCES `tb_acl_menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_menu_item_menu`
--
ALTER TABLE `tb_acl_menu_item_menu`
  ADD CONSTRAINT `fk_tb_acl_menu_item_menu_id_item` FOREIGN KEY (`id_item`) REFERENCES `tb_acl_menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_menu_item_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo`
--
ALTER TABLE `tb_acl_modulo`
  ADD CONSTRAINT `fk_tb_acl_modulo_homepage` FOREIGN KEY (`homepage`) REFERENCES `tb_acl_modulo_routes` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Restrições para tabelas `tb_acl_modulo_controller`
--
ALTER TABLE `tb_acl_modulo_controller`
  ADD CONSTRAINT `fk_tb_acl_modulo_classe_tb_acl_modulo1` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_controller_descricao`
--
ALTER TABLE `tb_acl_modulo_controller_descricao`
  ADD CONSTRAINT `fk_tb_acl_modulo_controller_descricao_id_controller` FOREIGN KEY (`id_controller`) REFERENCES `tb_acl_modulo_controller` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_modulo_controller_descricao_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_grupo`
--
ALTER TABLE `tb_acl_modulo_grupo`
  ADD CONSTRAINT `fk_tb_acl_menu_grupo_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tb_acl_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_modulo_grupo_tb_acl_modulo1` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_grupo_menu`
--
ALTER TABLE `tb_acl_modulo_grupo_menu`
  ADD CONSTRAINT `fk_tb_acl_modulo_menu_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `tb_acl_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_modulo_menu_id_modulo` FOREIGN KEY (`id_modulo_grupo`) REFERENCES `tb_acl_modulo_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_modulo_routes`
--
ALTER TABLE `tb_acl_modulo_routes`
  ADD CONSTRAINT `fk_tb_acl_modulo_routes_id_parent` FOREIGN KEY (`id_parent`) REFERENCES `tb_acl_modulo_routes` (`id`),
  ADD CONSTRAINT `fk_tb_acl_rotas_tb_acl_modulo_classe1` FOREIGN KEY (`id_controller`) REFERENCES `tb_acl_modulo_controller` (`id`);

--
-- Restrições para tabelas `tb_acl_pacote_modulo`
--
ALTER TABLE `tb_acl_pacote_modulo`
  ADD CONSTRAINT `fk_tb_pacote_modulo_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_pacote_modulo_id_pacote` FOREIGN KEY (`id_pacote`) REFERENCES `tb_acl_pacote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario`
--
ALTER TABLE `tb_acl_usuario`
  ADD CONSTRAINT `fk_tb_acl_usuario_id_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tb_acl_grupo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario_config`
--
ALTER TABLE `tb_acl_usuario_config`
  ADD CONSTRAINT `fk_tb_acl_usuario_config_id_config` FOREIGN KEY (`id_config`) REFERENCES `tb_sys_config` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_usuario_config_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_usuario_config_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario_imagem`
--
ALTER TABLE `tb_acl_usuario_imagem`
  ADD CONSTRAINT `tb_acl_usuario_imagem_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_acl_usuario_session`
--
ALTER TABLE `tb_acl_usuario_session`
  ADD CONSTRAINT `fk_tb_acl_usuario_session_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_acl_usuario_session_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_acl_usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_sys_config`
--
ALTER TABLE `tb_sys_config`
  ADD CONSTRAINT `fk_tb_sys_config_id_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `tb_acl_modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_sys_idioma_dicionario`
--
ALTER TABLE `tb_sys_idioma_dicionario`
  ADD CONSTRAINT `fk_tb_sys_idioma_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_sys_idioma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_sys_idioma_id_palavra` FOREIGN KEY (`id_palavra`) REFERENCES `tb_sys_dicionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;